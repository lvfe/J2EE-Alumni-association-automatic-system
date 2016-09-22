package com.alumni.struts.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.alumni.struts.form.*;
import com.alumni.core.*;

public class AlumniDao extends BaseDAO{

	private PreparedStatement ps;
	private ResultSet rs;

	public Alumni detailAlumniByUserID(String userName){
		ConnDB co=new ConnDB();
Connection conn=co.getConnection();
		String sql="select * from alumni where userName=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, userName);
			rs=ps.executeQuery();
			if(rs.next()){
				int userID=rs.getInt("userID");
				String uName=rs.getString("userName");
				String password=rs.getString("password");
				String realName=rs.getString("realName");
				String gender=rs.getString("gender");
				String birthday=rs.getString("birthday");
				String IDcardNum=rs.getString("IDcardNum");
				String enterYear=rs.getString("enterYear");
				String locationCity=rs.getString("locationCity");
				String college=rs.getString("college");
				String classNum=rs.getString("classNum");
				String stuID=rs.getString("stuID");
				String phoneNum=rs.getString("phoneNum");
				String qqNum=rs.getString("qqNum");
				String emailAddress=rs.getString("emailAddress");
				String company=rs.getString("company");
				String job=rs.getString("job");
				String mailAddress=rs.getString("mailAddress");
				String postCode=rs.getString("postCode");
				int status=rs.getInt("status");
				Alumni alumni=new Alumni(userID,uName,password,realName,gender,
							birthday,IDcardNum,enterYear,locationCity,college,
							classNum,stuID,phoneNum,qqNum,emailAddress,
							company,job,mailAddress,postCode,status);
				return alumni;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			co.close();
		}

		return null;

	}

	public boolean isValidUserName(String userName){   // 用户名是否唯一
		boolean f=true;
		ConnDB co=new ConnDB();
		Connection conn=co.getConnection();
		String sql="select userName from alumni where userName=?";
		try{
			ps=conn.prepareStatement(sql);
			ps.setString(1, userName);
			rs=ps.executeQuery();
			if(rs.next()){
				f=true;
			}
			else{
				f=false;
			}
		}catch(SQLException e){ 
			e.printStackTrace();
		}finally{
			co.close();
		}
		return f;
	}
	
	public boolean isValidStuID(String stuID){   // 学号是否唯一
		boolean f=true;
		ConnDB co=new ConnDB();
		Connection conn=co.getConnection();
		String sql="select stuID from alumni where stuID=?";
		try{
			ps=conn.prepareStatement(sql);
			ps.setString(1, stuID);
			rs=ps.executeQuery();
			if(rs.next()){
				f=true;
			}
			else{
				f=false;
			}
		}catch(SQLException e){ 
			e.printStackTrace();
		}finally{
			co.close();
		}
		return f;
	}

	public boolean addUser(List list){  //status=0 未审核
		String sql="insert into alumni(userID,userName,password,stuID,realName,enterYear,college,classNum,status) " +
				"values(seq_alumni.nextval,?,?,?,?,?,?,?,0)";
		boolean flag=executeSQL(sql,list);
		if(flag){
			return true;
		}else{
			return false;
		}

	}

