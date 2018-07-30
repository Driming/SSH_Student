package com.entity;

import java.util.HashSet;
import java.util.Set;

public class Major {

	private int id;
	private String name;
	private String text;
	private int college_id;
	private College college;

	public College getCollege() {
		return college;
	}
	public void setCollege(College college) {
		this.college = college;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getCollege_id() {
		return college_id;
	}
	public void setCollege_id(int collegeId) {
		college_id = collegeId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
}
