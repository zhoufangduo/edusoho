package com.et.edusoho.admin.course.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.et.edusoho.admin.course.service.CourseService;
import com.et.edusoho.admin.course.service.LessonService;
import com.et.edusoho.support.constroller.BaseController;

@Controller
@RequestMapping("/admin/*")
public class LessonController extends BaseController {
	
	private static Logger logger = Logger.getLogger(LessonController.class);
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private LessonService lessonService;
	
	public LessonController(){
		super("admin/course/lesson");
	}
	
	@RequestMapping("course/lesson")
	public String toLesson(){
		
		return getContext("/list");
	}
}
