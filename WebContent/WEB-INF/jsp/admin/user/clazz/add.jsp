<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
 <form action="<%=basePath%>/admin/user/clazz/add" class="form-horizontal" id="addForm" method="post">
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">添加班级</h4>
	      </div>
	      <div class="modal-body">
	      	<br/>
	       		<div class="form-group">
				    <label for="username" class="col-sm-2 control-label">班级名称</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" name="name" placeholder="创建的班级名称">
				    </div>
			    </div>
			    <div class="form-group">
				    <label for="password" class="col-sm-2 control-label">描述</label>
				    <div class="col-sm-9">
				      <textarea class="form-control" name="description" placeholder="描述"></textarea>
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
				"name":{
					required: true
				},
				"description" :{
					required:false,
					maxlength: 200
				}
			},
			messages:{
				"name": {required: "班级名称不能为空!"},
				"description": "长度不能超过200个字符!"
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