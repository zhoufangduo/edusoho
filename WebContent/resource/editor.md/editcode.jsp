<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Markdown编写</title>
	<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="<%=basePath%>/resource/editor.md/css/editormd.min.css" />
	<script src="<%=basePath%>/resource/editor.md/editormd.js"></script>
	<script type="text/javascript">
		var testEditor;
		$(function() {
		    testEditor = editormd("test-editormd", {
		        width   : "90%",
		        height  : 640,
		        path    : "<%=basePath%>/resource/editor.md/lib/",
	            codeFold : true,
	            //syncScrolling : false,
	            saveHTMLToTextarea : true,    // 保存HTML到Textarea
	            searchReplace : true,
	            //watch : false,                // 关闭实时预览
	            htmlDecode : "style,script,iframe",            // 开启HTML标签解析，为了安全性，默认不开启    
	            //toolbar  : false,             //关闭工具栏
	            //previewCodeHighlight : false, // 关闭预览HTML的代码块高亮，默认开启
	            emoji : true,
	            taskList : true,
	            tocm            : true,         // Using [TOCM]
	            tex : true,                   // 开启科学公式TeX语言支持，默认关闭
	            flowChart : true,             // 开启流程图支持，默认关闭
	            sequenceDiagram : true,       // 开启时序/序列图支持，默认关闭,
	            //dialogLockScreen : false,   // 设置弹出层对话框不锁屏，全局通用，默认为true
	            //dialogShowMask : false,     // 设置弹出层对话框显示透明遮罩层，全局通用，默认为true
	            //dialogDraggable : false,    // 设置弹出层对话框不可拖动，全局通用，默认为true
	            //dialogMaskOpacity : 0.4,    // 设置透明遮罩层的透明度，全局通用，默认值为0.1
	            //dialogMaskBgColor : "#000", // 设置透明遮罩层的背景颜色，全局通用，默认为#fff
	            imageUpload : true,
	            imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"]
		    });
		});
	</script>
</head>
<body>
	<div id="test-editormd">
		 <textarea class="form-control" rows="5"></textarea>
	</div>
</body>
</html>