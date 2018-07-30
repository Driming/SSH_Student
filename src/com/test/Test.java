package com.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


import com.action.GradeAction;
import com.action.TeacherAction;
import com.dao.AccountDAO;
import com.dao.CourseDao;
import com.dao.GradeDao;
import com.entity.Account;
import com.entity.Course;
import com.entity.Grade;
import com.entity.Major;
import com.entity.Role;
import com.entity.Teacher;


public class Test {
	public static void main(String[] args) {
		String path = "applicationContext.xml";
		ApplicationContext ac = new ClassPathXmlApplicationContext(path);
		AccountDAO a= (AccountDAO) ac.getBean("accountDAO");
	
		List<Account> list = a.findRecPages(1, 4);
		for (Account aa : list) {
			Role role = aa.getRole();
			System.out.println(aa.getAccount()+">>>"+aa.getPwd()+">>>"+role.getName());
			
		}
		
	}
}
