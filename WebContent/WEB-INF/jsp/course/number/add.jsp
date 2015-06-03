<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <form action="<%=basePath%>/course/number/add" class="form-horizontal" id="addForm" method="post">
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">添加学员</h4>
	      </div>
	      <div class="modal-body">
	      	<br/>
	       		<div class="form-group">
				    <label for="userId" class="col-sm-2 control-label">用户名</label>
				    <div class="col-sm-9">
				    	<select class="form-control" name="userId" id="userId">
				    		<c:forEach items="${numbers}" var="number">
				    			<option value="${number.userId}">${number.username}(${number.name})</option>
				    		</c:forEach>
				    	</select>
				    </div>
			    </div>
			    <div class="form-group">
				    <label for="comment" class="col-sm-2 control-label">备注</label>
				    <div class="col-sm-9">
				      	<textarea rows="10" class="form-control" name="comment" id="comment"></textarea>
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
	
	<input type="hidden" value="${param.courseId}" name="courseId">
</form>

<script type="text/javascript">
	
	$(function(){
		
		$('#myModal').modal('show');
	});
</script>