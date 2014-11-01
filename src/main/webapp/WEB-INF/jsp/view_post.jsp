<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看贴子</title>
<link rel="stylesheet" href="${path }/res/bootstrap/dist/css/bootstrap.min.css" />
<script src="${path }/res/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${path }/res/js/jquery-1.9.0.min.js"></script>
<script src="${path }/res/js/jquery-validate.js"></script>
<script src="${path }/res/ueditor/ueditor.config.js"></script>
<script src="${path }/res/ueditor/ueditor.all.js"></script>
<LINK rel="stylesheet" href="${path }/res/ueditor/themes/default/css/ueditor.css" />
</head>
<script type="text/javascript">
	
	function nextpage(totalpage, postid) {
		var currentpage = jQuery("#currentpage").val();
		if(currentpage < totalpage) {
			currentpage++;
			jQuery("#currentpage").html(currentpage);
			location.href="${path }/toReplyNewPage?currentpage=" + currentpage +"&postid=" + postid ;
		}
	}
	function prevpage(totalpage, postid) {
		var currentpage = jQuery("#currentpage").val();
		if(currentpage > 1) {
			currentpage--;
			jQuery("#currentpage").html(currentpage);
			location.href="${path }/toReplyNewPage?currentpage=" + currentpage +"&postid=" + postid;
		}
	}
</script>
<body>
	<div class="container" style="padding-top: 50px">
	
		<div class="pricehover">
			<h3>【${SinglePost.sectionname }】[${SinglePost.topic }] ${SinglePost.title }</h3>
			<div style="width:50%;float:left;">
			作者：${SinglePost.username } 
			</div>
			<div style="width:50%;float:right;text-align: right">楼主</div>
		</div>
		<hr/>
		<div>
			${SinglePost.content }
			<p style="text-align: right;">发表于：${SinglePost.posttime }</p>
		</div>
			
		<hr/>
		<div>
			<c:forEach var="Rep" items="${ReplyList }">
				<label>${Rep.username }：</label>
				<p style="padding-left: 60px">${Rep.content }</p>
				<p style="text-align: right;">${Rep.replytime }</p>
				<hr/>
			</c:forEach>
		</div>
		
		<div style="float: right;">
			<a id="prev" href="#" onclick="prevpage('${ReplyPages}', '${SinglePost.postid }')">上一页</a> 
			<input id="currentpage" type="text" value="${currentPage }" style="width: 20px; height: 20px;" />/${ReplyPages } 
			<a id="next" href="#" onclick="nextpage('${ReplyPages}', '${SinglePost.postid }')">下一页</a>
			
		</div>
		
		
		<div style="margin-bottom: 20px">
		<hr/>
			<div>
				<b>我有话要说：</b>
			</div>
			<form action="deliverReply?postid=${SinglePost.postid }&userid=${Login_User.userid }&username=${Login_User.username }" method="post">
				<script type="text/plain" id="content" name="content"></script>
				<script type="text/javascript">
					var editor =new UE.ui.Editor();
					editor.render("content");
				</script>
				<br/>
				<c:if test="${Login_User.enabled == 1}">
					<input type="submit" value="回复" class="btn btn-primary">
				</c:if>
				<c:if test="${Login_User.enabled == 0 }">
					<p style="color:red;">您已被管理员屏蔽，暂时不能发帖回帖！</p>
				</c:if>
				<c:if test="${Login_User == null}">
					<p style="color: red;">您尚未登录，请登录后再发表意见！</p>
				</c:if>
			</form>
		</div>
		
	</div>	
</body>
</html>