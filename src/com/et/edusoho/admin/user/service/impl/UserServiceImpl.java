package com.et.edusoho.admin.user.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.et.edusoho.admin.user.dao.UserDao;
import com.et.edusoho.admin.user.service.UserService;
import com.et.edusoho.login.bean.User;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;

	public void add(Map<String, String> params) {
		userDao.add(params);
	}

	public List<User> getList(Map<String, String> params) {
		// TODO Auto-generated method stub
		return null;
	}

}
