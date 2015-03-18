package com.et.edusoho.admin.course.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.et.edusoho.admin.course.service.CategoryService;
import com.et.edusoho.support.constroller.BaseController;

@Controller
@RequestMapping("/admin/course/*")
public class CategoryController extends BaseController{
	
	private static Logger logger = Logger.getLogger(CategoryController.class);
	
	
	@Autowired
	private CategoryService categoryService;
	
	public CategoryController(){
		super("admin/course/category");
	}
	
	
	@RequestMapping("add")
	public void add(final ModelMap modelMap, @RequestParam Map<String, String> params,
			HttpServletResponse response,HttpServletRequest request){
		
		try {
			
			setWebContext(request, response);
			
			if (params.size() > 0) {
				categoryService.add(params);
			}
			
		} catch (Exception e) {
			write("");
			logger.warn(e.getMessage(), e);
		}
	}
	
	@RequestMapping("category")
	public String toLesson(){
		return getContext("/list");
	}
}
