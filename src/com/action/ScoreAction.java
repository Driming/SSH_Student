package com.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.dao.ScoreDao;
import com.entity.Score;



@Controller
public class ScoreAction {
	@Resource
	private ScoreDao dao;
	private int id;
	private Score score;
    private List<Score> scores;
    private int page=1;
    private int pageSize=5;
    private int pages;
    
    public String findpages() {
    	scores=dao.findRecPages(page, pageSize);
    	pages=dao.findTotalPages(pageSize);
    	System.out.println("总页数:"+pages);
		return "success";
	}
    public String modify() {
        score=dao.findScoreById(id); 
    	return "success";
	}
    public String update() {
    	dao.updataScore(score);
    	return "success";
	}
    public String addScore() {
    	dao.addScore(score);
    	return "success";
	}
    public String delete() {
    	dao.deleteScore(id);
    	return "success";
	}
    
    
	public Score getScore() {
		return score;
	}
	public void setScore(Score score) {
		this.score = score;
	}
	public ScoreDao getDao() {
		return dao;
	}
	public void setDao(ScoreDao dao) {
		this.dao = dao;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public List<Score> getScores() {
		return scores;
	}
	public void setScores(List<Score> scores) {
		this.scores = scores;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPages() {
		return pages;
	}
	public void setPages(int pages) {
		this.pages = pages;
	}

}
