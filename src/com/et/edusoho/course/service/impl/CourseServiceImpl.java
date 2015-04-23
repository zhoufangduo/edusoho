package com.et.edusoho.course.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.et.edusoho.course.bean.Course;
import com.et.edusoho.course.dao.CourseDao;
import com.et.edusoho.course.service.CourseService;

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

	public Course view(Map<String, String> params) {
		return courseDao.view(params);
	}

	public synchronized void updateSeq(String id) {
		courseDao.updateSeq(id);
	}

	public Course viewById(String id) {
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("id", id);
		
		return courseDao.view(params);
	}

}
