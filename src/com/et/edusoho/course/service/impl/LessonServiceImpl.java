package com.et.edusoho.course.service.impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.et.edusoho.course.bean.Lesson;
import com.et.edusoho.course.dao.LessonDao;
import com.et.edusoho.course.service.LessonService;

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
