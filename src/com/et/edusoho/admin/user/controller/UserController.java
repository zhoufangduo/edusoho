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
import com.et.edusoho.tools.CONSTANTCONTEXT;

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
				
				String role = getRole(params);
				
				if (StringUtils.isEmpty(role)) {
					params.put("role", CONSTANTCONTEXT.USER_DEFAULT_ROLE);
				}
				
				userService.add(params);
			}
			
		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}
		
		return "redirect:/admin/user?active=user";
	}
	
	
	private String getRole(Map<String, String> params) {
		
		StringBuffer buffer = new StringBuffer();
		
		String role1 = params.get("role1");
		if (StringUtils.isNotEmpty(role1)) {
			buffer.append(role1);
		}
		
		String role2 = params.get("role2");
		if (StringUtils.isNotEmpty(role2)) {
			buffer.append(",").append(role2);
		}
		
		String role3 = params.get("role3");
		if (StringUtils.isNotEmpty(role3)) {
			buffer.append(",").append(role3);
		}
		
		return buffer.toString();
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
