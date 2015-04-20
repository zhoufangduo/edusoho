<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>CSS Editor</title>
	<link rel=stylesheet href="<%=basePath%>/resource/editor.md/lib/codemirror/doc/docs.css">
	<link rel="stylesheet" href="<%=basePath%>/resource/editor.md/lib/codemirror/codemirror.min.css">
	<link rel="stylesheet" href="<%=basePath%>/resource/editor.md/lib/codemirror/addon/hint/show-hint.css">
	<script src="<%=basePath%>/resource/editor.md/lib/codemirror/codemirror.min.js"></script>
	<script src="<%=basePath%>/resource/editor.md/lib/codemirror/addon/hint/show-hint.js"></script>
	<script src="<%=basePath%>/resource/editor.md/lib/codemirror/addon/hint/css-hint.js"></script>
	<script src="<%=basePath%>/resource/editor.md/lib/codemirror/mode/css/css.js"></script>
	<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
	
	
	<style type="text/css">
      .CodeMirror {
      		border: 1px solid #ddd; 
      		font-size:15px;
      		font-family: 'Courier New' ,'微软雅黑';
      		height: 480px;
      }
      .CodeMirror span{
      	 font-size:15px;
      	font-family: 'Courier New' ,'微软雅黑';
      }
      .title{
    		font-family: '微软雅黑';
    		font-size: 20px;
      }
      .bar{
    		margin: 1px 30px;
      }
      .panel{
      	  margin-top:30px;
      	  margin-left: 30px;
      	  margin-right: 30px;
      	 height: 95%;
      }
      body, html{
      	height: 96%;
      }
    </style>
</head>
<body>
	<div class="panel panel-default">
   		<div class="panel-body">
   			<div class="bar">
				<span class="title">CSS Editor</span>
				<span style="float: right;">
					<input type="button" id="subBtn" style="font-family: '微软雅黑';" class="btn btn-default" value="保存并关闭">
				</span>
			</div>
			<br/>
   			<div>
				<textarea id="code" name="code"></textarea>
			</div>
			 <p><strong>MIME types defined:</strong> <code>text/css</code>, <code>text/x-scss</code> , <code>text/x-less</code></p>
   		</div>
	</div>
    <script>
    	$(function(){
    		var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
    	        extraKeys: {"Ctrl-Space": "autocomplete"},
    	        lineNumbers: true
    	    });
    		
    		$("#subBtn").on("click",function(){
    			alert();
    		});
    	});
    </script>
</body>
</html>