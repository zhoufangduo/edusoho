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
					<h3>创建课程</h3>
					<p/><br/><br/>
					<form action="<%=basePath%>/admin/course/add" class="form-horizontal" id="addForm" method="post">
						<div class="form-group">
						    <label for="title" class="col-sm-2 control-label">标&nbsp;题</label>
						    <div class="col-sm-9">
						      <input type="text" class="form-control" id="title" name="title" placeholder="课程标题">
						    </div>
					    </div>
					    <br/><br/><br/>
					    <div class="form-group">
						    <div class="col-sm-9" style="text-align: center;">
						      <input type="submit" style="width: 100px;" class="btn btn-primary btn-lg" value="创&nbsp;建">
						    </div>
					    </div>
					    <br/>
					    <div class="form-group">
						    <div class="col-sm-9" style="text-align: center;">
						     	<a href="#">如何创建课程?</a>
						    </div>
					    </div>
					</form>
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