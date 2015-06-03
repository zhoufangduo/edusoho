package com.et.edusoho.course.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.et.edusoho.course.bean.Estimate;
import com.et.edusoho.course.dao.EstimateDao;
import com.et.edusoho.support.dao.BaseDaoSupport;
@Repository
public class EstimateDaoImpl extends BaseDaoSupport implements EstimateDao {

	public void save(Map<String, String> params) {
		insert("Estimate.save", params);
	}

	public List<Estimate> getBycourserId(String courseId) {
		
		return getList("Estimate.getBycourserId", courseId);
	}

	public void update(Map<String, String> params) {
		update("Estimate.update", params);
	}
}
