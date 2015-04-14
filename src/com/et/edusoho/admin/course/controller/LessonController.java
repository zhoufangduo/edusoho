package com.et.edusoho.admin.course.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.et.edusoho.admin.course.service.CourseService;
import com.et.edusoho.admin.course.service.LessonService;
import com.et.edusoho.support.constroller.BaseController;

@Controller
@RequestMapping("/admin/*")
public class LessonController extends BaseController {
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private LessonService lessonService;
	
	public LessonController(){
		super("admin/course/lesson");
	}
	
	@RequestMapping("course/lesson")
	public String toLesson(final ModelMap modelMap,
			@RequestParam Map<String, String> params){
		
		return getContext("/list");
	}
}
