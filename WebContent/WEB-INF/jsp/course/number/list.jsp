<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<%@ taglib prefix="nav" uri="/WEB-INF/navbar.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"  "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>学员管理-课程管理-${site.title}-${site.subtitle}-Power By 易通软件教育</title>
		<link href="<%=basePath%>/admin/system/setting/download?file=${site.icoImage}" rel="shortcut icon" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
		<script src="<%=basePath%>/resource/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="<%=basePath%>/resource/jquery/validate_form.js" type="text/javascript"></script>
		<link href="<%=basePath%>/resource/css/all.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<nav:menu/>
		<div class="container">
			<jsp:include page="../lesson/info.jsp"></jsp:include>	
			<div class="row">
			 	 <div class="col-md-3">
			 	 	<jsp:include page="../prop_menu.jsp"></jsp:include>
				 </div>
					 	
				 <div class="col-md-9">
			    	<div class="panel panel-default">
			    		<div class="panel-heading">
			    			<label class="course-title2">学员管理</label>
			    			<div style="float:right; margin-right: 5px;">
				    			<a class="btn btn-info" href="javascript:showModel('#model','<%=basePath%>/course/number/toAdd?courseId=${course.id}')">
				    				<span class="glyphicon glyphicon-plus"></span>&nbsp;添加学员
				    			</a>
				    			&nbsp;&nbsp;
				    			<button class="btn btn-info">
				    				<span class="glyphicon glyphicon-import"></span>&nbsp;导入学员
				    			</button>
				    			&nbsp;&nbsp;
				    			<button class="btn btn-info">
				    				<span class="glyphicon glyphicon-export"></span>&nbsp;导出学员
				    			</button>
				    		</div>
			    		</div>
			  			<div class="panel-body">
			  				<c:forEach items="${numbers}" var="num">
		  						<div class="numInfo" title="备注：${num.comment}" style="float: left;">
		  							<img alt="" src="<%=basePath%>/${num.avatar}" style="float: left;" class="sm_head"/>
			  						<span>
			  							<a href="#">${num.username}</a>
			  							<br/>
			  							${num.name}
			  						</span>
			  						<p/><p/>
			  						加入时间：${num.joinTime}
			  						<br/>
			  						<div class="btn-group">
			  							<button class="btn btn-sm btn-primary">&nbsp;查看资料&nbsp;</button>
			  							<div class="btn-group">
										  <button type="button" class="btn btn-sm btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
										  	 &nbsp;&nbsp; 管理&nbsp;&nbsp;<span class="caret"></span>&nbsp;&nbsp;
										  </button>
										  <ul class="dropdown-menu" role="menu">
										    <li><a href="#">
										    	<span class="glyphicon glyphicon-tag"></span>&nbsp;备注
										    </a></li>
										    <li><a href="javascript:delById('${num.userId}','${num.courseId}','${num.username}','${num.name}')">
										    	<span class="glyphicon glyphicon-remove"></span>&nbsp;移除
										    </a></li>
										  </ul>
										</div>
							  	  </div>
		  						</div>
			  				</c:forEach>
			  			</div>
			  		</div>
				 </div>
			</div>
		</div>
		<div id="model">
		
		</div>
		<script type="text/javascript">
			function delById(userId,courseId,userName,name){
				if(window.confirm("你确定要删除此学员:" + userName + "(" + name + ")?")){
					window.location = "<%=basePath%>/course/number/deleteById?courseId="+courseId+"&userId=" + userId;
				}
			}
		</script>
	</body>
</html>