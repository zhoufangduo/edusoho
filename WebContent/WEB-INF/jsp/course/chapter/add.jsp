<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <form action="<%=basePath%>/course/chapter/add" class="form-horizontal" id="addForm" method="post">
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">
	        	<c:if test="${param.type==1}">添加章</c:if>
	        	<c:if test="${param.type==2}">添加节</c:if>
	        </h4>
	      </div>
	      <div class="modal-body">
	     	<br/>
       		<div class="form-group">
			    <label for="title" class="col-sm-2 control-label">
			    	<c:if test="${param.type==1}">章标题</c:if>
		        	<c:if test="${param.type==2}">节标题</c:if>
			    </label>
			    <div class="col-sm-9">
			      <input type="text" class="form-control" id="title" name="title" 
			      	<c:if test="${param.type==1}">placeholder="章标题"</c:if>
	        		<c:if test="${param.type==2}">placeholder="节标题"</c:if>
			      >
			    </div>
			    <input type="hidden" name="pId" value="${param.pId}">
			    <input type="hidden" name="courseId" value="${param.courseId}">
			    <input type="hidden" name="type" value="${param.type}">
		    </div>
		    <br/>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">&nbsp;取&nbsp;消&nbsp;</button>
	        <button type="submit" class="btn btn-primary" >&nbsp;保&nbsp;存&nbsp;</button>
	      </div>
	    </div>
	  </div>
	</div>
	</div>
</form>

<script type="text/javascript">
	
	$(function(){
		
		var required;
		
		<c:if test="${param.type==1}">
			required = "章的标题不能为空!";
		</c:if>
    	<c:if test="${param.type==2}">
	    	required = "节的标题不能为空!";
    	</c:if>
		
		$("#addForm").validate({
			success:success,
			ignore: "",
			errorPlacement: showErrorTab,
			rules:{
				"title":{
					required: true
				}
			},
			messages:{
				"title": {required: required}
			},
			submitHandler: function(form) {
				form.submit();
			}
		});
		
		$('#myModal').modal('show');
	});
</script>