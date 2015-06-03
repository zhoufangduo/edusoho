package com.et.edusoho.course.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.et.edusoho.course.bean.Estimate;
import com.et.edusoho.course.dao.EstimateDao;
import com.et.edusoho.course.service.EstimateService;

@Service
public class EstimateServiceImpl implements EstimateService {
	
	@Autowired
	private EstimateDao estimateDao;

	public void save(Map<String, String> params) {
		estimateDao.save(params);
	}

	public List<Estimate> getBycourserId(String courseId) {
		
		return estimateDao.getBycourserId(courseId);
	}

	public void update(Map<String, String> params) {
		estimateDao.update(params);
	}
	
}
