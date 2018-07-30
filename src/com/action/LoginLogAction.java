package com.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.dao.LoginDAO;
import com.entity.Login;
import com.entity.Role;
@Controller("loginLogAction")
public class LoginLogAction {
	@Resource
	private LoginDAO loginDao;
	
	private Login log;
	private List<Login> logs;
	private int page=1;	
	private int pageSize=5;	
	private int total;
	private String did;
	
	public String addOption(){
		return "success";
	}
	
	/**
	 * 1 string[] str1 = new string[] {"100","300","200"};
2 
3 int[] intTemp = new int[str1.Length];
4 for (int i = 0; i <str1.Length; i++)
5 {
6 intTemp[i] = int.Parse(str1[i]);
7 }
	 * @return
	 */
	
	public String deleteAll(){
		
		String[] str_ids = did.split("-");
		Integer[] ids = new Integer[str_ids.length];
		for (int i = 0; i < str_ids.length; i++) {
			ids[i] = Integer.parseInt(str_ids[i]);
		}
		System.out.println(ids.toString());
		loginDao.delAll(ids);
		return "success";
	}
	
	public String findRecPages() {
		logs=loginDao.findRecPages(page, pageSize);
		total=loginDao.findTotalPages(pageSize);
		return "success";
	}
	
	public LoginDAO getLoginDao() {
		return loginDao;
	}
	public void setLoginDao(LoginDAO loginDao) {
		this.loginDao = loginDao;
	}

	public String getDid() {
		return did;
	}

	public void setDid(String did) {
		this.did = did;
	}

	public Login getLog() {
		return log;
	}
	public void setLog(Login log) {
		this.log = log;
	}
	public List<Login> getLogs() {
		return logs;
	}
	public void setLogs(List<Login> logs) {
		this.logs = logs;
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
}
