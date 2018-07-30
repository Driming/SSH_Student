package com.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.dao.MajorDao;
import com.entity.Major;

@Controller("majorAction")
public class MajorAction {
	@Resource
	private MajorDao majorDao;
	private Major major;
	private List<Major> majors;
	private int page = 1;
	private int pageSize = 5;
	private int total;
	private int id;
	private int cid;
	
	

	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public MajorDao getMajorDao() {
		return majorDao;
	}
	public void setMajorDao(MajorDao majorDao) {
		this.majorDao = majorDao;
	}
	public Major getMajor() {
		return major;
	}
	public void setMajor(Major major) {
		this.major = major;
	}
	public List<Major> getMajors() {
		return majors;
	}
	public void setMajors(List<Major> majors) {
		this.majors = majors;
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
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	/**
	 * 功能实现
	 * @return
	 */
	public String addMajor(){
		majorDao.addMajor(major);
		return "success";
	}
	public String deleteMajor(){
		majorDao.deleteMajor(id);
		return "success";
	}
	public String updateMajor(){
		majorDao.updateMajor(major);
		return "success";
	}
	public String findRecPages(){
		majors = majorDao.findRecPages(page, pageSize);
		total = majorDao.findTotalPages(pageSize);
		return "success";
	}
	public String findMajorById(){
		major = majorDao.findMajorById(id);
		return "success";
	}
	

	public String findAll(){
		majors = majorDao.findAll(cid);
		return "success";
	}

	
}
