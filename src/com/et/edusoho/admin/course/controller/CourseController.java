package com.et.edusoho.admin.course.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.et.edusoho.support.constroller.BaseController;

@Controller
@RequestMapping("/admin/*")
public class CourseController extends BaseController {
	
	public CourseController(){
		super("admin/course");
	}
	
	@RequestMapping("course")
	public String toCourse(){
		return getContext("/list");
	}
}
