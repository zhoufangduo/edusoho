package com.et.edusoho.course.service;

import java.util.List;
import java.util.Map;

import com.et.edusoho.course.bean.CourseFile;

public interface FileMrgService {

	public void addFile(Map<String, String> params);

	public List<CourseFile> getFiles(Map<String, String> params);

	public void deleteById(String[] idArray);

}
