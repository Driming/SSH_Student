package com.dao;

import java.util.List;

import com.entity.College;

public interface CollegeDaoInterface {

	public void addCollege(College college);
	public College findCollegeById(int id);
	public void updateCollege(College college);
	public void deleteCollege(int id);
	public List<College> findRecPages(int page,int pageSize);
	
	
}
