<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>站点设置-易通软件教育后台管理</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
	<script src="<%=basePath%>/resource/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<link href="<%=basePath%>/resource/css/all.css" rel="stylesheet" type="text/css">
	<script src="<%=basePath%>/resource/jquery/jquery.form.js"  type="text/javascript"></script>
</head>
<body>
	<jsp:include page="../../navigation.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<jsp:include page="../menu.jsp"></jsp:include>
			</div>
			<div class="col-md-10">
				<div class="panel panel-default">
				  <div class="panel-body">
					  	<div>
							<ol class="breadcrumb">
							  <li><a href="#">系统</a></li>
							  <li class="active">站点设置</li>
							</ol>
						</div>
						<form action="<%=basePath%>/admin/system/setting/save?active=site" 
							class="form-horizontal" id="addForm" method="post">
							<div class="form-group">
							    <label for="title" class="col-sm-2 control-label">站点名称</label>
							    <div class="col-sm-9">
							      <input type="text" class="form-control" id="title" 
							      name="title" placeholder="站点名称" value="${site.title}">
							    </div>
						    </div>
						    <div class="form-group">
							    <label for="subtitle" class="col-sm-2 control-label">网站副标题</label>
							    <div class="col-sm-9">
							      <input type="text" class="form-control" id="subtitle" 
							      name="subtitle" placeholder="网站副标题" value="${site.subtitle}">
							    </div>
						    </div>
						    <div class="form-group">
							    <label for="name" class="col-sm-2 control-label">网站Logo</label>
							    <div class="col-sm-9">
							      <span>
							      	 <img id="logoImage" src="<%=basePath%>/admin/system/setting/download?file=${site.logoImage}">
							      	 <input type="hidden" name="logoImage">
							      	 <br/>&nbsp;<br/>
							      </span>
							      <span>
							      	<input type="button" class="btn btn-default" onclick="openLogoFile()" value="选择">
							      	&nbsp;
							      	<input type="button" class="btn btn-default"  value="删除">
							      	<br/>
							      	请上传png, gif, jpg格式的图片文件。LOGO图片建议不要超过50*250
							      </span>
							    </div>
						    </div>
						    <div class="form-group">
							    <label for="name" class="col-sm-2 control-label">浏览器图标</label>
							    <div class="col-sm-9">
							      <span>
							      	 <img id="icoImage" src="<%=basePath%>/admin/system/setting/download?file=${site.icoImage}">
							      	 <input type="hidden" name="icoImage">
							      	 <br/>&nbsp;<br/>
							      </span>
							      <span>
							      	<input type="button" class="btn btn-default" onclick="openIcoFile()" value="选择">
							      	&nbsp;
							      	<input type="button" class="btn btn-default"  value="删除">
							      	<br/>
							      	请上传ico格式的图标文件
							      </span>
							    </div>
						    </div>
						    <div class="form-group">
							    <label for="adminEmail" class="col-sm-2 control-label">管理员的邮箱地址</label>
							    <div class="col-sm-9">
							      <input type="text" class="form-control" id="adminEmail" 
							      name="adminEmail" placeholder="管理员的邮箱地址" value="${site.adminEmail}">
							    </div>
						    </div>
						    <div class="form-group">
							    <label for="copyright" class="col-sm-2 control-label">课程内容版权方</label>
							    <div class="col-sm-9">
							      <input type="text" class="form-control" id="copyright"
							       name="copyright" placeholder="课程内容版权方" value="${site.copyright}">
							    </div>
						    </div>
						    <div class="form-group">
							    <label for="icpNo" class="col-sm-2 control-label">ICP备案号</label>
							    <div class="col-sm-9">
							      <input type="text" class="form-control" id="icpNo" 
							      name="icpNo" placeholder="ICP备案号" value="${site.icpNo}">
							    </div>
						    </div>
						    <br/>
						    <div class="form-group">
							    <div class="col-sm-9" style="text-align: center;">
							      <input type="button" class="btn btn-primary btn-lg" value="&nbsp;提&nbsp;交&nbsp;">
							    </div>
						    </div>
						</form>
				  </div>
			   </div>
			</div>
		</div>
	</div>
	
	<form id="logoForm" action="<%=basePath%>/admin/system/setting/upload?active=site&fileName=logoFile" 
  	 	enctype="multipart/form-data" method="post">
  	 	<input type="file" name="file" id="logoFile" style="display:none;">	
  	</form>
  	
  	<form id="icoForm" action="<%=basePath%>/admin/system/setting/upload?active=site&fileName=icoFile" 
  	 	enctype="multipart/form-data" method="post">
  	 	<input type="file" name="file" id="icoFile" style="display:none;">	
  	</form>
	<script type="text/javascript">
		function openLogoFile(){
			$("#logoFile").click();
		}
		
		function openIcoFile(){
			$("#icoFile").click();
		}
		
		$(function(){
			$("#logoFile").change(function(){
				$("#logoForm").ajaxSubmit({
					dataType	: "text",
					type        : "POST",
					cache       : false,
					success		: function(data){	
						var url = "<%=basePath%>/admin/system/setting/download?file=" + data;
						alert(url);
						$("#logoImage").attr("src",url);
						$("input[name=logoImage]").val(data);
					}
				});
			});
			
			$("#icoFile").change(function(){
				$("#icoForm").ajaxSubmit({
					dataType	: "text",
					type        : "POST",
					cache       : false,
					success		: function(data){	
						var url = "<%=basePath%>/admin/system/setting/download?file=" + data;
						$("#icoImage").attr("src",url);
						$("input[name=icoImage]").val(data);
					}
				});
			 });
		});
	</script>
</body>
</html>