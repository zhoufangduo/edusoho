package com.et.edusoho.admin.user.controller;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.et.edusoho.admin.user.bean.LoginLog;
import com.et.edusoho.admin.user.service.LogService;
import com.et.edusoho.support.constroller.BaseController;

@Controller
@RequestMapping("/admin/user/*")
public class LogController extends BaseController {
	
	private static Logger logger = Logger.getLogger(LogController.class);
	
	@Autowired
	private LogService logService;
	
	public LogController(){
		super("admin/user/log/");
	}
	
	@RequestMapping("log")
	public String toLog(final ModelMap modelMap, @RequestParam Map<String, Object> params){
		try {
			
			List<LoginLog> list = logService.getLog(params);
			
			modelMap.addAttribute("list", list);
			
		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}
		return getContext("list");
	}
	
	@RequestMapping("log/clean")
	public String clean(final ModelMap modelMap, @RequestParam Map<String, Object> params){
		
		logService.clean();
		
		return "redirect:?active=user&menu=log";
	}
	
}
