package com.et.edusoho.person.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.et.edusoho.admin.user.service.UserService;
import com.et.edusoho.support.constroller.BaseController;
import com.et.edusoho.tools.CONSTANTCONTEXT;

@Controller
@RequestMapping("/personal/*")
public class PersonalController extends BaseController {
	
	private static Logger logger = Logger.getLogger(PersonalController.class);
	
	@Autowired
	private UserService userService;
	
	public PersonalController(){
		super("personal/",CONSTANTCONTEXT.USER_IMGS);
	}
	
	@RequestMapping("basic")
	public String personal(final ModelMap modelMap,
			@RequestParam Map<String, String> params){
		
		try {
			
			modelMap.addAttribute("person", userService.get(params));
			
		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}
		
		return getContext("basic");
	}
	
	@RequestMapping("toAvatar")
	public String toAvatar(final ModelMap modelMap,
			@RequestParam Map<String, String> params){
		
		modelMap.addAttribute("person", userService.get(params));
		
		return getContext("avatar");
		
	}
	
	@RequestMapping("save")
	public String save(@RequestParam Map<String, String> params){
		
		try {
			
			if (params.size() > 0) {
				userService.update(params);
			}
			
		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}
		
		return "redirect:basic?active=base";
	}
	
	
	@RequestMapping("saveAvatar")
	public void saveAvatar(@RequestParam Map<String, String> params,
			HttpServletRequest request,HttpServletResponse response){
		
		setWebContext(request, response);
		
		save(params);
	}
	
	@RequestMapping("toSetPwd")
	public String toSetPwd(final ModelMap modelMap,@RequestParam Map<String, String> params,
			HttpServletRequest request,HttpServletResponse response){
		
		
		modelMap.addAttribute("person", userService.get(params));
		
		return getContext("setPwd");
		
	}
	
	@RequestMapping("validatePwd")
	public void toValidatePwd(@RequestParam Map<String, String> params,
			HttpServletRequest request,HttpServletResponse response){
		
		setWebContext(request, response);
		
		try {
			
			String oldPwd = params.get("oldPwd");
			if (StringUtils.isNotEmpty(oldPwd)) {
				params.put("id", getUserId());			
				@SuppressWarnings("unused")
				int result = userService.validatePwd(params);
				
			}
			
		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}
		
		write("false");
		
	}
	
	@RequestMapping("upload")
	public synchronized void upload(@RequestParam("file") Object uploadFile,
			HttpServletRequest request, HttpServletResponse response){
		
		try {
			
			setWebContext(request, response);
			
			String fileName = super.upload(uploadFile,getUsername());
			
			write(fileName);
			
		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
			write(e.getMessage());
		}
	}
	
	@RequestMapping("download")
	public synchronized void  download(@RequestParam Map<String, String> params,
			HttpServletRequest request, HttpServletResponse response){
		try {
			
			this.setWebContext(request, response);

			download(params);

		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}
	}
}
