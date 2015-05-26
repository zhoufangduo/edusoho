<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<%@ taglib prefix="nav" uri="/WEB-INF/navbar.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>我的在线课程-易通软件教育后台管理</title>
	<link href="<%=basePath%>/admin/system/setting/download?file=${site.icoImage}" rel="shortcut icon" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link href="<%=basePath%>/resource/css/all.css" rel="stylesheet" type="text/css">
</head>
<body>
	<nav:menu/>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<jsp:include page="menu.jsp"></jsp:include>
			</div>
			<div class="col-md-9">
				<div class="panel panel-default">
				  <div class="panel-heading">
				  		<label style="font-size: 15px;">在教课程</label>
					 	<a class="btn btn-sm btn-info"  href="<%=basePath%>/course/toAdd"
					 	style="float: right;">
					 		<span class="glyphicon glyphicon-plus"></span>&nbsp;创建课程
					 	</a>
				  </div>
				  <div class="panel-body">
				     <table class="table table-hover">
  						<tr>
  							<th>名称</th>
  							<th>状态</th>
  							<th>创建者</th>
  							<th>创建时间</th>
  							<th>操作</th>
  						</tr>
  						<c:forEach items="${courses}" var="course">
  							<tr>
  								<td title="${course.title}">
  									<a href="<%=basePath%>/course/view?id=${course.id}" class="nameTip">
  										<img alt="${course.title}" src="<%=basePath%>/course/download?file=${course.logoImage}" 
  										style="width: 100px;height: 56px;">
  									
  									${course.title}</a>
  									<c:if test="${course.recommended == 1}">
  										<span class="badge" style="background-color: red;">推荐</span>
  									</c:if>
  								</td>
  								<td>
  									<c:if test="${course.status == 'DRAFT'}">
  										<span style="color: #b0b0b0">未发布</span>
  									</c:if>
  									<c:if test="${course.status == 'PUBLISHED'}">
  										<span style="color: #449d44">已发布</span>
  									</c:if>
  									<c:if test="${course.status == 'CLOSED'}">
  										<span style="color: #c9302c">已关闭</span>
  									</c:if>
  								</td>
  								<td>
  									<c:forEach items="${users}" var="u">
  										<c:if test="${u.id == course.creater}">${u.name}</c:if>
  									</c:forEach>
  								</td>
  								<td>${course.createTime}</td>
  								<td>
									<c:choose>
										<c:when test="${course.creater == user.id}">
											<div class="btn-group">
											  <a href="<%=basePath%>/course/view?id=${course.id}" 
											  	class="btn btn-sm btn-default">管理</a>
											  <button type="button" class="btn btn-sm btn-default  dropdown-toggle" data-toggle="dropdown">
											    <span class="caret"></span>
											    <span class="sr-only">Toggle Dropdown</span>
											  </button>
											  <ul class="dropdown-menu" role="menu">
											    <li><a href="<%=basePath%>/course/lesson/list?active=lesson&id=${course.id}">
											    	<span class="glyphicon glyphicon-th-large"></span>&nbsp;课时管理
											    </a></li>
											    <li><a href="<%=basePath%>/course/fileMrg/toList?active=file&id=${course.id}">
											    	<span class="glyphicon glyphicon-file"></span>&nbsp;文件管理
											    </a></li>
											     <li><a href="<%=basePath%>/admin/curriculum/update?recommended=1&id=${course.id}">
											    	<span class="glyphicon glyphicon-user"></span>&nbsp;学员管理
											    </a></li>
											  </ul>
											</div>
										</c:when>
										<c:otherwise>
											<a class="btn btn-sm btn-default"  href="<%=basePath%>/course/toAdd">
					 							<span class="glyphicon glyphicon-search"></span>&nbsp;查看课程
					 						</a>
										</c:otherwise>
									</c:choose>
  								</td>
  							</tr>
  						</c:forEach>
					 </table>
				  </div>
			   </div>
			</div>
		</div>
	</div>
	
	<div id="model">
	</div>
</body>
</html>