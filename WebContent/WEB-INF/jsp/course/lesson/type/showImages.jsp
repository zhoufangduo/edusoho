<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>选择图片</title>
	<link href="<%=basePath%>/admin/system/setting/download?file=${site.icoImage}" rel="shortcut icon" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<style type="text/css">
		img{
			width:100px;
			width:150px;
			overflow:hidden;
		} 
		
		.thumbnail{
			width: 120px;
			height: 170px;
			float: left;
			margin-right: 15px; 
		}
	</style>
</head>
<body>
	<div class="panel panel-default">
   		<div class="panel-heading">
   			<label class="course-title2">选择课程中图片</label>
   		</div>
		<div class="panel-body">
			<c:forEach items="${images}" var="image">
				<a href="#" class="thumbnail" title="双击即可选择" onclick="selectImage('${image}')">
			   		<img src="<%=basePath%>/course/lesson/downloadFile?file=${image}">
			    </a>
			</c:forEach>
		</div>
 	</div>
 	<script type="text/javascript">
 		
 		function selectImage(image){
 			var url = "<%=basePath%>/course/lesson/downloadFile?file=" + image;
 			window.opener.CKEDITOR.tools.callFunction(1,url);
 			window.close();
 		}
 	</script>
</body>
</html>