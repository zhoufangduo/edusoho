<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>登录日志-易通软件教育后台管理</title>
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
						  <li class="active">用户登录日志</li>
						</ol>
					</div>
				    <form action="<%=basePath%>/admin/user/log?active=user&menu=log" method="post">
						<div class="input-group" style="float: left;width: 80%;">
							  <span class="input-group-addon">搜索项 </span>
							  <select class="form-control" name="colname" style="width: 125px;">
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
							  value="${param.keys}" style="width: 240px;">
							  
							  <span class="input-group-btn" style="float: left;">
        						<button class="btn btn-primary" type="submit">搜&nbsp;索</button>
      						  </span>
						</div>
						<span style="margin-left: 65px;">
      						  <a href="javascript:toCleanLog()" class="btn btn-info" >清空日志</a>
      					</span>
				    </form>
				    <br/>
				    <table class="table table-hover">
  						<tr>
  							<th width="20%">用户名</th>
  							<th>Email</th>
  							<th>用户组</th>
  							<th width="12%">登录IP</th>
  							<th width="18%">登录时间</th>
  						</tr>
  						<c:forEach items="${list}" var="log">
  							<tr>
  								<td>
									<span class="nameTip">
  									<a href="javascript:showModel('#model','<%=basePath%>/admin/user/toView?id=${log.userId}')">
  										${log.username}
  									</a></span>
  								</td>
  								<td>${log.email}</td>
  								<td>
  									<c:forEach items="${log.roles}"  var="role">
  										<c:if test="${role == 'STUDENT' }">学员&nbsp;</c:if>
  										<c:if test="${role == 'TEACHER' }">教师&nbsp;</c:if>
  										<c:if test="${role == 'ADMIN' }">管理员&nbsp;</c:if>
  										<c:if test="${role == 'SUPERADMIN' }">超级管理员&nbsp;</c:if>
  									</c:forEach>
  								</td>
  								<td>${log.loginIp}</td>
  								<td>${log.loginTime}</td>
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
	<script type="text/javascript">
		
		function toCleanLog(){
			if(window.confirm("你确定清空用户登录日志?")){
				window.location ="<%=basePath%>/admin/user/log/clean";
			}
		}
	
	</script>
</body>
</html>