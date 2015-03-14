<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>易通软件教育后台管理</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link href="<%=basePath%>/resource/css/all.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../navigation.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<jsp:include page="menu.jsp"></jsp:include>
			</div>
			<div class="col-md-10">
				<div class="panel panel-default">
				  <div class="panel-body">
				  	<div>
						<ol class="breadcrumb">
						  <li><a href="#">课程</a></li>
						  <li class="active">课程管理</li>
						</ol>
					</div>
				    <form action="">
						<div class="input-group">
							  <span class="input-group-addon" >&nbsp;搜索项 &nbsp;</span>
							  <select class="form-control" style="width: 120px;">
								  <option value="">课程分类</option>
								  <option>默认分类</option>
							  </select>
							  <select class="form-control" style="width: 120px;">
								  <option value="">课程状态</option>
								  <option>默认分类</option>
							  </select>
							  <input type="text" class="form-control" placeholder="标题" style="width: 200px;">
							  <input type="text" class="form-control" placeholder="创建者" style="width: 180px;">
							  <span class="input-group-btn" style="float: left;">
        						<button class="btn btn-primary" type="submit">搜&nbsp;索</button>
      						  </span>
						</div>
						 <span style="margin-left: 100px;">
      						  <button class="btn btn-info" type="submit">创建课程</button>
      					</span>
				    </form>
				    <br/>
				    <table class="table table-hover">
  						<tr>
  							<th>编号</th>
  							<th>名称</th>
  							<th>学员数</th>
  							<th>状态</th>
  							<th>创建者</th>
  							<th>创建时间</th>
  						</tr>
  						<tr>
  							<td></td>
  							<td></td>
  							<td></td>
  							<td></td>
  							<td></td>
  							<td></td>
  						</tr>
					</table>
				  </div>
			   </div>
			</div>
		</div>
	</div>
</body>
</html>