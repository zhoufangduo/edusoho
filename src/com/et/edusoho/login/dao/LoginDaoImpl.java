package com.et.edusoho.login.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.et.edusoho.login.bean.User;
import com.et.edusoho.support.dao.BaseDaoSupport;

@Repository
public class LoginDaoImpl extends BaseDaoSupport implements LoginDao {

	public User login(Map<String, String> params) {
		
		return get("Login.getLoginUser", params);
	}
	
}
