package com.et.edusoho.login.dao;

import java.util.Map;

import com.et.edusoho.login.bean.User;

public interface LoginDao {

	public User login(Map<String, String> params);

}
