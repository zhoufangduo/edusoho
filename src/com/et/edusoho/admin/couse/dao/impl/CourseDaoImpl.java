package com.et.edusoho.admin.couse.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.et.edusoho.admin.couse.dao.CourseDao;
import com.et.edusoho.course.bean.Course;
import com.et.edusoho.support.dao.BaseDaoSupport;

@Repository
public class CourseDaoImpl extends BaseDaoSupport implements CourseDao {

	public void create(Map<String, String> params) {
		insert("Course.create", params);
	}

	public List<Course> getAll(Map<String, String> params) {
		return getList("Course.getAll", params);
	}

	public void update(Map<String, String> params) {
		update("Course.update", params);
	}

	public void delete(Map<String, String> params) {
		delete("Course.delete", params);
	}
}
