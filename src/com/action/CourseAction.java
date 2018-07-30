package com.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.dao.CourseDao;
import com.entity.Course;

@Controller("courseAction")
public class CourseAction {

	@Resource
	private CourseDao courseDao;
	private Course course;
	private List<Course> courses;
	private int page = 1;
	private int pageSize = 5;
	private int total;
	private int id;
	private List<Course> list;
	public List<Course> getList() {
		return list;
	}
	public void setList(List<Course> list) {
		this.list = list;
	}
	public CourseDao getCourseDao() {
		return courseDao;
	}
	public void setCourseDao(CourseDao courseDao) {
		this.courseDao = courseDao;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public List<Course> getCourses() {
		return courses;
	}
	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	/**
	 * 功能实现
	 */
	public String addCourse(){
		courseDao.addCourse(course);
		return "success";
	}
	public String updateaddCourse(){
		courseDao.updateCourse(course);
		return "success";
	}
	public String deleteCourse(){
		courseDao.deleteCourse(id);
		return "success";
	}
	public String findCourseById(){
		course = courseDao.findCourseById(id);
		return "success";
	}
	public String findRecPages(){
		courses = courseDao.findRecPages(page, pageSize);
		total = courseDao.findTotalPages(pageSize);
		return "success";
	}
	
	public String SelCourse() {
		list=courseDao.findAll();
		return "success";
	}

}
