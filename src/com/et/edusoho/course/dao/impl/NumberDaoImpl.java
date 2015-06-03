package com.et.edusoho.course.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.et.edusoho.admin.user.bean.User;
import com.et.edusoho.course.dao.NumberDao;
import com.et.edusoho.support.dao.BaseDaoSupport;
@Repository
public class NumberDaoImpl extends BaseDaoSupport implements NumberDao {

	public List<User> getNumberById(String courseId) {
		return getList("Number.getNumberById", courseId);
	}

	public void add(Map<String, String> params) {
		insert("Number.add", params);
	}

	public void deleteById(Map<String, String> params) {
		delete("Number.deleteById", params);
	}

	public List<Number> getAddNumbers(Map<String, String> params) {
		return getList("Number.getAddNumbers", params);
	}

}
