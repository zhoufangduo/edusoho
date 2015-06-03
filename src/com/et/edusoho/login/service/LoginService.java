package com.et.edusoho.login.service;

import java.util.Map;

import com.et.edusoho.admin.user.bean.User;

public interface LoginService {
	
	public User login(Map<String, String> params);

}
