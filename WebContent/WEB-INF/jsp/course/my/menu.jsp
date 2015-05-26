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
	      <span class="list-group-item head">我的教学</span>
	      
		  <a href="<%=basePath%>/course/myCourse?active=list" 
		  		<c:choose>
				  	<c:when test="${param.active == 'list' || param.active == null}">class="list-group-item active"</c:when>
				  	<c:otherwise>class="list-group-item"</c:otherwise>
			  	</c:choose>
		  	>在教课程</a>
		  	
		  <a href="<%=basePath%>/course/detail?active=detail&id=${course.id}" 
			  	<c:choose>
				  	<c:when test="${param.active == 'detail'}">class="list-group-item active"</c:when>
				  	<c:otherwise>class="list-group-item"</c:otherwise>
			  	</c:choose>
		  >学员问答</a>
		</div>
			
		<div class="list-group" style="width: 99%;">
		  <span class="list-group-item head">我的学习</span>
		  <a href="#" class="list-group-item">我的问答</a>
		  <a href="#" class="list-group-item">我的笔记</a>
		</div>
	   </div>
	</div>