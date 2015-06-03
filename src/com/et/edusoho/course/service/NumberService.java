package com.et.edusoho.course.service;

import java.util.List;
import java.util.Map;

import com.et.edusoho.admin.user.bean.User;

public interface NumberService {

	public List<User> getNumberById(String courseId);

	public void add(Map<String, String> params);

	public void deleteById(Map<String, String> params);

	public List<Number> getAddNumbers(Map<String, String> params);

}
