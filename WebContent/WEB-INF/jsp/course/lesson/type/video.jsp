<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<form action="<%=basePath%>/admin/course/lesson/add" class="form-horizontal" id="videoForm" method="post">
	<div class="form-group">
		<label for="title" class="col-sm-2 control-label">标题</label>
		<div class="col-sm-9">
			<input type="text" class="form-control" id="title" name="title"
				placeholder="标题" />
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
				<li role="presentation" class="active"><a href="#">上传视频</a></li>
				<li role="presentation"><a href="#">从课程文件中选择</a></li>
				<li role="presentation"><a href="#">导入网络视频</a></li>
			</ul>
			<div class="panel panel-default">
				<div class="panel-body">
					<br /> 选择你要上传的视频文件：
					<p />
					<button type="button" class="btn btn-primary">上传文件</button>
					<br />&nbsp;
					<p />
					<div class="alert alert-info" role="alert">
						<ul>
							<li>支持<strong>mp4</strong>格式的视频文件上传，文件大小不能超过<strong>2.0MB
							</strong>。MP4文件的视频编码格式，请使用AVC(H264)编码，否则浏览器无法播放。
							</li>
							<li>视频将上传到<strong>网站服务器</strong>，如需使用云视频，请联系EduSoho官方购买。使用云视频，将获得更好的播放体验。
							</li>
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
				<input type="text" class="form-control" style="width: 120px;"
					placeholder="分" />&nbsp;分&nbsp; &nbsp; <input type="text"
					class="form-control" style="width: 120px;" placeholder="秒" />&nbsp;秒&nbsp;
			</div>
			时长必须为整数。
		</div>
	</div>
</form>