<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="panel panel-default">
  <div class="panel-body">
	<span style="float: left;">
	  <img style="width: 80px;height: 50px;margin-right: 10px;"
		<c:choose>
			<c:when test="${course.logoImage == null}">
				src="<%=basePath%>/resource/images/et-logo.png" 
			</c:when>
			<c:otherwise>
				 src="<%=basePath%>/course/download?file=${course.logoImage}"
			</c:otherwise>
		</c:choose>
		>
	 </span>
  	 <span style="float: left;">
	  	<a href="#" class="nameTip">${course.title}</a> 
	  	<br>
 		 教师：${course.creater}
 		 <br>
  	 </span>
 	 <span style="float: right;margin-top: 8px;">
 	 	<a class="btn btn-default" href="<%=basePath%>/course/myCourse?active=list"
 	 		 role="button">&nbsp;返&nbsp;回&nbsp;</a>&nbsp;
 	 	<a class="btn btn-info" href="<%=basePath%>/course/preview?courseId=${course.id}"  target="_blank"
 	 		role="button">&nbsp;预&nbsp;览&nbsp;</a>&nbsp;
 	 	<a class="btn btn-primary" href="#" role="button">&nbsp;上&nbsp;课&nbsp;</a>&nbsp;
 	 </span>
  </div>
</div>