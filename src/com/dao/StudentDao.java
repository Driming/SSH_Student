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

import com.entity.Student;

@Repository("studentDao")
public class StudentDao extends HibernateDaoSupport implements StudentDaoInterfaces{
	@Resource  
	public void SF(SessionFactory sf){
		super.setSessionFactory(sf);
	}

	
	public List<Student> findAllStu(){
		HibernateTemplate ht = getHibernateTemplate();
		return ht.find("from Student");
		
	}
	public void addStudent(Student student) {
			HibernateTemplate template=super.getHibernateTemplate();
			template.save(student);
	}

	public void deleteStudent(int id) {
		HibernateTemplate template=super.getHibernateTemplate();
		Student student=new Student();
		student.setId(id);
		template.delete(student);
	}

	@SuppressWarnings("unchecked")
	public List<Student> findRecPages(final int page, final int pageSize) {
		
		HibernateTemplate template=super.getHibernateTemplate();
		return template.executeFind(new HibernateCallback() {
			
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				String hql="from Student";
				Query query=session.createQuery(hql);
				query.setFirstResult((page-1)*pageSize);
				query.setMaxResults(pageSize);
				return query.list();
			}
		});

	}

	public Student findStudentById(int id) {
		HibernateTemplate template=super.getHibernateTemplate();
		Student student=(Student) template.get(Student.class, id);
		return student;
	}

	public int findTotalPages(int pageSize) {
		HibernateTemplate template=super.getHibernateTemplate();
		String hql="select count(*) from Student";
		List<Object> list=template.find(hql);
		int rows=(Integer.parseInt(list.get(0).toString()));
		if (rows%pageSize==0) {
			return rows/pageSize;
		}else {
			return rows/pageSize+1;
		}
	}

	public void updataStudent(Student student) {
		HibernateTemplate template=super.getHibernateTemplate();
		template.update(student);
	}
	
	@SuppressWarnings("unchecked")
	public List<Student> showStudent(final String stuNo){
		HibernateTemplate ht = getHibernateTemplate();
		return ht.executeFind(new HibernateCallback() {
			
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = session.createQuery("from Student where no=?");
				query.setString(0, stuNo);
				
				return query.list();
			}
		});
		
	}

}
