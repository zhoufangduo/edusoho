<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String basePath = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>课程分类管理-易通软件教育后台管理</title>
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
	<jsp:include page="../../navigation.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<jsp:include page="../menu.jsp"></jsp:include>
			</div>
			<div class="col-md-10">
				<div class="panel panel-default">
				  <div class="panel-body">
				  	<div>
						<ol class="breadcrumb">
						  <li><a href="#">课程</a></li>
						  <li class="active">课程分类管理</li>
						</ol>
					</div>
					
					<form action="<%=basePath%>/admin/course/category?active=course&menu=category" method="post">
						<div class="input-group" style="float: left;width: 80%;">
							  <span class="input-group-addon" >搜索项</span>
							  <input type="text" class="form-control" placeholder="分类名称" name="name" style="width: 90%;">
							  <span class="input-group-btn" style="float: left;">
	       						<button class="btn btn-primary" type="submit">搜&nbsp;索</button>
	     				      </span>
						</div>
						<span style="margin-left: 65px;">
      						  <button type="button" class="btn btn-info" onclick="showModel('#model',
      						  '<%=basePath%>/admin/course/category/toAdd?pid=0')">创建分类</button>
      					</span>
				    </form>
					<br/>
					
				   	<table class="table table-hover">
  						<tr>
  							<th>名称</th>
  							<th width="15%">显示序号</th>
  							<th width="22%">操作</th>
  						</tr>
  						
  						<c:forEach items="${list}" var="categ">
  							 <c:if test="${categ.pId == 0}">
	  							<tr>
		  							<td>
		  								<span class="glyphicon glyphicon-plus"></span>&nbsp;${categ.name}
		  							</td>
		  							<td>${categ.sort}</td>
		  							<td>
									 	<div class="btn-group">
										  <button type="button" class="btn btn-sm btn-default">管理</button>
										  <button type="button" class="btn btn-sm btn-default  dropdown-toggle" data-toggle="dropdown">
										    <span class="caret"></span>
										    <span class="sr-only">Toggle Dropdown</span>
										  </button>
										  <ul class="dropdown-menu" role="menu">
										    <li><a href="#">
										    	<span class="glyphicon glyphicon-edit"></span>&nbsp;编辑
										    </a></li>
										    <li><a href="#">
										    	<span class="glyphicon glyphicon-trash"></span>&nbsp;删除
										    </a></li>
										  </ul>
										</div>
									  <button type="button" class="btn btn-sm btn-default"
									   onclick="showModel('#model','<%=basePath%>/admin/course/category/toAdd?pid=${categ.id}')">
									  	<span class="glyphicon glyphicon-plus"></span>&nbsp;添加子分类
									  </button>
									</td>
	  							</tr>
  							</c:if>
  							
  							<c:forEach items="${list}" var="categSub">
  								<c:if test="${categ.id ==  categSub.pId && categSub.pId != 0}">
  									<tr>
			  							<td style="padding-left: 50px;">
			  								<span class="glyphicon glyphicon-minus"></span>&nbsp;${categSub.name}
			  							</td>
			  							<td>${categSub.sort}</td>
			  							<td>
											<div class="btn-group">
											  <button type="button" class="btn btn-sm btn-default">管理</button>
											  <button type="button" class="btn btn-sm btn-default  dropdown-toggle" data-toggle="dropdown">
											    <span class="caret"></span>
											    <span class="sr-only">Toggle Dropdown</span>
											  </button>
											  <ul class="dropdown-menu" role="menu">
											    <li><a href="#">
											    	<span class="glyphicon glyphicon-edit"></span>&nbsp;编辑
											    </a> </li>
											    <li><a href="#">
											    	<span class="glyphicon glyphicon-trash"></span>&nbsp;删除
											    </a></li>
											  </ul>
											</div>
										</td>
	  								</tr>
  								</c:if>
  							</c:forEach>
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