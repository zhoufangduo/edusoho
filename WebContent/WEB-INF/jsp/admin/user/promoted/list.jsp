<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>教师管理-易通软件教育后台管理</title>
	<link href="<%=basePath%>/admin/system/setting/download?file=${site.icoImage}" rel="shortcut icon" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/jquery/validate_form.js" type="text/javascript"></script>
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
				    <table class="table table-hover">
  						<tr>
  							<th>用户名</th>
  							<th>推荐教师</th>
  							<th>推荐时间</th>
  							<th>操作</th>
  						</tr>
  						<c:forEach items="${teachers}" var="quser">
  							<tr>
  								<td>
  									<span style="font-weight: bold;">
  									<a href="javascript:showModel('#model','<%=basePath%>/admin/user/toView?id=${quser.id}')">
  										${quser.username}
  									</a></span>
  									<c:if test="${quser.promoted == 1}">
  										<span class="badge" style="background-color: red;">推荐</span>
  									</c:if>
  								</td>
  								<td>${quser.name}</td>
  								<td>${quser.promotedTime}</td>
								<td>
									<div class="btn-group">
									  <button type="button" class="btn btn-default btn-sm"
									    onclick="showModel('#model','<%=basePath%>/admin/user/toView?id=${quser.id}')">查看</button>
									  <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
									    <span class="caret"></span>
									    <span class="sr-only">Toggle Dropdown</span>
									  </button>
									  <ul class="dropdown-menu" role="menu">
									  	<c:choose>
									  		<c:when test="${quser.promoted == 1}">
									  			<li><a 
									  				href="<%=basePath%>/admin/user/promoted/update?id=${quser.id}&promoted=0">
									  			取消该推荐</a></li>
									  		</c:when>
									  		<c:otherwise>
									  			<li><a href="<%=basePath%>/admin/user/promoted/update?id=${quser.id}&promoted=1">
									  			推荐该老师</a></li>
									  		</c:otherwise>
									  	</c:choose>
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