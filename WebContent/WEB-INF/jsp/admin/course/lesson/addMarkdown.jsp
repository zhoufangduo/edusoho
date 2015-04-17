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
		<label for="title" class="col-sm-2 control-label">代码</label>
			<div class="col-sm-9">
			   <div class="panel panel-default">
					<div class="panel-body">
						<br /> 选择你要上传的文件：
						<p />
						<button type="button" class="btn btn-primary" onclick="toEdit()">编辑Markdown</button>
						<br />&nbsp;
						<div class="alert alert-info" role="alert">
							点击按钮后，会弹出一个编写markdown的框
						</div>
					</div>
			  </div>
		</div>
	</div>
</form>
<script>
	function toEdit(){
		var xpwidth=window.screen.width-10;
        var xpheight=window.screen.height-35;
		window.open('<%=basePath%>/resource/editor.md/editcode.jsp', '_blank',
				'fullscreen,toolbar=no,location=no,directories=no,status=yes,resizable=yes,directories=no,top=0,left=0,width='+xpwidth+',height='+xpheight);
	}
</script>
