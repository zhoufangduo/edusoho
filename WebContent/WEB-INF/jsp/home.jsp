<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<%@ taglib prefix="nav" uri="/WEB-INF/navbar.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>我的主页</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link href="<%=basePath%>/resource/css/all.css" rel="stylesheet" type="text/css">
	<style type="text/css">
		.img-circle{
			width: 130px;
			height: 130px;
			float: left;
			margin-right: 30px;
		}
		
		.username{
			font-size: 30px;
			font-weight: bold;
			margin-right: 10px;
		}
	
	</style>
</head>
<body>
	<nav:menu/>
	<div class="container">
		<div class="panel panel-default">
	  		<div class="panel-body">
	   			<img src="<%=basePath%>/resource/images/00104.jpg"  class="img-circle">
	   			<span>
	   				<label class="username">admin</label>管理员
	   				<br>
	   				管理员，大家权限是我给的
	   			</span>
	  		</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-body">
				<div role="tabpanel">
				  <ul class="nav nav-tabs" role="tablist">
				    <li role="presentation" class="active">
				    	<a href="#home" aria-controls="home" role="tab" data-toggle="tab">在线课程</a>
				    </li>
				    <li role="presentation">
				    	<a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">在学课程</a>
				    </li>
				    <li role="presentation">
				    	<a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">收藏课程</a>
				    </li>
				  </ul>
				  <div class="tab-content">
				    <div role="tabpanel" class="tab-pane active" id="home">在线课程</div>
				    <div role="tabpanel" class="tab-pane" id="profile">在学课程</div>
				    <div role="tabpanel" class="tab-pane" id="messages">收藏课程</div>
				  </div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>