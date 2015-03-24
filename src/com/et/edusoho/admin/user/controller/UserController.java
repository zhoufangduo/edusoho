package com.et.edusoho.admin.user.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.et.edusoho.admin.user.service.UserService;
import com.et.edusoho.login.bean.User;
import com.et.edusoho.support.constroller.BaseController;

@Controller
@RequestMapping("/admin/*")
public class UserController extends BaseController {
	
	private static Logger logger = Logger.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	public UserController(){
		super("admin/user/");
	}
	
	@RequestMapping("user")
	public String toList(final ModelMap modelMap, @RequestParam Map<String, String> params){
		
		try {
			
			List<User> list = userService.getList(params);
			
			modelMap.addAttribute("list", list);
			
		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}
		
		return getContext("list");
	}
	
	@RequestMapping("user/toAdd")
	public String toAdd(){
		
		return getContext("add");
	}
	
	@RequestMapping("user/add")
	public String add(@RequestParam Map<String, String> params){
		
		try {
			
			if (params.size() > 0) {
				userService.add(params);
			}
			
		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}
		
		return "redirect:/admin/user?active=user";
	}
	
	@RequestMapping("lock")
	public String lock(@RequestParam Map<String, String> params){
		
		try {
			
			String id = params.get("id");
			
			if (StringUtils.isNotEmpty(id)) {
				
				userService.lock(params);
			}
			
		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}
		
		return "redirect:/admin/user?active=user";
	}
	
	@RequestMapping("user/toView")
	public String toView(final ModelMap modelMap, @RequestParam Map<String, String> params){
		
		try {
			
			String id = params.get("id");
			if (StringUtils.isNotEmpty(id)) {
				modelMap.addAttribute("queryUser", userService.get(params));
			}
			
		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}
		
		return getContext("view");
	}
	
}
