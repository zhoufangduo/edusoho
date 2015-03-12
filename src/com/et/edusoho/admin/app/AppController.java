package com.et.edusoho.admin.app;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.et.edusoho.support.constroller.BaseController;

@Controller
public class AppController extends BaseController {
	
	@RequestMapping("/admin")
	public String toAdmin(){
		
		return "admin/index";
	}
	
	
	@RequestMapping("admin/navigation")
	public String toNavigation(){
		
		return "admin/navigation";
	}
	
}
