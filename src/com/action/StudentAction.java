package com.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.dao.AccountDAO;
import com.dao.StudentDao;
import com.entity.Account;
import com.entity.Student;
import com.opensymphony.xwork2.ActionSupport;

@Controller
public class StudentAction {
	@Resource
	private StudentDao dao;
	private int id;
	private List<Student> students;
	@Resource
	private AccountDAO accountDAO;
	private Student student;
	private int page=1;
	private int pageSize=5;
	private int pages;
	
	public String findpages() {
		students=dao.findRecPages(page, pageSize);
		pages=dao.findTotalPages(pageSize);
		return "success";
		
	}
	public String addstudent() {
		dao.addStudent(student);
		return "success";
	}
	public String deleteStudent() {
		int accountId=0;
		student=dao.findStudentById(id);
		List<Account> list = accountDAO.findAccout(student.getNo());
		for (Account account : list) {
			if(student.getNo().equals(account.getUser_no())){
				accountId=account.getId();
			}
		}
		accountDAO.deleteAccount(accountId);
		dao.deleteStudent(id);
		return "success";
	}
	public String modify() {
		student=dao.findStudentById(id);
		return "success";
	}
	public String update() {
		dao.updataStudent(student);
		return "success";
	}
	
	
	

	public StudentDao getDao() {
		return dao;
	}

	public void setDao(StudentDao dao) {
		this.dao = dao;
	}

	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
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

	public int getPages() {
		return pages;
	}

	public void setPages(int pages) {
		this.pages = pages;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public AccountDAO getAccountDAO() {
		return accountDAO;
	}
	public void setAccountDAO(AccountDAO accountDAO) {
		this.accountDAO = accountDAO;
	}

}
