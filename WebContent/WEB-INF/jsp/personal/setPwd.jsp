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
	<script src="<%=basePath%>/resource/ckeditor/ckeditor.js"></script>
	<link href="<%=basePath%>/resource/css/all.css" rel="stylesheet" type="text/css">
	<script src="<%=basePath%>/resource/jquery/jquery.validate.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/jquery/validate_form.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/jquery/messages_zh.js" type="text/javascript"></script>
	
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
		  				<form action="<%=basePath%>/personal/save" class="form-horizontal"  method="post">
		  					<div class="form-group">
							    <label for="username" class="col-sm-2 control-label">用户名</label>
							    <div class="col-sm-9">
							    	<label  style="padding:6px 12px;">${person.username}
							    		(&nbsp;<c:forEach items="${person.roles}"  var="role">
	  										<c:if test="${role == 'STUDENT' }">学员&nbsp;</c:if>
	  										<c:if test="${role == 'TEACHER' }">教师&nbsp;</c:if>
	  										<c:if test="${role == 'ADMIN' }">管理员&nbsp;</c:if>
	  										<c:if test="${role == 'SUPERADMIN' }">超级管理员&nbsp;</c:if>
	  									</c:forEach>)
  									</label>
							    </div>
						    </div>
						   
						    <div class="form-group">
							    <label for="oldPwd" class="col-sm-2 control-label">旧密码</label>
							    <div class="col-sm-9">
							    	<input type="password" name="oldPwd" id="oldPwd"  class="form-control">
							    </div>
						    </div>
						    <br/>
						    <div class="form-group">
							    <label for="password1" class="col-sm-2 control-label">新密码</label>
							    <div class="col-sm-9">
							    	<input type="password" name="password1" id="password1" class="form-control">
							    </div>
						    </div>
						    <br/>
						    <div class="form-group">
							    <label for="password2" class="col-sm-2 control-label">确认密码</label>
							    <div class="col-sm-9">
							    	<input type="password" name="password2" id="password2" class="form-control">
							    </div>
						    </div>
						    <br/>
						    <div class="form-group">
							    <div class="col-sm-10" style="text-align: center;">
							    	<input type="submit" value="保&nbsp;&nbsp;存" class="btn btn-primary" style="width: 100px;" > 
							    </div>
						    </div>
						    <input type="hidden" value="${person.id}" name="id">
						    
		  				</form>
		  			</div>
			  	</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("form").validate({
			success:success,
			ignore: "",
			errorPlacement: showErrorTab,
			rules:{
				"oldPwd":{
					required: true,
					minlength: 6
				},
				"password1" :{
					required:true,
					minlength: 6
				},
				"password2" :{
					required:true,
					minlength: 6,
					equalTo:'password1'
				}
			},
			messages:{
				"oldPwd": {required: "旧的密码不能为空!", minlength:"长度至少为6个字符!"},
				"password1": {required : "新的密码不能为空!", minlength:"长度至少为6个字符!"},
				"password2": {required : "确认密码不能为空!", minlength:"长度至少为6个字符!",equalTo:"确认密码不一致!"}
			},
			submitHandler: function(form) {
				form.submit();
			}
		});
		
	</script>
</body>
</html>