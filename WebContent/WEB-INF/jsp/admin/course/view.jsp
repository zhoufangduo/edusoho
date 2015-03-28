<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<%@ taglib prefix="nav" uri="/WEB-INF/navbar.tld" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>课程管理-易通软件教育后台管理</title>
		<link href="<%=basePath%>/admin/system/setting/download?file=${site.icoImage}" rel="shortcut icon" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
		<script src="<%=basePath%>/resource/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="<%=basePath%>/resource/jquery/jquery.validate.js" type="text/javascript"></script>
		<script src="<%=basePath%>/resource/jquery/validate_form.js" type="text/javascript"></script>
		<script src="<%=basePath%>/resource/jquery/messages_zh.js" type="text/javascript"></script>
		<link href="<%=basePath%>/resource/css/all.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<nav:menu/>
		<div class="container">
			<div class="panel panel-default" style="width:60%;margin: auto;">
				<div class="panel-body" style="padding: 0px 20px;height: 480px;">
					
				</div>
			</div>
		</div>
		<script type="text/javascript">
	
		$(function(){
			$("#addForm").validate({
				success:success,
				ignore: "",
				errorPlacement: showErrorTab,
				rules:{
					"title":{
						required: true
					}
				},
				messages:{
					"title": "课程标题是必填项"
				},
				submitHandler: function(form) {
					form.submit();
				}
			});
		});
		
	</script>
	</body>
</html>