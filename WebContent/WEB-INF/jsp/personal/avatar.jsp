<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="nav" uri="/WEB-INF/navbar.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String basePath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>头像设置-个人中心-${site.title}-${site.subtitle}-Power By 易通软件教育</title>
	<link href="<%=basePath%>/admin/system/setting/download?file=${site.icoImage}" rel="shortcut icon" />
	<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link href="<%=basePath%>/resource/css/all.css" rel="stylesheet" type="text/css">
	<script src="<%=basePath%>/resource/jquery/jquery.form.js"  type="text/javascript"></script>
</head>
<body>
	<nav:menu/>
	<div class="container">
		<div class="row">
		 	<div class="col-md-3">
		 	 	<jsp:include page="menu.jsp"></jsp:include>
			</div>
			 	
			<div class="col-md-9">
				<div class="panel panel-default">
		    		<div class="panel-heading">
		    			<label class="course-title2">头像</label>
		    		</div>
		  			<div class="panel-body">
		  				<form action="<%=basePath%>/personal/upload" class="form-horizontal"  method="post" enctype="multipart/form-data">
		  					<div class="form-group">
							    <label for="username" class="col-sm-2 control-label">当前头像</label>
							    <div class="col-sm-9">
							    	<c:if test="${person.avatar == null}">
							    		<img src="<%=basePath%>/resource/images/deault_head.png" style="width: 200px;height: 200px;" id="image">
							    	</c:if>
							    	<c:if test="${person.avatar != null }">
							    		<img style="width: 200px;height: 200px;" src="<%=basePath%>/personal/download?file=${person.avatar}" id="image">
							    	</c:if>
							    </div>
						    </div>
						    <div class="form-group">
							    <label for="name" class="col-sm-2 control-label">新头像</label>
							    <div class="col-sm-9">
							    	<input type="button" class="btn btn-default" value="选择图片" id="uploadBtn">
							    	<br/>
							    	你可以上传JPG,GiF或PNG格式的文件，文件大小不能超过2.0MB.
							    	<br/>
							    	图片宽度为:200 * 200
							    </div>
						    </div>
						    <br/>
						    <div class="form-group">
							    <div class="col-sm-11" style="text-align: center;">
							    	<input type="button" id="submit" class="btn btn-primary disabled" value="保&nbsp;存"
							    	 style="width: 80px;" data-loading-text="正在提交...">
							    </div>
						    </div>
						    
						    <input type="hidden" value="${person.id}" name="id">
						    <input type="file" name="file" style="display: none;">
		  				</form>
		  			</div>
			  	</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
		$(function(){
			 $("#uploadBtn").click(function(){
				 $("input[name=file]").click();
			 });
			 
			 var fileName;
			 
			 $("input[name=file]").change(function(){
				 var imageUrl = $(this).val();
				 if(imageUrl  != ""){
					 	$("form").ajaxSubmit({
							dataType	: "text",
							type        : "POST",
							cache       : false,
							success		: function(data){	
								var url = "<%=basePath%>/personal/download?file=" + data;
								fileName = data;
								$("#image").attr("src",url);
							}
						});
					 
					   $("#submit").attr("class","btn btn-primary");
				 }
			 });
			 
			 $("#submit").click(function(){
				 var url = "<%=basePath%>/personal/saveAvatar";
				 $.post(url,{'fileName':fileName,'id':'${person.id}'},function(){
					 alert("修改头像成功!");
				 });
			 });
		});
	
	</script>
</body>
</html>