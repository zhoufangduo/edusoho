<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>用户管理-易通软件教育后台管理</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/jquery/jquery.validate.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/jquery/validate_form.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/jquery/messages_zh.js" type="text/javascript"></script>
	<link href="<%=basePath%>/resource/iCheck/skins/all.css" rel="stylesheet">
	<script src="<%=basePath%>/resource/iCheck/icheck.min.js"></script>
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
						  <li><a href="">用户</a></li>
						  <li class="active">用户管理</li>
						</ol>
					</div>
				    <form action="">
						<div class="input-group" style="float: left;width: 80%;">
							  <span class="input-group-addon" >&nbsp;搜索项 &nbsp;</span>
							  <select class="form-control" style="width: 120px;">
								  <option value="">所有角色</option>
								  <option>学员</option>
								  <option>教师</option>
								  <option>管理员</option>
								  <option>超级管理员</option>
							  </select>
							  
							  <select class="form-control" style="width: 125px;margin-left: 3px;">
								  <option value="">关键字类型</option>
								  <option>登录账号</option>
								  <option>邮件</option>
								  <option>姓名</option>
							  </select>
							  <input type="text" class="form-control" placeholder="关键字" style="width: 250px;">
							  
							  <span class="input-group-btn" style="float: left;">
        						<button class="btn btn-primary" type="submit">搜&nbsp;索</button>
      						  </span>
						</div>
						 <span style="margin-left: 100px;">
      						  <a href="javascript:showAddForm()" class="btn btn-info" target="_blank" >创建课程</a>
      					</span>
				    </form>
				    <br/>
				    <table class="table table-hover">
  						<tr>
  							<th>用户名</th>
  							<th>Email</th>
  							<th>注册时间</th>
  							<th>状态</th>
  							<th>操作</th>
  						</tr>
  						
  						
  						
					</table>
				  </div>
			   </div>
			</div>
		</div>
	</div>
	
	<form action="<%=basePath%>/admin/user/add" class="form-horizontal" id="addForm" method="post">
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">添加分类</h4>
		      </div>
		      <div class="modal-body">
		      	<br/>
		       		<div class="form-group">
					    <label for="username" class="col-sm-2 control-label">用户名</label>
					    <div class="col-sm-9">
					      <input type="text" class="form-control" id="username" name="username" placeholder="用户名">
					    </div>
				    </div>
				    <div class="form-group">
					    <label for="password" class="col-sm-2 control-label">密码</label>
					    <div class="col-sm-9">
					      <input type="password" class="form-control" id="password" name="password" placeholder="密码" 
					      value="123456">
					      <span>至少为6位英文、数字、符号，区分大小写,默认为:123456</span>
					    </div>
				    </div>
				    <div class="form-group">
					    <label for="confirmPassword" class="col-sm-2 control-label">确认密码</label>
					    <div class="col-sm-9">
					      <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="确认密码" 
					      value="123456">
					    </div>
				    </div>
				    <div class="form-group">
					    <label for="email" class="col-sm-2 control-label">邮箱地址</label>
					    <div class="col-sm-9">
					      <input type="text" class="form-control" id="email" name="email" placeholder="常用的邮箱的地址">
					    </div>
				    </div>
				     <div class="form-group">
					    <label for="email" class="col-sm-2 control-label">用户权限</label>
					    <div class="col-sm-9">
						    <input type="checkbox" name="role" value="TEACHER">&nbsp;教师&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						    <input type="checkbox" name="role" value="ADMIN">&nbsp;管理员&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						    <input type="checkbox" name="role" value="SUPERADMIN">&nbsp;超级管理员
						</div>
				    </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">&nbsp;取&nbsp;消&nbsp;</button>
		        <button type="submit" class="btn btn-primary" >&nbsp;保&nbsp;存&nbsp;</button>
		      </div>
		    </div>
		  </div>
		</div>
	</form>
	
	<script type="text/javascript">
		
		$(function(){
			$("#addForm").validate({
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
					},
					"confirmPassword":{
						equalTo: password 
					},
					"email":{
						required:false,
						email:true
					}
				},
				messages:{
					"username": {required: "账号名称不能为空!", rangelength:"长度只能为5-30字符!"},
					"password": {required : "密码不能为空!", minlength:"长度至少为6个字符!"},
					"confirmPassword": "确认密码不一致",
					"email": "邮箱格式不对,例如: admin@163.com"
				},
				submitHandler: function(form) {
					form.submit();
				}
			});
			
			$('input[type=checkbox]').iCheck({
			    checkboxClass: 'icheckbox_flat-blue',
			    radioClass: 'iradio_flat'
			});
		});
		
		function showAddForm(){
			$('#myModal').modal('show');
		}
	
	</script>
</body>
</html>