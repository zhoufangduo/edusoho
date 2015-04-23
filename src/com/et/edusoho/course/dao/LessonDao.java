package com.et.edusoho.course.dao;

import java.util.List;

import com.et.edusoho.course.bean.Lesson;


public interface LessonDao extends MarkdownDao{

	public List<Lesson> getListByCourseId(String courseId);

}
