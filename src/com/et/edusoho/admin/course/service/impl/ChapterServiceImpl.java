package com.et.edusoho.admin.course.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.et.edusoho.admin.course.bean.Chapter;
import com.et.edusoho.admin.course.dao.ChapterDao;
import com.et.edusoho.admin.course.service.ChapterService;

@Service
public class ChapterServiceImpl implements ChapterService {

	@Autowired
	private ChapterDao chapterDao;
	
	public void addChapter(Map<String, String> params) {
		chapterDao.addChapter(params);
	}

	public List<Chapter> getListByCourseId(String courseId) {
		
		return chapterDao.getListByCourseId(courseId);
	}
}
