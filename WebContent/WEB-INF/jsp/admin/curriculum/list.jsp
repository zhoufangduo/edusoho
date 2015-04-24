<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>课程管理-易通软件教育后台管理</title>
	<link href="<%=basePath%>/admin/system/setting/download?file=${site.icoImage}" rel="shortcut icon" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link href="<%=basePath%>/resource/css/all.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../navigation.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<jsp:include page="menu.jsp"></jsp:include>
			</div>
			<div class="col-md-10">
				<div class="panel panel-default">
				  <div class="panel-body">
				  	<div>
						<ol class="breadcrumb">
						  <li><a href="#">课程</a></li>
						  <li class="active">课程管理</li>
						</ol>
					</div>
				    <form action="">
						<div class="input-group" style="float: left;width: 80%;">
							  <span class="input-group-addon" >搜索项 </span>
							  <select class="form-control" style="width: 150px;">
								  <option value="">课程分类</option>
								  <c:forEach items="${categorys}" var="categ">
		  							  <c:if test="${categ.pId == 0}">
											<option value="${categ.id}">${categ.name}</option>	
		  							  </c:if>
  							
	 								  <c:forEach items="${categorys}" var="categSub">
		  								<c:if test="${categ.id ==  categSub.pId && categSub.pId != 0}">
		  									<option value="${categSub.id}">${categ.name}>${categSub.name}</option>	
		  								</c:if>
	 								  </c:forEach>
								   </c:forEach>
							  </select>
							  <select class="form-control" style="width: 125px;">
								  <option value="">课程状态</option>
								  <option>未发布</option>
								  <option>已发布</option>
								  <option>已关闭</option>
							  </select>
							  <input type="text" class="form-control" placeholder="标题" style="width: 200px;">
							  <input type="text" class="form-control" placeholder="创建者" style="width: 180px;">
							  <span class="input-group-btn" style="float: left;">
        						<button class="btn btn-primary" type="submit">搜&nbsp;索</button>
      						  </span>
						</div>
						<span style="margin-left: 65px;">
      						  <a href="<%=basePath%>/course/toAdd" class="btn btn-info" target="_blank">创建课程</a>
      					</span>
				    </form>
				    <br/>
				    <table class="table table-hover">
  						<tr>
  							<th>编号</th>
  							<th>名称</th>
  							<th>状态</th>
  							<th>创建者</th>
  							<th>创建时间</th>
  							<th>操作</th>
  						</tr>
  						<c:forEach items="${courses}" var="course">
  							<tr>
  								<td>${course.id}</td>
  								<td>
  									<a href="#" class="nameTip">${course.title}</a>
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
  								<td>${course.creater}</td>
  								<td>${course.createTime}</td>
  								<td>
  								<div class="btn-group">
								  <a href="<%=basePath%>/course/view?id=${course.id}" 
								  	class="btn btn-sm btn-default" target="_blank">管理</a>
								  <button type="button" class="btn btn-sm btn-default  dropdown-toggle" data-toggle="dropdown">
								    <span class="caret"></span>
								    <span class="sr-only">Toggle Dropdown</span>
								  </button>
								  <ul class="dropdown-menu" role="menu">
								  	<c:if test="${course.recommended == 0 }">
									    <li><a href="<%=basePath%>/admin/curriculum/update?recommended=1&id=${course.id}">
									    	<span class="glyphicon glyphicon-star"></span>&nbsp;推荐课程
									    </a> </li>
								    </c:if>
								    <c:if test="${course.recommended == 1}">
								    	<li><a href="<%=basePath%>/admin/curriculum/update?recommended=0&id=${course.id}">
								    		<span class="glyphicon glyphicon-star-empty"></span>&nbsp;取消推荐
								    	</a> </li>
								    </c:if>
								    <c:if test="${course.status == 'PUBLISHED'}">
									    <li><a href="<%=basePath%>/admin/curriculum/update?status=CLOSED&id=${course.id}">
									    	<span class="glyphicon glyphicon-ban-circle"></span>&nbsp;关闭课程
									    </a></li>
								    </c:if>
								    <c:if test="${course.status == 'DRAFT' || course.status == 'CLOSED'}">
									    <li><a href="<%=basePath%>/admin/curriculum/update?status=PUBLISHED&id=${course.id}">
									    	<span class="glyphicon glyphicon-ok-circle"></span>&nbsp;发布课程
									    </a></li>
								    </c:if>
								    <c:if test="${course.status == 'DRAFT'}">
									    <li><a href="#">
									    	<span class="glyphicon glyphicon-trash"></span>&nbsp;删除课程
									    </a></li>
								    </c:if>
								  </ul>
								</div>
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