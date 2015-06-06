package com.et.edusoho.person.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.et.edusoho.admin.user.service.UserService;
import com.et.edusoho.support.constroller.BaseController;

@Controller
@RequestMapping("/personal/*")
public class PersonalController extends BaseController {
	
	private static Logger logger = Logger.getLogger(PersonalController.class);
	
	@Autowired
	private UserService userService;
	
	public PersonalController(){
		super("personal/");
	}
	
	@RequestMapping("basic")
	public String personal(final ModelMap modelMap){
		
		try {
			
			//modelMap.addAttribute("", userService.get(params));
			
		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}
		
		return getContext("basic");
	}
	
}
