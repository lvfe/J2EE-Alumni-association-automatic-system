package com.alumni.struts.dao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.alumni.core.*;
import com.alumni.struts.action.*;
import com.alumni.struts.form.PersonnelForm;
import com.alumni.struts.form.Visit;


public class VisitDAO {
	QueryRunner runner= new QueryRunner();
	@SuppressWarnings("deprecation")
	public int returnVid(int mid, int uid){
		
		Connection conn=new ConnDB().getConnection();
		String sql="select * from visit where mid=? and userid=?";
		Object[] obj={mid,uid};
		Visit visit=null;
		List<Visit> list= null;
		try {
			list = (List<Visit>)runner.query(conn, sql, obj, new BeanListHandler<Visit>(Visit.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
		Iterator<Visit> it=list.iterator();
		visit=(Visit)it.next();
		return visit.getId();
	}
	
	@SuppressWarnings("deprecation")
	public List<Visit> unVisitList(int mid){
		ConnDB conn=new ConnDB();
		List<Visit> list =  new ArrayList<Visit>();
	       Visit v = null;
	       String sql="select * from visit where mid='"+mid+"' and isread=0";
	       
	       ResultSet rs = conn.executeQuery(sql);
	       try {
	           while (rs.next()) {
	               v = new Visit();
	               v.setId(rs.getInt(1));
	               v.setMid(rs.getInt(2));
	               v.setUserid(rs.getInt(3));
	               v.setIsRead(rs.getInt(4));
	               list.add(v);
	           }
	       } catch (SQLException ex) {}
		return list;
		
	}
	public List<Visit> messageList(int mid){
		Connection conn=new ConnDB().getConnection();
		String sql="select * from visit where mid=?";
		List<Visit> list =  new ArrayList<Visit>();
		try {
			list=(List<Visit>)runner.query(conn, sql, mid, new BeanListHandler<Visit>(Visit.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}
	public List<Visit> unVisitMessageList(int uid){
		Connection conn=new ConnDB().getConnection();
		String sql="select * from visit where userid=? and isread=?";
		Object[] obj={uid,0};
		List<Visit> list =  null;
		try {
			list=(List<Visit>)runner.query(conn, sql, obj, new BeanListHandler<Visit>(Visit.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}
	@SuppressWarnings("deprecation")
	
	public Visit findById(int vid){
		Visit visit=new Visit();
		Connection conn=new ConnDB().getConnection();
		int id=vid;
		String sql="select * from message where id=?";
		try {
			visit=(Visit)runner.query(conn, sql, id, new BeanHandler<Visit>(Visit.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return visit;
		
	}
	public int addMessage(Visit visit){
		ConnDB conn=new ConnDB();
		int flag=0;
		String sql="insert into visit(id,mid,userid,isread) values(seq_visit.nextval,"+visit.getMid()+","+visit.getUserid()+","+visit.getIsRead()+")" ;
		flag=conn.executeUpdate(sql);
		System.out.println(sql);
		if(flag==0) return 0;
		conn.close();
		return 1;
	}
	
	@SuppressWarnings("unchecked")
	public static List<Visit> listVisit(){
		List<Visit> list= new ArrayList<Visit>();
		QueryRunner runner= new QueryRunner();
		Connection conn=new ConnDB().getConnection();
		String sql="select * from message";
		try {
			list=(List<Visit>)runner.query(conn,sql, new BeanListHandler(Visit.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}
	
	public boolean delVisit(int vid){
		
		Connection conn=new ConnDB().getConnection();
	
	String sql="delete from message where id=?";
		try {
			runner.update(conn, sql, vid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
		
	}

	public boolean visitMessage(int mid, int uid){
		int vid=this.returnVid(mid, uid);
		Connection conn=new ConnDB().getConnection();
		String sql="update visit set mid=?,userid=?,isread=? where id=?" ;
		Object[] objs={mid,uid,1,vid};
		
		try {
			runner.update(conn, sql, objs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	
	}
//del all visit where userid=id
	public boolean delMessage(int userid) {
		Connection conn=new ConnDB().getConnection();
		
		String sql="delete from visit where userid=?";
			try {
				runner.update(conn, sql, userid);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
			return true;
		
	}
	//del all visit where mid=id
	public boolean delPersonnel(int mid){
		Connection conn=new ConnDB().getConnection();
		
		String sql="delete from visit where mid=?";
			try {
				runner.update(conn, sql, mid);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		
		return true;
		
	}
}
