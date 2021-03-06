<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
 <form action="<%=basePath%>/admin/user/add" class="form-horizontal" id="addForm" method="post">
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
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
				    <label class="col-sm-2 control-label">用户权限</label>
				    <div class="col-sm-9">
					    <input type="checkbox" name="role1" id="teacher" value="TEACHER">&nbsp;教师&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					    <input type="checkbox" name="role2" id="admin" value="ADMIN">&nbsp;管理员&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					    <input type="checkbox" name="role3" id="superAdmin" value="SUPERADMIN">&nbsp;超级管理员
					</div>
			    </div>
			    
			    <div class="form-group">
				    <label class="col-sm-2 control-label" style="margin-top: 50px;">用户组</label>
				    <div class="col-sm-9">
				    	<div style="width:40%;float:left;">
				    		<label class="control-label">所有组 </label>
				    		<select multiple class="form-control"  id="unuse">  
						   		<c:forEach items="${clazzs}" var="clazz">
						   			 <option value="${clazz.id}">${clazz.name}</option>
	  							</c:forEach>
					   		</select>
				    	</div>
					   <div style="float:left;margin:40px 20px;">
					   		<input type="button" class="btn btn-sm btn-default" value="&gt;&gt;" id="useBtn">
					   		<p/>
					   		<input type="button" class="btn btn-sm btn-default" value="&lt;&lt;" id="unuseBtn">
					   </div>
					   <div style="width:40%;float:left;">
						   <label class="control-label">当前组</label>
						   <select multiple class="form-control"  id="use"></select>
					   </div>
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
				$("#oldPwd").val($.md5($("#oldPwd").val()));
				$("#confirmPassword").val($.md5($("#confirmPassword").val()));
				
				form.submit();
			}
		});
		
		$("#useBtn").click(function(){
			var seleteds = $("#unuse option:selected");
			for(var i = 0; i < seleteds.length ;i ++){
				$("#use").append(seleteds[i]);
				$(seleteds[i]).attr("selected",false);
			}
		});
		
		$("#unuseBtn").click(function(){
			var seleteds = $("#use option:selected");
			for(var i = 0; i < seleteds.length ;i ++){
				$("#unuse").append(seleteds[i]);
				$(seleteds[i]).attr("selected",false);
			}
		});
		 
		$('input[type=checkbox]').iCheck({
		    checkboxClass: 'icheckbox_flat-blue',
		    radioClass: 'iradio_flat'
		});
		
		$('#myModal').modal('show');
	});
	
</script>