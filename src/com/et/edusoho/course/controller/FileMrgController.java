package com.et.edusoho.course.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.et.edusoho.course.bean.Course;
import com.et.edusoho.course.bean.CourseFile;
import com.et.edusoho.course.service.CourseService;
import com.et.edusoho.course.service.FileMrgService;
import com.et.edusoho.support.constroller.BaseController;
import com.et.edusoho.tools.CONSTANTCONTEXT;
import com.et.edusoho.tools.FileUtil;

@Controller
@RequestMapping("/course/fileMrg/*")
public class FileMrgController extends BaseController {
	
	private static Logger logger = Logger.getLogger(FileMrgController.class);
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private FileMrgService fileMrgService;
	
	public FileMrgController(){
		super("course/file/",CONSTANTCONTEXT.LESSON_FILE_DIR);
	}
	
	@RequestMapping("toList")
	public String toList(final ModelMap modelMap, @RequestParam Map<String, String> params,
			HttpServletRequest request, HttpServletResponse response){
		try {
			
			Course course = courseService.viewById(params.get("id"));
			modelMap.addAttribute("course", course);
			
			params.put("type", "1");
			List<CourseFile> courseFiles = fileMrgService.getFiles(params);
			modelMap.addAttribute("courseFiles", courseFiles);
			
			params.put("type", "2");
			List<CourseFile> backupFiles = fileMrgService.getFiles(params);
			modelMap.addAttribute("backupFiles", backupFiles);
			
		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}
		
		return getContext("list");
	}
	
	@RequestMapping("toUpload")
	public String toUpload(){
		return getContext("upload");
	}
	
	
	@RequestMapping("deleteById")
	public String deleteById(@RequestParam Map<String, String> params){
		
		try {
			
			String ids = params.get("ids");
			
			if (StringUtils.isNotEmpty(ids)) {
				String[] idArray = ids.split(",");
				fileMrgService.deleteById(idArray);
			}
			
		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}
		
		return "redirect:toList?active=file&id=" + params.get("courseId");
	}
	
	@RequestMapping("upload")
	public synchronized void upload(@RequestParam("file") Object uploadFile,
			@RequestParam Map<String, String> params,HttpServletRequest request, 
			HttpServletResponse response){
		
		setWebContext(request, response);
		
		try {
			
			String newFileName = super.upload(uploadFile);
			String fileType =  FileUtil.getFileExtension(newFileName).toUpperCase();
			params.put("fileType",fileType);
			params.put("name", newFileName);
			params.put("fileSize", "0");
			if (uploadFile instanceof MultipartFile) {
				long size = ((MultipartFile) uploadFile).getSize()/1024;
				params.put("fileSize",size + " kb");
				if (size > 1000) {
					size = size / 1024;
					params.put("fileSize",size + " mb");
				}
			}
			params.put("creater", getName());
			fileMrgService.addFile(params);
			
			write(getEncoding(newFileName));
		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}
	}
}
