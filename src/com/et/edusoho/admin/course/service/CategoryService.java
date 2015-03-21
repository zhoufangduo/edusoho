package com.et.edusoho.admin.course.service;

import java.util.List;
import java.util.Map;

import com.et.edusoho.admin.course.bean.Category;

public interface CategoryService {

	public void add(Map<String, String> params);

	public List<Category> list(Map<String, Object> params);

}
