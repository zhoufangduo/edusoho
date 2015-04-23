package com.et.edusoho.course.service;

import java.util.List;

import com.et.edusoho.course.bean.Lesson;

public interface LessonService extends MarkdownService{

	public List<Lesson> getListByCourseId(String courseId);


}
