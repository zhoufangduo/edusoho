<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>易通软件教育后台管理</title>
	<link href="<%=basePath%>/admin/system/setting/download?file=${site.icoImage}" rel="shortcut icon" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link href="<%=basePath%>/resource/css/all.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="navigation.jsp"></jsp:include>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-body">
				<ol class="breadcrumb">
				  <li>管理中心</li>
				</ol>	
				
				<div class="row">
				  <div class="col-md-6">
					<div class="panel panel-default">
						<div class="panel-heading">数据统计</div>
						<div class="panel-body">
							<table class="table table-hover">
			  					<tr>
			  						<th width="40%">数据项</th>
			  						<th width="30%">今天</th>
			  						<th width="30%">历史</th>
			  					</tr>
			  					<tr>
			  						<td>新注册用户数</td>
			  						<td>0</td>
			  						<td><a href="">趋势</a> | <a href="">详情</a></td>
			  					</tr>
			  					<tr>
			  						<td>用户登录数(不含重复登录)</td>
			  						<td>0</td>
			  						<td><a href="">趋势</a> | <a href="">详情</a></td>
			  					</tr>
			  					<tr>
			  						<td>新增课程数</td>
			  						<td>0</td>
			  						<td><a href="">趋势</a> | <a href="">详情</a></td>
			  					</tr>
			  					<tr>
			  						<td>新增课时数</td>
			  						<td>0</td>
			  						<td><a href="">趋势</a> | <a href="">详情</a></td>
			  					</tr>
			  					<tr>
			  						<td>完成课时学习数</td>
			  						<td>0</td>
			  						<td><a href="">趋势</a> | <a href="">详情</a></td>
			  					</tr>
			  					<tr>
			  						<td>视频观看数(含重复打开)</td>
			  						<td>0</td>
			  						<td><a href="">趋势</a> | <a href="">详情</a></td>
			  					</tr>
			  					<tr>
			  						<td>用户总数</td>
			  						<td>0</td>
			  						<td><a href="">趋势</a> | <a href="">详情</a></td>
			  					</tr>
			  					<tr>
			  					
							</table>
						</div>
				 	 </div>	
				  </div>
				  <div class="col-md-6">
					<div class="panel panel-default">
						<div class="panel-heading">受欢迎课程
							<div style="float: right;margin-top: -3px;" >
								<select class="form-control" style="padding: 0px 10px;height: 28px;">
									  <option>今日</option>
									  <option>昨日</option>
									  <option>本周</option>
									  <option>上周</option>
									  <option>本月</option>
									  <option>上月</option>
								</select>
							</div>
						</div>
						<div class="panel-body">
							<div class="no_data">
								暂无受欢迎课程
							</div>
						</div>
					</div>	
				 </div>
			   </div>
		  </div>	  
		</div>
	</div>
</body>
</html>