package com.et.edusoho.person.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.et.edusoho.support.constroller.BaseController;

@Controller
@RequestMapping("/personal/*")
public class PersonalController extends BaseController {
	
	private static Logger logger = Logger.getLogger(PersonalController.class);
	
	public PersonalController(){
		super("personal/");
	}
	
	@RequestMapping("basic")
	public String personal(){
		
		return getContext("basic");
	}
	
	
}
