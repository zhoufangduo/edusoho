package com.et.edusoho.admin.course.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.et.edusoho.admin.course.bean.Chapter;
import com.et.edusoho.admin.course.bean.Course;
import com.et.edusoho.admin.course.bean.Lesson;
import com.et.edusoho.admin.course.service.ChapterService;
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
	private ChapterService chapterService;
	
	@Autowired
	private LessonService lessonService;
	
	public LessonController(){
		super("admin/course/lesson");
	}
	
	@RequestMapping("course/lesson/toAdd")
	public String toAdd(){
		return getContext("/add");
	}
	
	@RequestMapping("course/lesson/toAddVideo")
	public String toAddVideo(){
		return getContext("/type/video");
	}
	
	@RequestMapping("course/lesson/toAddAudio")
	public String toAddAudio(){
		return getContext("/type/audio");
	}
	
	@RequestMapping("course/lesson/toAddText")
	public String toAddText(){
		return getContext("/type/text");
	}
	
	
	@RequestMapping("course/lesson/toAddCode")
	public String toAddDoc(){
		return getContext("/type/code");
	}
	
	@RequestMapping("course/lesson/add")
	public String add(final ModelMap modelMap, @RequestParam Map<String, String> params,
			HttpServletRequest request, HttpServletResponse response){
		
		String courseId =  params.get("courseId") == null? "" : params.get("courseId");
		
		try {
			
			setWebContext(request, response);
			
			if (params.size() > 0) {
				
				Course course = courseService.viewById(params.get("courseId"));
				params.put("seq", course.getMaxSeq());
				
				params.put("creater", getUserId());
				lessonService.addMarkdown(params);
				courseService.updateSeq(courseId);
			}
			
		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}
		
		
		return "redirect:/admin/course/lesson?active=lesson&id=" + courseId;
	}
	
	@RequestMapping("course/lesson")
	public String toLesson(final ModelMap modelMap,
			@RequestParam Map<String, String> params){
		
		try {
			
			setWebContext(request, response);
			
			Course course = courseService.view(params);
			
			if (course !=  null) {
				
				String courseId = course.getId();
				
				List<Lesson> lessons = lessonService.getListByCourseId(courseId);
				List<Chapter> chapters = chapterService.getListByCourseId(courseId);
				
				modelMap.addAttribute("lessons", lessons);
				modelMap.addAttribute("chapters", chapters);
				modelMap.addAttribute("course", course);
			}
			
		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}
		
		return getContext("/list");
	}
}
