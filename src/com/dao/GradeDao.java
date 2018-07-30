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

@Repository("gradeDao")
public class GradeDao extends HibernateDaoSupport  implements GradeInterface{

	@Resource
	public void setSF(SessionFactory sf) {
		super.setSessionFactory(sf);

	}
	
	
	
	public void addGrade(Grade grade) {
		// TODO Auto-generated method stub
		HibernateTemplate template = super.getHibernateTemplate();
		template.save(grade);
		
	}

	public void deleteGrade(int id) {
		// TODO Auto-generated method stub
		HibernateTemplate template = super.getHibernateTemplate();
		Grade grade= (Grade) template.get(Grade.class, id);
		template.delete(grade);
	}

	@SuppressWarnings("unchecked")
	public List<Grade> findRecPages(final int page, final int pageSize) {
		// TODO Auto-generated method stub
		HibernateTemplate template = super.getHibernateTemplate();
		return template.executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				String hql = "from Grade";
				Query q = session.createQuery(hql);
				q.setFirstResult((page - 1) * pageSize);
				q.setMaxResults(pageSize);
				return q.list();
			}
			});
	}
	
	public int findTotalPages(int pageSize) {
		HibernateTemplate template = super.getHibernateTemplate();
		String hql = "select count(*) from Grade";
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
	
	

	public Grade findGradeByid(int id) {
		HibernateTemplate template = super.getHibernateTemplate();
		Grade grade = (Grade) template.get(Grade.class, id);
//		Teacher t = grade.getTeacher();
//		System.out.println(grade.getName()+">>>"+t.getId()+">>>"+t.getName());
		return grade;
		// TODO Auto-generated method stub
		
	}

	public void updateGrade(Grade grade) {
		// TODO Auto-generated method stub
		HibernateTemplate template = super.getHibernateTemplate();
		template.update(grade);
		
	}

	public List<Grade> findAll() {
		HibernateTemplate template = super.getHibernateTemplate();
		return template.find("from Grade");
	}

	

	@SuppressWarnings("unchecked")
	public List<Teacher> findTeacher(final String manager){
		HibernateTemplate template = super.getHibernateTemplate();
		return template.executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				String hql = "from Teacher  where manager=?";
				Query q = session.createQuery(hql);
				q.setString(0, manager);
				return q.list();
			}
		});
	}

	

}
