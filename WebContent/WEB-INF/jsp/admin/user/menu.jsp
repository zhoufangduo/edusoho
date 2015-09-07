<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String basePath = request.getContextPath();%>
<div class="list-group">
   <a href="<%=basePath%>/admin/user?active=user&menu=list" 
   <c:choose>
   		<c:when test="${param.menu == null}">class="list-group-item active"</c:when>
		<c:when test="${param.menu != 'list'}">class="list-group-item"</c:when>
		<c:otherwise>
			class="list-group-item active"
		</c:otherwise>
	</c:choose>
   
	>用户管理</a>
	
	 <a href="<%=basePath%>/admin/user/clazz?active=user&menu=clazz" 
   	<c:choose>
		<c:when test="${param.menu == 'clazz'}">class="list-group-item active"</c:when>
		<c:otherwise>
			class="list-group-item"
		</c:otherwise>
	</c:choose> >班级管理</a>
	
   <a href="<%=basePath%>/admin/user/promoted?active=user&menu=promoted" 
   	<c:choose>
		<c:when test="${param.menu == 'promoted'}">class="list-group-item active"</c:when>
		<c:otherwise>
			class="list-group-item"
		</c:otherwise>
	</c:choose> >教师管理</a>
	
   <a href="#" class="list-group-item">私信管理</a>
   
   <a href="<%=basePath%>/admin/user/log?active=user&menu=log" 
   	<c:choose>
		<c:when test="${param.menu == 'log'}">class="list-group-item active"</c:when>
		<c:otherwise>
			class="list-group-item"
		</c:otherwise>
	</c:choose> >用户登录日志</a>
</div>