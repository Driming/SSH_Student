package com.dao;

import java.util.List;

import com.entity.Course;

public interface CourseDaoInterface {
	public void addCourse(Course course);
	public Course findCourseById(int id);
	public void updateCourse(Course course);
	public void deleteCourse(int id);
	public List<Course> findRecPages(int page,int pageSize);
}
