<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${path }/res/css/dashboard.css" rel="stylesheet">
<link href="${path }/res/css/index_main.css" rel="stylesheet">
<link href="${path }/res/css/login.css" rel="stylesheet">
<link href="${path }/res/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${path }/res/zTree/css/zTreeStyle/metro.css">

<script src="${path }/res/js/jquery-1.9.0.min.js"></script>
<script src="${path }/res/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${path }/res/zTree/js/jquery.ztree.core-3.5.js"></script>
<title>闲话搬砖社区</title>

<script type="text/javascript">
	function toLogin() {
		var name = jQuery("#username").val();
		var pwd = jQuery("#password").val();
		jQuery.post(
			"${path}/login", 
			{"username": name, "password":pwd},
			function(data) {
				alert("dsad");
				if(data.result){
					window.parent.location.reload();
				}
				else{
					alert("用户名或密码错误！！");
				}
			}
		,"json");
	}
</script>
</head>
<body>
	<div class="container">
		<form class="form-signin" role="form">
			<h4 class="form-signin-heading" style="text-align: center;">会员登陆</h4>
			<input id="username" name="username" type="text" class="form-control"placeholder="用户名" required autofocus> 
			<input id="password" name="password" type="password" class="form-control" placeholder="密码" required> 
			<a href="#"class="btn btn-primary btn-block" onclick="toLogin()">登录</a>
		</form>
	</div>
</body>
</html>