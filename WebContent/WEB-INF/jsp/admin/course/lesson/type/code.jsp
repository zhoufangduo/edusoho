<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<%-- <script type="text/javascript" src="<%=basePath%>/resource/syntaxhighlighter/scripts/shCore.js"></script>
<script type="text/javascript" src="<%=basePath%>/resource/syntaxhighlighter/scripts/shBrushJScript.js"></script>
<link type="text/css" rel="stylesheet" href="<%=basePath%>/resource/syntaxhighlighter/styles/shCoreDefault.css"/>
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
		<label for="title" class="col-sm-2 control-label">文件</label>
		<div class="col-sm-9">
			<pre class="brush: js;">
				function helloSyntaxHighlighter()
				{
					return "hi!";
				}
			</pre>
		</div>
	</div>
</form>
<script>
	$(function(){
		SyntaxHighlighter.all();
	});
</script> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Hello SyntaxHighlighter</title>
	<link type="text/css" rel="stylesheet" href="<%=basePath%>/resource/syntaxhighlighter/styles/shCoreDefault.css"/>
	<script type="text/javascript" src="<%=basePath%>/resource/syntaxhighlighter/scripts/shCore.js"></script>
	<script type="text/javascript" src="<%=basePath%>/resource/syntaxhighlighter/scripts/shBrushJScript.js"></script>
</head>

<body style="background: white; font-family: Helvetica">

<h1>Hello SyntaxHighlighter</h1>
<pre class="brush: js;">
function helloSyntaxHighlighter()
{
	return "hi!";
}
</pre>

<script type="text/javascript">SyntaxHighlighter.all();</script>

</html>
