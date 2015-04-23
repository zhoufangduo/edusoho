package com.et.edusoho.admin.couse.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.et.edusoho.admin.couse.dao.CourseDao;
import com.et.edusoho.admin.couse.service.CourseService;
import com.et.edusoho.course.bean.Course;


@Service
public class CourseServiceImpl implements CourseService {
	
	@Autowired
	private CourseDao courseDao;
	
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
