package com.et.edusoho.admin.user.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.et.edusoho.admin.user.bean.Clazz;
import com.et.edusoho.admin.user.dao.ClazzDao;
import com.et.edusoho.support.dao.BaseDaoSupport;

@Repository
public class ClassDaoImpl extends BaseDaoSupport implements ClazzDao {

	public List<Clazz> list(Map<String, String> params) {
		return getList("Clazz.list",params);
	}

	public void add(Map<String, String> params) {
		insert("Clazz.add", params);
	}

	public void deleteById(String id) {
		delete("Clazz.deleteById", id);
	}
}
