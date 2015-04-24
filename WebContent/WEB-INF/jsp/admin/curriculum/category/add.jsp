<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
 <form action="<%=basePath%>/admin/curriculum/category/add" class="form-horizontal" id="addForm" method="post">
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
				    <label for="name" class="col-sm-2 control-label">名&nbsp;称</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="name" name="name" placeholder="名称">
				    </div>
			    </div>
			     <br/>
			    <div class="form-group">
				    <label for="pId" class="col-sm-2 control-label">父分类</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="pId" name="pId" readonly="readonly"
				       placeholder="名称" >
				    </div>
			    </div>
			     <br/>
			    <div class="form-group">
				    <label for="sort" class="col-sm-2 control-label">显示序号</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="sort" name="sort" value="0" placeholder="显示序号">
				      <span class="right-tip">显示序号需为整数，分类按序号的顺序从小到大排序</span>
				    </div>
			    </div>
			     <br/>
			    <div class="form-group">
				    <label for="description" class="col-sm-2 control-label">分类描述</label>
				    <div class="col-sm-9">
				      <textarea class="form-control" rows="5" name="description" id="description"></textarea>
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
				"sort" :{
					required:true,
					digits:true
				}
			},
			messages:{
				"name": "分类名称是必填项",
				"sort": {required : "分类显示序列号不能为空!", digits:"只能为正整数!"}
			},
			submitHandler: function(form) {
				form.submit();
			}
		});
		
		showAddForm('${param.pid}');
	});
	
	function showAddForm(pid){
		$("#pId").val(pid);
		$("#name").val("");
		$("#description").val();
		$('#myModal').modal('show');
	}
</script>