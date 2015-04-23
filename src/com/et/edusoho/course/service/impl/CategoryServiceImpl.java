package com.et.edusoho.course.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.et.edusoho.course.bean.Category;
import com.et.edusoho.course.dao.CategoryDao;
import com.et.edusoho.course.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	private CategoryDao categoryDao;

	public void add(Map<String, String> params) {
		categoryDao.add(params);
	}

	public List<Category> list(Map<String, Object> params) {
		
		return categoryDao.list(params);
	}

	public void delete(Map<String, String> params) {
		categoryDao.delete(params);
	}
	
}
