<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "http://www.w3.org/TR/html4/loose.dtd">
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
						<div class="input-group" style="float: left;width: 80%;">
							  <span class="input-group-addon" >&nbsp;搜索项 &nbsp;</span>
							  <select class="form-control" style="width: 125px;">
								  <option value="">课程分类</option>
								  <option>默认分类</option>
							  </select>
							  <select class="form-control" style="width: 125px;">
								  <option value="">课程状态</option>
								  <option>未发布</option>
								  <option>已发布</option>
								  <option>已关闭</option>
							  </select>
							  <input type="text" class="form-control" placeholder="标题" style="width: 200px;">
							  <input type="text" class="form-control" placeholder="创建者" style="width: 180px;">
							  <span class="input-group-btn" style="float: left;">
        						<button class="btn btn-primary" type="submit">搜&nbsp;索</button>
      						  </span>
						</div>
						 <span style="margin-left: 100px;">
      						  <a href="http://www.hao123.com" class="btn btn-info" target="_blank" >创建课程</a>
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
  							<th>操作</th>
  						</tr>
  						<tr>
  							<td>对方是否打算<br/>dsfdsfdsfdsfdsf</td>
  							<td>第三方斯蒂芬</td>
  							<td>斯蒂芬森的</td>
  							<td>斯蒂芬斯多夫</td>
  							<td>斯蒂芬森的</td>
  							<td>斯蒂芬斯多夫</td>
  							<td>
  								<div class="btn-group">
								  <button type="button" class="btn btn-sm btn-default">管理</button>
								  <button type="button" class="btn btn-sm btn-default  dropdown-toggle" data-toggle="dropdown">
								    <span class="caret"></span>
								    <span class="sr-only">Toggle Dropdown</span>
								  </button>
								  <ul class="dropdown-menu" role="menu">
								    <li><a href="#">
								    	<span class="glyphicon glyphicon-star"></span>&nbsp;推荐课程
								    </a> </li>
								    <li><a href="#">
								    	<span class="glyphicon glyphicon-ban-circle"></span>&nbsp;关闭课程
								    </a></li>
								    <li><a href="#">
								    	<span class="glyphicon glyphicon-ok-circle"></span>&nbsp;发布课程
								    </a></li>
								    <li><a href="#">
								    	<span class="glyphicon glyphicon-trash"></span>&nbsp;删除课程
								    </a></li>
								  </ul>
								</div>
  							</td>
  						</tr>
					</table>
					
				  </div>
			   </div>
			</div>
		</div>
	</div>
</body>
</html>