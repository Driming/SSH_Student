package com.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.dao.CollegeDao;
import com.entity.College;
import com.entity.Major;

@Controller("collegeAction")
public class CollegeAction {
	@Resource
	private CollegeDao collegeDao;
	private College college;
	private List<College> colleges;
	private int page = 1;
	private int pageSize = 5;
	private int total;
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<College> getColleges() {
		return colleges;
	}

	public void setColleges(List<College> colleges) {
		this.colleges = colleges;
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

	public College getCollege() {
		return college;
	}

	public void setCollege(College college) {
		this.college = college;
	}

	public CollegeDao getCollegeDao() {
		return collegeDao;
	}

	public void setCollegeDao(CollegeDao collegeDao) {
		this.collegeDao = collegeDao;
	}
	
	/**
	 * 功能实现
	 * @return
	 */
	public String addCollege(){
		collegeDao.addCollege(college);
		return "success";
		
	}
	public String findRecPages(){
		colleges = collegeDao.findRecPages(page, pageSize);
		total = collegeDao.findTotalPages(pageSize);
		
		return "success";
		
	}
	public String deleteCollege(){
		collegeDao.deleteCollege(id);
		return "success";
	
	}
	
	public String findCollegeById(){
		college = collegeDao.findCollegeById(id);
		return "success";
	}
	
	public String updateCollege(){
		collegeDao.updateCollege(college);
		return "success";
	
	}
	
	public String findAll(){
		colleges = collegeDao.findAll();
		return "success";
	}
	
}
