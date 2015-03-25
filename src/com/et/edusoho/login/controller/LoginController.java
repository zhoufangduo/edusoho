package com.et.edusoho.login.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.et.edusoho.admin.user.service.LogService;
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
	
	@Autowired
	private LogService logService;
	
	
	@RequestMapping("/login")
	public String login(final ModelMap modelMap, @RequestParam Map<String, String> params,
			HttpServletRequest request, HttpServletResponse response){
		
		try {
			
			setWebContext(request, response);
			
			if (params.size() > 0) {
				
				User user = loginService.login(params);
				
				addLoginLog(user,params);
				
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

	
	
	private void addLoginLog(User user, Map<String, String> params) {
		
		params.put("loginRes", "1");
		
		if (user == null) {
			params.put("loginRes", "0");
		}
		
		params.put("loginIp", getIpAddr());
		
		logService.addLog(params);
	}



	@RequestMapping("/toLogin")
	public String toLogin(final ModelMap modelMap,@RequestParam Map<String, String> params
			,HttpServletRequest request){
		
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
	
	public String getIpAddr() {
		
		 String ip = request.getHeader("x-forwarded-for");
		 
		 if (StringUtils.isEmpty(ip)||"unknown".equalsIgnoreCase(ip)) {
			 ip = request.getHeader("Proxy-Client-IP");
		 }
		 
		 if (StringUtils.isEmpty(ip)||"unknown".equalsIgnoreCase(ip)) {
			 ip = request.getHeader("WL-Proxy-Client-IP");
		 }
		 
		 if (StringUtils.isEmpty(ip)||"unknown".equalsIgnoreCase(ip)) {
			 ip = request.getRemoteAddr();
		 }
		 
		 if (StringUtils.isEmpty(ip)||"unknown".equalsIgnoreCase(ip)) {
			 ip = request.getHeader("http_client_ip");
		 }
		 
		 if (StringUtils.isEmpty(ip)||"unknown".equalsIgnoreCase(ip)) {
			 ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		 }
		 
		 // 如果是多级代理，那么取第一个ip为客户ip
		 if (ip != null && ip.indexOf(",") != -1) {
			 ip = ip.substring(ip.lastIndexOf(",") + 1, ip.length()).trim();
		 }
		 
		 return ip.equals("0:0:0:0:0:0:0:1")? "127.0.0.1":ip;
	}

}
