package com.entity;

public class Course {

	private int id;
	private String name;
	private int major_id;
	private String text;
	private Major major;
	public Major getMajor() {
		return major;
	}
	public void setMajor(Major major) {
		this.major = major;
	}
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
	public int getMajor_id() {
		return major_id;
	}
	public void setMajor_id(int majorId) {
		major_id = majorId;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
}
