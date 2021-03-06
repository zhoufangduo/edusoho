<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%String basePath = request.getContextPath();%>
<%@ taglib prefix="nav" uri="/WEB-INF/navbar.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"  "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>课程管理-课程管理-${site.title}-${site.subtitle}-Power By 易通软件教育</title>
		<link href="<%=basePath%>/admin/system/setting/download?file=${site.icoImage}" rel="shortcut icon" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="<%=basePath%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<script src="<%=basePath%>/resource/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
		<script src="<%=basePath%>/resource/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
		<link href="<%=basePath%>/resource/css/all.css" rel="stylesheet" type="text/css">
		<script src="<%=basePath%>/resource/ckeditor/ckeditor.js"></script>
	</head>
	<body>
		<nav:menu/>
		<div class="container">
			<jsp:include page="lesson/info.jsp"></jsp:include>	
			<div class="row">
			 	 <div class="col-md-3">
			 	 	<jsp:include page="prop_menu.jsp"></jsp:include>
				 </div>
					 	
				 <div class="col-md-9">
			    	<div class="panel panel-default">
			    		<div class="panel-heading">
			    			<label class="course-title2">详细信息</label>
			    		</div>
			  			<div class="panel-body">
			  				<div class="form-horizontal">
			  					<div class="form-group">
								    <label for="title" class="col-sm-2 control-label">课程简介</label>
								    <div class="col-sm-8">
								      <textarea name="about"  style="height: 150px;" id="editor">${course.about}</textarea>
								    </div>
							    </div>
							    <br/>
							    <div class="form-group">
								    <label for="goals" class="col-sm-2 control-label">课程目标</label>
								    <div class="col-sm-8">
								    	<ul id="goalsUl" class="list-group" style="width:100%;display: none;">
										</ul>
								        <div class="input-group" >
									      <input type="text" class="form-control" id="goals" placeholder="课程目标" >
									      <span class="input-group-btn">
			        						<button class="btn btn-default" type="type" onclick="addGoals(goals)">添加</button>
			      						  </span>
									    </div>
								    </div>
							    </div>
							    <br/>
							    <div class="form-group">
								    <label for="audiences" class="col-sm-2 control-label">适应人群</label>
								    <div class="col-sm-8">
								    	<ul id="audiencesUl" class="list-group" style="width:100%;display: none;">
										</ul>
								    	<div class="input-group">
									      	<input type="text" class="form-control" id="audiences" placeholder="适应人群" >
									      	<span class="input-group-btn">
			        							<button class="btn btn-default" type="type" onclick="addAudiences(audiences)">添加</button>
			      						  	</span>
		      						  	</div>
								    </div>
							    </div>
							    <br/>
							    
							    <div class="form-group">
								    <div class="col-sm-9" style="text-align: center;">
								      <input type="button" style="width: 100px;" class="btn btn-primary btn-lg"
								       value="保&nbsp;存" onclick="save()">
								    </div>
							    </div>
			  				</div>
			  			</div>
			  		</div>
				 </div>
			</div>
		</div>
		
		<form class="form-horizontal" id="addForm" action="<%=basePath%>/course/updateDetail" method="post">
			<input type="hidden" name="id" value="${course.id}">
			<input type="hidden" name="goals" value="">
			<input type="hidden" name="audiences" value="">
			<input type="hidden" name="about" value="">
		</form>
		
		<script type="text/javascript">
			
		CKEDITOR.replace('editor',{
        	language: 'zh-cn',
       	 	skin:'bootstrapck',
       	    filebrowserImageUploadUrl: '<%=basePath%>/course/lesson/uploadFile',
 		    filebrowserImageBrowseUrl : '<%=basePath%>/course/lesson/Images',
       	 	toolbar :[
                 ['Bold', 'Italic', 'Underline','TextColor','BGColor','-',
                  'RemoveFormat','PasteText','NumberedList', 'BulletedList', '-',
                  'Link','Unlink','Image','-','Source','Maximize','Preview'],
                  ['Styles','Format','Font','FontSize']
            ]
        });
		
		 $(function(){
			 
			$("#goals").bind("keyup",function(event){
				if(event.keyCode == 13){
					addGoals(this);
				}
			});
			
			$("#audiences").bind("keyup",function(event){
				if(event.keyCode == 13){
					addAudiences(this);
				}
			});
			
			var goals = '${course.goals}'.split(",");
			if(goals){
				$("#goalsUl").show();
				$.each(goals,function(i,val){
					if(val != ""){
						$("#goalsUl").append(getGoalsTemp(val));
					}
				});
			}
			
			var audiences = '${course.audiences}'.split(",");
			if(audiences){
				$("#audiencesUl").show();
				$.each(audiences,function(i,val){
					if(val != ""){
						$("#audiencesUl").append(getAudiencesTemp(val));
					}
				});
			}
			
		});
		 
		function getGoalsTemp(context){
			return '<a class="list-group-item"><span class="glyphicon glyphicon-flag"></span>&nbsp;'+ context+ 
			'<span class="glyphicon glyphicon-remove" style="float: right;" onclick="del(this)"></span>'+
			'<input type="hidden" name="goalsName" value="'+ context+ '"</a>';
		}
		 
		function getAudiencesTemp(context){
			return '<a class="list-group-item"><span class="glyphicon glyphicon-user"></span>&nbsp;'+ context+ 
			'<span class="glyphicon glyphicon-remove" style="float: right;" onclick="del2(this)"></span>'+
			'<input type="hidden" name="audiencesName" value="'+ context+ '"</a>';
		}
		 
		function addGoals(obj){
			
			var val = $(obj).val();
			if(val != ""){
				$("#goalsUl").show();
				$("#goalsUl").append(getGoalsTemp(val));
			}
			
			$(obj).val("");
		}
		
		function addAudiences(obj){
			var val = $(obj).val();
			if(val != ""){
				$("#audiencesUl").show();
				$("#audiencesUl").append(getAudiencesTemp(val));
			}
			
			$(obj).val("");
		}
		 
		function del(obj){
			
			var parent = $($(obj).parent());
			parent.remove();
			
			var list_group = $("#goalsUl").children();
			if(list_group.length == 0){
				$("#goalsUl").hide();
			}
		}
		
		function del2(obj){
			
			var parent = $($(obj).parent());
			parent.remove();
			
			var list_group = $("#audiencesUl").children();
			if(list_group.length == 0){
				$("#audiencesUl").hide();
			}
		}
		
		function save(){
			var goalsVal = "" ;
			var goals = $("input[name=goalsName]");
			for(var i = 0; i < goals.length; i ++){
				goalsVal += $(goals[i]).val() + ",";
			}
			$("input[name=goals]").val(goalsVal);
			
			var audiencesVal = "" ;
			var audiences = $("input[name=audiencesName]");
			for(var i = 0; i < audiences.length; i ++){
				audiencesVal += $(audiences[i]).val() + ",";
			}
			
			$("input[name=audiences]").val(audiencesVal);
			
			var data = CKEDITOR.instances.editor.getData();
			
			$("input[name=about]").val(data);
			
			$("#addForm").submit();
		}
		
	</script>
	</body>
</html>