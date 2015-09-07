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
						  <li><a href="">用户</a></li>
						  <li class="active">用户管理</li>
						</ol>
					</div>
				    <form action="<%=basePath%>/admin/user?active=user" method="post">
				    	<div class="row">
				    		<div class="col-md-8">
				    			<div class="input-group">
									  <span class="input-group-addon">搜索项 </span>
									  <select class="form-control" name="role" style="width: 120px;">
										  <option value="" <c:if test="${param.role == ''}">selected="selected"</c:if>>所有角色</option>
										  <option value="STUDENT" <c:if test="${param.role == 'STUDENT'}">selected="selected"</c:if> >
										  	学员
										  </option>
										  <option value="TEACHER" <c:if test="${param.role == 'TEACHER'}">selected="selected"</c:if>>
										  	教师
										  </option>
										  <option value="ADMIN" <c:if test="${param.role == 'ADMIN'}">selected="selected"</c:if>>
										 	管理员
										 </option>
										  <option value="SUPERADMIN" <c:if test="${param.role == 'SUPERADMIN'}">selected="selected"</c:if>>
										 	超级管理员
										  </option>
									  </select>
									  
									  <select class="form-control" name="colname" style="width: 120px;margin-left: 3px;">
										  <option value="" <c:if test="${param.colname == ''}">selected="selected"</c:if>>
										 	 关键字类型
										  </option>
										  <option value="USERNAME" <c:if test="${param.colname == 'USERNAME'}">selected="selected"</c:if>>
										  	登录账号
										  </option>
										  <option value="EMAIL" <c:if test="${param.colname == 'EMAIL'}">selected="selected"</c:if>>
										  	邮件
										  </option>
										  <option value="NAME" <c:if test="${param.colname == 'NAME'}">selected="selected"</c:if>>
										  	姓名
										  </option>
									  </select>
									  <input type="text" class="form-control" name="keys" placeholder="关键字"
									  value="${param.keys}" style="width: 250px;">
									  
									  <span class="input-group-btn" style="float: left;">
		        						<button class="btn btn-primary" type="submit">搜&nbsp;索</button>
		      						  </span>
								</div>
				    		</div>
				    		<div class="col-md-4">
				    			<div class="btn-group" style="float: right;">
	      						<a href="javascript:showModel('#model','<%=basePath%>/admin/user/toAdd')"
	      						   class="btn btn-info" >创建</a>
					    		<button class="btn btn-info">
					    			导入
					    		</button>
					    		<button class="btn btn-info">
					    			导出
					    		</button>
	      					</div>
				    		</div>
				    	</div>
				    </form>
				    <br/>
				    <table class="table table-hover">
  						<tr>
  							<th width="20%">用户名</th>
  							<th>Email</th>
  							<th>用户组</th>
  							<th width="18%">注册时间</th>
  							<th width="12%">状态</th>
  							<th width="10%">操作</th>
  						</tr>
  						<c:forEach items="${list}" var="quser">
  							<tr>
  								<td>
									<span class="nameTip">
  									<a href="javascript:showModel('#model','<%=basePath%>/admin/user/toView?id=${quser.id}')">
  										${quser.username}
  									</a></span>
  									<c:if test="${quser.locked == 1}">
  										<span class="badge" style="background-color: red;">禁</span>
  									</c:if>
  								</td>
  								<td>${quser.email}</td>
  								<td>
  									<c:forEach items="${quser.roles}"  var="role">
  										<c:if test="${role == 'STUDENT' }">学员&nbsp;</c:if>
  										<c:if test="${role == 'TEACHER' }">教师&nbsp;</c:if>
  										<c:if test="${role == 'ADMIN' }">管理员&nbsp;</c:if>
  										<c:if test="${role == 'SUPERADMIN' }">超级管理员&nbsp;</c:if>
  									</c:forEach>
  								</td>
  								<td>${quser.createTime}</td>
  								<td>
  									<c:if test="${quser.locked == 1}">已锁定</c:if>
  									<c:if test="${quser.locked == 0}">可使用</c:if>
								</td>
								<td>
									<c:choose>
										<c:when test="${quser.id == user.id || fn:contains(user.role, 'SUPERADMIN')}">
											<div class="btn-group">
											  <button type="button" class="btn btn-default btn-sm"
											    onclick="showModel('#model','<%=basePath%>/admin/user/toView?id=${quser.id}')">查看</button>
											  <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
											    <span class="caret"></span>
											    <span class="sr-only">Toggle Dropdown</span>
											  </button>
											  <ul class="dropdown-menu" role="menu">
											    <li><a href="#">编辑用户信息</a></li>
											    <c:if test="${user.id !=  quser.id and fn:contains(user.role, 'SUPERADMIN')}">
												    <li><a href="#">删除用户</a></li>
												    <li class='divider'></li>
											    </c:if>
											    <li><a href="#">设置用户组</a></li>
											    <li><a href="#">修改用户头像</a></li>
											    <li><a href="#">修改密码</a></li>
											    <li><a href="#">封禁用户</a></li>
											  </ul>
											</div>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn btn-default btn-sm"
										    onclick="showModel('#model','<%=basePath%>/admin/user/toView?id=${quser.id}')">查看</button>
										</c:otherwise>
									</c:choose>
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