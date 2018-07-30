package com.action;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.springframework.stereotype.Controller;


import com.dao.TeacherDao;
import com.entity.Teacher;




@Controller
public class TeacherAction {
	@Resource
	 private TeacherDao teacherDao;
     private int page=1;
     private int pageSize=5;
     private Teacher teacher;
     private List<Teacher>list;
     private int id;
     private int pages;
     
 	
     public String findPages() {
 		list = teacherDao.findRecPages(page, pageSize);
 		pages= teacherDao.findTotalPages(pageSize);
 		for (int i = 0; i < list.size(); i++) {
			Teacher teacher2 = list.get(i);
			System.out.println(teacher2.getId()+"__"+teacher2.getManager()+"__"+teacher2.getName()+"__"+teacher2.getNo());
		}
 		
        return "success";

 	}
     
    public String addTeacher(){
    	teacherDao.addTeacher(teacher);
    	return "success";
    	
    }
     
    public String deleteTeacher(){
    	teacherDao.deleteTeacher(id);
    	return "success";
    	
    }
     
    public String modifyTeacher(){
    	teacher= teacherDao.findTeacherByid(id);
    	return "success";
    	
    }
    
    public String updateTeacher(){
    	teacherDao.updateTeacher(teacher);
    	return "success";
    }
    
    ///多对一
    //一写在多的实体里
    //private Teacher teacher
    public String findbyTeacher(){
    	teacherDao.findbyTeacher();
    	return "success";
    }
    
    

	public TeacherDao getTeacherDao() {
		return teacherDao;
	}

	public void setTeacherDao(TeacherDao teacherDao) {
		this.teacherDao = teacherDao;
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

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public List<Teacher> getList() {
		return list;
	}

	public void setList(List<Teacher> list) {
		this.list = list;
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

     
     
     
  
     
     
     
     
     
    
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
   
     
	
	
     
}
