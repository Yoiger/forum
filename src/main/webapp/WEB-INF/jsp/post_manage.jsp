<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>贴子管理</title>
<script src="${path }/res/js/jquery-1.9.0.min.js"></script>
<link href="${path }/res/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${path }/res/bootstrap/dist/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
	
function nextpage(totalpage, condition) {
	var currentpage = jQuery("#currentpage").val();
	if(currentpage < totalpage) {
		currentpage++;
		jQuery("#currentpage").html(currentpage);
		location.href="${path }/toNewPage2?currentpage=" + currentpage +"&condition=" +condition;
	}
}
function prevpage(totalpage, condition) {
	var currentpage = jQuery("#currentpage").val();
	if(currentpage > 1) {
		currentpage--;
		jQuery("#currentpage").html(currentpage);
		location.href="${path }/toNewPage2?currentpage=" + currentpage +"&condition=" +condition;
	}
}

	function deletePost(postid) {
		confirm_ = confirm('此操作将删除一篇帖子，是否继续?');
		if(confirm_) {
			location.href="${path }/deletePost?postid=" + postid;
		}
	}
</script>

<body>
<div>
	<h2 style="padding-left: 10%;padding-top: 40px"><i class="glyphicon glyphicon-align-justify"></i>贴子管理</h2>
	<div class="well">
		<div class="table-responsive">
            <table class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>版块</th>
                  <th>主题</th>
                  <th>标题</th>
                  <th>发帖人</th>
                  <th>发帖时间</th>
                  <th>浏览数</th>
                  <th>回复数</th>
                  <th>是否屏蔽</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach var="Post" items="${PostList }">
              	<tr>
              		<td>${Post.sectionname }</td>
              		<td>${Post.topic }</td>
              		<td><a href="${path }/toViewPost?postid=${Post.postid}" target="main">${Post.title }</a></td>
              		<td>${Post.username }</td>
              		<td>${Post.posttime }</td>
              		<td>${Post.viewcount }</td>
              		<td>${Post.replytimes }</td>
              		<td>${Post.status }</td>
              		<td>
              			<a onclick="deletePost('${Post.postid }')"><i class="glyphicon glyphicon-trash"></i>删除</a>
                 		<c:choose>
                  			<c:when test="${Post.status == 1 }">
                  			<a href="${path }/setPostStatus?postid=${Post.postid }&status=${Post.status}"><i class="glyphicon glyphicon-remove"></i>屏蔽</a>
                  		</c:when>
                  		<c:otherwise>
                  			<a href="${path }/setPostStatus?postid=${Post.postid }&status=${Post.status}"><i class="glyphicon glyphicon-ok"></i>解封</a>
                  		</c:otherwise>
                  		</c:choose>
              		</td>
              	</tr>
              	</c:forEach>
              </tbody>
             </table>
              <p style="color: red;">注：”是否屏蔽“一栏中，'1'表示用户未被屏蔽可被查看，'0'表示屏蔽，帖子不可查看</p>
         </div>
	</div>
	
	<div style="float:right;">
		<a id="prev" href="#" onclick="prevpage('${PostPages}', 'all')">上一页</a> 
		<input id="currentpage" type="text" value="${currentPage }" style="width: 20px; height: 20px;" />/${PostPages } 
		<a id="next" href="#" onclick="nextpage('${PostPages}', 'all')">下一页</a>
	</div>
</div>
</body>
</html>