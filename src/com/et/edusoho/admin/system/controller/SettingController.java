package com.et.edusoho.admin.system.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.et.edusoho.admin.system.service.SettingService;
import com.et.edusoho.support.constroller.BaseController;
import com.et.edusoho.tools.CONSTANTCONTEXT;
import com.et.edusoho.web.context.ApplicationContextLoader;

@Controller
@RequestMapping("/admin/system/setting/*")
public class SettingController extends BaseController {

	private static Logger logger = Logger.getLogger(SettingController.class);

	@Autowired
	private SettingService settingService;

	public SettingController() {
		super("/admin/system/setting/", CONSTANTCONTEXT.LOGO_DIR);
	}

	@RequestMapping("site")
	public String setSite(final ModelMap modelMap,
			@RequestParam Map<String, String> params) {
		
		modelMap.addAttribute("site", settingService.getInfo());
		
		return getContext("site");
	}
	
	@RequestMapping("save")
	public String save(@RequestParam Map<String, String> params,
			HttpServletResponse response, HttpServletRequest request){
		
		try {
			
			if (params.size() > 0) {
				settingService.save(params);
				
				ApplicationContextLoader.INSTANCE.onSiteUpdateEvent(request);
			}
			
		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}
		
		return "redirect:site?active=site";
	}
	
	@RequestMapping("upload")
	public void upload(@RequestParam("file") Object uploadFile,
			@RequestParam("fileName") String fileName,
			HttpServletRequest request, HttpServletResponse response) {

		try {

			this.setWebContext(request, response);
			
			String newFileName = super.upload(uploadFile, fileName);
			
			write(newFileName);

		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
			write("");
		}
	}

	@RequestMapping("download")
	public void download(@RequestParam Map<String, String> params,
			HttpServletRequest request, HttpServletResponse response) {

		try {

			this.setWebContext(request, response);

			download(params);

		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
			write("");
		}
	}

}
