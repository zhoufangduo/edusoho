package com.et.edusoho.admin.system.dao;

import java.util.Map;

import com.et.edusoho.admin.system.bean.Site;

public interface SettingDao {

	public void save(Map<String, String> params);

	public Site getInfo();

}
