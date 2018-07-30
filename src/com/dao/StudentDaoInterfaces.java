package com.dao;

import java.util.List;

import com.entity.Student;

public interface StudentDaoInterfaces {
	
	
	public Student findStudentById(int id);
	
	public void addStudent(Student student);
	
	public void updataStudent(Student student);
	
	public void deleteStudent(int id);
	
	public List<Student> findRecPages(int page,int pageSize);
	
	public int findTotalPages(int pageSize);

}
