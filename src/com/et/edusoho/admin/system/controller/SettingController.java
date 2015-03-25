package com.et.edusoho.admin.system.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.et.edusoho.support.constroller.BaseController;

@Controller
@RequestMapping("/admin/system/setting")
public class SettingController extends BaseController {
	
	@RequestMapping("site")
	public String setSite(final ModelMap modelMap, 
			@RequestParam Map<String, String> params){
		
		return "";
	}
}
