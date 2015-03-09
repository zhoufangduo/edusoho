<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<%@ taglib prefix="nav" uri="/WEB-INF/navbar.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>搜索</title>
	<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link href="<%=basePath%>/resource/iCheck/skins/all.css" rel="stylesheet">
	<script src="<%=basePath%>/resource/iCheck/icheck.min.js"></script>
	<link href="<%=basePath%>/resource/css/all.css" rel="stylesheet" type="text/css">
</head>
<body>
	<nav:menu/>
	<div class="container">
		<div class="panel panel-default">
		  <div class="panel-heading">
		  	<h3>搜索</h3>
		  </div>
		  <div class="panel-body">
		      <div class="input-group input-group-lg">
				  <div class="input-group-btn">
				   	 <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1"
				   	 	 data-toggle="dropdown" aria-expanded="true">分类<span class="caret"></span>
					  </button>
					  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
					  </ul>
				  </div>
				  <span class="input-group-addon">
			        <input type="checkbox">&nbsp;仅显示直播课程
			      </span>
				  <input type="text" class="form-control"  placeholder="输入搜索的关键字">
				  <span class="input-group-btn">
			        <button class="btn btn-primary" type="button">搜索</button>
			      </span>
			 </div>
			 <br/>
			 <div style="text-align: center;">
			 	 目前没有内容!
			 </div>
				
		  </div>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			$('input[type=checkbox]').iCheck({
			    checkboxClass: 'icheckbox_flat-blue',
			    radioClass: 'iradio_flat'
			});
			
			
		});
	
	</script>
</body>
</html>