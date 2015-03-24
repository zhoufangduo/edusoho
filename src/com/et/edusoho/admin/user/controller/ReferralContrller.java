package com.et.edusoho.admin.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.et.edusoho.admin.user.service.UserService;
import com.et.edusoho.login.bean.User;
import com.et.edusoho.support.constroller.BaseController;

@Controller
@RequestMapping("/admin/user/*")
public class ReferralContrller extends BaseController {
	
	@Autowired
	private UserService userService;
	
	public ReferralContrller(){
		super("admin/user/referral/");
	}
	
	
	@RequestMapping("referral")
	public String referral(final ModelMap modelMap){
		
		List<User> teachers = userService.getTeachers();
		modelMap.addAttribute("teachers", teachers);
		
		return getContext("teachers");
	}
}
