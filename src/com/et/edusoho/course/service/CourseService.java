package com.et.edusoho.course.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.et.edusoho.course.bean.Course;

public interface CourseService {

	public void create(Map<String, String> params);

	public List<Course> getAll(Map<String, String> params);

	public void update(Map<String, String> params);

	public void delete(Map<String, String> params);
	
	public Course view(Map<String, String> params);

	public void updateSeq(String id);
	
	public Course viewById(String id);

	public Set<Course> getMy(Map<String, String> params);

	public Course getById(String courseId);


}
