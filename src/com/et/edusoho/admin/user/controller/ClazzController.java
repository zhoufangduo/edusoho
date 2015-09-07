package com.et.edusoho.admin.user.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.et.edusoho.admin.user.service.ClazzService;
import com.et.edusoho.support.constroller.BaseController;
@Controller
@RequestMapping("/admin/user/*")
public class ClazzController extends BaseController {
	
	@Autowired
	private ClazzService clazzService;
	
	public ClazzController() {
		super("admin/user/clazz/");
	}
	
	@RequestMapping("clazz")
	public String list(@RequestParam Map<String, String> params,
			final ModelMap model){
		
		model.addAttribute("list", clazzService.list(params));
		
		return getContext(LIST);
	}
	
	@RequestMapping("clazz/toAdd")
	public String toAdd(){
		return getContext(ADD);
	}
	
	@RequestMapping("clazz/add")
	public String add(@RequestParam Map<String, String> params,
			HttpServletRequest request, HttpServletResponse response){
		
		setWebContext(request, response);
		
		if (params.size() > 0) {
			params.put("creater", getUserId());
			clazzService.add(params);
		}
		
		return "redirect:/admin/user/clazz?active=user&menu=clazz";
	}
	
	
	@RequestMapping("clazz/deleteById")
	public String deleteById(@RequestParam Map<String, String> params){
		
		String id = params.get("id");
		if (StringUtils.isNotEmpty(id)) {
			clazzService.deleteById(id);
		}
		
		return "redirect:/admin/user/clazz?active=user&menu=clazz";
	}
	
}
