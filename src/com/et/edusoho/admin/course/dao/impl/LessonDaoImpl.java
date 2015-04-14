package com.et.edusoho.admin.course.dao.impl;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.et.edusoho.admin.course.bean.Lesson;
import com.et.edusoho.admin.course.dao.LessonDao;
import com.et.edusoho.support.dao.BaseDaoSupport;

@Repository
public class LessonDaoImpl extends BaseDaoSupport implements LessonDao {

	public List<Lesson> getListByCourseId(String courseId) {
		return getList("Lesson.getListByCourseId", courseId);
	}
}
