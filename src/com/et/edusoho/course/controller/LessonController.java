package com.et.edusoho.course.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.et.edusoho.course.bean.Chapter;
import com.et.edusoho.course.bean.Course;
import com.et.edusoho.course.bean.Lesson;
import com.et.edusoho.course.service.ChapterService;
import com.et.edusoho.course.service.CourseService;
import com.et.edusoho.course.service.LessonService;
import com.et.edusoho.support.constroller.BaseController;
import com.et.edusoho.tools.CONSTANTCONTEXT;
import com.et.edusoho.tools.FileUtil;

@Controller
@RequestMapping("/course/lesson/*")
public class LessonController extends BaseController {
	
	private static Logger logger = Logger.getLogger(LessonController.class);
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private ChapterService chapterService;
	
	@Autowired
	private LessonService lessonService;
	
	public LessonController(){
		super("course/lesson/",CONSTANTCONTEXT.LESSON_FILE_DIR);
	}
	
	@RequestMapping("toAdd")
	public String toAdd(){
		return getContext("add");
	}
	
	@RequestMapping("toAddVideo")
	public String toAddVideo(){
		return getContext("type/video");
	}
	
	@RequestMapping("toAddAudio")
	public String toAddAudio(){
		return getContext("type/audio");
	}
	
	@RequestMapping("toAddText")
	public String toAddText(){
		return getContext("type/text");
	}
	
	
	@RequestMapping("toAddCode")
	public String toAddDoc(){
		return getContext("type/code");
	}
	
	@RequestMapping("add")
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
		
		
		return "redirect:/course/lesson/list?active=lesson&id=" + courseId;
	}
	
	@RequestMapping("list")
	public String toLesson(final ModelMap modelMap,
			@RequestParam Map<String, String> params,
			HttpServletRequest request, HttpServletResponse response){
		
		try {
			
			setWebContext(request, response);
			
			Course course = courseService.view(params);
			
			if (course !=  null) {
				
				String courseId = String.valueOf(course.getId());
				
				List<Lesson> lessons = lessonService.getListByCourseId(courseId);
				List<Chapter> chapters = chapterService.getListByCourseId(courseId);
				
				modelMap.addAttribute("lessons", lessons);
				modelMap.addAttribute("chapters", chapters);
				modelMap.addAttribute("course", course);
			}
			
		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}
		
		return getContext("list");
	}
	
	@RequestMapping("Images")
	public String getImages(final ModelMap modelMap,
			HttpServletRequest request, HttpServletResponse response){
		try {
			
			this.setWebContext(request, response);
			
			modelMap.addAttribute("images", 
					FileUtil.findLessonImage(CONSTANTCONTEXT.IMAGE_TYPE));
			
		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}
		
		return getContext("type/showImages");
	}
	
	
	@RequestMapping("audios")
	public void getAudio(HttpServletRequest request, HttpServletResponse response){
		
		JSONArray array = new JSONArray();
		
		try {
			
			this.setWebContext(request, response);
			
			List<String> audios = FileUtil.findLessonImage(CONSTANTCONTEXT.AUDIO_TYPE);
			
			array = new JSONArray(audios);
			
		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}
		
		write(array.toString());
	}
	
}
