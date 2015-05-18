package com.et.edusoho.course.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.et.edusoho.course.bean.CourseFile;
import com.et.edusoho.course.dao.FileMrgDao;
import com.et.edusoho.support.dao.BaseDaoSupport;

@Repository
public class FileMrgDaoImpl extends BaseDaoSupport implements FileMrgDao {

	public void addFile(Map<String, String> params) {
		insert("Course_File.addFile", params);
	}

	public List<CourseFile> getFiles(Map<String, String> params) {
		return getList("Course_File.getFiles", params);
	}

	public void deleteById(String[] idArray) {
		delete("Course_File.deleteById", idArray);
	}
}
