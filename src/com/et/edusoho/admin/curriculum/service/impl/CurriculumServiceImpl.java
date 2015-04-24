package com.et.edusoho.admin.curriculum.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.et.edusoho.admin.curriculum.dao.CurriculumDao;
import com.et.edusoho.admin.curriculum.service.CurriculumService;
import com.et.edusoho.course.bean.Course;


@Service
public class CurriculumServiceImpl implements CurriculumService {
	
	@Autowired
	private CurriculumDao courseDao;
	
	public void create(Map<String, String> params) {
		courseDao.create(params);
	}

	public List<Course> getAll(Map<String, String> params) {
		return courseDao.getAll(params);
	}

	public void update(Map<String, String> params) {
		courseDao.update(params);
	}

	public void delete(Map<String, String> params) {
		courseDao.delete(params);
	}
}
