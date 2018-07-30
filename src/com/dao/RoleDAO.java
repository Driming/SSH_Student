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

import com.entity.Role;
@Repository
public class RoleDAO extends HibernateDaoSupport implements RoleDAOinterface{
	@Resource
	public void setSF(SessionFactory sf){
		super.setSessionFactory(sf);
	}
	
	public void saveRole(Role role) {
		HibernateTemplate ht=super.getHibernateTemplate();
		ht.save(role);
	}
	
	public void deleteRole(int id) {
		HibernateTemplate ht=super.getHibernateTemplate();
		Role role=new Role();
		role.setId(id);
		ht.delete(role);
	}

	public Role findRoleById(int id) {
		HibernateTemplate ht=super.getHibernateTemplate();
		Role role=(Role) ht.load(Role.class, id);
		return role;
	}
	
	public void updateRole(Role role) {
		HibernateTemplate ht=super.getHibernateTemplate();
		ht.update(role);
	}
	
	@SuppressWarnings("unchecked")
	public int findTotalPages(int pageSize) {
		HibernateTemplate ht=super.getHibernateTemplate();
		String hql="select count (*) from Role";
		List<Object> obj=ht.find(hql);
		int total=Integer.valueOf(obj.get(0).toString());
		if(total%pageSize==0){
			return total/pageSize;
		}else{
			return total/pageSize+1;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Role> findRecPages(final int page, final int pageSize) {
		HibernateTemplate ht=super.getHibernateTemplate();
		String hql="from Role";
		return ht.executeFind(new HibernateCallback() {
			
			public Object doInHibernate(Session session) throws HibernateException,
			SQLException {
				String hql="from Role";
				Query query=session.createQuery(hql);
				query.setFirstResult((page-1)*pageSize);
				query.setMaxResults(pageSize);
				List<Role> role=query.list();
				return role;
			}
		});
	}

}
