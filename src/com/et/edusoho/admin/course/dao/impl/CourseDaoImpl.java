package com.et.edusoho.admin.course.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.et.edusoho.admin.course.bean.Course;
import com.et.edusoho.admin.course.dao.CourseDao;
import com.et.edusoho.support.dao.BaseDaoSupport;

@Repository
public class CourseDaoImpl extends BaseDaoSupport implements CourseDao {

	public void create(Map<String, String> params) {
		insert("Course.create", params);
	}

	public List<Course> getAll(Map<String, String> params) {
		return getList("Course.getAll", params);
	}

}
