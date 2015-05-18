
var myupload ;

(function($) {
	$.extend($.fn,{
		myupload: function(settings){
			try {
    			this.settings = settings;
    			this.movieName = "myupload";
    			myupload = this;
    			
    			this.initSettings();
    			this.loadFlash();
    		} catch (ex) {
    			throw ex;
    		}
		},
		
		completeURL: function(url) {
    		if (typeof(url) !== "string" || url.match(/^https?:\/\//i) || url.match(/^\//)) {
    			return url;
    		}
    		
    		var indexSlash = window.location.pathname.lastIndexOf("/");
    		if (indexSlash <= 0) {
    			path = "/";
    		} else {
    			path = window.location.pathname.substr(0, indexSlash) + "/";
    		}
    		
    		return  path + url;
    	},
    	
    	initSettings: function(){
    		
    		this.ensureDefault = function(obj, settingName, defaultValue){
    			obj[settingName]= (obj[settingName] == undefined) ? defaultValue : obj[settingName];
    		};
    		
    		this.ensureDefault(this.settings,"upload_url", "");
    		this.ensureDefault(this.settings,"index", -1);
    		this.ensureDefault(this.settings,"post_param", "");
    		this.ensureDefault(this.settings,"swf_url", "myupload.swf");
    		this.ensureDefault(this.settings,"bgcolor", "#FFFFFF");
    		this.ensureDefault(this.settings,"height", 30);
    		this.ensureDefault(this.settings,"width", 20);
    		this.ensureDefault(this.settings,"upload_fileName", "file");
    		this.ensureDefault(this.settings,"upload_fileSize", 100);
    		this.ensureDefault(this.settings,"upload_limit", 10);
    		this.ensureDefault(this.settings,"filter_type", {"label": "All File(*.*)","type": "*.*"});
    		this.ensureDefault(this.settings,"upload_button", {"label":"Upload"});
    		this.ensureDefault(this.settings,"browse_button", {"label":"Browse"});
    		this.ensureDefault(this.settings.filter_type,"label","All File(*.*)");
    		this.ensureDefault(this.settings.filter_type,"type","*.*");
    		this.ensureDefault(this.settings.upload_button,"label","Upload");
    		this.ensureDefault(this.settings.upload_button,"width",null);
    		this.ensureDefault(this.settings.upload_button,"height",null);
    		this.ensureDefault(this.settings.upload_button,"x",null);
    		this.ensureDefault(this.settings.upload_button,"y",null);
    		this.ensureDefault(this.settings.browse_button,"label","Upload");
    		this.ensureDefault(this.settings.browse_button,"width",null);
    		this.ensureDefault(this.settings.browse_button,"height",null);
    		this.ensureDefault(this.settings.browse_button,"x",null);
    		this.ensureDefault(this.settings.browse_button,"y",null);
    		
    		if (!!this.settings.prevent_swf_caching) {
    			this.settings.flash_url = this.settings.flash_url + (this.settings.flash_url.indexOf("?") < 0 ? "?" : "&") + "preventswfcaching=" + new Date().getTime();
    		}
    		
    		if (!this.settings.preserve_relative_urls) {
    			this.settings.upload_url = this.completeURL(this.settings.upload_url);
    		}
    		
    		delete this.ensureDefault;
    		
    	},
    	
    	loadFlash: function () {
    		var targetElement;

    		if (document.getElementById(this.movieName) !== null) {
    			return ;
    		}
    		
    		targetElement = $(this.getFlashHTML());
    		this.append(targetElement);
    	},
    	
    	getFlashHTML: function () {
    		return '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"'+
    					'id="myupload" width="'+this.settings["width"]+'" height="'+this.settings["height"]+'"'+
    					'codebase="http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab">'+
    					'<param name="movie" value="'+this.settings["swf_url"]+'" />'+
    					'<param name="quality" value="high" />'+
    					'<param name="bgcolor" value="'+this.settings["bgcolor"]+'" />'+
    					'<param name="wmode" value="transparent">'+
    					'<param name="allowScriptAccess" value="sameDomain" />'+
    					'<embed src="'+this.settings["swf_url"]+'" wmode="transparent" quality="high" bgcolor='+this.settings["bgcolor"]+'" '+
    						'width="'+this.settings["width"]+'" height="'+this.settings["height"]+' " name="myupload" id="myupload" align="middle"'+
    						'play="true" loop="false" quality="high"'+
    						'allowScriptAccess="sameDomain"'+
    						'type="application/x-shockwave-flash"'+
    						'pluginspage="http://www.adobe.com/go/getflashplayer">'+
    					'</embed>'+
    			 '</object>';
    	},
    	
    	addUpload: function(file){
    		var type = file.type.toLowerCase();
    		var targetElement = this.getUploadHtml(file.name,this.getTypeIco(type),file.index);
    		$(".contain").append(targetElement);
    	},
    	
    	getTypeIco: function(type){
    		var types = {'.ac3':'AC3.png','.ace':'ACE.png','.ade':'ADE.png','.adp':'ADP.png','.ai':'AI.png','.aiff':'AIFF.png','.au':'AU.png','.avi':'AVI.png','.bat':'BAT.png','.bin':'BIN.png','.bmp':'BMP.png','.bup':'BUP.png','.cab':'CAB.png','.cat':'CAT.png','.chm':'CHM.png','.css':'CSS.png','.cue':'CUE.png','.dat':'DAT.png','.dcr':'DCR.png','.default':'Default.png','.der':'DER.png','.dic':'DIC.png','.divx':'DIVX.png','.diz':'DIZ.png','.dll':'DLL.png','.doc':'DOC.png','.docx':'DOCX.png','.dos':'DOS.png','.dvd':'DVD.png','.dwg':'DWG.png','.dwt':'DWT.png','.emf':'EMF.png','.exc':'EXC.png','.fon':'FON.png','.gif':'GIF.png','.hlp':'HLP.png','.html':'HTML.png','.ifo':'IFO.png','.inf':'INF.png','.ini':'INI.png','.ins':'INS.png','.ip':'IP.png','.iso':'ISO.png','.isp':'ISP.png','.java':'JAVA.png','.jfif':'JFIF.png','.jpeg':'JPEG.png','.jpg':'JPG.png','.log':'LOG.png','.m4a':'M4A.png','.mid':'MID.png','.mmf':'MMF.png','.mmm':'MMM.png','.mov':'MOV.png','.movie':'MOVIE.png','.mp2':'MP2.png','.mp2v':'MP2V.png','.mp3':'MP3.png','.mp4':'MP4.png','.mpe':'MPE.png','.mpeg':'MPEG.png','.mpg':'MPG.png','.mpv2':'MPV2.png','.nfo':'NFO.png','.pdd':'PDD.png','.pdf':'PDF.png','.php':'PHP.png','.png':'PNG.png','.ppt':'PPT.png','.pptx':'PPTX.png','.psd':'PSD.png','.rar':'RAR.png','.reg':'REG.png','.rtf':'RTF.png','.scp':'SCP.png','.theme':'THEME.png','.tif':'TIF.png','.tiff':'TIFF.png','.tlb':'TLB.png','.ttf':'TTF.png','.txt':'TXT.png','.uis':'UIS.png','.url':'URL.png','.vbs':'VBS.png','.vcr':'VCR.png','.vob':'VOB.png','.wav':'WAV.png','.wba':'WBA.png','.wma':'WMA.png','.wmv':'WMV.png','.wpl':'WPL.png','.wri':'WRI.png','.wtx':'WTX.png','.xls':'xls.png','.xlsx':'XLSX.png','.xml':'XML.png','.xsl':'XSL.png','.zap':'ZAP.png','.zip':'ZIP.png'};
    		if(type != "" && type != null && type != undefined){
    			return this.settings.ico_path+types[type];
    		}
    	},
    	
    	getUploadHtml: function(name,type,index){
    		return '<div class="uploading" id="'+index+'">'+
						'<img src="'+type+'" class="typeIco">'+
						'<div class="uploadInfo">'+
							'<div class="file">'+name+'</div>'+
							'<div class="progress"><div class="bar" style="width:0%;"></div></div>'+
						'</div>'+
						'<div class="option">'+
							'<a href="javascript:cacelUpload(\''+index+'\')">取 消</a>&nbsp;&nbsp; <a href="javascript:deleteUpload(\''+index+'\')">删 除</a>'+
						'</div>'+
					'</div>';
    	}
	});
	
})(jQuery);

/**
 * flush 获取配置信息
 * @returns
 */
function getUploadCfg(){
	return myupload.settings;
}

/**返回选择的文件
 * 
 * @param Object files
 */
function selectHandler(file){
	myupload.addUpload(file);
}

/**取消正在上传的文件句柄
 * 
 * @param String fileName
 */
function cacelHandler(file){
	var bar = $("#"+file.index).find(".bar").toggleClass("bar-warning");
	$("#"+file.index).css({color:" #fbb450"});
	$("#"+file.index).find("a").css({color:" #fbb450"});
	bar.html("canceled file: "+file.name);
}

/**
 * 返回正在上传的文件进度句柄
 * @param Object fileInfo
 */
function progressHandler(file){
	var bar = $("#"+file.index).find(".bar");
	var length = ((file.loaded / file.total) * 100);
	bar.width(length+"%");
	bar.html(length+"%");
}

/**
 * 上传成功的文件句柄
 * @param Object fileInfo
 */
function uploadedHandler(file){
	$("#"+file.index).remove();
}

/**
 * 删除上传的文件
 * @param name
 */
function deleteUpload(name){
	$("#"+name).remove();
	document.getElementById("myupload").deleteByIndex(name);
}

/**
 * 取消正在上传的文件
 * @param index
 */
function cacelUpload(index){
	document.getElementById("myupload").cacel(index);
}

/**
 * 上传文件Http错误响应的句柄
 * @param file
 */
function httpStatusHandler(file){
	var status = file.status;
	if(status !== 200){
		var bar = $("#"+file.index).find(".bar").toggleClass("bar-danger");
		$("#"+file.index).css({color:"red"});
		$("#"+file.index).find("a").css({color:"red"});
		bar.html("http response error: "+status);
	}
}

function uploadErrorHander(){
	alert("Upload Error!");
}

function uploadBeforHandler(){
	var childrens = $(".contain").children();
	for(var i=0; i < childrens.length; i ++){
		var child = childrens[i];
		var atags = $(child).find("a");
		$(atags[1]).remove();
	}
}

function clean(){
	if(myupload.settings.succes != undefined){
		myupload.settings.succes();
	}
	$(".uploading").remove();
}