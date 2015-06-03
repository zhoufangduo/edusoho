<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
 <form action="<%=basePath%>/admin/user/add" class="form-horizontal" id="addForm" method="post">
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">添加用户</h4>
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
					    <input type="checkbox" name="role1" id="teacher" value="TEACHER">&nbsp;教师&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					    <input type="checkbox" name="role2" id="admin" value="ADMIN">&nbsp;管理员&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					    <input type="checkbox" name="role3" id="superAdmin" value="SUPERADMIN">&nbsp;超级管理员
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
		
		$('#myModal').modal('show');
	});
	
</script>