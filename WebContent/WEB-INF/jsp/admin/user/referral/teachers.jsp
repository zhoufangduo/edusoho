<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>教师管理-易通软件教育后台管理</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/jquery/jquery.validate.js" type="text/javascript"></script>
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
						  <li><a href="">用户</a></li>
						  <li class="active">教师管理</li>
						</ol>
					</div>
				    <br/>
				    <table class="table table-hover">
  						<tr>
  							<th width="25%">用户名</th>
  							<th width="25">推荐教师</th>
  							<th width="25%">推荐时间</th>
  							<th width="25%">操作</th>
  						</tr>
  						<c:forEach items="${list}" var="quser">
  							<tr>
  								<td>${quser.username} 
  									<c:if test="${quser.locked == 1}">
  										<span class="badge" style="background-color: red;">禁</span>
  									</c:if>
  								</td>
  								<td>${quser.email}</td>
  								<td>${quser.createTime}</td>
  								<td>
  									<c:if test="${quser.locked == 1}">已锁定</c:if>
  									<c:if test="${quser.locked == 0}">可使用</c:if>
								</td>
								<td>
									<div class="btn-group">
									  <button type="button" class="btn btn-default btn-sm"
									    onclick="showModel('#model','<%=basePath%>/admin/user/toView?id=${quser.id}')">查看</button>
									  <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
									    <span class="caret"></span>
									    <span class="sr-only">Toggle Dropdown</span>
									  </button>
									  <ul class="dropdown-menu" role="menu">
									    <li><a href="#">推荐该老师</a></li>
									    <li><a href="#">取消该推荐</a></li>
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
</body>
</html>