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
</style>
<div class="modal fade" id="myModal" role="dialog" aria-hidden="true" data-backdrop="static" aria-labelledby="exampleModalLabel">
	<div class="modal-dialog  modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	        <span aria-hidden="true">&times;</span></button>
	        
	        <h4 class="modal-title" id="myModalLabel">添加课时</h4>
	      </div>
	      <div class="modal-body">
	     	 <div role="tabpanel">
				  <ul class="nav nav-tabs" role="tablist" id="tab">
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
				    	<a href="#code" aria-controls="code" role="tab" data-toggle="tab">代码</a>
				    </li>
				     <li role="presentation">
				    	<a href="#markdown" aria-controls="markdown" role="tab" data-toggle="tab">Markdown</a>
				    </li>
				  </ul>
				  <div class="tab-content">
				    <div role="tabpanel" class="tab-pane active" id="video"></div>
				    <div role="tabpanel" class="tab-pane" id="audio"></div>
				    <div role="tabpanel" class="tab-pane" id="text"></div>
				    <div role="tabpanel" class="tab-pane" id="code"></div>
				    <div role="tabpanel" class="tab-pane" id="markdown"></div>
				  </div>
			  </div> 
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">&nbsp;取&nbsp;消&nbsp;</button>
		        <button type="button" class="btn btn-primary" id="submit">&nbsp;保&nbsp;存&nbsp;</button>
		      </div>
	    </div>
	  </div>
	</div>
</div>
<script type="text/javascript">

	var formName = "#videoForm";
	
	$(function(){
		
		$("#video").load("<%=basePath%>/course/lesson/toAddVideo?pId=${param.pId}&courseId=${param.courseId}");
		$("#audio").load("<%=basePath%>/course/lesson/toAddAudio?pId=${param.pId}&courseId=${param.courseId}");
		$("#text").load("<%=basePath%>/course/lesson/toAddText?pId=${param.pId}&courseId=${param.courseId}");
		$("#code").load("<%=basePath%>/course/lesson/toAddCode?pId=${param.pId}&courseId=${param.courseId}");
		$("#markdown").load("<%=basePath%>/course/lesson/toAddMarkdown?pId=${param.pId}&courseId=${param.courseId}");
		
		var config = {
			'#video'	:	'#videoForm',
			'#audio'	:	'#audioForm',
			'#text'		:	'#textForm',
			'#code'		:	'#codeForm',
			'#markdown' : 	'#markdownForm'
		};
		
		$('#tab a').click(function (e) {
			formName = config[$(this).attr("href")];
		  	$(this).tab('show');
		});
		
		$("#submit").click(function(){
			 $(formName).submit();
		});
		
		$('#myModal').modal('show');
	});
	
</script>