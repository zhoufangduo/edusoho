package com.et.edusoho.admin.user.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.et.edusoho.admin.user.bean.User;
import com.et.edusoho.admin.user.dao.UserDao;
import com.et.edusoho.support.dao.BaseDaoSupport;

@Repository
public class UserDaoImpl extends BaseDaoSupport implements UserDao {

	public void add(Map<String, String> params) {
		insert("User.add", params);
	}

	public List<User> getList(Map<String, String> params) {
		return getList("User.list", params);
	}

	public void lock(Map<String, String> params) {
		update("User.lock", params);
	}

	public User get(Map<String, String> params) {
		List<User> users = getList(params);
		if (users.size() > 0) {
			return users.get(0);
		}
		return null;
	}

	public List<User> getTeachers() {
		return getList("User.getTeachers");
	}

	public void update(Map<String, String> params) {
		update("User.update", params);
	}

	public int validatePwd(Map<String, String> params) {
		return get("User.validatePwd", params);
	}
}
