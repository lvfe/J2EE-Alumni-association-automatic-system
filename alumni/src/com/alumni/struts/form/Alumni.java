package com.alumni.struts.form;

public class Alumni {
private int userID;
private String userName;
private String password;
private String realName;
private String gender;
private String birthday;
private String IDcardNum;
private String enterYear;
private String locationCity;
private String college;
private String classNum;
private String stuID;
private String phoneNum;
private String qqNum;
private String emailAddress;
private String company;
private String job;
private String mailAddress;
private String postCode;
private int status;


public Alumni(int userID, String userName, String password, String realName,
		String gender, String birthday, String iDcardNum, String enterYear,
		String locationCity, String college, String classNum, String stuID,
		String phoneNum, String qqNum, String emailAddress, String company,
		String job, String mailAddress, String postCode, int status) {
	super();
	this.userID = userID;
	this.userName = userName;
	this.password = password;
	this.realName = realName;
	this.gender = gender;
	this.birthday = birthday;
	IDcardNum = iDcardNum;
	this.enterYear = enterYear;
	this.locationCity = locationCity;
	this.college = college;
	this.classNum = classNum;
	this.stuID = stuID;
	this.phoneNum = phoneNum;
	this.qqNum = qqNum;
	this.emailAddress = emailAddress;
	this.company = company;
	this.job = job;
	this.mailAddress = mailAddress;
	this.postCode = postCode;
	this.status = status;
}
public void setUserID(int userID) {
	this.userID = userID;
}
public int getUserID() {
	return userID;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getUserName() {
	return userName;
}
public void setPassword(String password) {
	this.password = password;
}
public String getPassword() {
	return password;
}
public void setRealName(String realName) {
	this.realName = realName;
}
public String getRealName() {
	return realName;
}
public void setGender(String gender) {
	this.gender = gender;
}
public String getGender() {
	return gender;
}
public void setBirthday(String birthday) {
	this.birthday = birthday;
}
public String getBirthday() {
	return birthday;
}
public void setIDcardNum(String iDcardNum) {
	IDcardNum = iDcardNum;
}
public String getIDcardNum() {
	return IDcardNum;
}
public void setEnterYear(String enterYear) {
	this.enterYear = enterYear;
}
public String getEnterYear() {
	return enterYear;
}
public void setLocationCity(String locationCity) {
	this.locationCity = locationCity;
}
public String getLocationCity() {
	return locationCity;
}
public void setCollege(String college) {
	this.college = college;
}
public String getCollege() {
	return college;
}
public void setClassNum(String classNum) {
	this.classNum = classNum;
}
public String getClassNum() {
	return classNum;
}
public void setQqNum(String qqNum) {
	this.qqNum = qqNum;
}
public String getQqNum() {
	return qqNum;
}
public void setEmailAddress(String emailAddress) {
	this.emailAddress = emailAddress;
}
public String getEmailAddress() {
	return emailAddress;
}
public void setCompany(String company) {
	this.company = company;
}
public String getCompany() {
	return company;
}
public void setJob(String job) {
	this.job = job;
}
public String getJob() {
	return job;
}
public void setMailAddress(String mailAddress) {
	this.mailAddress = mailAddress;
}
public String getMailAddress() {
	return mailAddress;
}
public void setPostCode(String postCode) {
	this.postCode = postCode;
}
public String getPostCode() {
	return postCode;
}
public void setStatus(int status) {
	this.status = status;
}
public int getStatus() {
	return status;
}
public void setStuID(String stuID) {
	this.stuID = stuID;
}
public String getStuID() {
	return stuID;
}
public void setPhoneNum(String phoneNum) {
	this.phoneNum = phoneNum;
}
public String getPhoneNum() {
	return phoneNum;
}

}
