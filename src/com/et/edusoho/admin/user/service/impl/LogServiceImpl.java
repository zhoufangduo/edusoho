package com.et.edusoho.admin.user.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.et.edusoho.admin.user.bean.LoginLog;
import com.et.edusoho.admin.user.dao.LogDao;
import com.et.edusoho.admin.user.service.LogService;

@Service
public class LogServiceImpl implements LogService {
	
	@Autowired
	private LogDao logDao;
	
	public void addLog(Map<String, String> params) {
		logDao.addLog(params);
	}

	public List<LoginLog> getLog(Map<String, Object> params) {
		List<LoginLog> list = logDao.getLog(params);
		
		for(LoginLog log : list){
			if (log != null) {
				String[]roles = log.getRole().split(",");
				log.setRoles(roles);
			}
		}
		
		return list;
	}

	public void clean() {
		logDao.clean();
	}

}
