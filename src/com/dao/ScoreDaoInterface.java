package com.dao;

import java.util.List;
import com.entity.Score;

public interface ScoreDaoInterface {
    public Score findScoreById(int id);
	
	public void addScore(Score score);
	
	public void updataScore(Score score);
	
	public void deleteScore(int id);
	
	public List<Score> findRecPages(int page,int pageSize);
	
	public int findTotalPages(int pageSize);

}
