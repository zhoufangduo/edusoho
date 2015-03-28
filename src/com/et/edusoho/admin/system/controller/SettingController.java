package com.et.edusoho.admin.system.controller;

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
import org.springframework.web.multipart.MultipartFile;

import com.et.edusoho.admin.system.service.SettingService;
import com.et.edusoho.support.constroller.BaseController;
import com.et.edusoho.tools.CONSTANTCONTEXT;
import com.et.edusoho.tools.FileUtil;
import com.et.edusoho.tools.PathUtil;

@Controller
@RequestMapping("/admin/system/setting/*")
public class SettingController extends BaseController {

	private static Logger logger = Logger.getLogger(SettingController.class);

	private final String UPLOAD_LOGO_DIR;
	
	@Autowired
	private SettingService settingService;

	public SettingController() {
		super("/admin/system/setting/");
		this.UPLOAD_LOGO_DIR = PathUtil.getPath() + CONSTANTCONTEXT.LOGO_DIR;
	}

	@RequestMapping("site")
	public String setSite(final ModelMap modelMap,
			@RequestParam Map<String, String> params) {
		
		modelMap.addAttribute("site", settingService.getInfo());
		
		return getContext("site");
	}

	@RequestMapping("upload")
	public void upload(@RequestParam("file") Object uploadFile,
			@RequestParam("fileName") String fileName,
			HttpServletRequest request, HttpServletResponse response) {

		try {

			this.setWebContext(request, response);

			if (uploadFile instanceof MultipartFile) {

				String newFileName = FileUtil.save((MultipartFile) uploadFile,
						UPLOAD_LOGO_DIR, fileName);
				
				logger.info("上传文件的路径: " + UPLOAD_LOGO_DIR);

				write(newFileName);
			}

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

			String fileName = params.get("file");
			if (StringUtils.isNotEmpty(fileName)) {
				
				FileUtil.download(response, this.UPLOAD_LOGO_DIR + fileName);
			}

		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
			write("");
		}
	}
	
	@RequestMapping("save")
	public String save(@RequestParam Map<String, String> params,
			HttpServletResponse response, HttpServletRequest request){
		
		try {
			
			if (params.size() > 0) {
				settingService.save(params);
			}
			
		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
		}
		
		return "redirect:site?active=site";
	}

}
