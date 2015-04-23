package com.et.edusoho.course.service;

import java.util.List;
import java.util.Map;

import com.et.edusoho.course.bean.Chapter;

public interface ChapterService {
	
	public void addChapter(Map<String, String> params);

	public List<Chapter> getListByCourseId(String courseId);
}
