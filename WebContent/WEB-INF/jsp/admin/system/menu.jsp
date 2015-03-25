<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String basePath = request.getContextPath();%>
<div class="list-group">
   <a href="<%=basePath%>/admin/system/site?active=site" 
   	<c:choose>
		<c:when test="${param.menu == 'site'}">class="list-group-item"</c:when>
		<c:otherwise>
			class="list-group-item  active"
		</c:otherwise>
	</c:choose>
   
	>站点设置</a>
   <a href="<%=basePath%>/admin/course/category?active=course&menu=category" 
   	<c:choose>
		<c:when test="${param.menu == 'category'}">class="list-group-item active"</c:when>
		<c:otherwise>
			class="list-group-item"
		</c:otherwise>
	</c:choose> >全局设置</a>
	
   <a href="#" class="list-group-item">IP黑名单</a>
   <a href="#" class="list-group-item">用户设置</a>
   <a hred="#" class="list-group-item">数据统计</a>
</div>