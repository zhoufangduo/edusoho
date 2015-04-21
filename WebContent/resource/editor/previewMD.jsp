<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>预览Markdown内容</title>
	<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="<%=basePath%>/resource/editor.md/css/editormd.css" />
	<link rel="stylesheet" href="<%=basePath%>/resource/editor.md/css/editormd.preview.css" />
	<script src="<%=basePath%>/resource/editor.md/lib/marked.min.js"></script>
    <script src="<%=basePath%>/resource/editor.md/lib/prettify.min.js"></script>
    <script src="<%=basePath%>/resource/editor.md/lib/raphael.min.js"></script>
    <script src="<%=basePath%>/resource/editor.md/lib/underscore.min.js"></script>
    <script src="<%=basePath%>/resource/editor.md/lib/sequence-diagram.min.js"></script>
    <script src="<%=basePath%>/resource/editor.md/lib/flowchart.min.js"></script>
    <script src="<%=basePath%>/resource/editor.md/lib/jquery.flowchart.min.js"></script>
	<script src="<%=basePath%>/resource/editor.md/editormd.js"></script>
	<script src="<%=basePath%>/resource/editor.md/editormd.amd.js"></script>
	<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="editormd">	
		<textarea id="text" style="display:none;"></textarea>    
	</div>
	<script type="text/javascript">
		 $(function() {
			 
			 $("#text").val($("input[name=context]",opener.document).val());
			 
            editormdView = editormd.markdownToHTML("editormd", {
                 htmlDecode      : "style,script,iframe",  // you can filter tags decode
                 emoji           : true,
                 taskList        : true,
                 tex             : true, 
                 flowChart       : true, 
                 sequenceDiagram : true
             });
	     });
	</script>
</body>
</html>