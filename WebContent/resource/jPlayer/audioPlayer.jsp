<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String basePath = request.getContextPath(); %>
<link 	href="<%=basePath%>/resource/jPlayer/skin/blue.monday/css/jplayer.blue.monday.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/resource/jPlayer/jplayer/jquery.jplayer.min.js"></script>
<script type="text/javascript">
	 var jplayer;
	 $(function(){
	 	jplayer = $("#jquery_jplayer_1").jPlayer({
	  		ready: function () {
	  			$(this).jPlayer("setMedia", {
	  				title: "Bubble"
	  			});
	  		},
	  		swfPath: "jplayer",
	  		supplied: "mp3",
	  		wmode: "window",
	  		useStateClassSkin: true,
	  		autoBlur: true,
	  		smoothPlayBar: true,
	  		keyEnabled: true,
	  		remainingDuration: true,
	  		toggleDuration: true
	  	}); 
	 });
</script>
<div id="jquery_jplayer_1" class="jp-jplayer"></div>
<div id="jp_container_1" class="jp-audio" role="application" aria-label="media player" style="display: none;">
	<div class="jp-type-single">
		<div class="jp-gui jp-interface">
			<div class="jp-controls">
				<button class="jp-play" role="button" tabindex="0">play</button>
				<button class="jp-stop" role="button" tabindex="0">stop</button>
			</div>
			<div class="jp-progress">
				<div class="jp-seek-bar">
					<div class="jp-play-bar"></div>
				</div>
			</div>
			<div class="jp-volume-controls">
				<button class="jp-mute" role="button" tabindex="0">mute</button>
				<button class="jp-volume-max" role="button" tabindex="0">max volume</button>
				<div class="jp-volume-bar">
					<div class="jp-volume-bar-value"></div>
				</div>
			</div>
			<div class="jp-time-holder">
				<div class="jp-current-time" role="timer" aria-label="time">&nbsp;</div>
				<div class="jp-duration" role="timer" aria-label="duration">&nbsp;</div>
				<div class="jp-toggles">
					<button class="jp-repeat" role="button" tabindex="0">repeat</button>
				</div>
			</div>
		</div>
	</div>
</div>