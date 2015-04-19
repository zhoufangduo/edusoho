<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<form action="<%=basePath%>/admin/course/chapter/add" class="form-horizontal" id="addMarkDownForm" method="post">
	<div class="form-group">
		<label for="title" class="col-sm-2 control-label">标题</label>
		<div class="col-sm-9">
			<input type="text" class="form-control" id="title" name="title"
				placeholder="标题" />
		</div>
	</div>
	<div class="form-group">
		<label for="title" class="col-sm-2 control-label">摘要</label>
		<div class="col-sm-9">
			<textarea rows="3" cols="" class="form-control"></textarea>
		</div>
	</div>
	<div class="form-group">
		<label for="title" class="col-sm-2 control-label">文件</label>
		<div class="col-sm-9">
			<textarea rows="12" cols="" class="form-control" id="code"></textarea>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			var index = 0;
			$("#code").on("keyup",function(event){
			 	keycode = event.keyCode;
			 	if(keycode == 13){
			 		index ++;
			 	}
			 	
			 	if(index >= 10){
			 		document.getElementById("code").ROWS = index;
			 		//$("#code").attr("rows",index);
			 	}
			 	
			});
		});
	</script>
</form>

