<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="<%=basePath%>/admin">易通软件教育后台管理</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li <c:if test="${param.active == 'course'}">class="active_nav"</c:if>>
        	<a href="<%=basePath%>/admin/course?active=course">课程 </a>
        </li>
        <li <c:if test="${param.active == 'user'}">class="active_nav"</c:if>>
        	<a href="<%=basePath%>/admin/user?active=user" >用户</a>
        </li>
        <li><a href="#">内容</a></li>
        <li><a href="#">系统</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="<%=basePath%>"><span class="glyphicon glyphicon-home"></span>&nbsp;回首页</a></li>
        <li><a href="login.jsp"><span class="glyphicon glyphicon-user"></span>&nbsp;${user.name}</a></li>
        <li><a href="addUser.jsp"><span class="glyphicon glyphicon-off"></span>&nbsp;退出</a></li>
      </ul>
    </div>
  </div>
</div>