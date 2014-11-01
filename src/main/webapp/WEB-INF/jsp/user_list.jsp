<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
<link href="${path }/res/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${path }/res/js/jquery-1.9.0.min.js"></script>
<script src="${path }/res/bootstrap/dist/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
	
	function nextpage(totalpage) {
		var currentpage = jQuery("#currentpage").val();
		if(currentpage < totalpage) {
			currentpage++;
			jQuery("#currentpage").html(currentpage);
			location.href="${path }/toUserNewPage?currentpage=" + currentpage;
		}
	}
	function prevpage(totalpage) {
		var currentpage = jQuery("#currentpage").val();
		if(currentpage > 1) {
			currentpage--;
			jQuery("#currentpage").html(currentpage);
			location.href="${path }/toUserNewPage?currentpage=" + currentpage;
		}
	}
	
	function deleteUser(userid) {
		confirm_ = confirm('此操作将删除一个用户，是否继续?');
		if(confirm_) {
			var currentpage = jQuery("#currentpage").val();
			location.href="${path }/deleteUser?userid=" + userid;
		}
	}
	
	function setUserEnabled(userid, username) {
		var enabled = jQuery("#" + userid).text();
		jQuery.post(
			"${path}/setUserEnabled",
			{"userid": userid, "enabled": enabled},
			function(data) {
				if(data.result) {
					jQuery("#" + username).html("<i class='glyphicon glyphicon-ok'></i>启用");
					jQuery("#" + userid).html(0);
				}
				else{
					jQuery("#" + username).html("<i class='glyphicon glyphicon-remove'></i>禁用");
					jQuery("#" + userid).html(1);
				}
			}
		);
	}
</script>
<body>
<div style="padding-top: 5%">
	<h2 style="padding-left: 10%"><i class="glyphicon glyphicon-list"></i> 用户列表</h2>
	<div class="well">
		<div class="table-responsive">
            <table class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>用户名</th>
                  <th>真实姓名</th>
                  <th>年龄</th>
                  <th>性别</th>
                  <th>邮箱</th>
                  <th>是否可用</th>
                  <th>创建时间</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="User" items="${UserList }">
                <tr>
                  <td>${User.username }</td>
                  <td>${User.realname }</td>
                  <td>${User.age }</td>
                  <td>${User.sex }</td>
                  <td>${User.email }</td>
                  <td id="${User.userid }">${User.enabled }</td>
                  <td>${User.creationtime }</td>
                  <td><a href="#" onclick="deleteUser('${User.userid}')"><i class="glyphicon glyphicon-trash"></i>删除</a>
                  
                 <%--  <c:choose>
                  	<c:when test="${User.enabled == 1 }">
                  		<a href="${path }/setUserEnabled?userid=${User.userid }&enabled=${User.enabled}">
                  		<i class="glyphicon glyphicon-remove"></i>禁用</a>
                  	</c:when>
                  	<c:otherwise>
                  		<a href="${path }/setUserEnabled?userid=${User.userid }&enabled=${User.enabled}">
                  		<i class="glyphicon glyphicon-ok"></i>启用</a>
                  	</c:otherwise>
                  </c:choose> --%>
                  
                   <c:choose>
                  	<c:when test="${User.enabled == 1 }">
                  		<a id="${User.username }" href="#" onclick="setUserEnabled('${User.userid}','${User.username }')">
                  		<i class="glyphicon glyphicon-remove"></i>禁用</a>
                  	</c:when>
                  	<c:otherwise>
                  		<a id="${User.username }" href="#" onclick="setUserEnabled('${User.userid}', '${User.username }')">
                  		<i class="glyphicon glyphicon-ok"></i>启用</a>
                  	</c:otherwise>
                  </c:choose>
                  
                  </td>
                </tr>
             </c:forEach>
          	</tbody>
          </table>
          <p style="color: red;">注：”是否可用“一栏中，'1'表示用户未被禁用，'0'表示被禁用</p>
	</div>
	</div>
	
	<div style="float: right;">
		<a id="prev" href="#" onclick="prevpage('${UserPages}')">上一页</a> 
		<input id="currentpage" type="text" value="${currentPage }" style="width: 20px; height: 20px;" />/${UserPages } 
		<a id="next" href="#" onclick="nextpage('${UserPages}')">下一页</a>
	</div>
</div>
</body>
</html>