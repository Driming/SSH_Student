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

import com.entity.Course;
import com.entity.Major;
@Repository
public class CourseDao extends HibernateDaoSupport  implements CourseDaoInterface {

	@Resource
	public void SetSF(SessionFactory sf){
		super.setSessionFactory(sf);
	}
	public void addCourse(Course course) {
		HibernateTemplate ht = getHibernateTemplate();
		ht.save(course);
		
	}

	public void deleteCourse(int id) {
		HibernateTemplate ht = getHibernateTemplate();
		Course course = new Course();
		course.setId(id);
		ht.delete(course);
		
	}

	public Course findCourseById(int id) {
		HibernateTemplate ht = getHibernateTemplate();
		Course course = (Course)ht.get(Course.class, id);
		return course;
	}

	@SuppressWarnings("unchecked")
	public List<Course> findRecPages(final int page, final int pageSize) {
		HibernateTemplate ht = getHibernateTemplate();
		return ht.executeFind(new HibernateCallback() {
			
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = session.createQuery("from Course");
				query.setFirstResult((page-1)*pageSize);
				query.setMaxResults(pageSize);
				return query.list();
			}
		});
		
	}
	
	

	public void updateCourse(Course course) {
		HibernateTemplate ht = getHibernateTemplate();
		ht.update(course);
	}
	
	public int findTotalPages(int pageSize){
		
		HibernateTemplate ht = getHibernateTemplate();
		List<Object> list = ht.find("select count(*) from Course");
		int rows = Integer.valueOf( list.get(0).toString());
	
		if(rows%pageSize==0){
			return rows/pageSize;
		}else{
			return rows/pageSize+1;
		}
		
	}
	
	public List<Course> findAll() {
		HibernateTemplate ht = getHibernateTemplate();
		String hql="from Course";
		List<Course> list=ht.find(hql);
		return list;
	}
	
	
	
}
