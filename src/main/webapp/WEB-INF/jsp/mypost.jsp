<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的帖子</title>
<link href="${path }/res/css/dashboard.css" rel="stylesheet">
<link href="${path }/res/css/index_main.css" rel="stylesheet">
<link href="${path }/res/css/login.css" rel="stylesheet">
<link href="${path }/res/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheer" href="${path }/res/css/left_menu.css">
<script src="${path }/res/js/jquery-1.9.0.min.js"></script>
<script src="${path }/res/bootstrap/dist/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
	
	function nextpage(totalpage, userid) {
		var currentpage = jQuery("#currentpage").val();
		if(currentpage < totalpage) {
			currentpage++;
			jQuery("#currentpage").html(currentpage);
			location.href="${path }/toMyPostNewPage?currentpage=" + currentpage +"&userid=" + userid;
		}
	}
	function prevpage(totalpage, userid) {
		var currentpage = jQuery("#currentpage").val();
		if(currentpage > 1) {
			currentpage--;
			jQuery("#currentpage").html(currentpage);
			location.href="${path }/toMyPostNewPage?currentpage=" + currentpage +"&userid=" + userid;
		}
	}
	
	function deleteMyPost(postid, userid) {
		confirm_ = confirm('此操作将删除您发表的一篇帖子，是否继续?');
		if(confirm_) {
			var currentpage = jQuery("#currentpage").val();
			location.href="${path}/deleteMyPost?currentpage=" + currentpage + "&postid=" + postid +"&userid=" + userid;
		}
	}
</script>
<body>
<div >
	<h2 style="padding-left: 10%"><i class="glyphicon glyphicon-indent-left"></i> 帖子管理</h2>
	<div class="well">
			<c:if test="${PostList == null }">
				<p>你还没发过贴哦</p>
			</c:if>
			<c:forEach var="PL" items="${PostList }">
					<div>
						<div>
							<a style="padding-left: 2%" onclick="deleteMyPost('${PL.postid}', '${Login_User.userid }')"><i class="glyphicon glyphicon-trash"></i>删除</a>
							<c:if test="${PL.status == 0 }">
								<a style="padding-left: 6%;color: #B0B0B0;text-decoration:none">【${PL.sectionname }】[${PL.topic }]
									${PL.title } </a>
							</c:if>
							<c:if test="${PL.status == 1 }">
							<a style="padding-left: 6%" href="${path }/toViewPost?postid=${PL.postid}">【${PL.sectionname }】[${PL.topic }]
									${PL.title } </a>
							</c:if>
							<p style="float: right;">状态：${PL.status } | 浏览：${PL.viewcount }|回复：${PL.replytimes }|${PL.posttime }</p>
							</div>
						<hr />
					</div>
				</c:forEach>
			<p style="color: red;">注：状态为'0'的帖子已被管理员屏蔽，为'1'的正常</p>
	</div>
	
	<c:if test="${PostList != null }">
	<div style="float:right;">
		<a id="prev" href="#" onclick="prevpage('${PostPages}', '${Login_User.userid }')">上一页</a> 
		<input id="currentpage" type="text" value="${currentPage }" style="width: 20px; height: 20px;" />/${PostPages } 
		<a id="next" href="#" onclick="nextpage('${PostPages}', '${Login_User.userid }')">下一页</a>
	</div>
	</c:if>
</div>



</body>
</html>