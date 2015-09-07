<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="nav" uri="/WEB-INF/navbar.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%String basePath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>登录</title>
	<link href="<%=basePath%>/admin/system/setting/download?file=${site.icoImage}" rel="shortcut icon" />
	<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/jquery/jquery.md5.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/jquery/jquery.validate.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/jquery/validate_form.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/jquery/messages_zh.js" type="text/javascript"></script>
	<link href="<%=basePath%>/resource/iCheck/skins/all.css" rel="stylesheet">
	<script src="<%=basePath%>/resource/iCheck/icheck.min.js"></script>
	<link href="<%=basePath%>/resource/css/all.css" rel="stylesheet" type="text/css">
	<script src="<%=basePath%>/resource/jquery/jquery.cookie.js" type="text/javascript"></script>
	
	<style type="text/css">
		.alert{
			width: 100%;
			text-align: center;
			position: absolute;
			padding: 11px 40px;
		}
	
	</style>
</head>
<body>
	<nav:menu/>
	  <c:if test="${error == true}">
		<div class="alert alert-danger alert-dismissible" role="alert">
	      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	      	<span aria-hidden="true">×</span>
	      </button>
	      <span style="color: red">
		      <strong>错误提示: </strong>登录的帐号或者密码错误,请确认好再登录!
	      </span>
	    </div>
	   </c:if>
	   <center>
		<div class="form-panel">
			<div class="panel panel-default">
			  <div class="panel-body">
			      <h3>登&nbsp;录</h3>
			      <br>
			      <form id="loginForm" class="form-horizontal" action="<%=basePath%>/login" method="post">
			      	 <div class="form-group">
					    <label for="username" class="col-sm-2 control-label">账&nbsp;号</label>
					    <div class="col-sm-9">
					      <input type="text" class="form-control" id="username" 
					      	name="username" placeholder="账号/邮件" value="${username}">
					    </div>
					  </div>
					  <br/>
					  <div class="form-group">
					    <label for="password" class="col-sm-2 control-label">密&nbsp;码</label>
					    <div class="col-sm-9">
					      <input type="password" class="form-control" id="password" name="password" placeholder="密&nbsp;码">
					    </div>
					  </div>
					  <br/>
					  <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-9">
					      <div class="checkbox">
					        <label style="width: 220px;">
					          <input type="checkbox" id="remeber" name="remeber" value="true"> 记住密码
					        </label>
					        <button type="submit" class="btn btn-primary" style="width: 100px;">登&nbsp;&nbsp;录</button>
					      </div>
					    </div>
					  </div>
					  <br/>
					  <p/>
					  <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					     	<a href="#">找回密码</a>
					     	&nbsp;|&nbsp;还没有注册帐号？&nbsp;
					     	<a href="">	立即注册</a>
					    </div>
					  </div>
			      </form>
			 </div>
			</div>
		</div>
	</center>
	
	<script type="text/javascript">
		$(function(){
			
			if($.cookie("remeber")){
				 $("#username").val($.cookie("username"));
				 $("#password").val($.cookie("password"));
				 $("#remeber").attr("checked","checked");
			}
			
			$("#loginForm").validate({
				success:success,
				ignore: "",
				errorPlacement: showErrorTab,
				rules:{
					"username":{
						required: true,
						rangelength: [5,30]
					},
					"password" :{
						required:true,
						minlength: 6
					}
				},
				messages:{
					"username": {required: "账号名称不能为空!", rangelength:"长度只能为5-30字符!"},
					"password": {required : "密码不能为空!", minlength:"长度至少为6个字符!"}
				},
				submitHandler: function(form) {
					
					if($("#remeber").attr("checked")){
						$.cookie("username", $("#username").val() , { path: '/',expires: 365});
						$.cookie("password", $("#password").val() , { path: '/',expires: 365}); 
						$.cookie("remeber", true , { path: '/',expires: 365});
					}else{
						$.cookie("username", null, { path: '/',expires: 0});
						$.cookie("password", null, { path: '/',expires: 0}); 
						$.cookie("remeber", false, { path: '/',expires: 0});
					}
					
					$("#password").val($.md5($("#password").val()));
					form.submit();
				}
			});
			
			$('#remeber').iCheck({
			    checkboxClass: 'icheckbox_flat-blue',
			    radioClass: 'iradio_flat'
			});
			
			$('#remeber').on('ifChecked', function(event){
				$('#remeber').attr("checked",true);
			});
			
			$('#remeber').on('ifUnchecked', function(event){
				$('#remeber').attr("checked",false);
			});
			
			$("#username").focus(); 
		});
	</script>
</body>
</html>
