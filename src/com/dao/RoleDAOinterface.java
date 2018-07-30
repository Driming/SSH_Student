package com.dao;

import java.util.List;

import com.entity.Role;

public interface RoleDAOinterface {

	public void saveRole(Role role);
	
	public void deleteRole(int id);
	
	public Role findRoleById(int id);
	
	public void updateRole(Role role);
	
	public List<Role> findRecPages(int page,int pageSize);
	
	public int findTotalPages(int pageSize);
}
