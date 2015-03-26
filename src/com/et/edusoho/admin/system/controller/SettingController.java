package com.et.edusoho.admin.system.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.et.edusoho.support.constroller.BaseController;
import com.et.edusoho.tools.CONSTANTCONTEXT;
import com.et.edusoho.tools.FileUtil;
import com.et.edusoho.tools.PathUtil;

@Controller
@RequestMapping("/admin/system/setting/*")
public class SettingController extends BaseController {

	private static Logger logger = Logger.getLogger(SettingController.class);

	private final String fileDir;

	public SettingController() {
		super("/admin/system/setting/");
		this.fileDir = PathUtil.getPath() + CONSTANTCONTEXT.DIR;
	}

	@RequestMapping("site")
	public String setSite(final ModelMap modelMap,
			@RequestParam Map<String, String> params) {

		return getContext("site");
	}

	@RequestMapping("upload")
	public void upload(@RequestParam("file") Object uploadFile,
			HttpServletRequest request, HttpServletResponse response) {

		try {

			this.setWebContext(request, response);

			if (uploadFile instanceof MultipartFile) {

				String fileName = FileUtil.save((MultipartFile) uploadFile,
						fileDir, FileUtil.getFileNameTime());

				write(fileName);
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
				
				FileUtil.download(response,this.fileDir + fileName);
			}

		} catch (Exception e) {
			logger.warn(e.getMessage(), e);
			write("");
		}
	}

}
