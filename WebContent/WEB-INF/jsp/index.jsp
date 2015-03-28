<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="nav" uri="/WEB-INF/navbar.tld" %>
<%String basePath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>${site.title}-${site.subtitle}-Power By 易通软件教育</title>
	<link href="<%=basePath%>/admin/system/setting/download?file=${site.icoImage}" rel="shortcut icon" />
	<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link href="<%=basePath%>/resource/css/all.css" rel="stylesheet" type="text/css">
</head>
<body>
	<nav:menu/>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-body">
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
			      <ol class="carousel-indicators">
			        <li data-target="#carousel-example-generic" data-slide-to="0" class=""></li>
			        <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
			        <li data-target="#carousel-example-generic" data-slide-to="2" class="active"></li>
			      </ol>
			      <div class="carousel-inner" role="listbox">
			        <div class="item">
			          <img  src="<%=basePath%>/resource/images/1.png"  data-holder-rendered="true">
			           <div class="carousel-caption">
				       	1.png
				       </div>
			        </div>
			        <div class="item">
			          <img  src="<%=basePath%>/resource/images/2.png" data-holder-rendered="true">
			          <div class="carousel-caption">
				       	2.png
				      </div>
			        </div>
			        <div class="item active">
			          <img  src="<%=basePath%>/resource/images/3.png"  data-holder-rendered="true">
			          <div class="carousel-caption">
				       	3.png
				      </div>
			        </div>
			      </div>
			      <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			        <span class="sr-only">Previous</span>
			      </a>
			      <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			        <span class="sr-only">Next</span>
			      </a>
			    </div>
			    <p/>
			    <div class="row">
				  <div class="col-md-8">
				  	<div class="panel panel-success">
				  		<div class="panel-heading">
					    	<h3 class="panel-title">课程&nbsp;
					    		<small style="float: right;"><a href="#">更多...</a></small>
					    	</h3>
					  	</div>
					  	<div class="panel-body">
							<div href="#" class="thumbnail">
							  <img alt="" src="<%=basePath%>/resource/images/et-logo.png" style="float: left;">
						      <div class="course">
						    		 <span class="course-title">ajax</span>
						    		 <br/>ajax的介绍<p/></p>
						    		 <span>admin<br>管理员</span>
						      </div>
						    </div>	
						    <div href="#" class="thumbnail">
						    	<img alt="" src="<%=basePath%>/resource/images/et-logo.png" style="float: left;">
						    	<div class="course">
						    		 <span class="course-title">ajax</span><br/>ajax的介绍<p/></p>
						    		 <span>admin<br>管理员 </span>
						    	</div>
						    </div>	
						    <div href="#" class="thumbnail">
						    	<img alt="" src="<%=basePath%>/resource/images/et-logo.png" style="float: left;">
							    <div class="course">
						    		 <span class="course-title">ajax</span><br/>ajax的介绍<p/></p>
						    		 <span>admin<br>管理员</span>
						    	</div>
						    </div>	
						    <div href="#" class="thumbnail">
						    	<img alt="" src="<%=basePath%>/resource/images/et-logo.png" style="float: left;">
							    <div class="course">
						    		 <span class="course-title">ajax</span><br/>ajax的介绍<p/></p>
						    		 <span>admin<br>管理员</span>
						    	</div>
						    </div>
						    <div style="float: right;">
						    	<button type="button" class="btn btn-default btn-sm">更多...</button>
						    </div>
					  	</div>
				  	</div>
				  	
				  </div>
				  <div class="col-md-4">
				  	<div class="panel panel-info">
				  		<div class="panel-heading">
					    	<h3 class="panel-title">学员动态
					    		<small style="float: right;"><a href="#">更多...</a></small>
					    	</h3>
					  	</div>
					  	<div class="panel-body">
					  		<div class="status-list">
					    		<span class="glyphicon glyphicon-user"></span>
					    		admin开始学习ajax的
					    	</div>
					    	<div class="status-list">
					    		<span class="glyphicon glyphicon-user"></span>
					    		admin开始学习ajax的
					    	</div>
					    	<div class="status-list">
					    		<span class="glyphicon glyphicon-user"></span>
					    		admin开始学习ajax的
					    	</div>
					    	<div class="status-list">
					    		<span class="glyphicon glyphicon-user"></span>
					    		admin开始学习ajax的
					    	</div>
					    	<div style="float: right;margin-top: 10px;">
						    	<button type="button" class="btn btn-default btn-sm">更多...</button>
						    </div>
					  	</div>
					</div>
				  </div>
				</div>
		    </div>
	    </div>
	    <div class="foot_contain">
	    	www.hao123.com 新浪
			Powered by EasyTop v4.8.0 ©2015-2016 好知网
	    </div>
	</div>
</body>
</html>