<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发帖</title>
<script src="${path }/res/js/jquery-1.9.0.min.js"></script>
<script src="${path }/res/bootstrap/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${path }/res/bootstrap/dist/css/bootstrap.min.css" />
<script src="${path }/res/ueditor/ueditor.config.js"></script>
<script src="${path }/res/ueditor/ueditor.all.js"></script>
<LINK rel="stylesheet" href="${path }/res/ueditor/themes/default/css/ueditor.css" />
<script src="${path }/res/js/bootstrap3-validation.js"></script>
<script type="text/javascript" src="${path }/res/js/formValidation.js"></script>

</head>
<script type="text/javascript">
			var topic=[
           ["C","C++","JAVA","Android"],
           ["求问","答疑"],
           ["新人","杂谈","搬砖","愤青","吐槽"]
           ];
       
           function getTopic(){
               //获得Section下拉框的对象
               var sltSection = document.form.sectionname;
               //获得Topic下拉框的对象
               var sltTopic= document.form.topic;
               
               var SC = topic[sltSection.selectedIndex - 1];
       
               //清空topic下拉框，仅留提示选项
               sltTopic.length=1;
       
               //将topic数组中的值填充到topic下拉框中
               for(var i=0;i<SC.length;i++){
                   sltTopic[i+1]=new Option(SC[i], SC[i]);
               }     
        }
</script>

<body>
	<div class = "container" >
		<h2 style="padding-top: 5%"><i class="glyphicon glyphicon-edit"></i> 欢迎来发帖</h2>
		<hr/>
	</div>
	<div class="container">
		<form action="submitPost" class="form-horizontal" method="post" name="form" id="form1">
		
		<div class="form-group">
			
			<div class="col-sm-2">
				<select class="form-control" id = "sectionname" name="sectionname" onChange="getTopic()" check-type="required">
					<%-- <c:forEach var="Section" items="${SectionList }">
						<option value="${Section.sectionname }" onclick="getTopic('${Section.sectionid}')">${Section.sectionname }</option>
					</c:forEach> --%>
					<option value="其他">选择版块</option>
					<option value="技术精华">技术精华</option>
					<option value="答疑">答疑</option>
					<option value="大杂烩">大杂烩</option>
				</select>
			</div>
			<label class="control-label" for="sectionname">版块</label>
		</div>
		
		<div class="form-group">
			<label class="control-label" for="topic">主题  </label>
			<div class="col-sm-2">
				<select id = "topic" name="topic" class="form-control">
					<option value="其他">其他</option>
				</select>
			</div>
		</div>
		
		<div class="form-group">
			<label class=" control-label" for="title">标题  </label>
			<div class="col-sm-4">
			<input type="text" id ="title" name="title" class="form-control" check-type="required"/>
			</div>
		</div>
		<hr/>
		<div >
			<script type="text/plain" id="editor" name="content" style="height:300px" check-type="required"></script>
			<script type="text/javascript">
				var ue =new UE.ui.Editor();
				ue.render("editor");
			</script> 
		<hr/>
		<c:if test="${Login_User.enabled == 1 }">
        	<input type="submit" id="submit1" value="提交" class="btn btn-primary"/>
        </c:if>
        <c:if test="${Login_User.enabled == 0 }">
        	<p style="color: red;">您已被管理员封禁，暂时不能发帖！</p>
        </c:if>
        <a href="${path}/skipTo?target=image" class="btn btn-default" target="main">返回</a>
		</div>
	
		</form>
		
		
	</div>
</body>
</html>