package com.action;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;


import com.dao.GradeDao;
import com.entity.Grade;
import com.entity.Teacher;

@Controller
public class GradeAction {
	@Resource
	 private GradeDao gradeDao;
     private int page=1;
     private int pageSize=5;
     private Grade grade;
     private List<Grade>list;
     private int id;
     private List<Teacher>list1;
     private int pages;
     private String manager;
     
     public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public String findPages() {
 		list = gradeDao.findRecPages(page, pageSize);
 		pages = gradeDao.findTotalPages(pageSize);
 		
        return "success";

 	}
     
    public String addGrade(){
    	gradeDao.addGrade(grade);
    	return "success";
    	
    }
     
    public String deleteGrade(){
    	gradeDao.deleteGrade(id);
    	return "success";
    	
    }
     
    public String modifyGrade(){
    	grade = gradeDao.findGradeByid(id);
    	
    	return "success";
    	
    }
    
    public String updateGrade(){
    	gradeDao.updateGrade(grade);
    	return "success";
    	
    }
    
    //寻找教师表信息方法
    public String findTeacher(){
    	 list1 = gradeDao.findTeacher(manager);
		return "success";
    	
    }
     
    public String findAll() {
    	list=gradeDao.findAll();
		return "success";
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
	public Grade getGrade() {
		return grade;
	}
	public void setGrade(Grade grade) {
		this.grade = grade;
	}
	public List<Grade> getList() {
		return list;
	}
	public void setList(List<Grade> list) {
		this.list = list;
	}

	public GradeDao getGradeDao() {
		return gradeDao;
	}

	public void setGradeDao(GradeDao gradeDao) {
		this.gradeDao = gradeDao;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPages() {
		return pages;
	}

	public void setPages(int pages) {
		this.pages = pages;
	}

	public List<Teacher> getList1() {
		return list1;
	}

	public void setList1(List<Teacher> list1) {
		this.list1 = list1;
	}


     
     
     
    
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
   
     
	
	
     
}
