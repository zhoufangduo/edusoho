<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>SQL Editor</title>
	<link rel=stylesheet href="<%=basePath%>/resource/editor.md/lib/codemirror/doc/docs.css">
	<link rel="stylesheet" href="<%=basePath%>/resource/editor.md/lib/codemirror/codemirror.min.css" />
	<link rel="stylesheet" href="<%=basePath%>/resource/editor.md/lib/codemirror/addon/hint/show-hint.css" />
	<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/editor.md/lib/codemirror/codemirror.min.js"></script>
	<script src="<%=basePath%>/resource/editor.md/lib/codemirror/mode/sql/sql.js"></script>
	<script src="<%=basePath%>/resource/editor.md/lib/codemirror/addon/hint/show-hint.js"></script>
	<script src="<%=basePath%>/resource/editor.md/lib/codemirror/addon/hint/sql-hint.js"></script>
	<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<style>
		.CodeMirror {
		    border-top: 1px solid #ddd;
		    border-bottom: 1px solid #ddd; 
		    height: 510px;
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
      		margin: 2px 30px;
      	}
    </style>
 </head>
 <body>
 	<br/>
 	
 	<div class="panel panel-default">
   		<div class="panel-body">
   			<div class="bar">
				<span class="title"> SQL Editor </span>
				<span style="float: right;">
					<input type="button"  id="subBtn"  style="font-family: '微软雅黑';" class="btn btn-default" value="保存并关闭">
				</span>
			</div>
			<br/>
   			<div>
				<textarea id="code" name="code"></textarea>
			    <p><strong>MIME types defined:</strong> 
			        <code><a href="?mime=text/x-sql">text/x-sql</a></code>,
			        <code><a href="?mime=text/x-mysql">text/x-mysql</a></code>,
			        <code><a href="?mime=text/x-mariadb">text/x-mariadb</a></code>,
			        <code><a href="?mime=text/x-cassandra">text/x-cassandra</a></code>,
			        <code><a href="?mime=text/x-plsql">text/x-plsql</a></code>,
			        <code><a href="?mime=text/x-mssql">text/x-mssql</a></code>,
			        <code><a href="?mime=text/x-hive">text/x-hive</a></code>.
			    </p>
			</div>
   		</div>
	</div>
	<script>
		$(function(){
			var mime = 'text/x-mariadb';
			  // get mime type
		    if (window.location.href.indexOf('mime=') > -1) {
		    	mime = window.location.href.substr(window.location.href.indexOf('mime=') + 5);
		    } 
			editor = CodeMirror.fromTextArea(document.getElementById('code'), {
			    mode: mime,
			    indentWithTabs: true,
			    smartIndent: true,
			    lineNumbers: true,
			    matchBrackets : true,
			    autofocus: true,
			    extraKeys: {"Ctrl-Space": "autocomplete"}
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