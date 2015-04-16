<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<script src="<%=basePath%>/resource/ckeditor/ckeditor.js"></script>
<form action="<%=basePath%>/admin/course/chapter/add" class="form-horizontal" id="addForm" method="post">
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
		<label for="title" class="col-sm-2 control-label">视频</label>
		<div class="col-sm-9">
			 <textarea name="about"  style="height: 150px;" id="editor"></textarea>
		</div>
	</div>
</form>
<script>
	CKEDITOR.replace('editor',{
		language: 'zh-cn',
		skin:'bootstrapck',
   	 	toolbar :[
             ['Bold', 'Italic', 'Underline','TextColor','BGColor','-',
              'RemoveFormat','PasteText','NumberedList', 'BulletedList', '-',
              'Link','Unlink','Image','-','Source','Maximize','Preview'],
              ['Styles','Format','Font','FontSize']
        ]
	});
</script>