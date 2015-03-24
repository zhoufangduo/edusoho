<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">个人详细信息</h4>
      </div>
      <div class="modal-body">
      		<table class="table table-bordered" style="width: 100%;">
				<tr>
					<td rowspan="3" width="10%">
						<img alt="" src="<%=basePath%>${queryUser.avatar}">
					</td>
					<th width="10%">账号</th>
					<td>${queryUser.username}
						<span style="float: right;">
							<a href="#">个人主页</a>
						</span>
					</td>
				</tr>
				<tr>
					<th>姓名</th>
					<td>${queryUser.name}</td>
				</tr>
				<tr>
					<th>性别</th>
					<td><c:if test="${queryUser.sex == 'SCORI'}">保密</c:if></td>
				</tr>
				<tr>
					<th>Email</th>
					<td colspan="2">${queryUser.email}</td>
				</tr>
				<tr>
					<th>用户组</th>
					<td colspan="2">
						<c:if test="${queryUser.role == 'STUDENT'}">学员</c:if>
						<c:if test="${queryUser.role == 'TECAHER'}">教师</c:if>
						<c:if test="${queryUser.role == 'ADMIN'}">管理员</c:if>
						<c:if test="${queryUser.role == 'SUPERADMIN'}">超级管理员</c:if>
					</td>
				</tr>
				<tr>
					<th>注册时间</th>
					<td colspan="2">${queryUser.createTime}</td>
				</tr>
				<tr>
					<th>是否封禁</th>
					<td colspan="2">
						<c:if test="${queryUser.locked == '0'}">否</c:if>
						<c:if test="${queryUser.locked == '1' }">是</c:if>
					</td>
				</tr>
			</table>
      </div>
      <div class="modal-footer">
         <button type="button" class="btn btn-info" data-dismiss="modal">&nbsp;关&nbsp;闭&nbsp;</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
	
	$(function(){
		$('#myModal').modal('show');
	});
	
</script>
