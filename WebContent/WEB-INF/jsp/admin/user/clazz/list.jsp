<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>用户管理-易通软件教育后台管理</title>
	<link href="<%=basePath%>/admin/system/setting/download?file=${site.icoImage}" rel="shortcut icon" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/jquery/jquery.validate.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/jquery/validate_form.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/jquery/messages_zh.js" type="text/javascript"></script>
	<link href="<%=basePath%>/resource/iCheck/skins/all.css" rel="stylesheet">
	<script src="<%=basePath%>/resource/iCheck/icheck.min.js"></script>
	<link href="<%=basePath%>/resource/css/all.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
	
		function toDel(id,name){
			if(window.confirm("你确定要删除"+name+"班级?")){
				window.location = "<%=basePath%>/admin/user/clazz/deleteById?id=" + id;
			}
		}
	
	</script>
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
						  <li><a href="">用户</a></li>
						  <li class="active">班级管理</li>
						</ol>
					</div>
				    <form action="<%=basePath%>/admin/user/clazz?active=user&menu=clazz" method="post">
				    	<div class="row">
				    		<div class="col-md-8">
				    			<div class="input-group">
									  <span class="input-group-addon">搜索项 </span>
									  <input type="text" class="form-control" name="name" placeholder="班级名称"
									  	value="${param.name}" style="width: 250px;">
									  <span class="input-group-btn" style="float: left;">
		        						<button class="btn btn-primary" type="submit">搜&nbsp;索</button>
		      						  </span>
								</div>
				    		</div>
				    		<div class="col-md-4">
				    			<div class="btn-group" style="float: right;">
	      						<a href="javascript:showModel('#model','<%=basePath%>/admin/user/clazz/toAdd')"
	      						   class="btn btn-info" >添&nbsp;&nbsp;加</a>
					    		<button class="btn btn-info">
					    			导&nbsp;&nbsp;出
					    		</button>
	      					</div>
				    		</div>
				    	</div>
				    </form>
				    <br/>
				    <table class="table table-hover">
  						<tr>
  							<th width="13%">班级名称</th>
  							<th width="14%">创建人</th>
  							<th width="22%">创建时间</th>
  							<th >描述</th>
  							<th width="10%">操作</th>
  						</tr>
  						<c:forEach items="${list}" var="clazz">
  							<tr>
  								<td>${clazz.name}</td>
  								<td>${clazz.creator}</td>
  								<td>${clazz.createTime}</td>
  								<td>${clazz.description}</td>
  								<td>
  									<input type="button" onclick="toDel('${clazz.id}','${clazz.name}')" class="btn btn-sm btn-default" value="删除" />
  								</td>
  							</tr>
  						</c:forEach>
					</table>
				  </div>
			   </div>
			</div>
		</div>
	</div>
	<div id="model">
		
	</div>
</body>
</html>