package com.et.edusoho.admin.couse.dao;


import java.util.List;
import java.util.Map;

import com.et.edusoho.admin.couse.bean.Category;


public interface CategoryDao {

	public void add(Map<String, String> params);

	public List<Category> list(Map<String, Object> params);

	public void delete(Map<String, String> params);

}
