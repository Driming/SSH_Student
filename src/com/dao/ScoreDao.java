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
import com.entity.Score;

@Repository
public class ScoreDao extends HibernateDaoSupport implements ScoreDaoInterface{
	@Resource  
	public void SF(SessionFactory sf){
		super.setSessionFactory(sf);
	}

	public void addScore(Score score) {
		HibernateTemplate template=super.getHibernateTemplate();
		template.save(score);
		System.out.println("添加成功");
		
	}

	public void deleteScore(int id) {
		HibernateTemplate template=super.getHibernateTemplate();
		Score score=new Score();
		score.setId(id);
		template.delete(score);
		System.out.println("删除成功");
		
	}

	@SuppressWarnings("unchecked")
	public List<Score> findRecPages(final int page, final int pageSize) {
        HibernateTemplate template=super.getHibernateTemplate();	
		return template.executeFind(new HibernateCallback() {		
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				String hql="from Score";
				Query query=session.createQuery(hql);
				query.setFirstResult((page-1)*pageSize);
				query.setMaxResults(pageSize);
				return query.list();
			}
		});
	}

	public Score findScoreById(int id) {
		HibernateTemplate template=super.getHibernateTemplate();
		Score score=(Score) template.get(Score.class, id);
		return score;
	}

	public int findTotalPages(int pageSize) {
		HibernateTemplate template=super.getHibernateTemplate();
		String hql="select count(*) from Score";
		List<Object> list=template.find(hql);
		int rows=(Integer.parseInt(list.get(0).toString()));
		if (rows%pageSize==0) {
			return rows/pageSize;
		}else {
			return rows/pageSize+1;
		}
	}

	public void updataScore(Score score) {
		HibernateTemplate template=super.getHibernateTemplate();
		template.update(score);
		System.out.println("修改成功");
		
	}

}
