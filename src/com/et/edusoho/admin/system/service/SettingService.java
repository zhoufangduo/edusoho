package com.et.edusoho.admin.system.service;

import java.util.Map;

import com.et.edusoho.admin.system.bean.Site;

public interface SettingService {

	public void save(Map<String, String> params);

	public Site getInfo();

}
