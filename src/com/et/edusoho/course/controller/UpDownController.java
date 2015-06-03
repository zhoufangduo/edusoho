package com.et.edusoho.course.controller;


import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.et.edusoho.course.service.CourseService;
import com.et.edusoho.course.service.MarkdownService;
import com.et.edusoho.support.constroller.BaseController;
import com.et.edusoho.tools.CONSTANTCONTEXT;
import com.et.edusoho.tools.DateUtil;
import com.et.edusoho.tools.FileUtil;
import com.et.edusoho.tools.PathUtil;

@Controller
@RequestMapping("/course/lesson/*")
public class UpDownController extends BaseController{
	
	private static Logger logger = Logger.getLogger(UpDownController.class);
	
	@Autowired
	private MarkdownService mkdnService;
	
	@Autowired
	private CourseService courseService;
	
	public UpDownController(){
		super("course/lesson/type/",CONSTANTCONTEXT.LESSON_FILE_DIR);
	}
	
	@RequestMapping("toAddMarkdown")
	public String toMarkdown(){
		return getContext("markdown");
	}
	
	@RequestMapping("uploadMD")
	public void uploadFile(@RequestParam("file") Object uploadFile,
			HttpServletRequest request, HttpServletResponse response){
		
		try {
			
			setWebContext(request, response);
			
			if (uploadFile instanceof MultipartFile) {
				MultipartFile file = (MultipartFile) uploadFile;
				
				String code = new String(file.getBytes(),"UTF-8");
				write(getEncoding(code));
			}
			
		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}
	}
	
	@RequestMapping("uploadFile")
	public void uploadFile(@RequestParam("upload") Object uploadFile,
			@RequestParam Map<String, String> params,
			HttpServletRequest request, HttpServletResponse response){
		try {
			
			String fileName = DateUtil.getFileNameTime();
			this.setWebContext(request, response);
			String newFileName = super.upload(uploadFile, fileName);
			
			String callback = params.get("CKEditorFuncNum");  
			if(StringUtils.isNotEmpty(callback)){
				String path = PathUtil.getHttpPath(request) + "/course/lesson/downloadFile?file=" + newFileName ;
				write("<script type=\'text/javascript\'>window.parent.CKEDITOR.tools.callFunction(" 
						+ callback + ",'"+path+ "','')</script>");
			}else{
				write(newFileName);
			}

		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
			write("");
		}
	}
	
	@RequestMapping("downloadFile")
	public synchronized void  downloadFile(@RequestParam Map<String, String> params,
			HttpServletRequest request, HttpServletResponse response){
		try {
			this.setWebContext(request, response);

			download(params);

		} catch (Exception e) {
			//logger.warn(e.getMessage(), e);
		}
	}
	
	@RequestMapping("toURLDownload")
	public void toURLDownload(@RequestParam Map<String, String> params,
			HttpServletRequest request, HttpServletResponse response){
		
		this.setWebContext(request, response);
		
		String destURL = params.get("url");
		
		byte[]bytes;
		
		if (StringUtils.isNotEmpty(destURL)) {
			try {
				
				String fileName = DateUtil.getFileNameTime() + "." +
						FileUtil.getFileExtension(destURL);
				
				logger.info(fileName);
				
				URL url = new URL(destURL);
				
				logger.info("正在从网络中下载文件");
				
				 HttpURLConnection connection = (HttpURLConnection)url.openConnection();
				bytes = readInputStream(connection.getInputStream());
				
				String newFileName = FileUtil.save(bytes, UPLOAD_FILE_DIR, fileName);
				
				logger.info("生成的文件:" + UPLOAD_FILE_DIR + newFileName);
				
				write(newFileName);
				
			} catch (MalformedURLException e) {
				logger.warn(e.getMessage(), e);
				write("0");
			} catch (IOException e) {
				logger.warn(e.getMessage(), e);
				write("0");
			}
		}else {
			write("-1");
		}
	}
	
	 private byte[] readInputStream(InputStream inputStream) throws IOException {    
	        byte[] buffer = new byte[1024];    
	        int len = 0;    
	        
	        ByteArrayOutputStream bos = new ByteArrayOutputStream();    
	        while((len = inputStream.read(buffer)) != -1) {    
	            bos.write(buffer, 0, len);    
	        }    
	        
	        bos.close();    
	        
	        return bos.toByteArray();    
	 }    
}
