<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<%@ taglib prefix="nav" uri="/WEB-INF/navbar.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>课程管理-易通软件教育后台管理</title>
		<link href="<%=basePath%>/admin/system/setting/download?file=${site.icoImage}" rel="shortcut icon" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
		<script src="<%=basePath%>/resource/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="<%=basePath%>/resource/jquery/jquery.validate.js" type="text/javascript"></script>
		<script src="<%=basePath%>/resource/jquery/validate_form.js" type="text/javascript"></script>
		<script src="<%=basePath%>/resource/jquery/messages_zh.js" type="text/javascript"></script>
		<link href="<%=basePath%>/resource/css/all.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>/resource/iCheck/skins/all.css" rel="stylesheet">
		<script src="<%=basePath%>/resource/iCheck/icheck.min.js"></script>
	</head>
	<body>
		<nav:menu/>
		<div class="container">
			<div class="panel panel-default">
			  <div class="panel-body">
				<span style="float: left;">
				  <img style="width: 80px;height: 50px;margin-right: 10px;"
					<c:choose>
						<c:when test="${course.logoImage == null}">
							src="<%=basePath%>/resource/images/et-logo.png" 
						</c:when>
						<c:otherwise>
							 src="<%=basePath%>/admin/course/download?file=${course.logoImage}"
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
			 	 	<a class="btn btn-default" href="#" role="button">返回课程列表</a>&nbsp;
			 	 	<a class="btn btn-info" href="#" role="button">预览</a>&nbsp;
			 	 	<a class="btn btn-primary" href="#" role="button">上课</a>&nbsp;
			 	 </span>
			  </div>
			</div>
			<div class="row">
			 	 <div class="col-md-3">
			 	 	<jsp:include page="prop_menu.jsp"></jsp:include>
				 </div>
					 	
				 <div class="col-md-9">
			    	<div class="panel panel-default">
			    		<div class="panel-heading">基本信息</div>
			  			<div class="panel-body">
			  				<form action="<%=basePath%>/admin/course/update" class="form-horizontal" id="updateForm" method="post">
			  					<div class="form-group">
								    <label for="title" class="col-sm-2 control-label">名&nbsp;称</label>
								    <div class="col-sm-8">
								      <input type="text" class="form-control" id="title" 
								      name="title" placeholder="课程名称" value="${course.title}">
								    </div>
							    </div>
							    <br/>
							    <div class="form-group">
								    <label for="subtitle" class="col-sm-2 control-label">副标题</label>
								    <div class="col-sm-8">
								      <input type="text" class="form-control" id="subtitle" 
								      name="subtitle" placeholder="副标题" value="${course.subtitle}">
								    </div>
							    </div>
							    <br/>
							    <div class="form-group">
								    <label for="learnTime" class="col-sm-2 control-label">学习时长</label>
								    <div class="col-sm-8">
								      <input type="text" class="form-control" id="learnTime" 
								       name="learnTime" placeholder="天数" value="${course.learnTime}">
								      <span>
								    	设置该值后(时间单位/天)，上课的老师可以按照此时间来规划上课内容。该值为0，则不做此限制。
								    </span>
								    </div>
							    </div>
							    <br/>
							    <div class="form-group">
								    <label for="subtitle" class="col-sm-2 control-label">显示学员人数</label>
								    <div class="col-sm-8" style="margin-top: 4px;">
								     	<input type="radio"  name="openLearner" value="1"
								     		<c:if test="${course.openLearner == 1 }">checked="checked"</c:if>
								     	>&nbsp;开启
								     	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								     	<input type="radio"  name="openLearner" value="0"
								     		<c:if test="${course.openLearner == 0 }">checked="checked"</c:if>
								     	>&nbsp;关闭
								    </div>
							    </div>
							    <br/>
							     <div class="form-group">
								    <label for="type" class="col-sm-2 control-label">分类</label>
								    <div class="col-sm-8">
										<select class="form-control" name="type" style="width: 50%">
										  <option value="">课程分类</option>
										  <c:forEach items="${categorys}" var="categ">
				  							  <c:if test="${categ.pId == 0}">
													<option value="${categ.id}" 
															<c:if test="${course.type == categ.id}">selected="selected"</c:if>
													>${categ.name}</option>	
				  							  </c:if>
		  							
			 								  <c:forEach items="${categorys}" var="categSub">
				  								<c:if test="${categ.id ==  categSub.pId && categSub.pId != 0}">
				  									<option value="${categSub.id}"
				  										<c:if test="${course.type == categSub.id}">selected="selected"</c:if>
				  									>${categ.name}>${categSub.name}</option>	
				  								</c:if>
			 								  </c:forEach>
										   </c:forEach>
									  </select>								      
								    </div>
							    </div>
							    <br/>
							    
							    <div class="form-group">
								    <div class="col-sm-9" style="text-align: center;">
								      <input type="submit" style="width: 100px;" class="btn btn-primary btn-lg" value="保&nbsp;存">
								    </div>
							    </div>
							    <input type="hidden" name="id" value="${course.id}">
			  				</form>
			  			</div>
			  		</div>
				 </div>
			</div>
		</div>
		<script type="text/javascript">
		$(function(){
			$("#updateForm").validate({
				success:success,
				ignore: "",
				errorPlacement: showErrorTab,
				rules:{
					"title":{
						required: true
					}
				},
				messages:{
					"title": "课程标题是必填项"
				},
				submitHandler: function(form) {
					form.submit();
				}
			});
			
			$('input[type=radio]').iCheck({
			    checkboxClass: 'iradio_flat-blue',
			    radioClass: 'iradio_flat-blue'
			});
		});
		
	</script>
	</body>
</html>