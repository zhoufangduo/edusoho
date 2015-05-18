<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<%=basePath%>/resource/myupload/myupload.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=basePath%>/resource/myupload/myupload.js"></script>
<div class="modal fade" id="myModal" role="dialog" data-backdrop="static">
	<div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	        <span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">
	        	<c:if test="${param.type == 1}">上传课时文件</c:if>
	        	<c:if test="${param.type == 2}">上传资料文件</c:if>
	        </h4>
	      </div>
	      <div class="modal-body">
	      	 <label id="tip">
	      	 	<c:if test="${param.type == 1}">请选择课时相关的文件上传到服务器</c:if>
	        	<c:if test="${param.type == 2}">请选择备用资料文件上传到服务器</c:if>
	      	 </label>
	      	 <br/>
	      	 <div id="flash" class="flash"></div>
	      	 <div class="contain" id="contain"></div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">&nbsp;关&nbsp;闭&nbsp;</button>
	      </div>
	   </div>
	</div>
</div>
<script type="text/javascript">

	$(function(){
		
		filter_type = {};
		
		if("${param.type}" == "1"){
			filter_type.label = "课时文件(*.png;*.jpg;*.gif;*.mp3;*.mp4)";
			filter_type.type = "*.png;*.jpg;*.gif;*.mp3;*.mp4";
		}
		else if("${param.type}" == "2"){
			filter_type.label = "课时备用资料文件(*.png;*.jpg;*.gif;*.mp3;*.mp4;*.doc;*.docx;*.xls;*.xlsx;*.ppt;*.pptx;*.txt;*.md;*.java)";
			filter_type.type = "*.png;*.jpg;*.gif;*.mp3;*.mp4;*.doc;*.docx;*.xls;*.xlsx;*.ppt;*.pptx;*.txt;*.md;*.java";
		}else{
			filter_type.label = "所有文件";
			filter_type.type = "*.*";
		}
		
		var setting = {
			"upload_url": "<%=basePath%>/course/fileMrg/upload",
			"index": -1,
			"ico_path":"<%=basePath%>/resource/myupload/ico/",
			"post_param":"courseId=${param.courseId}&type=${param.type}",
			"height": 50,
			"width": '100%',
			"swf_url":"<%=basePath%>/resource/myupload/myupload.swf",
			"upload_fileName":"file",
			"upload_fileSize" :1,//MB
			"upload_limit":8,
			"filter_type":filter_type,
			"upload_button":{"label":"上传文件",height:35,width:150},
			"browse_button":{"label":"选择文件",height:35,width:150},
			"succes":function(){
				$("#tip").html("<span style='color:#339900'>已上传所有的文件</span>");
			}
		};
		
		$("#flash").myupload(setting);
		
		$('#myModal').modal('show').bind("hide.bs.modal",function(){
			window.location = "<%=basePath%>/course/fileMrg/toList?active=file&id=${param.courseId}";
		});
	});
</script>