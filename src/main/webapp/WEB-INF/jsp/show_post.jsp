<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>帖子列表</title>
<link href="${path }/res/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${path }/res/js/jquery-1.9.0.min.js"></script>
<script src="${path }/res/bootstrap/dist/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
	
	function nextpage(totalpage, condition) {
		var currentpage = jQuery("#currentpage").val();
		if(currentpage < totalpage) {
			currentpage++;
			jQuery("#currentpage").html(currentpage);
			location.href="${path }/toNewPage?currentpage=" + currentpage +"&condition=" +condition;
		}
	}
	function prevpage(totalpage, condition) {
		var currentpage = jQuery("#currentpage").val();
		if(currentpage > 1) {
			currentpage--;
			jQuery("#currentpage").html(currentpage);
			location.href="${path }/toNewPage?currentpage=" + currentpage +"&condition=" +condition;
		}
	}
</script>
<body>
	<div class="container" style="padding-top: 40px">
		<h2><i class="glyphicon glyphicon-home"></i>欢迎光临${Section }区</h2>
		<hr/>
		<div class="container">
				<c:forEach var="PL" items="${PostList }">
					<div>
						<c:if test="${PL.status == 0 }">
							<p style="color: #B0B0B0;">该帖子已被管理员屏蔽！</p>
							<hr />
						</c:if>
						<c:if test="${PL.status == 1 }">
							<div>
							<a href="${path }/toViewPost?postid=${PL.postid}">【${PL.sectionname }】[${PL.topic }]
									${PL.title } </a>
							<p style="float: right;">作者：${PL.username } 浏览：${PL.viewcount }|回复：${PL.replytimes }</p>
							</div>
							<p style="float: left;">发表时间：${PL.posttime }</p>
							<hr />
						</c:if>
					</div>
				</c:forEach>

				<div style="float: right;">
					<a id="prev" href="#" onclick="prevpage('${PostPages}', '${Section }')">上一页</a> 
					<input id="currentpage" type="text" value="${currentPage }" style="width: 20px; height: 20px;" />/${PostPages } 
					<a id="next" href="#" onclick="nextpage('${PostPages}', '${Section }')">下一页</a>
				</div>
			</div>
		</div>

</body>
</html>