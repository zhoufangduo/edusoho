package com.et.edusoho.context.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.et.edusoho.support.dao.BaseDaoSupport;

@Controller
public class IndexController extends BaseDaoSupport {
	
	@RequestMapping("/index")
	public String index(final ModelMap modelMap){
		
		return "/index";
	}
}
