package com.et.edusoho.admin.user.service;

import java.util.List;
import java.util.Map;

import com.et.edusoho.admin.user.bean.LoginLog;

public interface LogService {

	public void addLog(Map<String, String> params);

	public List<LoginLog> getLog(Map<String, Object> params);

	public void clean();

}
