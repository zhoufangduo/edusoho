package com.et.edusoho.admin.course.dao.impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.et.edusoho.admin.course.dao.ChapterDao;
import com.et.edusoho.support.dao.BaseDaoSupport;

@Repository
public class ChapterDaoImpl extends BaseDaoSupport implements ChapterDao{
	
	public void addChapter(Map<String, String> params) {
		insert("Chapter.add", params);
	}
}
