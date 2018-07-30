package com.dao;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.entity.Login;

/**
 * 登录日志
 * @author Administrator
 *
 */

@Repository
public class LoginDAO extends HibernateDaoSupport implements LoginDAOinterface{
	@Resource
	public void setSF(SessionFactory sf){
		super.setSessionFactory(sf);
	}

	public void saveLogin(Login log) {
		HibernateTemplate ht=super.getHibernateTemplate();
		ht.save(log);
	}

	public void deleteLogin(int id) {
		HibernateTemplate ht=super.getHibernateTemplate();
		Login log=new Login();
		log.setId(id);
		ht.delete(log);
	}
	
	public void delAll(final Object[] ids){
		HibernateTemplate ht = getHibernateTemplate();
		 final String hql = "delete Login where id in (:ids) ";
		 ht.execute(new HibernateCallback() {
			
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				 Query query = session.createQuery(hql);
	                query.setParameterList("ids", ids);
	                
	                return query.executeUpdate();
			}
		});
	}

	public List<Login> findAll(){
		HibernateTemplate ht = getHibernateTemplate();
		 return ht.find("from Login");
	}
	
	public Login findLoginById(int id) {
		HibernateTemplate ht=super.getHibernateTemplate();
		Login log=(Login) ht.load(Login.class, id);
		return log;
	}

	public void updateLogin(Login log) {
		HibernateTemplate ht=super.getHibernateTemplate();
		ht.update(log);
	}

	@SuppressWarnings("unchecked")
	public List<Login> findRecPages(final int page, final int pageSize) {
		HibernateTemplate ht=super.getHibernateTemplate();
		return ht.executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				String hql="from Login";
				Query query=session.createQuery(hql);
				query.setFirstResult((page-1)*pageSize);
				query.setMaxResults(pageSize);
				List<Login> list=query.list();
				return list;
			}
		});
	}

	public int findTotalPages(int pageSize) {
		HibernateTemplate ht=super.getHibernateTemplate();
		String hql="select count (*) from Login";
		List<Object> obj=ht.find(hql);
		int total=Integer.valueOf(obj.get(0).toString());
		if(total%pageSize==0){
			return total/pageSize;
		}else{
			return total/pageSize+1;
		}
	}
	
	public String getCurrentDatetime(){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(new Date());
	}
	

}
