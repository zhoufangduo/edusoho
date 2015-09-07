package com.et.edusoho.admin.user.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.et.edusoho.admin.user.bean.Clazz;
import com.et.edusoho.admin.user.dao.ClazzDao;
import com.et.edusoho.admin.user.service.ClazzService;

@Service
public class ClazzServiceImpl implements ClazzService{
	
	@Autowired
	private ClazzDao clazzDao;

	public List<Clazz> list(Map<String, String> params) {
		
		return clazzDao.list(params);
	}

	public void add(Map<String, String> params) {
		clazzDao.add(params);
	}

	public void deleteById(String id) {
		clazzDao.deleteById(id);
	}
}
