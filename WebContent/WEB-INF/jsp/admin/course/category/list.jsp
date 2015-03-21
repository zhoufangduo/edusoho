<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<script src="<%=basePath%>/resource/jquery/jquery.validate.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/jquery/validate_form.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/jquery/messages_zh.js" type="text/javascript"></script>
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
					
					<form action="<%=basePath%>/admin/course/category?active=course&menu=category" method="post">
						<div class="input-group" style="float: left;width: 80%;">
							  <span class="input-group-addon" >&nbsp;搜索项 &nbsp;</span>
							  <input type="text" class="form-control" placeholder="分类名称" name="name" style="width: 95%;">
							  <span class="input-group-btn" style="float: left;">
	       						<button class="btn btn-primary" type="submit">搜&nbsp;索</button>
	     				      </span>
						</div>
						<span style="margin-left: 100px;">
      						  <button type="button" class="btn btn-info" onclick="showAddForm(0)" >创建课程</button>
      					</span>
				    </form>
					<br/>
					
				   	<table class="table table-hover">
  						<tr>
  							<th>名称</th>
  							<th width="15%">显示序号</th>
  							<th width="22%">操作</th>
  						</tr>
  						
  						<c:forEach items="${list}" var="categ">
  							 <c:if test="${categ.pId == 0}">
	  							<tr>
		  							<td>
		  								<span class="glyphicon glyphicon-plus"></span>&nbsp;${categ.name}
		  							</td>
		  							<td>${categ.sort}</td>
		  							<td>
									 	<div class="btn-group">
										  <button type="button" class="btn btn-sm btn-default">管理</button>
										  <button type="button" class="btn btn-sm btn-default  dropdown-toggle" data-toggle="dropdown">
										    <span class="caret"></span>
										    <span class="sr-only">Toggle Dropdown</span>
										  </button>
										  <ul class="dropdown-menu" role="menu">
										    <li><a href="#">
										    	<span class="glyphicon glyphicon-edit"></span>&nbsp;编辑
										    </a></li>
										    <li><a href="#">
										    	<span class="glyphicon glyphicon-trash"></span>&nbsp;删除
										    </a></li>
										  </ul>
										</div>
									  <button type="button" class="btn btn-sm btn-default" onclick="showAddForm(${categ.id})">
									  	<span class="glyphicon glyphicon-plus"></span>&nbsp;添加子分类
									  </button>
									</td>
	  							</tr>
  							</c:if>
  							
  							<c:forEach items="${list}" var="categSub">
  								<c:if test="${categ.id ==  categSub.pId && categSub.pId != 0}">
  									<tr>
			  							<td style="padding-left: 50px;">
			  								<span class="glyphicon glyphicon-minus"></span>&nbsp;${categSub.name}
			  							</td>
			  							<td>${categSub.sort}</td>
			  							<td>
											<div class="btn-group">
											  <button type="button" class="btn btn-sm btn-default">管理</button>
											  <button type="button" class="btn btn-sm btn-default  dropdown-toggle" data-toggle="dropdown">
											    <span class="caret"></span>
											    <span class="sr-only">Toggle Dropdown</span>
											  </button>
											  <ul class="dropdown-menu" role="menu">
											    <li><a href="#">
											    	<span class="glyphicon glyphicon-edit"></span>&nbsp;编辑
											    </a> </li>
											    <li><a href="#">
											    	<span class="glyphicon glyphicon-trash"></span>&nbsp;删除
											    </a></li>
											  </ul>
											</div>
										</td>
	  								</tr>
  								</c:if>
  							</c:forEach>
  						</c:forEach>
					  </table>
				    </div>
			   </div>
			</div>
		</div>
	</div>
	
	<form action="<%=basePath%>/admin/course/add" class="form-horizontal" id="addForm" method="post">
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">添加分类</h4>
		      </div>
		      <div class="modal-body">
		      	<br/>
		       		<div class="form-group">
					    <label for="name" class="col-sm-2 control-label">名&nbsp;称</label>
					    <div class="col-sm-9">
					      <input type="text" class="form-control" id="name" name="name" placeholder="名称">
					    </div>
				    </div>
				    <div class="form-group">
					    <label for="pId" class="col-sm-2 control-label">父分类</label>
					    <div class="col-sm-9">
					      <input type="text" class="form-control" id="pId" name="pId" readonly="readonly"
					       placeholder="名称" >
					    </div>
				    </div>
				    <div class="form-group">
					    <label for="sort" class="col-sm-2 control-label">显示序号</label>
					    <div class="col-sm-9">
					      <input type="text" class="form-control" id="sort" name="sort" value="0" placeholder="显示序号">
					      <span class="right-tip">显示序号需为整数，分类按序号的顺序从小到大排序</span>
					    </div>
				    </div>
				    <div class="form-group">
					    <label for="description" class="col-sm-2 control-label">分类描述</label>
					    <div class="col-sm-9">
					      <textarea class="form-control" rows="5" name="description" id="description"></textarea>
					    </div>
				    </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">&nbsp;取&nbsp;消&nbsp;</button>
		        <button type="submit" class="btn btn-primary" >&nbsp;保&nbsp;存&nbsp;</button>
		      </div>
		    </div>
		  </div>
		</div>
	</form>
	<script type="text/javascript">
		
		$(function(){
			$("#addForm").validate({
				success:success,
				ignore: "",
				errorPlacement: showErrorTab,
				rules:{
					"name":{
						required: true
					},
					"sort" :{
						required:true,
						digits:true
					}
				},
				messages:{
					"name": "分类名称是必填项",
					"sort": {required : "分类显示序列号不能为空!", digits:"只能为正整数!"}
				},
				submitHandler: function(form) {
					form.submit();
				}
			});
		});
		
		function showAddForm(pid){
			$("#pId").val(pid);
			$("#name").val("");
			$("#description").val();
			$('#myModal').modal('show');
		}
	
	</script>
</body>
</html>