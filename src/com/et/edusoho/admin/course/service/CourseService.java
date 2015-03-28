package com.et.edusoho.admin.course.service;

import java.util.List;
import java.util.Map;

import com.et.edusoho.admin.course.bean.Course;

public interface CourseService {

	public void create(Map<String, String> params);

	public List<Course> getAll(Map<String, String> params);

}
