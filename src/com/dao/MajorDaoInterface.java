package com.dao;

import java.util.List;

import com.entity.Major;


public interface MajorDaoInterface {
	public void addMajor(Major major);
	public Major findMajorById(int id);
	public void updateMajor(Major major);
	public void deleteMajor(int id);
	public List<Major> findRecPages(int page,int pageSize);
}
