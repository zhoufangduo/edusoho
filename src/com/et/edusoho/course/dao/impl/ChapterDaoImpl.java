package com.et.edusoho.course.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.et.edusoho.course.bean.Chapter;
import com.et.edusoho.course.dao.ChapterDao;
import com.et.edusoho.support.dao.BaseDaoSupport;

@Repository
public class ChapterDaoImpl extends BaseDaoSupport implements ChapterDao{
	
	public void addChapter(Map<String, String> params) {
		insert("Chapter.add", params);
	}

	public List<Chapter> getListByCourseId(String courseId) {
		
		return getList("Chapter.getListByCourseId", courseId);
	}
}
