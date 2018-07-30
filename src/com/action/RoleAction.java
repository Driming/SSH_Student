package com.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.stereotype.Controller;

import com.dao.RoleDAO;
import com.entity.Role;
@Controller
public class RoleAction implements SessionAware{
	@Resource
	private RoleDAO roleDao;
	private int id;
	private String name;
	private String text;
	private String page;
	private Role role;
	private List<Role> roles;
	private Map<String,Object>	session;
	private int pages=1;
	private int pageSize=4;
	private int total;
	
	public String addOption(){
//		total=roleDao.findTotalPages(pageSize);
		return "success";
	}
	
	public String addRole(){
		roleDao.saveRole(role);
		total=roleDao.findTotalPages(pageSize);
		return "success";
	}
	
	public String deleteRole() {
		roleDao.deleteRole(id);
		return "success";
	}
	
	public String findRoleById() {
		role=roleDao.findRoleById(id);
		
		return "success";
	}
	
	public String updateRole() {
		roleDao.updateRole(role);
		return "success";
	}
	
	public String findRecPages() {
		roles=roleDao.findRecPages(pages, pageSize);
		total=roleDao.findTotalPages(pageSize);
		return "success";
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public RoleDAO getRoleDao() {
		return roleDao;
	}
	public void setRoleDao(RoleDAO roleDao) {
		this.roleDao = roleDao;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public List<Role> getRoles() {
		return roles;
	}
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	public int getPages() {
		return pages;
	}
	public void setPages(int pages) {
		this.pages = pages;
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
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	
}
