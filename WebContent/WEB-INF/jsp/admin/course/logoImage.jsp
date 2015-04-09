<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<%@ taglib prefix="nav" uri="/WEB-INF/navbar.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"  "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>课程图片-课程管理-易通软件教育后台管理</title>
		<link href="<%=basePath%>/admin/system/setting/download?file=${site.icoImage}" rel="shortcut icon" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
		<script src="<%=basePath%>/resource/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
		<link href="<%=basePath%>/resource/css/all.css" rel="stylesheet" type="text/css">
		<script src="<%=basePath%>/resource/jquery/jquery.form.js"  type="text/javascript"></script>
		<style type="text/css">
			.logoImage{
				width: 400px;
				height: 210px;
			}
		</style>
	</head>
	<body>
		<nav:menu/>
		<div class="container">
			<div class="panel panel-default">
			  <div class="panel-body">
			  	 <span style="float: left;">
				  <img style="width: 80px;height: 50px;"
					<c:choose>
						<c:when test="${course.logoImage == null}">
							src="<%=basePath%>/resource/images/et-logo.png" 
						</c:when>
						<c:otherwise>
							 src="<%=basePath%>/admin/course/download?file=${course.logoImage}"
						</c:otherwise>
					</c:choose>
					>
				 </span>
			  	 <span style="float: left;">
				  	<a href="#" class="nameTip">${course.title}</a> 
				  	<br>
			 		 教师：${course.creater}
			 		 <br>
			  	 </span>
			 	 <span style="float: right;margin-top: 8px;">
			 	 	<a class="btn btn-default" href="#" role="button">返回课程列表</a>&nbsp;
			 	 	<a class="btn btn-info" href="#" role="button">预览</a>&nbsp;
			 	 	<a class="btn btn-primary" href="#" role="button">上课</a>&nbsp;
			 	 </span>
			  </div>
			</div>
			<div class="row">
			 	 <div class="col-md-3">
			 	 	<jsp:include page="prop_menu.jsp"></jsp:include>
				 </div>
					 	
				 <div class="col-md-9">
			    	<div class="panel panel-default">
			    		<div class="panel-heading">课程图片</div>
			  			<div class="panel-body">
			  				<div class="form-horizontal" style="height: 370px;">
			  					 <div class="form-group">
				  					<center>
				  						<img id="logoImage" class="logoImage"
				  						<c:choose>
				  							<c:when test="${course.logoImage == null}">
				  								src="<%=basePath%>/resource/images/easytopLOGO.png" 
				  							</c:when>
				  							<c:otherwise>
				  								 src="<%=basePath%>/admin/course/download?file=${course.logoImage}"
				  							</c:otherwise>
				  						</c:choose>
				  						>
								      	 <input type="hidden" name="logoImage">
								      	 <br/>&nbsp;<br/>
								      	 <br/>&nbsp;
								      <span>
								      	<input type="button" class="btn btn-primary" style="width: 100px;"
								      	 onclick="openLogoFile()" value="选&nbsp;择">
								      	<br/>
								      	你可以上传jpg, gif, png格式的文件, 图片建议尺寸至少为400x210。
								      	<br/>文件大小不能超过2M。
								      </span>
				  					</center>
			  					</div>
			  				</div>
			  			</div>
			  		</div>
				 </div>
			</div>
		</div>
		<form id="logoForm" action="<%=basePath%>/admin/course/upload?active=logoImage" 
	  	 	enctype="multipart/form-data" method="post">
	  	 	<input type="file" name="file" id="logoFile" style="display:none;">	
	  	 	<input type="hidden" value="${course.id}" name="fileName">
	  	</form>
		<script type="text/javascript">
			function openLogoFile(){
				$("#logoFile").click();
			}
			
			$(function(){
				$("#logoFile").change(function(){
					$("#logoForm").ajaxSubmit({
						dataType	: "text",
						type        : "POST",
						cache       : false,
						success		: function(data){	
							var url = "<%=basePath%>/admin/course/download?file=" + data;
							$("#logoImage").attr("src",url);
						}
					});
				});
			});
		</script>
	</body>
</html>