package com.alumni.core;

import java.util.Hashtable;

public class UserLocked {
	String lockedTable=null;//表名
	String lobkedField=null;//字段
	String username=null;//用户名
	String keyword=null;//数据库记录的关键字
	public void UserLocked(String lockedTable,String lockedField,String keyword,String username){
		
	}
	@SuppressWarnings("unchecked")
	public void UserLockedResoures(){
		@SuppressWarnings("unused")
		Hashtable LockResources;
	LockResources=new Hashtable();
	} 
	public void lock(UserLocked re){
		
	}
	public void unlock(UserLocked re){
		
	}
	public Boolean ifselfLocked(UserLocked re){//判断某资源被锁定
		return null;
		
	}
	public boolean isLocked(UserLocked re){//判断是否被锁定
		return false;
		
	}
	public void printResourceStatus(){//打印呗锁定的资源
		
	}
	public Hashtable GetLockedSrc(){//复制被锁定的资源列表
		return null;
		
	}
	public void UserLockedCopy(){//复制被锁定的资源
		
	}
	void Set(Hashtable locksrc){//设置被锁定的资源
		
	}
}

