<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String basePath = request.getContextPath();%>
<div class="list-group">
   <a href="<%=basePath%>/admin/course?active=course" 
   	<c:choose>
		<c:when test="${param.menu == 'category'}">class="list-group-item"</c:when>
		<c:otherwise>
			class="list-group-item  active"
		</c:otherwise>
	</c:choose>
   
	>课程管理</a>
   <a href="<%=basePath%>/admin/course/category?active=course&menu=category" 
   	<c:choose>
		<c:when test="${param.menu == 'category'}">class="list-group-item active"</c:when>
		<c:otherwise>
			class="list-group-item"
		</c:otherwise>
	</c:choose> >分类管理</a>
	
   <a href="#" class="list-group-item">推荐的课程</a>
   <a href="#" class="list-group-item">评价管理</a>
   <a hred="#" class="list-group-item">课程提问</a>
</div>