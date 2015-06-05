<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="nav" uri="/WEB-INF/navbar.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String basePath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>基本信息-个人中心-${site.title}-${site.subtitle}-Power By 易通软件教育</title>
	<link href="<%=basePath%>/admin/system/setting/download?file=${site.icoImage}" rel="shortcut icon" />
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
		<div class="row">
		 	<div class="col-md-3">
		 	 	<jsp:include page="menu.jsp"></jsp:include>
			</div>
			 	
			<div class="col-md-9">
				<div class="panel panel-default">
		    		<div class="panel-heading">
		    			<label class="course-title2">基本信息</label>
		    		</div>
		  			<div class="panel-body">
		  				<form action="" class="form-horizontal"  method="post">
		  					<div class="form-group">
							    <label for="username" class="col-sm-2 control-label">用户名</label>
							    <div class="col-sm-9">
							    	<label  style="padding:6px 12px;">${user.username}
							    		(&nbsp;<c:forEach items="${user.roles}"  var="role">
	  										<c:if test="${role == 'STUDENT' }">学员&nbsp;</c:if>
	  										<c:if test="${role == 'TEACHER' }">教师&nbsp;</c:if>
	  										<c:if test="${role == 'ADMIN' }">管理员&nbsp;</c:if>
	  										<c:if test="${role == 'SUPERADMIN' }">超级管理员&nbsp;</c:if>
	  									</c:forEach>)
  									</label>
							    </div>
						    </div>
						    <div class="form-group">
							    <label for="name" class="col-sm-2 control-label">姓名</label>
							    <div class="col-sm-9">
							    	<input type="text" name="name"  class="form-control" value="${user.name}">
							    </div>
						    </div>
						    <div class="form-group">
							    <label for="sex" class="col-sm-2 control-label">性别</label>
							    <div class="col-sm-9">
							    	<div style="padding:6px 12px;">
								    	<input type="radio" value="MALE" name="sex"> 男
								    	&nbsp;&nbsp;&nbsp;&nbsp;
								    	<input type="radio" value="FEMALE" name="sex"> 女
								    	&nbsp;&nbsp;&nbsp;&nbsp;
								    	<input type="radio" value="SCORI" name="sex"> 男
							    	</div>
							    </div>
						    </div>
						    <div class="form-group">
							    <label for="email" class="col-sm-2 control-label">姓名</label>
							    <div class="col-sm-9">
							    	<input type="text" name="email"  class="form-control" value="${user.email}">
							    </div>
						    </div>
						    <div class="form-group">
							    <label for="signature" class="col-sm-2 control-label">个性签名</label>
							    <div class="col-sm-9">
							    	<input type="text" name="signature"  class="form-control" value="${user.signature}">
							    </div>
						    </div>
						    <div class="form-group">
							    <label for="introduction" class="col-sm-2 control-label">自我介绍</label>
							    <div class="col-sm-9">
							    	<textarea rows="10"  class="form-control" name="introduction" >${user.introduction}</textarea>
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
			$('input[name=sex]').iCheck({
			    checkboxClass: 'icheckbox_flat-blue',
			    radioClass: 'iradio_flat-blue'
			});
		});
	
	</script>
</body>
</html>