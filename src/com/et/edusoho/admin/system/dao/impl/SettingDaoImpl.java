package com.et.edusoho.admin.system.dao.impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.et.edusoho.admin.system.bean.Site;
import com.et.edusoho.admin.system.dao.SettingDao;
import com.et.edusoho.support.dao.BaseDaoSupport;

@Repository
public class SettingDaoImpl extends BaseDaoSupport implements SettingDao {

	public void save(Map<String, String> params) {
		insert("Setting.save", params);
	}

	public Site getInfo() {
		return get("Setting.getInfo");
	}

}
