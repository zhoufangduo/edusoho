package com.et.edusoho.course.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.et.edusoho.course.bean.Category;
import com.et.edusoho.course.dao.CategoryDao;
import com.et.edusoho.support.dao.BaseDaoSupport;

@Repository
public class CategoryDaoImpl extends BaseDaoSupport implements CategoryDao {

	public void add(Map<String, String> params) {
		insert("Category.add", params);
	}

	public List<Category> list(Map<String, Object> params) {
		
		return getList("Category.list", params);
	}

	public void delete(Map<String, String> params) {
		delete("Category.delete", params);
	}

}
