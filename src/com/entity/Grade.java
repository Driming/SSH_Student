package com.entity;


public class Grade {
	private int id;
	private String name;
	private int teac_no;
	private Teacher teacher;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public int getTeac_no() {
		return teac_no;
	}
	public void setTeac_no(int teacNo) {
		teac_no = teacNo;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	
	
	
}
