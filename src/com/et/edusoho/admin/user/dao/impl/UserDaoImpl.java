package com.et.edusoho.admin.user.dao.impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.et.edusoho.admin.user.dao.UserDao;
import com.et.edusoho.support.dao.BaseDaoSupport;

@Repository
public class UserDaoImpl extends BaseDaoSupport implements UserDao {

	public void add(Map<String, String> params) {
		insert("User.add", params);
	}
}
