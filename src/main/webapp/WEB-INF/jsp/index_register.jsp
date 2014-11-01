<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
<script src="${path }/res/js/jquery-1.10.2.min.js"></script>
<script src="${path }/res/bootstrap/dist/js/bootstrap.min.js"></script>
<link href="${path }/res/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${path }/res/js/bootstrap3-validation.js"></script>
<script type="text/javascript" src="${path }/res/js/formValidation.js"></script>
<script type="text/javascript" src="${apht }/res/js/jquery-validate.js"></script>
</head>
<body>
	<div >
		<h2 style="text-align: center;padding-top: 40px">注册Bricks会员</h2>
		<div class="well">
		<form class="form-horizontal form" role="form" action="register" method="post" id="form1">
   			<div class="form-group">
      			<label class="col-sm-5 control-label">用户名</label>
      				<div class="col-sm-3">
         				<input type="text" class="form-control" name="username" placeholder="支持英文字符、下划线" 
         					check-type="required" required-message="请填写你的用户名">
      				</div>
   			</div>
   			
   			<div class="form-group">
      			<label class="col-sm-5 control-label">真名</label>
     				 <div class="col-sm-3">
         				<input type="text" class="form-control" name="realname" placeholder="支持汉字、英文" 
         					check-type="required" required-message="请填写你的真名">
      				</div>
   			</div>
   			
   			<div class="form-group">
      			<label class="col-sm-5 control-label">密码</label>
     				 <div class="col-sm-3">
         				<input type="password" class="form-control" id="password" name="password" placeholder="请输入至少6位密码" 
         					 check-type="required" minlength="6">
      				</div>
   			</div>
   			
   			<div class="form-group">
      			<label class="col-sm-5 control-label">确认密码</label>
     				 <div class="col-sm-3">
         				<input type="password" class="form-control" id="password2" placeholder="保持与上一项一致" 
         					onchange="checkPasswords()" check-type="required" minlength="6">
      				</div>
   			</div>
   			
   			<div class="form-group">
      			<label  class="col-sm-5 control-label">年龄</label>
     				 <div class="col-sm-3">
         				<input type="text" class="form-control" name="age" placeholder="请输入10-100的整数" check-type="required" range="10~100" >
      				</div>
   			</div>
   			
   			<div class="form-group">
      			<label class="col-sm-5 control-label">性别</label>
     			<div class="btn-group col-sm-3" data-toggle="buttons">
					<label class="btn btn-default active">
						<input type="radio"  name="sex" autocomplete="off" checked value="男">男
					</label>
					<label class="btn btn-default">
						<input type="radio"  name="sex" autocomplete="off" value="女">女
					</label>
   				</div>
   			</div>
   			
   			<div class="form-group">
      			<label class="col-sm-5 control-label">邮箱</label>
     				 <div class="col-sm-3">
         				<input type="text" class="form-control" name="email" placeholder="请输入xxx@sss.aa" check-type="mail required">
      				</div>
   			</div>
   			<hr/>
   			<div class="form-group" align="center">
   				<button id="submit1" type="submit" class="btn btn-primary" >提交</button>
   				<a href="${path}/skipTo?target=image" class="btn btn-default" target="main">返回</a>
   			</div>
  		</form>	
  		<p>${ExistName }</p>
  		</div>
	</div>
</body>
<script type="text/javascript">
function checkPasswords() {
    var passl = document.getElementById("password");
    var pass2 = document.getElementById("password2");
  	if (passl.value != pass2.value)
        alert("两次密码必须输入一致！");
} 
</script>
</html>