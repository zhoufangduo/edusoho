package com.et.edusoho.login.controller;

import java.util.Map;

import javax.servlet.http.Cookie;
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
import com.et.edusoho.tools.CONSTANTCONTEXT;

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
			
			setWebContext(request, response);
			
			if (params.size() > 0) {
				
				if ("true".equals(params.get("remeber"))) {
					setLoginToCookie(params, request, response);  
				}
				
				User user = loginService.login(params);
				if (user != null) {
					session.setAttribute(CONSTANTCONTEXT.USER, user);
					
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

	private void setLoginToCookie(Map<String, String> params,
			HttpServletRequest request, HttpServletResponse response) {
		String host = request.getServerName();  
		Cookie cookie = new Cookie(CONSTANTCONTEXT.LOGIN_COOKIE_USERNAME, params.get("username")); 
		cookie.setPath("/");  
		cookie.setDomain(host);  
		response.addCookie(cookie);  
		cookie = new Cookie(CONSTANTCONTEXT.LOGIN_COOKIE_PASSWORD, params.get("password"));   
		cookie.setPath("/");  
		cookie.setDomain(host);  
		response.addCookie(cookie);
	}
	
	@RequestMapping("/toLogin")
	public String toLogin(final ModelMap modelMap,
			@RequestParam Map<String, String> params){
		
		return "login/login";
	}
	
	@RequestMapping("/logout")
	public String toLogout(HttpServletRequest request, HttpServletResponse response){
		
		try {
			
			setWebContext(request, response);
			
			session.removeAttribute(CONSTANTCONTEXT.USER);
			
		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}
		
		return "/index";
	}

}
