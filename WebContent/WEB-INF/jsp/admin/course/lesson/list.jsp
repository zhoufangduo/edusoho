<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<%@ taglib prefix="nav" uri="/WEB-INF/navbar.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"  "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>课时管理-课程管理-易通软件教育后台管理</title>
		<link href="<%=basePath%>/admin/system/setting/download?file=${site.icoImage}" rel="shortcut icon" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
		<script src="<%=basePath%>/resource/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
		<link href="<%=basePath%>/resource/css/all.css" rel="stylesheet" type="text/css">
		<script src="<%=basePath%>/resource/jquery/jquery.validate.js" type="text/javascript"></script>
		<script src="<%=basePath%>/resource/jquery/validate_form.js" type="text/javascript"></script>
		<script src="<%=basePath%>/resource/jquery/messages_zh.js" type="text/javascript"></script>
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
			<jsp:include page="info.jsp"></jsp:include>
			<div class="row">
			 	 <div class="col-md-3">
			 	 	<jsp:include page="../prop_menu.jsp"></jsp:include>
				 </div>
				 <div class="col-md-9">
			    	<div class="panel panel-default">
			    		<div class="panel-heading">
					    	 <label class="course-title2">课时管理</label>
				    		 <span style="float:right; margin-right: 5px;">
				    			<div class="btn-group">
								  <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
								   <span class="glyphicon glyphicon-plus"></span>&nbsp;
								    添加&nbsp;<span class="caret"></span>
								  </button>
								  <ul class="dropdown-menu" role="menu">
								    <li><a href="javascript:showModel('#model','<%=basePath%>/admin/course/chapter/toAdd?type=1&pId=0&courseId=${course.id}')">
								   		<span class="glyphicon glyphicon-plus-sign"></span>&nbsp;添加章
								   	</a></li>
								    <li><a href="javascript:showModel('#model','<%=basePath%>/admin/course/chapter/toAdd?type=2&pId=0&courseId=${course.id}')">
								    	<span class="glyphicon glyphicon-plus-sign"></span>&nbsp;添加节
								    </a></li>
								  </ul>
								</div>
								
								&nbsp;&nbsp;
								<a href="javascript:showModel('#model','<%=basePath%>/admin/course/lesson/toAdd?pId=0&courseId=${course.id}')" 
				    					class="btn btn-primary">
					    			<span class="glyphicon glyphicon-plus"></span>&nbsp;添加课时
				    			</a>
				    			&nbsp;&nbsp;
								<a href="" 
				    					class="btn btn-info">
					    			<span class="glyphicon glyphicon-plus"></span>&nbsp;添加作业
				    			</a>
				    		</span>
			    		</div>
			  			<div class="panel-body">
			  				<div class="form-horizontal" style="height: 370px;">
			  					<ul class="lesson-list sortable-list">
			  						<c:forEach items="${chapters}" var="chapter">
			  							<li class="item-chapter  clearfix" style="word-break: break-all;">
											<div class="item-content">第 <span class="number">1</span> 章：${chapter.title}</div>
											<div class="item-actions prs"></div>
										</li>			 
			  						</c:forEach>
			  						
						  			<!-- <li class="item-chapter  clearfix" style="word-break: break-all;">
										<div class="item-content">第 <span class="number">1</span> 章： 第一章</div>
										<div class="item-actions prs"></div>
									</li>			  						  			   
									<li class="item-chapter item-chapter-unit clearfix"  style="word-break: break-all;">
										<div class="item-content">第 <span class="number">1</span> 节： 第一节</div>
										<div class="item-actions prs"></div>
									</li>			  						  			    
									<li class="item-lesson clearfix" id="lesson-1" style="word-break: break-all;">
										<div class="item-line"></div>
										<div class="item-content">
											dffdssf
										</div>
										<div class="item-actions"></div>
									</li>	
									<li class="item-lesson clearfix" id="lesson-1" style="word-break: break-all;">
										<div class="item-line"></div>
										<div class="item-content">
											dffdssf
										</div>
										<div class="item-actions"></div>
									</li>	
									<li class="item-chapter  clearfix" id="chapter-3" style="word-break: break-all;">
										<div class="item-content">第 <span class="number">1</span> 章： 第一章</div>
										<div class="item-actions prs"></div>
									</li>		   -->						
								</ul>
			  				</div> 
			  			</div>
			  		</div>
				 </div>
			</div>
		</div>
		<div id="model">
		
		</div>
	</body>
</html>