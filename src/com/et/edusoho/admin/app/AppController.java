package com.et.edusoho.admin.app;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.et.edusoho.support.constroller.BaseController;

@Controller
public class AppController extends BaseController {
	
	@RequestMapping("/admin")
	public String toAdmin(HttpServletResponse response, HttpServletRequest request){
		
		setWebContext(request, response);
		
		if (getUser() == null) {
			
			return "redirect:/toLogin";
		}
		
		if (isAdmin()) {
			return "admin/index";
		}
		
		return "redirect:";
		
	}
	
	
	@RequestMapping("admin/navigation")
	public String toNavigation(){
		
		return "admin/navigation";
	}
	
}
