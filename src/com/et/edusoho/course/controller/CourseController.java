package com.et.edusoho.course.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.et.edusoho.admin.curriculum.service.CategoryService;
import com.et.edusoho.admin.user.service.UserService;
import com.et.edusoho.course.bean.Course;
import com.et.edusoho.course.service.ChapterService;
import com.et.edusoho.course.service.CourseService;
import com.et.edusoho.course.service.EstimateService;
import com.et.edusoho.support.constroller.BaseController;
import com.et.edusoho.tools.CONSTANTCONTEXT;

@Controller
@RequestMapping("/course/*")
public class CourseController extends BaseController {

	private static Logger logger = Logger.getLogger(CourseController.class);

	@Autowired
	private CourseService courseService;

	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ChapterService chapterService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private EstimateService esService;

	public CourseController() {
		super("course/", CONSTANTCONTEXT.LOGO_DIR);
	}

	@RequestMapping("list")
	public String toCourse(final ModelMap modelMap,
			@RequestParam Map<String, String> params) {

		List<Course> courses = courseService.getAll(params);

		modelMap.addAttribute("categorys", categoryService.list(null));
		modelMap.addAttribute("courses", courses);

		return getContext("list");
	}
	
	
	@RequestMapping("myCourse")
	public String toMyCourse(final ModelMap modelMap,
			@RequestParam Map<String, String> params,
			HttpServletRequest request, HttpServletResponse response) {
		
		setWebContext(request, response);
		
		params.put("userId", getUserId());
		
		Set<Course> courses = courseService.getMy(params);

		modelMap.addAttribute("categorys", categoryService.list(null));
		modelMap.addAttribute("courses", courses);
		modelMap.addAttribute("users",userService.getList(null));

		return getContext("my/list");
	}

	@RequestMapping("toAdd")
	public String toAdd() {
		return getContext("add");
	}

	@RequestMapping("add")
	public String add(final ModelMap modelMap,
			@RequestParam Map<String, String> params,
			HttpServletRequest request, HttpServletResponse response) {

		try {

			setWebContext(request, response);

			if (params.size() > 0) {

				params.put("creater", getUserId());

				courseService.create(params);
			}

		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}

		return "redirect:view?active=base&id=" + params.get("id");
	}

	@RequestMapping("update")
	public String update(@RequestParam Map<String, String> params) {
		try {

			if (params.size() > 0) {
				courseService.update(params);
			}

		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}

		return "redirect:view?active=base&id=" + params.get("id");
	}
	
	@RequestMapping("updateState")
	public String updateState(@RequestParam Map<String, String> params) {
		try {
			
			if (params.size() > 0) {
				courseService.update(params);
			}
			
		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}
		
		
		return "redirect:myCourse";
	}
	

	@RequestMapping("delete")
	public String delete(@RequestParam Map<String, String> params) {
		
		try {

			if (params.size() > 0) {
				courseService.delete(params);
			}

		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}

		return "redirect:myCourse";

	}

	@RequestMapping("view")
	public String toView(final ModelMap modelMap,
			@RequestParam Map<String, String> params) {
		try {

			if (params.size() > 0) {
				modelMap.addAttribute("course", courseService.view(params));
				modelMap.addAttribute("categorys", categoryService.list(null));
			}

		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}
		return getContext("base");
	}

	@RequestMapping("detail")
	public String toDetail(final ModelMap modelMap,
			@RequestParam Map<String, String> params) {
		try {

			if (params.size() > 0) {
				modelMap.addAttribute("course", courseService.view(params));
			}

		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}

		return getContext("detail");
	}

	@RequestMapping("updateDetail")
	public String updateDetail(final ModelMap modelMap,
			@RequestParam Map<String, String> params) {

		update(params);

		return "redirect:detail?active=detail&id=" + params.get("id");
	}

	@RequestMapping("toLogoImage")
	public String toLogoImage(final ModelMap modelMap,
			@RequestParam Map<String, String> params) {

		try {

			if (params.size() > 0) {
				modelMap.addAttribute("course", courseService.view(params));
			}

		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}

		return getContext("logoImage");
	}

	@RequestMapping("upload")
	public void upload(@RequestParam("file") Object uploadFile,
			@RequestParam("fileName") String fileName,
			HttpServletRequest request, HttpServletResponse response) {

		try {

			this.setWebContext(request, response);

			String newFileName = super.upload(uploadFile, fileName);

			Map<String, String> params = new HashMap<String, String>();
			params.put("id", fileName);
			params.put("logoImage", newFileName);

			courseService.update(params);

			write(newFileName);

		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
			write("");
		}
	}

	@RequestMapping("download")
	public  synchronized void  download(@RequestParam Map<String, String> params,
			HttpServletRequest request, HttpServletResponse response) {
		try {

			this.setWebContext(request, response);

			download(params);

		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
			write("");
		}
	}
	
	@RequestMapping("preview")
	public String preview(final ModelMap modelMap,
			@RequestParam Map<String, String> params){
		
		String courseId = params.get("courseId");
		if (StringUtils.isNotEmpty(courseId)) {
			
			Course course = courseService.getById(courseId);
			modelMap.addAttribute("course", course);
			modelMap.addAttribute("chapters",chapterService.getListByCourseId(courseId));
			modelMap.addAttribute("estimates",esService.getBycourserId(courseId));
			
			params.put("id", course.getCreater());
			
			modelMap.addAttribute("teacher",userService.get(params));
		}
		
		return getContext("preview");
	}
	
	@RequestMapping("toSaveEstimate")
	public String toSaveEstimate(final ModelMap modelMap,
			@RequestParam Map<String, String> params){
		
		try {
			
			if (params.size() > 0) {
				
				params.put("userId", getUserId());
				
				if ("0".equals(params.get("mark"))) {
					esService.save(params);
				}else {
					esService.update(params);
				}
			}
			
		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}
		
		return "redirect:preview?courseId=" + params.get("courseId");
	}
	
	
	@RequestMapping("goClass")
	public String goClass(){
		
		return "";
	}

}
