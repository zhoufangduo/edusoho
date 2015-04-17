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
			<div class="panel panel-default">
				<div class="panel-body">
					<br /> 选择你要上传的视频文件：
					<p />
					<button type="button" class="btn btn-primary">上传文件</button>
					<br />&nbsp;
					<p />
					<div class="alert alert-info" role="alert">
						
						<ul>
							<li>支持<strong>所有的</strong>格式的文档文件上传，文件大小不能超过<strong>2.0MB</strong></li>
							<li>不支持<strong>在线直接查看</strong>，必须下载后，使用相应的软件才能打开
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<script>
	$(function(){
		
	});
</script>