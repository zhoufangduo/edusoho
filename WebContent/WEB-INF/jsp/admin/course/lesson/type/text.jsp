<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<script src="<%=basePath%>/resource/ckeditor/ckeditor.js"></script>
<form action="<%=basePath%>/admin/course/lesson/add" class="form-horizontal" id="textForm" method="post">
	<div class="form-group">
		<label for="title" class="col-sm-2 control-label">标题</label>
		<div class="col-sm-9">
			<input type="text" class="form-control" id="title" name="title" placeholder="标题" />
		</div>
	</div>
	<div class="form-group">
		<label for="summary" class="col-sm-2 control-label">摘要</label>
		<div class="col-sm-9">
			<textarea rows="3" name="summary" class="form-control"></textarea>
		</div>
	</div>
	<div class="form-group">
		<label for="context" class="col-sm-2 control-label">视频</label>
		<div class="col-sm-9">
			 <textarea name="context"  style="height: 150px;" id="editor"></textarea>
		</div>
	</div>
	<input type="hidden" name="pId" value="${param.pId}">
	<input type="hidden" name="courseId" value="${param.courseId}">
	<input type="hidden" name="type" value="3">
</form>
<script>

	CKEDITOR.replace('editor',{
		language: 'zh-cn',
		skin:'bootstrapck',
		filebrowserImageUploadUrl: '<%=basePath%>/admin/course/lesson/uploadFile',
		filebrowserImageBrowseUrl : '<%=basePath%>/admin/course/lesson/Images',
		filebrowserFlashUploadUrl: '<%=basePath%>/admin/course/lesson/uploadFile?type=image',
		filebrowserFlashBrowseUrl : '<%=basePath%>/admin/course/lesson/Images',
   	 	toolbar :[
             ['Bold', 'Italic', 'Underline','TextColor','BGColor','-',
              'RemoveFormat','PasteText','NumberedList', 'BulletedList', 
              'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock','-',
              'Smiley','Image','Table', 'HorizontalRule', 'SpecialChar', 'Iframe','-',
              'Link','Unlink','-','PasteText', 'PasteFromWord','-','Find','Replace',
              'Source','Maximize','Preview'],
              ['Styles','Format','Font','FontSize']
        ] 
	});
	
	$(function(){
		$("#textForm").validate({
			success:success,
			ignore: "",
			errorPlacement: showErrorTab,
			rules:{
				"title":{
					required: true
				}
			},
			messages:{
				"title": "标题是必填项"
			},
			submitHandler: function(form) {
				var data = CKEDITOR.instances.editor.getData();
				$("input[name=context]").val(data);
				form.submit();
			}
		});
	});
</script>