package com.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.entity.College;
import com.entity.Major;
@Repository
public class CollegeDao extends HibernateDaoSupport implements CollegeDaoInterface {

	@Resource
	public void setSF(SessionFactory sf){
		super.setSessionFactory(sf);
	}
	
	public List<College> findAll(){
		HibernateTemplate ht = getHibernateTemplate();
		return ht.find("from College");
	}
	
	public void addCollege(College college) {
		HibernateTemplate ht = getHibernateTemplate();
		ht.save(college);
	}

	public void deleteCollege(int id) {
		HibernateTemplate ht = getHibernateTemplate();
		College college = new College();
		college.setId(id);
		ht.delete(college);
		
	}
	

	public College findCollegeById(int id) {
		HibernateTemplate ht = getHibernateTemplate();
		College college = (College)ht.get(College.class, id);
		return college;
	}

	@SuppressWarnings("unchecked")
	public List<College> findRecPages(final int page,final int pageSize) {
		HibernateTemplate ht = getHibernateTemplate();
		
		return ht.executeFind(new HibernateCallback() {
			
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = session.createQuery("from College");
				query.setFirstResult((page-1)*pageSize);
				query.setMaxResults(pageSize);
				return query.list();
			}
		});
	}

	public void updateCollege(College college) {
		HibernateTemplate ht = getHibernateTemplate();
		ht.update(college);
	}
	
	public int findTotalPages(int pageSize){
		
		HibernateTemplate ht = getHibernateTemplate();
		List<Object> list = ht.find("select count(*) from College");
		int rows = Integer.valueOf( list.get(0).toString());
	
		if(rows%pageSize==0){
			return rows/pageSize;
		}else{
			return rows/pageSize+1;
		}
		
	}

}
