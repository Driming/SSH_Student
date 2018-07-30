package com.dao;


import java.util.List;

import com.entity.Grade;

public interface GradeInterface {
	
	public List<Grade> findRecPages(final int page, final int pageSize);
	
	public Grade findGradeByid(int id);

	public void addGrade(Grade grade);

	public void updateGrade(Grade grade);

	public void deleteGrade(int id);
	
	public int findTotalPages(int pageSize);


}
