package com.et.edusoho.admin.course.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.et.edusoho.admin.course.service.ChapterService;
import com.et.edusoho.support.constroller.BaseController;

@Controller
@RequestMapping("/admin/*")
public class ChapterController extends BaseController {
	
	private static Logger logger = Logger.getLogger(ChapterController.class);
	
	@Autowired
	private ChapterService chapterService;
	
	public ChapterController(){
		super("admin/course/chapter");
	}
	
	
	@RequestMapping("course/chapter/toAdd")
	public String toAddChapter(){
		
		return getContext("/add");
	}
	
	@RequestMapping("course/chapter/add")
	public String addChapter(final ModelMap modelMap,
			@RequestParam Map<String, String> params,
			HttpServletRequest request, HttpServletResponse response){
		
		try {
			
			setWebContext(request, response);
			
			if (params.size() > 0) {
				params.put("creater", getUser().getId());
				
				System.out.println(params);
				chapterService.addChapter(params);
			}
			
		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}
		
		return "redirect:lesson?active=lesson&id=" + params.get("id");
	}
}
