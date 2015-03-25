package com.et.edusoho.admin.user.service;

import java.util.List;
import java.util.Map;

import com.et.edusoho.login.bean.User;

public interface UserService {

	public void add(Map<String, String> params);

	public List<User> getList(Map<String, String> params);

	public void lock(Map<String, String> params);

	public User get(Map<String, String> params);

	public List<User> getTeachers();

	public void update(Map<String, String> params);

}