	public List queryUncheckedUserlist(){   //需要审核的名单
		ConnDB co=new ConnDB();
		Connection conn=co.getConnection();
		List list=new ArrayList();
		String sql="select * from alumni where status=0 order by userID";
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				int userID=rs.getInt("userID");
				String userName=rs.getString("userName");
				String password=rs.getString("password");
				String realName=rs.getString("realName");
				String gender=rs.getString("gender");
				String birthday=rs.getString("birthday");
				String IDcardNum=rs.getString("IDcardNum");
				String enterYear=rs.getString("enterYear");
				String locationCity=rs.getString("locationCity");
				String college=rs.getString("college");
				String classNum=rs.getString("classNum");
				String stuID=rs.getString("stuID");
				String phoneNum=rs.getString("phoneNum");
				String qqNum=rs.getString("qqNum");
				String emailAddress=rs.getString("emailAddress");
				String company=rs.getString("company");
				String job=rs.getString("job");
				String mailAddress=rs.getString("mailAddress");
				String postCode=rs.getString("postCode");
				int status=rs.getInt("status");
				Alumni alumni=new Alumni(userID,userName,password,realName,gender,
							birthday,IDcardNum,enterYear,locationCity,college,
							classNum,stuID,phoneNum,qqNum,emailAddress,
							company,job,mailAddress,postCode,status);
				list.add(alumni);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			co.close();
		}
		return list;
	}
	
	public  List  queryCheckedUserlist(){   //已经审核的名单
		ConnDB co=new ConnDB();
		Connection conn=co.getConnection();
		List list=new ArrayList();
		String sql="select * from alumni where status=1 order by userID";
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				int userID=rs.getInt("userID");
				String userName=rs.getString("userName");
				String password=rs.getString("password");
				String realName=rs.getString("realName");
				String gender=rs.getString("gender");
				String birthday=rs.getString("birthday");
				String IDcardNum=rs.getString("IDcardNum");
				String enterYear=rs.getString("enterYear");
				String locationCity=rs.getString("locationCity");
				String college=rs.getString("college");
				String classNum=rs.getString("classNum");
				String stuID=rs.getString("stuID");
				String phoneNum=rs.getString("phoneNum");
				String qqNum=rs.getString("qqNum");
				String emailAddress=rs.getString("emailAddress");
				String company=rs.getString("company");
				String job=rs.getString("job");
				String mailAddress=rs.getString("mailAddress");
				String postCode=rs.getString("postCode");
				int status=rs.getInt("status");
				Alumni alumni=new Alumni(userID,userName,password,realName,gender,
							birthday,IDcardNum,enterYear,locationCity,college,
							classNum,stuID,phoneNum,qqNum,emailAddress,
							company,job,mailAddress,postCode,status);
				list.add(alumni);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			co.close();
		}
		return list;
	}

	public Alumni querydetailAlumni(int userId){
		ConnDB co=new ConnDB();
		Connection conn=co.getConnection();
		String sql="select * from alumni where userID=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, userId);
			rs=ps.executeQuery();
			if(rs.next()){
				int userID=rs.getInt("userID");
				String userName=rs.getString("userName");
				String password=rs.getString("password");
				String realName=rs.getString("realName");
				String gender=rs.getString("gender");
				String birthday=rs.getString("birthday");
				String IDcardNum=rs.getString("IDcardNum");
				String enterYear=rs.getString("enterYear");
				String locationCity=rs.getString("locationCity");
				String college=rs.getString("college");
				String classNum=rs.getString("classNum");
				String stuID=rs.getString("stuID");
				String phoneNum=rs.getString("phoneNum");
				String qqNum=rs.getString("qqNum");
				String emailAddress=rs.getString("emailAddress");
				String company=rs.getString("company");
				String job=rs.getString("job");
				String mailAddress=rs.getString("mailAddress");
				String postCode=rs.getString("postCode");
				int status=rs.getInt("status");
				Alumni alumni=new Alumni(userID,userName,password,realName,gender,
							birthday,IDcardNum,enterYear,locationCity,college,
							classNum,stuID,phoneNum,qqNum,emailAddress,
							company,job,mailAddress,postCode,status);
				return alumni;
			} 

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			co.close();
		}
		return null;
	}

	public boolean deleteAlumni(List list){
		String sql="delete alumni where userID=?";
		boolean flag=executeSQL(sql, list);
		if(flag){
			return true;
		}else{

			return false;
		}
	}

	public boolean deleteAlumniAll(String temp){
		String sql="delete from alumni where userID in ("+temp+")";
		boolean flag=executeSQL(sql, null);
		if(flag){
			return true;

		}else{
			return false;
		}

	}

	public boolean setAlumniChecked(List list){
		String sql="update alumni set status=1 where userID=?"; //通过审核
		boolean flag=executeSQL(sql, list);

		if(flag){
			return true;
		}else{
			return false;
		}

	}
	
	public boolean updatePassword(List list){
		String sql="update alumni set password=? where userID=?"; 
		boolean flag=executeSQL(sql, list);

		if(flag){
			return true;
		}else{
			return false;
		}

	}
	
	public boolean updateAlumni(List list){
		String sql="update alumni set " +
				"userName=?, realName=?, gender=?, birthday=?, " +
				"IDcardNum=?, enterYear=?, locationCity=?, college=?, classNum=?, stuID=?, " +
				"phoneNum=?, qqNum=?, emailAddress=?, company=?, " +
				"job=?, mailAddress=?, postCode=? " +
				"where userID=?";
		boolean flag=executeSQL(sql,list);
		if(flag){
			return true;
		}else{
			return false;
		}

	}

	public boolean validateAlumni(String uName,String pwd){
		String sql="select * from alumni where userName=? and password=?";
		ConnDB co=new ConnDB();
		Connection conn=co.getConnection();
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, uName);
			ps.setString(2, pwd);
			rs=ps.executeQuery();
			if(rs.next()){
				return true;	      
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			co.close();
		}
		return false;

	}
	
	public List querySearchAlumnilist(String searchCondition, String contents){   // 查询校友信息
		ConnDB co=new ConnDB();
		Connection conn=co.getConnection();
		List list=new ArrayList();
		String sql="select * from alumni where " + searchCondition + " like '%" + contents + "%' and status=1 order by userID";
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				int userID=rs.getInt("userID");
				String userName=rs.getString("userName");
				String password=rs.getString("password");
				String realName=rs.getString("realName");
				String gender=rs.getString("gender");
				String birthday=rs.getString("birthday");
				String IDcardNum=rs.getString("IDcardNum");
				String enterYear=rs.getString("enterYear");
				String locationCity=rs.getString("locationCity");
				String college=rs.getString("college");
				String classNum=rs.getString("classNum");
				String stuID=rs.getString("stuID");
				String phoneNum=rs.getString("phoneNum");
				String qqNum=rs.getString("qqNum");
				String emailAddress=rs.getString("emailAddress");
				String company=rs.getString("company");
				String job=rs.getString("job");
				String mailAddress=rs.getString("mailAddress");
				String postCode=rs.getString("postCode");
				int status=rs.getInt("status");
				Alumni alumni=new Alumni(userID,userName,password,realName,gender,
							birthday,IDcardNum,enterYear,locationCity,college,
							classNum,stuID,phoneNum,qqNum,emailAddress,
							company,job,mailAddress,postCode,status);
				list.add(alumni);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			co.close();
		}
		return list;
	}
	
	public List queryCheckedUserlistBy20(){   //最新加入（只显示审核的）
		ConnDB co=new ConnDB();
		Connection conn=co.getConnection();
		List list=new ArrayList();
		String sql="select * from (select * from alumni where status=1 order by userID desc) where rownum<=20";
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				int userID=rs.getInt("userID");
				String userName=rs.getString("userName");
				String password=rs.getString("password");
				String realName=rs.getString("realName");
				String gender=rs.getString("gender");
				String birthday=rs.getString("birthday");
				String IDcardNum=rs.getString("IDcardNum");
				String enterYear=rs.getString("enterYear");
				String locationCity=rs.getString("locationCity");
				String college=rs.getString("college");
				String classNum=rs.getString("classNum");
				String stuID=rs.getString("stuID");
				String phoneNum=rs.getString("phoneNum");
				String qqNum=rs.getString("qqNum");
				String emailAddress=rs.getString("emailAddress");
				String company=rs.getString("company");
				String job=rs.getString("job");
				String mailAddress=rs.getString("mailAddress");
				String postCode=rs.getString("postCode");
				int status=rs.getInt("status");
				Alumni alumni=new Alumni(userID,userName,password,realName,gender,
							birthday,IDcardNum,enterYear,locationCity,college,
							classNum,stuID,phoneNum,qqNum,emailAddress,
							company,job,mailAddress,postCode,status);
				list.add(alumni);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			co.close();
		}
		return list;
	}

}
