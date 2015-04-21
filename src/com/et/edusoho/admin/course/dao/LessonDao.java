package com.et.edusoho.admin.course.dao;

import java.util.List;

import com.et.edusoho.admin.course.bean.Lesson;


public interface LessonDao extends MarkdownDao{

	public List<Lesson> getListByCourseId(String courseId);

}
