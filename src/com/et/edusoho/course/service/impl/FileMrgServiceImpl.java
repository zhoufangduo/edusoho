package com.et.edusoho.course.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.et.edusoho.course.bean.CourseFile;
import com.et.edusoho.course.dao.FileMrgDao;
import com.et.edusoho.course.service.FileMrgService;

@Service
public class FileMrgServiceImpl implements FileMrgService {
	
	@Autowired
	private FileMrgDao fileMrgDao;

	
	public void addFile(Map<String, String> params) {
		fileMrgDao.addFile(params);
	}


	public List<CourseFile> getFiles(Map<String, String> params) {
		return fileMrgDao.getFiles(params);
	}


	public void deleteById(String[] idArray) {
		fileMrgDao.deleteById(idArray);
	}
}
