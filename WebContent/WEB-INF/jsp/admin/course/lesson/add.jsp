<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<style>
		.tab-content{
			margin-top: 35px;
		}
		.nav-pills>li>a{
			padding: 3px 10px;
		}
		.edui-default .edui-colorpicker-nocolor{
				padding :0px 5px;
		} 
		.modal{
			z-index: 10;
		}
	</style>
	<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">添加课时</h4>
	      </div>
	      <div class="modal-body">
	     	 <div role="tabpanel">
				  <ul class="nav nav-tabs" role="tablist">
				    <li role="presentation" class="active">
				    	<a href="#video" aria-controls="video" role="tab" data-toggle="tab">视频</a>
				    </li>
				    <li role="presentation">
				    	<a href="#audio" aria-controls="audio" role="tab" data-toggle="tab">音频</a>
				    </li>
				    <li role="presentation">
				    	<a href="#text" aria-controls="text" role="tab" data-toggle="tab">图文</a>
				    </li>
				    <li role="presentation">
				    	<a href="#office" aria-controls="office" role="tab" data-toggle="tab">Office的文档</a>
				    </li>
				     <li role="presentation">
				    	<a href="#markdown" aria-controls="markdown" role="tab" data-toggle="tab">Markdown文件</a>
				    </li>
				  </ul>
				  <div class="tab-content">
				    <div role="tabpanel" class="tab-pane active" id="video">
				    	<form action="<%=basePath%>/admin/course/chapter/add" class="form-horizontal" id="addForm" method="post">
					    	<div class="form-group">
					    		<label for="title" class="col-sm-2 control-label">标题</label>
					    		<div class="col-sm-9">
					    			<input type="text" class="form-control" id="title" name="title" placeholder="标题" />
					    		</div>
					    	</div>
					    	<div class="form-group">
					    		<label for="title" class="col-sm-2 control-label">摘要</label>
					    		<div class="col-sm-9">
					    			<textarea rows="3" cols="" class="form-control"></textarea>
					    		</div>
					    	</div>
					    	<div class="form-group">
					    		<label for="title" class="col-sm-2 control-label">视频</label>
					    		<div class="col-sm-9">
					    			<ul class="nav nav-pills" style="margin-bottom: 5px;">
									  <li role="presentation" class="active" >
									  	<a href="#">上传视频</a>
									  </li>
									  <li role="presentation" >
									  	<a href="#">从课程文件中选择</a>
									  </li>
									  <li role="presentation" >
									  	<a href="#">导入网络视频</a>
									  </li>
									</ul>
									<div class="panel panel-default">
										<div class="panel-body">
									    	<br/>
											选择你要上传的视频文件：
											<p/>
											<button type="button" class="btn btn-primary">上传文件</button>
											<br/>&nbsp;<p/>
											<div class="alert alert-info" role="alert">
												<ul>
	                                  				<li>支持<strong>mp4</strong>格式的视频文件上传，文件大小不能超过<strong>2.0MB </strong>。MP4文件的视频编码格式，请使用AVC(H264)编码，否则浏览器无法播放。</li>
	                  								<li>视频将上传到<strong>网站服务器</strong>，如需使用云视频，请联系EduSoho官方购买。使用云视频，将获得更好的播放体验。</li>
                              					</ul>
											</div>
									    </div>
									</div>
					    		</div>
					    	</div>
					    	<div class="form-group">
					    		<label for="title" class="col-sm-2 control-label">视频时长</label>
					    		<div class="col-sm-9">
					    			<div class="form-inline">
							    		<input type="text" class="form-control" style="width: 120px;" placeholder="分" />&nbsp;分&nbsp;
						    			&nbsp;
							    		<input type="text" class="form-control" style="width: 120px;" placeholder="秒" />&nbsp;秒&nbsp;
					    			</div>
					    			时长必须为整数。
					    		</div>
					    	</div>
				    	</form>
				    </div>
				    <div role="tabpanel" class="tab-pane" id="audio">
				    	audio
				    </div>
				    <div role="tabpanel" class="tab-pane" id="text">
				    	<form action="<%=basePath%>/admin/course/chapter/add" class="form-horizontal" id="addForm" method="post">
					    	<div class="form-group">
					    		<label for="title" class="col-sm-2 control-label">标题</label>
					    		<div class="col-sm-9">
					    			<input type="text" class="form-control" id="title" name="title" placeholder="标题" />
					    		</div>
					    	</div>
					    	<div class="form-group">
					    		<label for="title" class="col-sm-2 control-label">摘要</label>
					    		<div class="col-sm-9">
					    			<textarea rows="3" cols="" class="form-control"></textarea>
					    		</div>
					    	</div>
					    	
					    	<div class="form-group">
					    		<label for="title" class="col-sm-2 control-label">内容</label>
					    		<div class="col-sm-9">
					    			 <textarea name="about"  style="height: 150px;" id="editor"></textarea>
					    		</div>
					    	</div>
					    </form>
				    </div>
				    <div role="tabpanel" class="tab-pane" id="office">
				    	office
				    </div>
				    <div role="tabpanel" class="tab-pane" id="markdown">
				    	markdown
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
</div>

<script type="text/javascript">
	
	$(function(){
		
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
				"title": {required: ""}
			},
			submitHandler: function(form) {
				form.submit();
			}
		});
		
		$('#myModal').modal('show');
	});
	var ue = UE.getEditor('editor',{
	    autoHeightEnabled: true,
	    autoFloatEnabled: true
	});
</script>