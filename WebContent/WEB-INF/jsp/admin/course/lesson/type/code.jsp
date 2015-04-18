<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<script src="http://cdnjs.cloudflare.com/ajax/libs/html-inspector/0.8.2/html-inspector.js"></script>
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
			
		</div>
	</div>
</form>
<script>
	$(function(){
		
	});
</script>