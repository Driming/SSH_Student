package com.dao;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;


import com.entity.Grade;
import com.entity.Teacher;


@Repository
public class TeacherDao extends HibernateDaoSupport implements TeacherInterface {
  @Resource
    public void setSF(SessionFactory sf){
	  super.setSessionFactory(sf);
	  
  }
	public void addTeacher(Teacher teacher) {
		// TODO Auto-generated method stub
		HibernateTemplate template = super.getHibernateTemplate();
		template.save(teacher);
	}

	public void deleteTeacher(int id) {
		// TODO Auto-generated method stub
		HibernateTemplate template = super.getHibernateTemplate();
		Teacher teacher= (Teacher ) template.get(Teacher .class, id);
		template.delete( teacher);
	}

	public Teacher findTeacherByid(int id) {
		// TODO Auto-generated method stub
		HibernateTemplate template = super.getHibernateTemplate();
		Teacher teacher = (Teacher ) template.get( Teacher.class, id);
		return teacher;
		
	}

	@SuppressWarnings("unchecked")
	public List<Teacher> findRecPages(final int page, final int pageSize) {
		// TODO Auto-generated method stub
		HibernateTemplate template = super.getHibernateTemplate();

		return template.executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				String hql = "from Teacher";
				Query q = session.createQuery(hql);
				q.setFirstResult((page - 1) * pageSize);
				q.setMaxResults(pageSize);
				return q.list();
			}
		});
		
	}

	@SuppressWarnings("unchecked")
	public int findTotalPages(int pageSize) {
		// TODO Auto-generated method stub
		HibernateTemplate template = super.getHibernateTemplate();
		String hql = "select count(*) from Teacher";
		List<Object> list = template.find(hql);
		int count = Integer.valueOf(list.get(0).toString());
		int pages = 0;
		if (count % pageSize == 0) {
			pages = count / pageSize;
		} else {
			pages = count / pageSize + 1;
		}
		return pages;
		
	}

	public void updateTeacher(Teacher teacher) {
		// TODO Auto-generated method stub
		HibernateTemplate template = super.getHibernateTemplate();
		template.update(teacher);
	}
    
	
	@SuppressWarnings("unchecked")
	public List<Teacher> findAllTeac(){
		HibernateTemplate ht = getHibernateTemplate();
		return ht.find("from Teacher");
	}
	
	
	// 多对一
	public  void findbyTeacher() {
		HibernateTemplate template= super.getHibernateTemplate();
		@SuppressWarnings("unused")
		Grade grade = (Grade) template.get(Grade.class, 2);
    
	}
	
    
}
