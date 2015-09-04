package com.et.edusoho.admin.curriculum.controller;

import java.util.List;
import java.util.Map;





import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.et.edusoho.admin.curriculum.service.CategoryService;
import com.et.edusoho.admin.curriculum.service.CurriculumService;
import com.et.edusoho.course.bean.Course;
import com.et.edusoho.support.constroller.BaseController;
import com.et.edusoho.tools.CONSTANTCONTEXT;

@Controller
@RequestMapping("/admin/curriculum/*")
public class CurriculumController extends BaseController {

	private static Logger logger = Logger.getLogger(CurriculumController.class);

	@Autowired
	private CurriculumService courseService;

	@Autowired
	private CategoryService categoryService;

	public CurriculumController() {
		super("admin/curriculum/", CONSTANTCONTEXT.LOGO_DIR);
	}
	
	public CurriculumController(String path, String filePath) {
		super(path, filePath);
	}

	@RequestMapping("list")
	public String toCourse(final ModelMap modelMap,
			@RequestParam Map<String, String> params) {

		List<Course> courses = courseService.getAll(params);

		modelMap.addAttribute("categorys", categoryService.list(null));
		modelMap.addAttribute("courses", courses);

		return getContext("/list");
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

		return "redirect:list?active=base&id=" + params.get("id");
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

		return "redirect:list?active=course";
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
		return "redirect:?active=course";
	}
}
