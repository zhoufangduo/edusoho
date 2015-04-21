<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<form action="<%=basePath%>/admin/course/chapter/add" class="form-horizontal" id="codeForm" method="post">
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
			   <div class="panel panel-default">
				   <div class="panel-body">
						<br /> 选择你要上传的文件：
						<p />
						<div class="btn-group">
						  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
						     编写代码&nbsp;<span class="caret"></span>
						  </button>
						  <ul class="dropdown-menu" role="menu">
						    <li><a href="javascript:toCodeEdit('java')">Java</a></li>
						    <li><a href="javascript:toCodeEdit('js')">JavaScript</a></li>
						    <li><a href="javascript:toCodeEdit('sql')">Sql</a></li>
						    <li><a href="javascript:toCodeEdit('html')">Html</a></li>
						    <li><a href="javascript:toCodeEdit('css')">Css</a></li>
						    <li><a href="javascript:toCodeEdit('other')">其他</a></li>
						  </ul>
						</div>
						&nbsp;&nbsp;<span style="color: #31708f;">点击按钮后，会弹出一个编写代码的框,可以直接进行代码编写</span>
						<br />&nbsp;
						<pre style="min-height: 100px;"><code id="code"  style="font-family: '微软雅黑';"></code></pre>
						 <input type="hidden" name="context" value="">
				   </div>
			   </div>
		</div>
	</div>
	<script type="text/javascript">
		function toCodeEdit(type){
			var xpwidth=window.screen.width-10;
	        var xpheight=window.screen.height-35;
			window.open('<%=basePath%>/resource/editor/' + type + 'Editor.jsp', '_blank',
					'fullscreen,toolbar=no,location=no,directories=no,status=yes,resizable=yes,directories=no,top=0,left=0,width='+xpwidth+',height='+xpheight);
		}
	</script>
</form>

