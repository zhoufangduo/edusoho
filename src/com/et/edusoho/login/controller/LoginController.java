package com.et.edusoho.login.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.et.edusoho.login.bean.User;
import com.et.edusoho.login.service.LoginService;
import com.et.edusoho.support.constroller.BaseController;

@Controller
@RequestMapping
public class LoginController extends BaseController{
		
	private static Logger logger = Logger.getLogger(LoginController.class);
	
	@Autowired
	private LoginService loginService;
	
	
	@RequestMapping("/login")
	public String login(final ModelMap modelMap, @RequestParam Map<String, String> params,
			HttpServletRequest request, HttpServletResponse response){
		
		try {
			
			if (params.size() > 0) {
				
				User user = loginService.login(params);
				if (user != null) {
					return "/index";
				}
			}
			
		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}
		
		modelMap.addAttribute("username",params.get("username"));
		modelMap.addAttribute("error", true);
		
		return "forward:toLogin";
	}
	
	@RequestMapping("/toLogin")
	public String toLogin(final ModelMap modelMap,
			@RequestParam Map<String, String> params){
		
		return "login/login";
	}

}
