package com.et.edusoho.admin.user.dao;

import java.util.List;
import java.util.Map;

import com.et.edusoho.admin.user.bean.Clazz;

public interface ClazzDao {

	public List<Clazz> list(Map<String, String> params);

	public void add(Map<String, String> params);

	public void deleteById(String id);

	public List<Clazz> getAll();

}
