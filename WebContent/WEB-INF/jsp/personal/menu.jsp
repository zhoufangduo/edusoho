<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%String basePath = request.getContextPath();%>
<style type="text/css">
	 .list-group-item.active, 
	 .list-group-item.active:focus, 
	 .list-group-item.active:hover{
		background-color: #eee;
		color:#000000;
		border-color: #eee;
		font-weight: bold;
		border-left: solid 3px #CCCCCC;
		border-right: solid 3px #CCCCCC;
	}
	.list-group-item.head, 
	.list-group-item.head:focus, 
	.list-group-item.head:hover{
		background-color: #777;
		border-color: #777;
		color: #FFFFFF;
		font-weight: bold;
	}
</style>
<div class="panel panel-default">
  <div class="panel-body">
    <div class="list-group" style="width: 99%;">
      <span class="list-group-item head">个人中心</span>
	  <a href="<%=basePath%>/personal/basic?active=basic&id=${user.id}" 
	  		<c:choose>
			  	<c:when test="${param.active == 'basic' || param.active == null}">class="list-group-item active"</c:when>
			  	<c:otherwise>class="list-group-item"</c:otherwise>
		  	</c:choose>
	  	><span class="glyphicon glyphicon-user"></span>&nbsp;基本信息</a>
	  	
	  <a href="<%=basePath%>/personal/toAvatar?acive=avatar&id=${user.id}" 
		  	<c:choose>
			  	<c:when test="${param.active == 'avatar'}">class="list-group-item active"</c:when>
			  	<c:otherwise>class="list-group-item"</c:otherwise>
		  	</c:choose>
	  ><span class="glyphicon glyphicon-picture"></span>&nbsp;头像设置</a>
	  
	  <a href="#"
	  		<c:choose>
			  	<c:when test="${param.active == 'logoImage'}">class="list-group-item active"</c:when>
			  	<c:otherwise>class="list-group-item"</c:otherwise>
		  	</c:choose>
	  ><span class="glyphicon glyphicon-lock"></span>&nbsp;安全设置</a>
	</div>
   </div>
</div>