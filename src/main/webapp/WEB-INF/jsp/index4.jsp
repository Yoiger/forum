<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<head>

<meta charset="utf-8">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>闲话搬砖社区</title> 
<link href="${path }/res/css/dashboard.css" rel="stylesheet">
<link href="${path }/res/css/index_main.css" rel="stylesheet">
<link href="${path }/res/css/login.css" rel="stylesheet">
<link href="${path }/res/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${path }/res/zTree/css/zTreeStyle/zTreeStyle.css">
<link rel="stylesheer" href="${path }/res/css/left_menu.css">
<script src="${path }/res/js/jquery-1.9.0.min.js"></script>
<script src="${path }/res/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${path }/res/zTree/js/jquery.ztree.all-3.5.js"></script>

<script>
	function time() {
		var t = document.getElementById("time");
		var d = new Date();
		var hour = d.getHours();
		var minute = d.getMinutes();
		var second = d.getSeconds();
		if(hour < 10)
			hour = "0" + hour;
		if(minute <10)
			minute = "0" + minute;
		if(second < 10)
			second = "0" + second;
		var time = d.getMonth()+"月" +d.getDay() + "日 " +hour + ":"+ minute +":" + second;
		t.innerHTML=time;
		setTimeout('time()', 1000);
	}
</script>

<script type="text/javascript">
	function toLogin() {
		var name = jQuery("#username").val();
		var pwd = jQuery("#password").val();
		jQuery.post(
			"${path}/login", 
			{"username": name, "password":pwd},
			function(data) {
				if(data.result){
					window.parent.location.reload();
				}
				else{
					alert("用户名或密码错误！！");
				}
			}
		,"json");
	}
	
	function toRegister() {
		jQuery('#myModal').modal('toggle');
		//location.href="${path}/skipTo?target=register";
	}
</script>

</head>
<body onload="time()">
<div>
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation" >
	<div class="container-fluid">
        <div class="navbar-header">
          	<a class="navbar-brand" href="${path}/skipTo?target=image" target="main" style="color: red">Bricks</a>
        </div>
        <div class="navbar-collapse collapse">
          	<ul class="nav navbar-nav">
				<li>
					<a href="${path }/showPostList?target=技术精华" target="main">技术精华</a>
				</li>
				<li><a href="${path }/showPostList?target=问答" target="main">问答区</a></li>
				<li><a href="${path }/showPostList?target=大杂烩" target="main">大杂烩</a></li>
				
			</ul>
			
			<div>
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
					</div>
					<a href="${path}/skipTo?target=result" target="main"
						type="submit" class="btn btn-default" id="search">搜索</a>
				</form>    
			</div>
			
		  <div class="navbar-right">
				<ul class="nav navbar-nav">
					<c:choose>
						<c:when test="${Login_User != null }">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								${Login_User.username }			
								<b class="caret"></b>
								</a>
								<ul class="dropdown-menu">
									<li><a>我的消息</a></li>
									<li><a href="${path }/skipTo?target=personalInfo" target="main">个人信息</a></li>
								</ul>
							</li>
							<li><a href="${path }/logout">注销</a></li>
						</c:when>
						<c:when test="${Login_User == null }">
							<li><a data-toggle="modal" href="#myModal" data-backdrop="true" data-keyboard="true" >登陆</a></li>		
							<%-- <li><a  href="${path }/skipTo?target=login" target="main">登陆</a></li> --%>
						</c:when>
					</c:choose>
					<li><a id="time"></a></li>
					
				</ul>
			</div>
        </div>
      </div>
    </div>
    
    <!-- modal -->
    <div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="padding-top: 10%;">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<h3 class="modal-title" id="myModalLabel">Bricks</h3>
				</div>
				<div class="modal-body">
					<form class="form-signin" role="form">
						<h4 class="form-signin-heading" style="text-align: center;">会员登陆</h4>
						<input id="username" name="username" type="text" class="form-control"placeholder="用户名" required autofocus> 
						<input id="password" name="password" type="password" class="form-control" placeholder="密码" required> 
						<a href="#"class="btn btn-primary btn-block" onclick="toLogin()">登录</a>
					</form>
				</div>
				<div class="modal-footer">
					<a href="${path}/skipTo?target=register" target="main" onclick="toRegister()">没有账号？点击这里！</a>
				</div>
			</div>
		</div>
	</div>

    <div class="container-fluid">
      	<div class="row" >
        	<div class="sidebar "style="height: 100%; width:10%">
          		<ul class="nav sidebar" style="width:14%;padding-left: 40px">
            		<li><a href="${path }/showPostList?target=all" target="main">进入论坛</a></li>
            		<c:if test="${Login_User != null}">
            			<li><a href="${path }/skipTo?target=posting" target="main">快速发帖</a></li>
            			<li><a href="${path }/skipTo?target=personalInfo" target="main">个人信息</a></li>            			
            			<li><a href="#">我的论坛</a></li>
            			
            			<li><a href="#">系统管理</a></li>
            			<li><a href="${path }/logout">注销登录</a></li>
            		</c:if>
          		</ul >        		
        	</div>

        <div class="main_content main " style="padding-left: 15%;margin-top: 0;">
        	<iframe runat="server" name="main" src="${path}/skipTo?target=image" width="100%" height="100%" 
        	frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="yes" allowtransparency="yes"></iframe>
        </div>
    </div> 
	</div>	
</div>	
	
</body>
</html>
