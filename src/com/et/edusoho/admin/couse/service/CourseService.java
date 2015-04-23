package com.et.edusoho.admin.couse.service;

import java.util.List;
import java.util.Map;

import com.et.edusoho.course.bean.Course;

public interface CourseService {

	public void create(Map<String, String> params);

	public List<Course> getAll(Map<String, String> params);

	public void update(Map<String, String> params);

	public void delete(Map<String, String> params);

}
