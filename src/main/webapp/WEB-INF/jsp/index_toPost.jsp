<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Post an article</title>
<link rel="stylesheet" href="${path }/res/bootstrap/dist/css/bootstrap.min.css" />
<script src="${path }/res/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${path }/res/js/jquery-1.9.0.min.js"></script>
<script src="${path }/res/js/jquery-validate.js"></script>
<script src="${path }/res/ueditor/ueditor.config.js"></script>
<script src="${path }/res/ueditor/ueditor.all.js"></script>
<LINK rel="stylesheet" href="${path }/res/ueditor/themes/default/css/ueditor.css" />
</head>
<body>
	<div class = "container" >
		<h2>欢迎来发帖</h2>
		<hr/>
	</div>
	<div class="container">
		<form action="submitPost" class="form-horizontal" method="post" name="form">
		
		<div >
			<label  for="topic">主题  </label>
			<select id = "topic" name="topic" >
				<option value="吐槽">吐槽</option>
				<option value="搬砖">搬砖</option>
				<option value="文艺">文艺</option>
				<option value="爆尿">爆尿</option>
				<option value="大神">大神</option>
				<option value="新手">新手</option>
			</select>
			<!-- <input type="text" id ="topic" name="topic" class="input-xlarge focused"/> -->
		</div>
		
		<div >
			<label  for="title">标题  </label>
			<input type="text" id ="title" name="title" class="input-xlarge focused"/>
		</div>
		<hr/>
		<div >	
		<textarea name="content" id="myEditor" style="height:300px;width=1200px;">这里写你的初始化内容</textarea> 
		<script type="text/plain" id="content" name="content"></script>
				<script type="text/javascript">
					var editor =new UE.ui.Editor();
					editor.render("content");
				</script>

			<hr/>
        <input type="submit" value="提交" class="btn btn-primary"/>	
		</div>
		</form>
	</div>
</body>
<script>
	 $('form').validate({
		onKeyup : true,
			eachValidField : function() {
				$(this).closest('div').removeClass('error').addClass('success');
				},
			eachInvalidField : function() {
				$(this).closest('div').removeClass('success').addClass('error');
				},
				conditional : {
					confirm : function() {
					return $(this).val() == $('#password').val();
					}
		}
	}); 
</script>
</html>