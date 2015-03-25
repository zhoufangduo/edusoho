package com.et.edusoho.admin.user.dao;

import java.util.List;
import java.util.Map;

import com.et.edusoho.admin.user.bean.LoginLog;

public interface LogDao {

	public void addLog(Map<String, String> params);

	public List<LoginLog> getLog(Map<String, Object> params);

	public void clean();

}
