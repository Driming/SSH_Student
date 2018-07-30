package com.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.stereotype.Controller;

import com.dao.AccountDAO;
import com.dao.LoginDAO;
import com.dao.StudentDao;
import com.dao.TeacherDao;
import com.entity.Account;
import com.entity.Login;
import com.entity.Student;
import com.entity.Teacher;

@Controller("accountAction")
public class AccountAction implements SessionAware{
	@Resource
	private AccountDAO accountDAO;
	@Resource
	private LoginDAO loginDao;
	@Resource
	private TeacherDao teacherDao;
	@Resource
	private StudentDao studentDao;
	
	private List<Account> accounts;
	private List<Teacher> teacher;
	private List<Student> students;
	private Student student;
	private Account account;
	private int page = 1;
	private int pageSize = 5;
	private int total;
	private Login login = new Login();
	private Map<String,Object> session;
	private String pagePwd;
	private String newPwd;
	private Map<String, String> msg = new HashMap<String, String>();
	
	
	

	public Map<String, String> getMsg() {
		return msg;
	}

	public void setMsg(Map<String, String> msg) {
		this.msg = msg;
	}

	public String getPagePwd() {
		return pagePwd;
	}

	public void setPagePwd(String pagePwd) {
		this.pagePwd = pagePwd;
	}

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}

	public StudentDao getStudentDao() {
		return studentDao;
	}

	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}

	public TeacherDao getTeacherDao() {
		return teacherDao;
	}

	public void setTeacherDao(TeacherDao teacherDao) {
		this.teacherDao = teacherDao;
	}

	public String addlogin(){
		boolean b = accountDAO.checklogin(account.getAccount(),account.getPwd());
		if(b){
			session.put("account",account.getAccount());
			String LoginIn = loginDao.getCurrentDatetime(); 
			
			session.put("LoginIn",LoginIn);
			String stuNo = "";
			int roleId = 0;
			int accountId = 0;
			List<Account> list = accountDAO.findAll();
			for (Account acc : list) {
				if(acc.getAccount().equals(account.getAccount())){
					roleId = acc.getRole_id();
					stuNo = acc.getUser_no();
					accountId = acc.getId();
				}
			}
			session.put("roleId", roleId);
			session.put("stuNo", stuNo);
			session.put("accountId",accountId);
			session.put("pwd", account.getPwd());
			return "success";
		}else{
			return "error";
		}
	}
	
	public String addTeacAccount(){
		accountDAO.addAccount(account);
		return "success";
	}
	
	public String addStuAccount(){
		accountDAO.addAccount(account);
		return "success";
	}
	
	public String outLogin(){
		login.setAccount((String)session.get("account"));
		login.setLoginIn((String)session.get("LoginIn"));
		login.setLoginOut(loginDao.getCurrentDatetime());
		loginDao.saveLogin(login);
		session.remove("account");
		return "success";
	}
	
	public String findRecPages(){
		accounts = accountDAO.findRecPages(page, pageSize);
		total = accountDAO.findTotalPages(pageSize);
		return "success";
	}
	
	public String addTeacAcc(){
		teacher = teacherDao.findAllTeac();
		return "success";
	}
	
	public String addStuAcc(){
		students = studentDao.findAllStu();
		return "success";
	}
	
	
	public String showPersonal(){
		String stuNo = (String)session.get("stuNo");
		int stuId = 0;
		students = studentDao.showStudent(stuNo);
		for (Student stu : students) {
			if(stu.getNo().equals(stuNo)){
				stuId= stu.getId();
			}
		}
		student= studentDao.findStudentById(stuId);
		
		return "success";
	}
	
	
	
	public String loginTrue(){
		
		return "success";
	}
	
	public String loginhello(){
		return "success";
	}

	public String showInfo(){
		
		String pwd = (String)session.get("pwd");
		if(pagePwd.equals(pwd)){
			msg.put("checkpwd", "");
		}else{
			msg.put("checkpwd", "密码不正确");
		}
		return "success";
	}
	
	public String updatePwd(){
		int id = (Integer) session.get("accountId");
		String pwd = account.getPwd();
		account = accountDAO.findAccountById(id);
		account.setPwd(pwd);
		accountDAO.updateAccount(account);
		return "success";
	}
	
	
	public List<Account> getAccounts() {
		return accounts;
	}

	public void setAccounts(List<Account> accounts) {
		this.accounts = accounts;
	}


	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	public AccountDAO getAccountDAO() {
		return accountDAO;
	}

	public void setAccountDAO(AccountDAO accountDAO) {
		this.accountDAO = accountDAO;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public LoginDAO getLoginDao() {
		return loginDao;
	}

	public void setLoginDao(LoginDAO loginDao) {
		this.loginDao = loginDao;
	}

	public Login getLogin() {
		return login;
	}

	public void setLogin(Login login) {
		this.login = login;
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

	public List<Teacher> getTeacher() {
		return teacher;
	}

	public void setTeacher(List<Teacher> teacher) {
		this.teacher = teacher;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}
	
}
