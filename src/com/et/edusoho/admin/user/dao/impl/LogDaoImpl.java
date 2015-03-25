package com.et.edusoho.admin.user.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.et.edusoho.admin.user.bean.LoginLog;
import com.et.edusoho.admin.user.dao.LogDao;
import com.et.edusoho.support.dao.BaseDaoSupport;

@Repository
public class LogDaoImpl extends BaseDaoSupport implements LogDao {

	public void addLog(Map<String, String> params) {
		insert("LoginLog.addLog", params);
	}

	public List<LoginLog> getLog(Map<String, Object> params) {
		return getList("LoginLog.getLog", params);
	}

	public void clean() {
		delete("LoginLog.clean");
	}
}
