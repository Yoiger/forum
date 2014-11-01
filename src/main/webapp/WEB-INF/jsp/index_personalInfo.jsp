<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Personal Information</title>
<link href="${path }/res/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${path }/res/js/jquery-1.9.0.min.js"></script>
<script src="${path }/res/bootstrap/dist/js/bootstrap.min.js"></script>
<link href="${path }/res/css/dashboard.css" rel="stylesheet">
<link href="${path }/res/css/index_main.css" rel="stylesheet">
<link href="${path }/res/css/login.css" rel="stylesheet">
</head>

<script>
	jQuery(document).ready(function(){
		jQuery("#doneBtn").hide();
		jQuery("#info").disabled();
	});
	
	function toDoneBtn() {
		jQuery("#changeBtn").remove();
		jQuery("#doneBtn").show();
	}
	
	function submitInfo(userid) {
		var age = jQuery("#age").val();
		var email = jQuery("#email").val();
		jQuery.post(
			"${path }/changeInfo",	
			{"userid": userid, "age": age, "email": email},
			function(data) {
				if(data.result) {
					alert("修改成功！");
				}
				else {
					alert("出现未知错误！");
				}
			}
		);
	}
</script>

<body>
	<div>
		<h2 style="padding-left: 10%"><i class="glyphicon glyphicon-user"></i>个人信息管理</h2>
		<div class="well">
			<form class="form-horizontal" method="post">
			<div id="info">
				<div class="form-group">
      				<label class="col-sm-2 control-label">用户名</label>
      				<div class="col-sm-3">
         				<input type="text" class="form-control disabled" name="username" value="${Login_User.username }" disabled> 
      				</div>
   				</div>
   				
   				<div class="form-group">
      				<label class="col-sm-2 control-label">真实姓名</label>
     				 <div class="col-sm-3">
         				<input type="text" class="form-control" name="realname" value="${Login_User.realname }" disabled>
      				</div>
   				</div>
				
				<div class="form-group">
      				<label class="col-sm-2 control-label">年龄</label>
     				 <div class="col-sm-3">
         				<input type="text" class="form-control" id= "age"name="age" value="${Login_User.age }">
      				</div>
   				</div>
   				
   				<div class="form-group">
      				<label class="col-sm-2 control-label">邮箱</label>
     				 <div class="col-sm-3">
         				<input type="text" class="form-control" id="email"name="email" value="${Login_User.email }">
      				</div>
   				</div>
   				</div>
				<hr/>
				
				<!-- <div id="changeBtn" class="form-group" style="padding-left: 15%">
   					<button class="btn btn-primary" onclick="toDoneBtn()">修改信息</button>
   				</div> -->
   				
				<div  class="form-group" style="padding-left: 15%">
   					<a class="btn btn-primary" onclick="submitInfo('${Login_User.userid}')">完成修改</a>
   				</div>
			</form>
		</div>
	</div>
</body>
</html>