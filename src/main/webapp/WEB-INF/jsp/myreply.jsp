<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的回复</title>
<link href="${path }/res/css/dashboard.css" rel="stylesheet">
<link href="${path }/res/css/index_main.css" rel="stylesheet">
<link href="${path }/res/css/login.css" rel="stylesheet">
<link href="${path }/res/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheer" href="${path }/res/css/left_menu.css">
<script src="${path }/res/js/jquery-1.9.0.min.js"></script>
<script src="${path }/res/bootstrap/dist/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
	
	function nextpage(totalpage, condition) {
		var currentpage = jQuery("#currentpage").val();
		if(currentpage < totalpage) {
			currentpage++;
			jQuery("#currentpage").html(currentpage);
			location.href="${path }/toMyReplyNewPage?currentpage=" + currentpage +"&condition=" + condition;
		}
	}
	function prevpage(totalpage, condition) {
		var currentpage = jQuery("#currentpage").val();
		if(currentpage > 1) {
			currentpage--;
			jQuery("#currentpage").html(currentpage);
			location.href="${path }/toMyReplyNewPage?currentpage=" + currentpage +"&condition=" + condition;
		}
	}
	
	function deleteMyReply(replyid, userid) {
		confirm_ = confirm('此操作将不可逆，是否继续?');
		if(confirm_) {
			var currentpage = jQuery("#currentpage").val();
			location.href="${path}/deleteReply?currentpage=" + currentpage + "&replyid=" + replyid +"&userid=" + userid;
		}
	}
</script>
<body>
	<div>
		<h2 style="padding-left: 10%"><i class="glyphicon glyphicon-indent-right"></i> 回复管理</h2>
		<div class="well">
			<c:if test="${ReplyList == null }">
				<p>你还没回过贴！</p>
			</c:if>
			<c:forEach var="RL" items="${ReplyList }">
					<div>
						<div>
							<a href="#" style="padding-left: 2%" onclick="deleteMyReply('${RL.replyid}', '${Login_User.userid }')">
							<i class="glyphicon glyphicon-trash"></i>删除</a>
							<p style="padding-left: 6%">${RL.content }</p>
							<a style="float: right;" href="${path }/toViewPost?postid=${RL.postid}">进入帖子</a>
							<p style="float: right;">${RL.replytime }</p>
						</div>
							<hr />
					</div>
				</c:forEach>
		</div>
		
		<c:if test="${ReplyList != null }">
		<div style="float:right;">
			<a id="prev" href="#" onclick="prevpage('${ReplyPages}', '${Login_User.userid }')">上一页</a> 
			<input id="currentpage" type="text" value="${currentPage }" style="width: 20px; height: 20px;" />/${ReplyPages } 
			<a id="next" href="#" onclick="nextpage('${ReplyPages}', '${Login_User.userid }')">下一页</a>
		</div>
		</c:if>
	</div>

</body>
</html>