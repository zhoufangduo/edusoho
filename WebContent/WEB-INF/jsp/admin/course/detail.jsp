<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<%@ taglib prefix="nav" uri="/WEB-INF/navbar.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<link href="<%=basePath%>/resource/iCheck/skins/all.css" rel="stylesheet">
		<script src="<%=basePath%>/resource/iCheck/icheck.min.js"></script>
		<style type="text/css">
			 .list-group-item.active, 
			 .list-group-item.active:focus, 
			 .list-group-item.active:hover{
				background-color: #eee;
				color:#000000;
				border-color: #eee;
				font-weight: bold;
				border-left: solid 3px #CCCCCC;
				border-right: solid 3px #CCCCCC;
			}
			.list-group-item.head, 
			.list-group-item.head:focus, 
			.list-group-item.head:hover{
				background-color: #777;
				border-color: #777;
				color: #FFFFFF;
				font-weight: bold;
			}
		</style>
	</head>
	<body>
		<nav:menu/>
		<div class="container">
			<div class="panel panel-default">
			  <div class="panel-body">
			  	 <span style="float: left;">
				  	<a href="#" class="nameTip">${course.title}</a> 
				  	<br>
			 		 教师：${course.creater}
			  	 </span>
			 	 <span style="float: right;">
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
			    		<div class="panel-heading">详细信息</div>
			  			<div class="panel-body">
			  				<form action="<%=basePath%>/admin/course/update" class="form-horizontal" id="addForm" method="post">
			  					<div class="form-group">
								    <label for="title" class="col-sm-2 control-label">课程简介</label>
								    <div class="col-sm-8">
								      <textarea rows="" cols=""></textarea>
								    </div>
							    </div>
							    <br/>
							    <div class="form-group">
								    <label for="subtitle" class="col-sm-2 control-label">课程目标</label>
								    <div class="col-sm-8">
								        <div class="input-group" >
									      <input type="text" class="form-control" id="subtitle" 
									      name="subtitle" placeholder="副标题" value="${course.subtitle}">
									      <span class="input-group-btn">
			        						<button class="btn btn-default" type="type">添加</button>
			      						  </span>
									    </div>
								    </div>
							    </div>
							    <br/>
							    <div class="form-group">
								    <label for="subtitle" class="col-sm-2 control-label">适应人群</label>
								    <div class="col-sm-8">
								    	<div class="input-group" >
									      	<input type="text" class="form-control" id="subtitle" 
									      		name="subtitle" placeholder="副标题" value="${course.subtitle}">
									      	<span class="input-group-btn">
			        							<button class="btn btn-default" type="type">添加</button>
			      						  	</span>
		      						  	</div>
								    </div>
							    </div>
							    <br/>
							    
							    <div class="form-group">
								    <div class="col-sm-9" style="text-align: center;">
								      <input type="submit" style="width: 100px;" class="btn btn-primary btn-lg" value="保&nbsp;存">
								    </div>
							    </div>
							    
			  				</form>
			  			</div>
			  		</div>
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
			
			$('input[type=radio]').iCheck({
			    checkboxClass: 'iradio_flat-blue',
			    radioClass: 'iradio_flat-blue'
			});
		});
		
	</script>
	</body>
</html>