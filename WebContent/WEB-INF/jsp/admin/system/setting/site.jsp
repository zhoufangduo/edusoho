<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>课程管理-易通软件教育后台管理</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link href="<%=basePath%>/resource/css/all.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../../navigation.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<jsp:include page="../menu.jsp"></jsp:include>
			</div>
			<div class="col-md-10">
				<div class="panel panel-default">
				  <div class="panel-body">
					  	<div>
							<ol class="breadcrumb">
							  <li><a href="#">系统</a></li>
							  <li class="active">站点设置</li>
							</ol>
						</div>
						<form action="<%=basePath%>" class="form-horizontal" id="addForm" method="post">
							<div class="form-group">
							    <label for="name" class="col-sm-2 control-label">站点名称</label>
							    <div class="col-sm-9">
							      <input type="text" class="form-control" id="name" name="name" placeholder="站点名称">
							    </div>
						    </div>
						    <div class="form-group">
							    <label for="name" class="col-sm-2 control-label">网站副标题</label>
							    <div class="col-sm-9">
							      <input type="text" class="form-control" id="name" name="name" placeholder="网站副标题">
							    </div>
						    </div>
						    <div class="form-group">
							    <label for="name" class="col-sm-2 control-label">网站Logo</label>
							    <div class="col-sm-9">
							      <span>
							      	<input type="button" class="btn btn-default" onclick="openFile()" value="选择">
							      	&nbsp;
							      	<input type="button" class="btn btn-default"  value="删除">
							      </span>
							      &nbsp;
							      <span>
							      	 <input type="file" id="file" style="display:none;">
							      	 <img src="">
							      </span>
							    </div>
						    </div>
						</form>
				  </div>
			   </div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function openFile(){
			$("#file").click();
		}
		
		$(function(){
			$("#file").change(function(){
				
			});
		});
	</script>
</body>
</html>