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
<script src="${path }/res/js/jquery-1.9.0.min.js"></script>
<script src="${path }/res/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${path }/res/js/bootstrap3-validation.js"></script>
<script src="${path }/res/js/formValidation.js"></script>
<script src="${path }/res/js/initIndex.js"></script>
<link href="${path }/res/css/dashboard.css" rel="stylesheet">
<link href="${path }/res/css/index_main.css" rel="stylesheet">
<link href="${path }/res/css/login.css" rel="stylesheet">
<link href="${path }/res/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheer" href="${path }/res/css/left_menu.css">

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

function validateSearch() {
	var tj = jQuery("#tj").val();
	if(tj == "") {
		alert("请输入查询内容！");
		
	}
	else {
		main.location.href="${path}/searchPost?tj=" + tj; //main为iframe的id
	}
}
</script>
</head>
<body onload="time()">
<div>

<!-- 上方导航栏 -->
<div class="navbar navbar-fixed-top" role="navigation" style="background-color: #CCCCFF">
	<div class="container-fluid">
        <div class="navbar-header">
          	<a class="navbar-brand" href="${path}/skipTo?target=image" target="main" style="color: red">Bricks</a>
        </div>
        <div class="navbar-collapse collapse">
          	<ul class="nav navbar-nav">
				<li>
					<a href="${path }/showPostList?target=技术精华" target="main">技术精华</a>
				</li>
				<li><a href="${path }/showPostList?target=答疑" target="main">答疑区</a></li>
				<li><a href="${path }/showPostList?target=大杂烩" target="main">大杂烩</a></li>
				
			</ul>
			
			<div>
				<form class="navbar-form navbar-left" role="search"  method="post" id="form1">
					<div class="form-group">
					<input id="tj" type="text" class="form-control" name="tj" placeholder="Search">
					</div>
					<a target="main" class="btn btn-default" onclick="validateSearch()">搜索</a>
				</form>    
			</div>
			
		  <div class="navbar-right">
				<ul class="nav navbar-nav">
					<c:choose>
						<c:when test="${Login_User != null }">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i>
								${Login_User.username }			
								<b class="caret"></b>
								</a>
								<ul class="dropdown-menu">
									<li><a href="${path }/skipTo?target=personalInfo" target="main">个人信息</a></li>
								</ul>
							</li>
							<li><a href="${path }/logout"><i class="glyphicon glyphicon-off"></i> 注销</a></li>
						</c:when>
						<c:when test="${Login_User == null }">
							<li><a data-toggle="modal" href="#myModal" data-backdrop="true" data-keyboard="true" ><i class="glyphicon glyphicon-tower"></i>登陆</a></li>		
						</c:when>
					</c:choose>
					<li><a id="time"></a></li>
					
				</ul>
			</div>
        </div>
      </div>
    </div>
    
    <!-- 实现用户登录的拟态框modal，未激活时隐藏 -->
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
						<input id="username" name="username" type="text" class="form-control"placeholder="用户名" required autofocus data-required> 
						<input id="password" name="password" type="password" class="form-control" placeholder="密码" required data-required> 
						<a href="#"class="btn btn-primary btn-block" onclick="toLogin()">登录</a>
					</form>
				</div>
				<div class="modal-footer">
					<a href="${path}/skipTo?target=register" target="main" onclick="toRegister()">没有账号？点击这里！</a>
				</div>
			</div>
		</div>
	</div>


	<!-- 左边的菜单加iframe -->
   <div class="row-fluid">
		<div class="row-fluid">
			<div class="sidebar" style="height: 100%; width:15%">
          		<div class="sidebar-menu">
            		<a href="${path }/showPostList?target=all" target="main"><i class="glyphicon glyphicon-home"></i> 进入论坛</a>
            		<hr/>
            		<c:if test="${Login_User != null}">
            			
            			<a href="${path}/toPost" target="main"><i class="glyphicon glyphicon-edit"></i> 快速发帖</a>
            			<hr/>
            			
            			<a href="${path }/skipTo?target=personalInfo" target="main"><i class="glyphicon glyphicon-user"></i> 个人信息</a>   
            			<hr/>  
            			      			
            			<a href="#myforum" class="nav-header menu-first collapsed" data-toggle="collapse">
            				<i class="glyphicon glyphicon-folder-open"></i>
            				 我的论坛
            				<b class="caret"></b>
            			</a>
							<ul id="myforum" class="nav nav-list collapse menu-second">
								<li><a href="${path }/mypost?userid=${Login_User.userid}" target="main"><i class="glyphicon glyphicon-indent-left"></i>我的帖子</a></li>
								<li><a href="${path }/myreply?userid=${Login_User.userid}" target="main"><i class="glyphicon glyphicon-indent-right"></i>我的回复</a></li>		
							</ul>
						
						<hr/>
						<c:if test="${Login_Role.roleid == 3001 }">
							<a href="#usermanage" class="nav-header menu-first collapsed" data-toggle="collapse">
								<i class="glyphicon glyphicon-cog"></i>
								 用户管理<b class="caret"></b>
							</a>
							<ul id="usermanage" class="nav nav-list collapse menu-second">
								<li><a href="${path }/toUserList" target="main"><i class="glyphicon glyphicon-list"></i> 用户列表</a></li>
								<li><a href="${path }/skipTo?target=register" target="main"><i class="glyphicon glyphicon-leaf"></i> 新增用户</a></li>
							</ul>
							<hr/>
						
							<a href="#forummanage" class="nav-header menu-first collapsed" data-toggle="collapse">
								<i class="glyphicon glyphicon-cog"></i>
								 论坛管理<b class="caret"></b>
							</a>
							<ul id="forummanage" class="nav nav-list collapse menu-second">
								<li><a style="color: #B0B0B0;text-decoration:none"><i class="glyphicon glyphicon-th"></i> 板块管理</a></li>
								<li><a href="${path }/postManage" target="main"><i class="glyphicon glyphicon-align-justify"></i> 帖子管理</a></li>
							</ul>
							<hr/>
						</c:if>
						<a href="${path }/logout"><i class="glyphicon glyphicon-off"></i> 注销登录</a>
            		</c:if>
				</div>
			
		</div>	
		
		<!-- iframe -->
		<div class="main_content main " style="padding-left: 15%;margin-top: 0;">
        	<iframe runat="server" name="main" src="${path}/skipTo?target=image" width="100%" height="100%" 
        	frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="yes" allowtransparency="yes"></iframe>
        </div>
		
	</div>
	</div>	
</div>	
	
</body>
</html>
