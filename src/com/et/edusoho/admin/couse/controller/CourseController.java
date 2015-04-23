package com.et.edusoho.admin.couse.controller;

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

import com.et.edusoho.admin.couse.service.CategoryService;
import com.et.edusoho.admin.couse.service.CourseService;
import com.et.edusoho.course.bean.Course;
import com.et.edusoho.support.constroller.BaseController;
import com.et.edusoho.tools.CONSTANTCONTEXT;

@Controller
@RequestMapping("/admin/course/*")
public class CourseController extends BaseController {

	private static Logger logger = Logger.getLogger(CourseController.class);

	@Autowired
	private CourseService courseService;

	@Autowired
	private CategoryService categoryService;

	public CourseController() {
		super("admin/course", CONSTANTCONTEXT.LOGO_DIR);
	}

	@RequestMapping("list")
	public String toCourse(final ModelMap modelMap,
			@RequestParam Map<String, String> params) {

		List<Course> courses = courseService.getAll(params);

		modelMap.addAttribute("categorys", categoryService.list(null));
		modelMap.addAttribute("courses", courses);

		return getContext("/list");
	}

	@RequestMapping("toAdd")
	public String toAdd() {
		return getContext("/add");
	}

	@RequestMapping("add")
	public String add(final ModelMap modelMap,
			@RequestParam Map<String, String> params,
			HttpServletRequest request, HttpServletResponse response) {

		try {

			setWebContext(request, response);

			if (params.size() > 0) {

				params.put("creater", getUser().getId());

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

	@RequestMapping("course/delete")
	public String delete(@RequestParam Map<String, String> params) {
		try {

			if (params.size() > 0) {
				courseService.delete(params);
			}

		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}

		return "redirect:?active=course";

	}

}
