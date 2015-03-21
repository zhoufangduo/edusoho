<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String basePath = request.getContextPath();%>
<div class="list-group">
   <a href="<%=basePath%>/admin/user?active=user" 
   <c:choose>
		<c:when test="${param.menu == 'list'}">class="list-group-item"</c:when>
		<c:otherwise>
			class="list-group-item  active"
		</c:otherwise>
	</c:choose>
   
	>用户管理</a>
   <a href="<%=basePath%>/admin/user?active=user" 
   	<c:choose>
		<c:when test="${param.menu == 'category'}">class="list-group-item active"</c:when>
		<c:otherwise>
			class="list-group-item"
		</c:otherwise>
	</c:choose> >教师管理</a>
	
   <a href="#" class="list-group-item">私信管理</a>
   <a href="#" class="list-group-item">用户登录日志</a>
</div>