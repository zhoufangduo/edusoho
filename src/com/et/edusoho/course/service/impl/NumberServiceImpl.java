package com.et.edusoho.course.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.et.edusoho.admin.user.bean.User;
import com.et.edusoho.course.dao.NumberDao;
import com.et.edusoho.course.service.NumberService;

@Service
public class NumberServiceImpl implements NumberService {

	@Autowired
	private NumberDao numberDao;
		
	public List<User> getNumberById(String courseId) {
		return numberDao.getNumberById(courseId);
	}

	public void add(Map<String, String> params) {
		numberDao.add(params);
	}

	public void deleteById(Map<String, String> params) {
		numberDao.deleteById(params);
	}

	public List<Number> getAddNumbers(Map<String, String> params) {
		return numberDao.getAddNumbers(params);
	}

}
