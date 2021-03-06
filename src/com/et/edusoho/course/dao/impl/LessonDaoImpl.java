package com.et.edusoho.course.dao.impl;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.et.edusoho.course.bean.Lesson;
import com.et.edusoho.course.dao.LessonDao;
import com.et.edusoho.support.dao.BaseDaoSupport;

@Repository
public class LessonDaoImpl extends BaseDaoSupport implements LessonDao {

	public List<Lesson> getListByCourseId(String courseId) {
		return getList("Lesson.getListByCourseId", courseId);
	}

	public void addMarkdown(Map<String, String> params) {
		insert("Lesson.addMarkdown", params);
	}
}
