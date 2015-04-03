<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%String basePath = request.getContextPath();%>
		<div class="panel panel-default">
		  <div class="panel-body">
		    <div class="list-group" style="width: 99%;">
		      <span class="list-group-item head">课程信息</span>
		      
			  <a href="<%=basePath%>/admin/course/view?active=base&id=${course.id}" 
			  		<c:choose>
					  	<c:when test="${param.active == 'base' || param.active == null}">class="list-group-item active"</c:when>
					  	<c:otherwise>class="list-group-item"</c:otherwise>
				  	</c:choose>
			  	>基本信息</a>
			  	
			  <a href="<%=basePath%>/admin/course/detail?active=detail&id=${course.id}" 
				  	<c:choose>
					  	<c:when test="${param.active == 'detail'}">class="list-group-item active"</c:when>
					  	<c:otherwise>class="list-group-item"</c:otherwise>
				  	</c:choose>
			  >详细信息</a>
			  
			  
			  
			  <a href="#" class="list-group-item">课程图片</a>
			  <a href="#" class="list-group-item">课时管理</a>
			  <a href="#" class="list-group-item">文件管理</a>
			</div>
				
			<div class="list-group" style="width: 99%;">
			  <span class="list-group-item head">课程设置</span>
			  <a href="#" class="list-group-item">教师设置</a>
			  <a href="#" class="list-group-item">学员设置</a>
			</div>
		   </div>
		</div>