package com.et.edusoho.admin.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.et.edusoho.admin.user.service.UserService;
import com.et.edusoho.support.constroller.BaseController;

@Controller
@RequestMapping("/admin/user/*")
public class ReferralContrller extends BaseController {
	
	public ReferralContrller(){
		super("admin/user/referral/");
	}
	
	@Autowired
	private UserService userService;
	
	
	@RequestMapping("referral")
	public String referral(){
		
		return getContext("teachers");
	}
}
