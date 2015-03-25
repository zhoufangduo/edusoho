package com.et.edusoho.admin.user.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.et.edusoho.admin.user.service.UserService;
import com.et.edusoho.login.bean.User;
import com.et.edusoho.support.constroller.BaseController;

@Controller
@RequestMapping("/admin/user/*")
public class PromotedContrller extends BaseController {
	
	@Autowired
	private UserService userService;
	
	public PromotedContrller(){
		super("admin/user/promoted/");
	}
	
	
	@RequestMapping("promoted")
	public String promoted(final ModelMap modelMap){
		
		List<User> teachers = userService.getTeachers();
		modelMap.addAttribute("teachers", teachers);
		
		return getContext("list");
	}
	
	@RequestMapping("promoted/update")
	public String update(@RequestParam Map<String, String> params){
		
		if (params.size() > 0) {
			userService.update(params);
		}
		
		return "redirect:?active=user&menu=promoted";
	}
	
}
