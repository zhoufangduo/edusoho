package com.et.edusoho.admin.system.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.et.edusoho.admin.system.bean.Site;
import com.et.edusoho.admin.system.dao.SettingDao;
import com.et.edusoho.admin.system.service.SettingService;

@Service
public class SettingServiceImpl implements SettingService {
	
	@Autowired
	private SettingDao settingDao;

	public void save(Map<String, String> params) {
		settingDao.save(params);
	}

	public Site getInfo() {
		return settingDao.getInfo();
	}

}
