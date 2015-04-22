<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>JAVASCRIPT Editor</title>
	<link rel=stylesheet href="<%=basePath%>/resource/editor.md/lib/codemirror/doc/docs.css">
	<link rel="stylesheet" href="<%=basePath%>/resource/editor.md/lib/codemirror/codemirror.min.css">
	<script src="<%=basePath%>/resource/editor.md/lib/codemirror/codemirror.min.js"></script>
	<script src="<%=basePath%>/resource/editor.md/lib/codemirror/addon/edit/matchbrackets.js"></script>
	<script src="<%=basePath%>/resource/editor.md/lib/codemirror/addon/comment/continuecomment.js"></script>
	<script src="<%=basePath%>/resource/editor.md/lib/codemirror/addon/comment/comment.js"></script>
	<script src="<%=basePath%>/resource/editor.md/lib/codemirror/mode/javascript/javascript.js"></script>
	<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
	<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<style type="text/css">
		.CodeMirror {
			border: 1px solid #ddd;
			font-size: 15px;
			font-family: 'Courier New' ,'微软雅黑';
			height: 520px;
		}
		
		.CodeMirror span {
			font-size: 15px;
			font-family: 'Courier New' ,'微软雅黑';
		}
		
		.title {
			font-family: '微软雅黑';
			font-size: 20px;
		}
		
		.bar {
			margin: 1px 30px;
		}
		
		.panel {
			margin: 2px 30px;
		}
	</style>
</head>
<body>
	<br />
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="bar">
				<span class="title"> JAVASCRIPT Editor </span> 
				<span style="float: right;"> 
					<input type="button" id="subBtn" style="font-family: '微软雅黑';" class="btn btn-default" value="保存并关闭">
				</span>
			</div>
			<br />
			<div>
				<textarea id="code" name="code"></textarea>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			 var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
		        lineNumbers: true,
		        matchBrackets: true,
		        continueComments: "Enter",
		        extraKeys: {"Ctrl-Q": "toggleComment"}
		     });
			 
			 $("#subBtn").on("click",function(){
    			code = editor.getValue();
				$("#codeCtx",opener.document).html(code); 
				$("input[name=context]",opener.document).val(code); 
				window.close();
	    	 });
			 
		});
	</script>
</body>
</html>