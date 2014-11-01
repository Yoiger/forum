<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搜索结果</title>
<link rel="stylesheet" href="${path }/res/bootstrap/dist/css/bootstrap.min.css" />
<script src="${path }/res/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${path }/res/js/jquery-1.9.0.min.js"></script>
<script src="${path }/res/js/jquery-validate.js"></script>
<script src="${path }/res/ueditor/ueditor.config.js"></script>
<script src="${path }/res/ueditor/ueditor.all.js"></script>
<LINK rel="stylesheet" href="${path }/res/ueditor/themes/default/css/ueditor.css" />
</head>
<script type="text/javascript">
function nextpage(totalpage, condition) {
	var currentpage = jQuery("#currentpage").val();
	if(currentpage < totalpage) {
		currentpage++;
		jQuery("#currentpage").html(currentpage);
		location.href="${path }/toSearchNewPage?currentpage=" + currentpage +"&condition=" +condition;
	}
}
function prevpage(totalpage, condition) {
	var currentpage = jQuery("#currentpage").val();
	if(currentpage > 1) {
		currentpage--;
		jQuery("#currentpage").html(currentpage);
		location.href="${path }/toSearchNewPage?currentpage=" + currentpage +"&condition=" +condition;
	}
}
</script>
<body>
<div>
	<h2 style="padding-left: 10%;padding-top: 40px">"${Search }"的搜索结果如下：</h2>
	<div class="container">
		<hr/>
		<div class="container">
				<c:if test="${PostList == null }">
					<p style="color: red;">对不起，没有找到相关帖子！</p>
				</c:if>
				<c:forEach var="PL" items="${PostList }">
					<div>
						<c:if test="${PL.status == 1 }">
							<div>
							<a href="${path }/toViewPost?postid=${PL.postid}">【${PL.sectionname }】[${PL.topic }]
									${PL.title } </a>
							<b style="float: right;">作者：${PL.username } 浏览：${PL.viewcount }|回复：${PL.replytimes }</b>
							</div>
							<label style="text-align: right;">发表时间：${PL.posttime }</label>
							<hr />
						</c:if>
					</div>
				</c:forEach>
				
				<c:if test="${PostList != null }">
				<div style="float:right;">
					<a id="prev" href="#" onclick="prevpage('${PostPages}', '${Search }')">上一页</a> 
					<input id="currentpage" type="text" value="${currentPage }" style="width: 20px; height: 20px;" />/${PostPages } 
					<a id="next" href="#" onclick="nextpage('${PostPages}', '${Search }')">下一页</a>
				</div>
				</c:if>
		</div>
	</div>
</div>
</body>
</html>