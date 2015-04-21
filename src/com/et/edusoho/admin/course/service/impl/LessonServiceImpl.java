package com.et.edusoho.admin.course.service.impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.et.edusoho.admin.course.bean.Lesson;
import com.et.edusoho.admin.course.dao.LessonDao;
import com.et.edusoho.admin.course.service.LessonService;

@Service
public class LessonServiceImpl implements LessonService {
	
	@Autowired
	private LessonDao lessonDao;

	public List<Lesson> getListByCourseId(String courseId) {
		return lessonDao.getListByCourseId(courseId);
	}

	public void addMarkdown(Map<String, String> params) {
		lessonDao.addMarkdown(params);
	}
}
