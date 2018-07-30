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

import com.entity.Account;

@Repository("accountDAO")
public class AccountDAO extends HibernateDaoSupport implements AccountDaoInterface{

	@Resource
	public void setSF(SessionFactory sf){
		super.setSessionFactory(sf);
	}
	
	public List<Account> findAll(){
		HibernateTemplate ht = getHibernateTemplate();
		List<Account>list  = ht.find("from Account");
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public boolean checklogin(final String account ,final String pwd){
		HibernateTemplate ht = getHibernateTemplate();
		
		List<Account> list =  ht.executeFind(new HibernateCallback() {
			
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = session.createQuery("from Account where account=? and pwd=?");
				query.setString(0, account);
				query.setString(1, pwd);
				return query.list();
			}
		});
		
		if(list.size()!=0){
			return true;
		}else{
			return false;
		}
	}



	public void addAccount(Account account) {
		// TODO Auto-generated method stub
		HibernateTemplate ht = getHibernateTemplate();
		ht.save(account);
	}



	public void deleteAccount(int id) {
		// TODO Auto-generated method stub
		HibernateTemplate ht = getHibernateTemplate();
		Account account = new Account();
		account.setId(id);
		ht.delete(account);
	}



	public Account findAccountById(int id) {
		// TODO Auto-generated method stub
		HibernateTemplate ht = getHibernateTemplate();
		Account account = (Account) ht.get(Account.class, id);
		return account;
	}
	
	@SuppressWarnings("unchecked")
	public List<Account> findAccout(final String no){
		HibernateTemplate ht = getHibernateTemplate();
		List<Account> list = ht.executeFind(new HibernateCallback() {
			
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = session.createQuery("from Account where user_no");
				query.setString(0, no);
				return query.list();
			}
		});
		return list;
	}



	@SuppressWarnings("unchecked")
	public List<Account> findRecPages(final int page, final int pageSize) {
		// TODO Auto-generated method stub
		HibernateTemplate ht = getHibernateTemplate();
		return ht.executeFind(new HibernateCallback() {
			
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				// TODO Auto-generated method stub
				Query query = session.createQuery("from Account");
				query.setFirstResult((page-1)*pageSize);
				query.setMaxResults(pageSize);
				return query.list();
			}
		});
		
	}



	public void updateAccount(Account account) {
		// TODO Auto-generated method stub
		HibernateTemplate ht = getHibernateTemplate();
		ht.update(account);
		
	}
	
	public int findTotalPages(int pageSize){
		
		HibernateTemplate ht = getHibernateTemplate();
		List<Object> list = ht.find("select count(*) from Account");
		int rows = Integer.valueOf(list.get(0).toString());
		
		if(rows % pageSize == 0){
			return rows / pageSize;
		}else{
			return rows / pageSize + 1;
		}
		
	}
	

}
