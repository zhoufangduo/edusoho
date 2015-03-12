package com.et.edusoho.admin.lesson;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.et.edusoho.support.constroller.BaseController;

@Controller
@RequestMapping("/admin/*")
public class LessonController extends BaseController {
	
	public LessonController(){
		super("admin/lesson");
	}
	
	@RequestMapping("lesson")
	public String toLesson(){
		return getContext("/list");
	}
}
