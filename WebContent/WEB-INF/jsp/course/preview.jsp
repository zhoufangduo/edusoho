<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<%@ taglib prefix="nav" uri="/WEB-INF/navbar.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>${course.title}-${site.title}-Power By 易通软件教育</title>
	<link href="<%=basePath%>/admin/system/setting/download?file=${site.icoImage}" rel="shortcut icon" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link href="<%=basePath%>/resource/css/all.css" rel="stylesheet" type="text/css">
	<style type="text/css">
		.logo_image{
			width: 400px;
			height: 220px;
			margin-right: 30px;
		}
		.tab-pane{
			padding: 15px; 
			border: solid 1px ;
			border-color: #ddd;
			-webkit-box-shadow: 0 1px 1px rgba(0,0,0,.05);
			box-shadow: 0 1px 1px rgba(0,0,0,.05);
			border-top: none;
			border-bottom-left-radius: 4px;
			border-bottom-right-radius: 4px;
			overflow-x: auto;
			overflow-y: auto;
		}
		
		.head{
			width: 48px;
			height: 48px;
		}
		
	</style>
</head>
<body>
	<nav:menu/>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-body">
				<div style="float: left;">
					<img class="logo_image"
					<c:choose>
						<c:when test="${course.logoImage == null}">
							src="<%=basePath%>/resource/images/et-logo.png" 
						</c:when>
						<c:otherwise>
							 src="<%=basePath%>/course/download?file=${course.logoImage}"
						</c:otherwise>
					</c:choose>
					>
				</div>
				<div>
					<div class="btn-group" style="float: right;">
						<button class="btn btn-default" data-toggle="modal" data-target="#myModal">
							<span class="glyphicon glyphicon-thumbs-up"></span>&nbsp;1
						</button>
						<button class="btn  btn-default">
							<span class="glyphicon glyphicon-user"></span>&nbsp;1
						</button>
						<a class="btn  btn-default" href="<%=basePath%>/course/view?id=${course.id}">
							<span class="glyphicon glyphicon-cog"></span>&nbsp;
						</a>
					</div>
					<div>
						<label style="font-size: 20px;">${course.title}</label>
						<p/><p/>
					</div>
					<div>
						评价：&nbsp;&nbsp;
						<c:forEach begin="1" step="1" end="5">
							<span class="glyphicon glyphicon-star-empty"></span>
						</c:forEach>
						(0人)
						<p/><p/>
					</div>
					<div>
						学员：&nbsp;&nbsp;0人
						<p/><p/>
					</div>
					<div>
						教师：&nbsp;&nbsp;${course.creater}
						<p/><p/>
					</div>
					<div>
						<span style="float: left;">学习进度：</span>
						<div class="progress" style="width: 300px;">
						  <div class="progress-bar progress-bar-primary progress-bar-striped" 
						  	style="width: 25%;">1/4</div>
						</div>
						<p/>
					</div>
					<button class="btn btn-info">
						&nbsp;<span class="glyphicon glyphicon-bookmark"></span>&nbsp;收藏课程&nbsp;
					</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="btn btn-primary">
						&nbsp;<span class="glyphicon glyphicon-hand-right"></span>&nbsp;继续学习&nbsp;
					</button>
				</div>
		  	</div>	  
		</div>
		<p/>
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="row">
				  <div class="col-md-8">
				  	<div role="tabpanel">
						  <ul class="nav nav-tabs" role="tablist">
						    <li role="presentation" class="active">
						    	<a href="#1" aria-controls="1" role="tab" data-toggle="tab">课程介绍</a>
						    </li>
						    <li role="presentation">
						    	<a href="#2" aria-controls="2" role="tab" data-toggle="tab">课程列表</a>
						    </li>
						    <li role="presentation">
						    	<a href="#3" aria-controls="3" role="tab" data-toggle="tab">课程评价</a>
						    </li>
						  </ul>
						  <div class="tab-content">
						    <div role="tabpanel" class="tab-pane active" id="1">
						    	${course.about}
						    </div>
						    <div role="tabpanel" class="tab-pane" id="2">
						    	<ul class="lesson-list sortable-list">
			  						<c:forEach items="${chapters}" var="chapter">
			  							<li class="item-chapter  clearfix" style="word-break: break-all;">
											<div class="item-content">第 <span class="number">1</span> 章：${chapter.title}</div>
											<div class="item-actions prs"></div>
										</li>			 
			  						</c:forEach>
			  					</ul>
						    </div>
						    <div role="tabpanel" class="tab-pane" id="3">
						    	<c:forEach items="${estimates}" var="estimate">
						    		<div style="float: left;">
						    			<img class="head" src="<%=basePath%>/${estimate.avatar}">
						    		</div>
						    			<a href="#">${estimate.userName}</a>
						    			&nbsp;&nbsp;&nbsp;
						    			<span style="color:#A9A9A9 ">${estimate.createTime}</span>
						    		<br>
						    			<span class="stars-${estimate.grade}"></span>
						    		<br/>
						    		<span>
						    			${estimate.comment}
						    		</span>
						    		<p/>
						    	</c:forEach>
						    </div>
						  </div>
					  </div> 
				  </div>
				  <div class="col-md-4">
				  	 <div class="panel panel-default">
				  	 	<div class="panel-heading">课程教师</div>
						<div class="panel-body">
							<div style="text-align: center;">
								<img alt="老师头像" src="<%=basePath%>${teacher.avatar}"  class="img-circle" 
									style="width: 128px;height: 128px;"/>
								<p/>${teacher.name}<p/>${teacher.signature}
							</div>
							<div class="divider"></div>
							${teacher.introduction}
						</div>
					 </div>
					 <p/>
					 <div class="panel panel-default">
				  	 	<div class="panel-heading">最新学员</div>
						<div class="panel-body">
						</div>
					 </div>
					 <p/>
					 <div class="panel panel-default">
				  	 	<div class="panel-heading">
				  	 		 <span>课程公告</span>
				  	 		 <span style="float: right;">
				  	 		 	<a href="#">添加公告</a>
				  	 		 </span>
				  	 	</div>
						<div class="panel-body">
						</div>
					 </div>
				  </div>
			    </div>
			</div>
		</div>
	</div>
	
	<form action="<%=basePath%>/course/toSaveEstimate" class="form-horizontal" id="addEstForm" method="post">
		<div class="modal fade" id="myModal" role="dialog" data-backdrop="static" aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">评价课程</h4>
		      </div>
		      <div class="modal-body">
		      		<br/>
		       		<div class="form-group">
					    <label class="col-sm-2 control-label">级别</label>
					    <div class="col-sm-9">
					     	<span id="my-course-rate" style="cursor: pointer; width: 100px;">
					     		<img src="<%=basePath%>/resource/images/star-off.png" alt="1" title="很差">&nbsp;
					     		<img src="<%=basePath%>/resource/images/star-off.png" alt="2" title="较差">&nbsp;
					     		<img src="<%=basePath%>/resource/images/star-off.png" alt="3" title="还行">&nbsp;
					     		<img src="<%=basePath%>/resource/images/star-off.png" alt="4" title="推荐">&nbsp;
					     		<img src="<%=basePath%>/resource/images/star-off.png" alt="5" title="力荐">
					     	</span>
					    </div>
				    </div>
				    <br/>
				    <div class="form-group">
					    <label class="col-sm-2 control-label">评语</label>
					    <div class="col-sm-9">
					     	<textarea rows="10" class="form-control" name="comment" ></textarea>
					    </div>
				    </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">&nbsp;取&nbsp;消&nbsp;</button>
		        <button type="submit" class="btn btn-primary" >&nbsp;保&nbsp;存&nbsp;</button>
		      </div>
		    </div>
		  </div>
		</div>
		<input type="hidden" name="courseId" value="${course.id}">
		<input type="hidden" name="grade" value="0">
		<input type="hidden" name="mark" value="0">
		<script type="text/javascript">
			$("#my-course-rate img").click(function(){
				$("#my-course-rate img").attr("src","<%=basePath%>/resource/images/star-off.png");
				var alt = $(this).attr("alt");
				for(var i = 0; i <= alt;  i++){
					$("img[alt="+i+"]").attr("src","<%=basePath%>/resource/images/star-on.png");
				}
				
				$("input[name=grade]").val(alt);
			});
			
			$(function(){
				
				$("#addEstForm").submit(function(){
					if($("input[name=grade]").val() > 0){
						return true;
					}
					alert("请选择评价的级别!");
					return false;
				});
				
				<c:forEach items="${estimates}" var="estimate">
	    			<c:if test="${estimate.userId == user.id}">
	    			for(var i = 0; i <= '${estimate.grade}';  i++){
						$("img[alt="+i+"]").attr("src","<%=basePath%>/resource/images/star-on.png");
						$("input[name=mark]").val(1);
					}
	    			
	    			$("[name=comment]").val('${estimate.comment}');
	    			</c:if>
	    		</c:forEach>
			});
		</script>
	</form>
	
</body>
</html>