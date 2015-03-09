<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<%@ taglib prefix="nav" uri="/WEB-INF/navbar.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>注册用户</title>
	<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link href="<%=basePath%>/resource/iCheck/skins/all.css" rel="stylesheet">
	<script src="<%=basePath%>/resource/iCheck/icheck.min.js"></script>
	<link href="<%=basePath%>/resource/css/all.css" rel="stylesheet" type="text/css">
	<style type="text/css">
		.form-control{
			width: 65%;
			float: left;
		}
		.control-label{
			width: 120px;
		}
		.btn{
			width: 250px;
		}
	</style>
</head>
<body>
	<nav:menu/>
	<center>
		<div class="w8-panel">
			<div class="panel panel-default">
			  <div class="panel-body">
			      <h3 style="text-align: left;">注册用户</h3>
			      <br>
			      <form class="form-horizontal">
			      	 <div class="form-group">
					    <label for="username" class="col-sm-2 control-label">账&nbsp;号</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="username" placeholder="账号">
					      <span class="right-tip">英文、数字和字符，长度为:5-30</span>
					    </div>
					  </div>
					  <br/>
					  <div class="form-group">
					    <label for="email" class="col-sm-2 control-label">邮&nbsp;箱</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="email" placeholder="邮箱">
					      <span class="right-tip">填写你常用的邮箱作为登录帐号</span>
					    </div>
					  </div>
					  <br/>
					  <div class="form-group">
					    <label for="password" class="col-sm-2 control-label">密&nbsp;码</label>
					    <div class="col-sm-10">
					      <input type="password" class="form-control" id="password" placeholder="密码" >
					      <span class="right-tip">5-20位英文、数字、符号，区分大小写</span>
					    </div>
					  </div>
					  <br/>
					  <div class="form-group">
					    <label for="password" class="col-sm-2 control-label">确认密码</label>
					    <div class="col-sm-10">
					      <input type="password" class="form-control" id="password" placeholder="确认密码">
					      <span class="right-tip">再输入一次密码</span>
					    </div>
					  </div>
					  <br/>
					  <p/>
					  <div class="form-group">
					    <div class="col-sm-10">
					       <button type="submit" class="btn btn-primary btn-lg btn-block">注&nbsp;&nbsp;&nbsp;册</button>
					    </div>
					  </div>
			      </form>
			  </div>
			</div>
		</div>
	</center>
</body>
</html>