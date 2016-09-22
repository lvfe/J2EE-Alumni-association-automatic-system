package com.alumni.struts.form;



public class Message {
	private int id;
	private String subject;
	private String day;
	private String time;
	private String content;
	private int authorid;
	
	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setAuthorid(int authorid) {
		this.authorid = authorid;
	}
	public int getAuthorid() {
		return authorid;
	}
	

}
