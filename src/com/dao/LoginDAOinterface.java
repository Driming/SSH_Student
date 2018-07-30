package com.dao;

import java.util.List;

import com.entity.Login;

public interface LoginDAOinterface {

	public List<Login> findRecPages(int page,int pageSize);
	
	public int findTotalPages(int pageSize);
	
	public void saveLogin(Login log);
	
	public void deleteLogin(int id);
	
	public Login findLoginById(int id);
	
	public void updateLogin(Login log);
}
