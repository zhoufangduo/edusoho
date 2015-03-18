<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>课程分类管理</title>
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
						  <li><a href="#">课程</a></li>
						  <li class="active">课程分类管理</li>
						</ol>
					</div>
					
					<form action="">
						<div class="input-group" style="float: left;width: 80%;">
							  <span class="input-group-addon" >&nbsp;搜索项 &nbsp;</span>
							  <input type="text" class="form-control" placeholder="分类名称" style="width: 95%;">
							  <span class="input-group-btn" style="float: left;">
        						<button class="btn btn-primary" type="submit">搜&nbsp;索</button>
      						  </span>
						</div>
						 <span style="margin-left: 100px;">
      						  <button type="button" class="btn btn-info" 
      						  data-toggle="modal" data-target="#myModal">创建课程</button>
      					</span>
				    </form>
					<br/>
					
				   	<table class="table table-hover">
  						<tr>
  							<th>名称</th>
  							<th width="15%">显示序号</th>
  							<th width="20%">操作</th>
  						</tr>
  						<tr>
  							<td>
  								<span class="glyphicon glyphicon-minus-sign"></span>&nbsp;test
  							</td>
  							<td>100</td>
  							<td>
							  <button type="button" class="btn btn-sm btn-default">
							  	<span class="glyphicon glyphicon-edit"></span>&nbsp;编辑
							  </button>
							  <button type="button" class="btn btn-sm btn-default">
							  	<span class="glyphicon glyphicon-plus"></span>&nbsp;添加子分类
							  </button>
  							</td>
  						</tr>
  						<tr>
  							<td>
  								<span class="glyphicon glyphicon-minus-sign"></span>&nbsp;test2
  							</td>
  							<td>100</td>
  							<td>
							  <button type="button" class="btn btn-sm btn-default">
							  	<span class="glyphicon glyphicon-edit"></span>&nbsp;编辑
							  </button>
							  <button type="button" class="btn btn-sm btn-default">
							  	<span class="glyphicon glyphicon-plus"></span>&nbsp;添加子分类
							  </button>
  							</td>
  						</tr>
  						<tr>
  							<td style="padding-left: 50px;">
  								<span class="glyphicon glyphicon-minus"></span>&nbsp;test21
  							</td>
  							<td>100</td>
  							<td>
							  <button type="button" class="btn btn-sm btn-default">
							  	<span class="glyphicon glyphicon-edit"></span>&nbsp;编辑
							  </button>
  							</td>
  						</tr>
  						<tr>
  							<td style="padding-left: 50px;">
  								<span class="glyphicon glyphicon-minus"></span>&nbsp;test22
  							</td>
  							<td>100</td>
  							<td>
							  <button type="button" class="btn btn-sm btn-default">
							  	<span class="glyphicon glyphicon-edit"></span>&nbsp;编辑
							  </button>
  							</td>
  						</tr>
					  </table>
				    </div>
			   </div>
			</div>
		</div>
	</div>
	
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">添加分类</h4>
	      </div>
	      <div class="modal-body">
	      	<br/>
	       	<form action="<%=basePath%>/admin/course/add" class="form-horizontal" id="addForm">
	       		<div class="form-group">
				    <label for="username" class="col-sm-2 control-label">名&nbsp;称</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="username" placeholder="名称">
				    </div>
			    </div>
			    <div class="form-group">
				    <label for="username" class="col-sm-2 control-label">父分类</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="username" readonly="readonly" placeholder="名称">
				    </div>
			    </div>
			    <div class="form-group">
				    <label for="username" class="col-sm-2 control-label">显示序号</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control" id="username" placeholder="显示序号">
				      <span class="right-tip">显示序号需为整数，分类按序号的顺序从小到大排序</span>
				    </div>
			    </div>
			    <div class="form-group">
				    <label for="username" class="col-sm-2 control-label">分类描述</label>
				    <div class="col-sm-9">
				      <textarea class="form-control" rows="5"></textarea>
				    </div>
			    </div>
	       	</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">&nbsp;取&nbsp;消&nbsp;</button>
	        <button type="button" class="btn btn-primary">&nbsp;保&nbsp;存&nbsp;</button>
	      </div>
	    </div>
	  </div>
	</div>
	<script type="text/javascript">
		
		$(function(){
			
		});
	
	</script>
</body>
</html>