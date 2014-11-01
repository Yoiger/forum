<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${path }/res/css/dashboard.css" rel="stylesheet">
<link href="${path }/res/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${path }/res/js/jquery-1.9.0.min.js"></script>
<script src="${path }/res/bootstrap/dist/js/bootstrap.min.js"></script>
</head>
<body>
	 <div class="jumbotron" style="background-image: url(${path }/res/img/bgd.PNG)">
     <h2 style="color: white">Bricks</h2>
     <p style="color: white">探讨技术、解疑答惑、吐槽人生...</p>
     <p>
     	<c:if test="${Login_User == null }">
        	<a class="btn btn-primary" href="${path}/skipTo?target=register" role="button">加入我们 &raquo;</a>
        </c:if>
        <c:if test="${Login_User != null}">
        	<a class="btn btn-primary" href="${path }/showPostList?target=all" target="main">进入论坛&raquo;</a>
        </c:if>
     </p>
     </div>
	<hr/>
		
     <div class="container">
     	<h3 style="color: red;">【公告】</h3>
     	<p>论坛规则：</p>
     	<p>1. Bricks论坛提供的是一个方便大家讨论技术、答疑解惑的平台。我们欢迎大家前来讨论并鼓励原创；</p>
     	<p>2. 严禁发表与政治有关的帖子、回复，一旦发现，永久封账号甚至删除账号！</p>
     	<P>3. 严禁发表色情、暴力、血腥等内容；</P>
     	<p>4. 严禁发布广告；</p>
     	<p>5. 未经他人许可，严禁公布他人信息、转载内容</p>
     	<p style="color: red;">6. 遭到封禁的用户将不能发帖和回帖</p>
     </div>

</body>
</html>