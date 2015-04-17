<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Markdown编写</title>
	<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="<%=basePath%>/resource/editor.md/css/editormd.css" />
	<script src="<%=basePath%>/resource/editor.md/editormd.js"></script>
	<script src="<%=basePath%>/resource/editor.md/editormd.amd.js"></script>
	<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		var editor;
		$(function() {
		    editor = editormd("editormd", {
		        width   : "90%",
		        height  : 640,
		        path    : "<%=basePath%>/resource/editor.md/lib/",
	            codeFold : true,
	            toolbarIcons : function() {
	                return [ "save","undo", "redo", "|", 
	                         "bold", "del", "italic", "quote", "ucwords", "uppercase", "lowercase", "|", 
	                         "h1", "h2", "h3", "h4", "h5", "h6", "|", 
	                         "list-ul", "list-ol", "hr", "|",
	                         "link", "reference-link", "image", "code", "preformatted-text", "code-block", "table", "datetime", "emoji", "html-entities", "pagebreak", "|",
	                         "goto-line", "watch", "preview", "fullscreen", "clear", "search", "|","help"]
	            },
	            toolbarIconsClass : {
	            	/*指定一个FontAawsome的图标类*/
	            	save:'glyphicon glyphicon-floppy-disk'
	            },
	            toolbarHandlers : {
	            	save : function(cm, icon, cursor, selection) {
	            		markdownCode = $("#context").val();
	            		window.close();
	            	}
	            },
	            saveHTMLToTextarea : true,
	            searchReplace : true,
	            htmlDecode : "style,script,iframe",
	            emoji : true,
	            taskList : true,
	            tocm : true,      
	            tex : true, 
	            flowChart : true,  
	            sequenceDiagram : true,  
	            imageUpload : true,
	            imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"]
		    });
		}); 
	</script>
</head>
<body>
	<div id="editormd" style="width: 95%;">
		 <textarea class="form-control" id="context" rows="5"></textarea>
	</div>
</body>
</html>