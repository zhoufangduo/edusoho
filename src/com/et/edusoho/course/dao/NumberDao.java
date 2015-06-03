package com.et.edusoho.course.dao;

import java.util.List;
import java.util.Map;

import com.et.edusoho.admin.user.bean.User;

public interface NumberDao {

	public List<User> getNumberById(String courseId);

	public void add(Map<String, String> params);

	public void deleteById(Map<String, String> params);

	public List<Number> getAddNumbers(Map<String, String> params);

}
