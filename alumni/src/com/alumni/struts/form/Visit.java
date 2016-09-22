package com.alumni.struts.form;

public class Visit {
	private int isread;
	private int userid;
	private int mid;
	private int id;
	
	public Visit() {
		super();
		this.isread = 0;
	}
	public int getIsRead() {
		return isread;
	}
	public void setIsRead(int isread) {
		this.isread = isread;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public int getMid() {
		return mid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getUserid() {
		return userid;
	}
	

}
