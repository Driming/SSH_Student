package com.dao;


import java.util.List;

import com.entity.Grade;
import com.entity.Teacher;

public interface TeacherInterface {
	
	public List<Teacher> findRecPages(final int page, final int pageSize);
	
	public Teacher findTeacherByid(int id);

	public void addTeacher(Teacher teacher);

	public void updateTeacher(Teacher teacher);

	public void deleteTeacher(int id);
	
	public int findTotalPages(int pageSize);


}
