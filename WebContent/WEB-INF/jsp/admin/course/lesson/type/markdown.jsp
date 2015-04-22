<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form action="<%=basePath%>/admin/course/lesson/add" class="form-horizontal" id="markdownForm" method="post">
	<div class="form-group">
		<label for="title" class="col-sm-2 control-label">标题</label>
		<div class="col-sm-9">
			<input type="text" class="form-control" id="title" name="title"
				placeholder="标题" />
		</div>
	</div>
	<div class="form-group">
		<label for="summary" class="col-sm-2 control-label">摘要</label>
		<div class="col-sm-9">
			<textarea rows="3" name="summary" class="form-control"></textarea>
		</div>
	</div>
	<div class="form-group">
		<label for="title" class="col-sm-2 control-label">代码</label>
			<div class="col-sm-9">
			   <ul class="nav nav-pills" style="margin-bottom: 5px;">
					<li role="presentation" class="active" id="li1"><a href="javascript:toMDShow('#uploadMd')">上传MD文件</a></li>
					<li role="presentation" id="li2"><a href="javascript:toMDShow('#editMd')">在线编辑</a></li>
			   </ul>
			   <div class="panel panel-default">
				   <div class="panel-body">
						<br /> 
						<div id="uploadMd">
							选择你要上传的&nbsp;<img src='<%=basePath%>/resource/images/markdown.png'/>&nbsp;文件<p/> 
							<button type="button" class="btn btn-primary" onclick="selectFile()">md文件</button>
							&nbsp;&nbsp;
							<button type="button" class="btn btn-info" onclick="toPreview()">预览</button>
							<br /> &nbsp;<br /> 
							<span id="fileName"></span>
						</div>
						<div id="editMd" style="display: none;">
							<button type="button" class="btn btn-primary" onclick="toEdit()">编辑Markdown</button>
							&nbsp;&nbsp;<span style="color: #31708f;">点击按钮后，会弹出一个编写markdown的框</span>
							<br />&nbsp;
							<pre style="min-height: 100px;"><code id="markdownCode" style="font-family: '微软雅黑';"></code></pre>
						</div>
				   </div>
			   </div>
		</div>
	</div>
	<input type="hidden" name="context" value="">
	<input type="hidden" name="pId" value="${param.pId}">
	<input type="hidden" name="courseId" value="${param.courseId}">
	<input type="hidden" name="type" value="5">
</form>

<form id="mdFileForm"  action="<%=basePath%>/admin/course/lesson/uploadMD"   enctype="multipart/form-data" method="post">
	<input type="file" name="file" id="mdFile" style="display: none;">
</form>
<script>

	$(function(){
		$("#mdFile").change(function(){
			var fileName = $(this).val();
			var fileType=fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
			if(fileType != 'md'){
				alert("你选择的不是Markdown的文件，请重新选择!");
			}else{
				$("#uploadMd > button").attr("diabled","true");
				$("#fileName").html("你选择的md文件: <label>" + fileName + "</label>");
				$("#mdFileForm").ajaxSubmit({
					dataType	: "text",
					type        : "POST",
					cache       : false,
					success		: function(data){
						$("[name=context]").val(data);
					}
				});
			}
		});
		
		$("#markdownForm").validate({
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
				form.submit();
			}
		});
	});
	
	function selectFile(){
		$("#mdFile").click();
	}
	
	function toEdit(){
		var xpwidth=window.screen.width-10;
        var xpheight=window.screen.height-35;
		window.open('<%=basePath%>/resource/editor/mdEditor.jsp', '_blank',
				'fullscreen,toolbar=no,location=no,directories=no,status=yes,resizable=yes,directories=no,top=0,left=0,width='+xpwidth+',height='+xpheight);
	}
	
	function toPreview(){
		var xpwidth=window.screen.width-10;
        var xpheight=window.screen.height-35;
		window.open('<%=basePath%>/resource/editor/previewMD.jsp', '_blank',
				'fullscreen,toolbar=no,location=no,directories=no,status=yes,resizable=yes,directories=no,top=0,left=0,width='+xpwidth+',height='+xpheight);
		
	}
	
	function toMDShow(panel){
		$(panel).show();
		$('#li2').attr("class","");
		$('#li1').attr("class","");
		if(panel == '#uploadMd'){
			$('#editMd').hide();
			$('#li1').attr("class","active");
		}else{
			$('#uploadMd').hide();
			$('#li2').attr("class","active");
		}
	}
</script>
