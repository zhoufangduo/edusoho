package com.et.edusoho.course.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.et.edusoho.course.bean.Course;
import com.et.edusoho.course.service.CourseService;
import com.et.edusoho.course.service.NumberService;
import com.et.edusoho.support.constroller.BaseController;

@Controller
@RequestMapping("/course/number/*")
public class NumberController extends BaseController {

	private static Logger logger = Logger.getLogger(NumberController.class);

	@Autowired
	private CourseService courseService;

	@Autowired
	private NumberService numberService;

	
	public NumberController() {
		super("/course/number/");
	}

	
	@RequestMapping("list")
	public String list(final ModelMap modelMap,
			@RequestParam Map<String, String> params) {

		try {

			String courseId = params.get("id");
			if (StringUtils.isNotEmpty(courseId)) {

				Course course = courseService.viewById(courseId);
				modelMap.addAttribute("numbers",numberService.getNumberById(courseId));
				modelMap.addAttribute("course", course);
			}

		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}

		return getContext("list");
	}

	
	@RequestMapping("toAdd")
	public String toAdd(final ModelMap modelMap,@RequestParam Map<String, String> params) {
		List<Number> numbers = numberService.getAddNumbers(params);
		modelMap.addAttribute("numbers", numbers);
		return getContext("add");
	}

	
	@RequestMapping("add")
	public String add(@RequestParam Map<String, String> params) {

		try {
			if (params.size() > 0) {
				numberService.add(params);
			}
		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}
		return "redirect:list?active=number&id=" + params.get("courseId");
	}

	
	@RequestMapping("deleteById")
	public String deleteById(@RequestParam Map<String, String> params) {
		try {
			if (params.size() > 0) {
				numberService.deleteById(params);
			}
		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}
		return "redirect:list?active=number&id=" + params.get("courseId");
	}
}
