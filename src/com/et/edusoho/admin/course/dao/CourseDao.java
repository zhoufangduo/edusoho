package com.et.edusoho.admin.course.dao;

import java.util.List;
import java.util.Map;

import com.et.edusoho.admin.course.bean.Course;

public interface CourseDao {

	public void create(Map<String, String> params);

	public List<Course> getAll(Map<String, String> params);

	public void update(Map<String, String> params);

	public void delete(Map<String, String> params);

	public Course view(Map<String, String> params);

}