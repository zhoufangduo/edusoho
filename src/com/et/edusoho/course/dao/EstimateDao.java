package com.et.edusoho.course.dao;

import java.util.List;
import java.util.Map;

import com.et.edusoho.course.bean.Estimate;

public interface EstimateDao {

	public void save(Map<String, String> params);

	public List<Estimate> getBycourserId(String courseId);

	public void update(Map<String, String> params);

}
