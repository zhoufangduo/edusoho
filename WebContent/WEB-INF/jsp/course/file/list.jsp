<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<%@taglib prefix="nav" uri="/WEB-INF/navbar.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>课程管理-易通软件教育</title>
		<link href="<%=basePath%>/admin/system/setting/download?file=${site.icoImage}" rel="shortcut icon" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
		<script src="<%=basePath%>/resource/bootstrap/js/bootstrap.js" type="text/javascript"></script>
		<script src="<%=basePath%>/resource/jquery/validate_form.js" type="text/javascript"></script>
		<link href="<%=basePath%>/resource/css/all.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>/resource/iCheck/skins/all.css" rel="stylesheet">
		<script src="<%=basePath%>/resource/iCheck/icheck.min.js"></script>
		<style type="text/css">
			.ico{
				width: 60px;
				height: 40px;
			}
		</style>
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
			    			<label class="course-title2">文件管理</label>
			    			<span style="float:right; margin-right: 5px;">
			    				<a href="javascript:showUploadModel()" class="btn btn-info" id="uploadBtn">
			    					<i class="glyphicon glyphicon-cloud-upload"></i>&nbsp;上传课时文件
			    				</a>
			    			</span>
			    		</div>
			  			<div class="panel-body">
			  				<div role="tabpanel">
							  <ul class="nav nav-tabs" role="tablist" id="tab">
							    <li role="presentation"  value="1" class="active">
							    	<a href="#file1"  aria-controls="file1" role="tab" data-toggle="tab">课时文件</a>
							    </li>
							    <li role="presentation" value="2">
							    	<a href="#file2"  aria-controls="file2" role="tab" data-toggle="tab">备用资料文件</a>
							    </li>
							  </ul>
							  <div class="tab-content">
							    <div role="tabpanel" class="tab-pane active" id="file1">
							    	<br/>
							    	<table class="table table-hover" id="t1">
							    		<tr>
							    			<th width="6%"><input type="checkbox" name="file1_all" value=""></th>
							    			<th>文件名</th>
							    			<th width="12%">类型</th>
							    			<th width="12%">大小</th>
							    			<th width="15%">更改者</th>
							    			<th width="20%">更新时间</th>
							    		</tr>
							    		<c:forEach items="${courseFiles}" var="file">
							    			<tr>
							    				<td><input type="checkbox" value="${file.id}"></td>
							    				<td>${file.name}</td>
							    				<td>
							    					<img class="ico" src="<%=basePath%>/resource/myupload/ico/${file.fileType}.png" />
							    				</td>
							    				<td>${file.fileSize}</td>
							    				<td>${file.createder}</td>
							    				<td>${file.createdTime}</td>
							    			</tr>
							    		</c:forEach>
									</table>
									<br/>
									<div class="controls controls-row">
										<label class="checkbox-inline" style="padding-left:10px;">
											<input type="checkbox" data-role="batch-select" name="file1_all" value=""> 全选
										</label>
										&nbsp;&nbsp;&nbsp;&nbsp;
										<a class="btn btn-danger btn-sm" href="javascript:deleteFile('#t1')">
											<i class="glyphicon glyphicon-trash"></i>&nbsp;删&nbsp;除
										</a>
									</div>
							    </div>
							    <div role="tabpanel" class="tab-pane" id="file2">
							    	<div role="tabpanel" class="tab-pane active">
								    	<br/>
								    	<table class="table table-hover" id="t2">
								    		<tr>
								    			<th width="6%"><input type="checkbox" name="file2_all" value=""></th>
								    			<th>文件名</th>
								    			<th width="12%">类型</th>
								    			<th width="12%">大小</th>
								    			<th width="15%">更改者</th>
								    			<th width="20%">更新时间</th>
								    		</tr>
								    		<c:forEach items="${backupFiles}" var="file">
								    			<tr>
								    				<td><input type="checkbox" value="${file.id}"></td>
								    				<td>${file.name}</td>
								    				<td>
								    					<img class="ico" src="<%=basePath%>/resource/myupload/ico/${file.fileType}.png"/>
								    				</td>
								    				<td>${file.fileSize}</td>
								    				<td>${file.createder}</td>
								    				<td>${file.createdTime}</td>
								    			</tr>
								    		</c:forEach>
										</table>
										<br/>
										<div class="controls controls-row">
											<label class="checkbox-inline" style="padding-left:10px;">
												<input type="checkbox" data-role="batch-select" name="file2_all" value=""> 全选
											</label>
											&nbsp;&nbsp;&nbsp;&nbsp;
											<a class="btn btn-danger btn-sm" href="javascript:deleteFile('#t2')">
												<i class="glyphicon glyphicon-trash"></i>&nbsp;删&nbsp;除
											</a>
										</div>
								    </div>
							    </div>
							  </div>
						   </div> 
			  			</div>
			  		</div>
				 </div>
			</div>
		</div>
		<div id="model"></div>
		<script type="text/javascript">
			
			var type = 1;
		
			$(function(){
				
				$('input[name!=all]').on('ifChecked', function(event){
					$(this).attr("checked",true);
				});
				
				$('input[name!=all]').on('ifUnchecked', function(event){
					$(this).attr("checked",false);
				});
				
				$("input[name=file1_all]").on('ifChecked',function(event){
					$("#file1 input").iCheck("check");
				});
				
				$('input[name=file1_all]').on('ifUnchecked', function(event){
					$("#file1 input").iCheck("uncheck");
				});
				
				$("input[name=file2_all]").on('ifChecked',function(event){
					$("#file2 input").iCheck("check");
				});
				
				$('input[name=file2_all]').on('ifUnchecked', function(event){
					$("#file2 input").iCheck("uncheck");
				});
				
				$('li[role="presentation"]').click(function(){
					type = $(this).val();
					if(type == 1){
						$('#uploadBtn').html('<i class="glyphicon glyphicon-cloud-upload"></i>&nbsp;上传课时文件');
					}else if(type == 2){
						$('#uploadBtn').html('<i class="glyphicon glyphicon-cloud-upload"></i>&nbsp;上传备用资料文件');
					}
				});
				
				$('input').iCheck({
				    checkboxClass: 'icheckbox_flat-blue',
				    radioClass: 'iradio_flat'
				});
			});
			
			function showUploadModel(){
				showModel('#model','<%=basePath%>/course/fileMrg/toUpload?courseId=${param.id}&type=' + type);
			}
			
			function deleteFile(t){
				var ids = "";
				var checkboxs = $(t + " input[type=checkbox]");
				for(var i = 0;i < checkboxs.length; i ++){
					var id = checkboxs[i].value;
					if(id != undefined && id != ""){
						ids = ids +  id + "," ;
					}
				}
				
				window.location = "<%=basePath%>/course/fileMrg/deleteById?courseId=${param.id}&ids=" + ids;
			}
		
		</script>
	</body>
</html>