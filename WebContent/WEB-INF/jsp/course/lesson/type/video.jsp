<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<form action="<%=basePath%>/course/lesson/add" class="form-horizontal" id="videoForm" method="post">
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
				<li role="presentation" class="active"><a href="javascript:toShow('#pill1')">上传视频</a></li>
				<li role="presentation"><a href="javascript:toShow('#pill2')">从课程文件中选择</a></li>
				<li role="presentation"><a href="javascript:toShow('#pill3')">导入网络视频</a></li>
			</ul>
			<div class="panel panel-default">
				<div class="panel-body">
					<div id="pill1">
						<br /> 选择你要上传的视频文件：
						<p />
						<button type="button" class="btn btn-primary">上传文件</button>
						<br />&nbsp;
						<p />
						<div class="alert alert-info" role="alert">
							<ul>
								<li>支持<strong>mp4</strong>格式的视频文件上传，文件大小不能超过<strong>2.0MB
								</strong>。视频将上传到<strong>网站服务器</strong>
								</li>
							</ul>
						</div>
					</div>
					<div id="pill2" style="height: 150px;display: none;overflow:auto;">
					</div>
					<div id="pill3" style="display: none;">
						输入下载的音频文件的网络的地址，点击导入即可:<p/>
						<div class="input-group">
					      <input type="text" class="form-control" placeholder="输入导入音频文件的地址" id="url">
					      <span class="input-group-btn">
					        <button class="btn btn-default" type="button" id="importBtn">导入</button>
					      </span>
					    </div>
					     <br/>
				        <span id="importTip">
				        </span>
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
	<script type="text/javascript">
		function toShow(panel){
			$(panel).show();
			$("#vli1").removeAttr("class");
			$('#vli2').removeAttr("class");
			$('#vli3').removeAttr("class");
			if(panel == '#pill1'){
				$('#vli1').attr("class","active");
				$("#pill2").hide();
				$("#pill3").hide();
			}else if(panel == '#pill2'){
				$('#vli2').attr("class","active");
				toFrom();
				$("#pill1").hide();
				$("#pill3").hide();
			}else{
				$('#vli3').attr("class","active");
				$("#pill1").hide();
				$("#pill2").hide();
			} 
		}
	</script>
</form>