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

import com.entity.Major;
@Repository
public class MajorDao extends HibernateDaoSupport  implements MajorDaoInterface {

	@Resource
	public void SetSF(SessionFactory sf){
		super.setSessionFactory(sf);
	}
	public void addMajor(Major major) {
		HibernateTemplate ht = getHibernateTemplate();
		ht.save(major);
	}

	public void deleteMajor(int id) {
		HibernateTemplate ht = getHibernateTemplate();
		Major major = new Major();
		major.setId(id);
		ht.delete(major);
		
	}

	public Major findMajorById(int id) {
		HibernateTemplate ht = getHibernateTemplate();
		Major major = (Major)ht.get(Major.class, id);
		return major;
	}

	@SuppressWarnings("unchecked")
	public List<Major> findRecPages(final int page,final int pageSize) {
		HibernateTemplate ht = getHibernateTemplate();
		return ht.executeFind(new HibernateCallback() {
			
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = session.createQuery("from Major");
				query.setFirstResult((page-1)*pageSize);
				query.setMaxResults(pageSize);
				return query.list();
			}
		});
	}

	public void updateMajor(Major major) {
		HibernateTemplate ht = getHibernateTemplate();
		ht.update(major);
	}
	
	public int findTotalPages(int pageSize){
		
		HibernateTemplate ht = getHibernateTemplate();
		List<Object> list = ht.find("select count(*) from Major");
		int rows = Integer.valueOf( list.get(0).toString());
	
		if(rows%pageSize==0){
			return rows/pageSize;
		}else{
			return rows/pageSize+1;
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public List<Major> findAll(final int cid){
		HibernateTemplate ht = getHibernateTemplate();
		return ht.executeFind(new HibernateCallback() {
			
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = session.createQuery("from Major where college_id=?");
				query.setInteger(0, cid);
				return query.list();
			}
		});
	}

}
