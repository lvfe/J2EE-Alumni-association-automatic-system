package com.alumni.struts.dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.alumni.struts.action.*;
import com.alumni.struts.form.*;
import com.alumni.core.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MessageDAO {
	QueryRunner runner= new QueryRunner();
	
	
	/*
	 * count number
	 */
	public int messageIdMax(){
		Connection conn = new ConnDB().getConnection();
		int count = 0;
		Statement statement = null;
		try {
			statement = conn.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 ResultSet resultSet = null;
		try {
			resultSet = statement.executeQuery("select max(id) from message");
		} catch (SQLException e) {
			e.printStackTrace();
		}
        try {
			count=resultSet.getInt(1);
			System.out.println(count);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}
	/*
	 *search by id 
	 */
	@SuppressWarnings("deprecation")
	public Message findByID(int ID){
		Message message=null;
		Connection	conn = new ConnDB().getConnection();
		int messageid=ID;
		String sql="select * from message where id=?";
		try {
			message=(Message)runner.query(conn, sql, messageid, new BeanHandler<Message>(Message.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return message;
	}
	public int findItID(Message message){
		int mid=0;
		String sql="select * from message where subject='"+message.getSubject()+"'and day='"+message.getDay()+"'and time='"+message.getTime()+"'";
		System.out.println("SQl:"+sql);
		ConnDB conn=new ConnDB();
		ResultSet rs = conn.executeQuery(sql);
		try {
			if(rs.next()){
				mid=rs.getInt(1);
				System.out.println("mid:"+mid);
				return mid;}
			
		} catch (SQLException e) {
			System.out.println("没有此项");
			e.printStackTrace();
		}
		return mid;
	}
	/*
	 *delete by id 
	 */
	public boolean delMessage(int id) {
		int messageid=id;
		
			Connection conn = new ConnDB().getConnection();
		
		String sql="delete from message where id=?";
			try {
				runner.update(conn, sql, messageid);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return true;
		
	}
	/*
	 *list 
	 */
	@SuppressWarnings("unchecked")
	public List<Message> listMessage(){
		List<Message> list= new ArrayList<Message>();
		QueryRunner runner= new QueryRunner();
		Connection 
			conn = new ConnDB().getConnection();
		String sql="select * from message";
		try {
			list=(List<Message>)runner.query(conn,sql, new BeanListHandler(Message.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	/*
	 *save
	 */
	public int saveMessage(Message message){
		ConnDB conn = new ConnDB();
		String sql="insert into message(id,authorid,subject,content,day,time) values(seq_message.nextval,"+message.getAuthorid()+",'"+message.getSubject()+"','"+message.getContent()+"','"+message.getDay()+"','"+message.getTime()+"')" ;
		conn.executeUpdate(sql);
		int id=this.findItID(message);
		conn.close();
		return id;
		
	}
	/*
	 *update
	 */
	public boolean updateMessage(Message message) {
		Connection conn =new ConnDB().getConnection();
		String sql="update message set authorid=?,subject=?,content=?,day=?,time=? where id=?" ;
		Object[] objs={message.getAuthorid(),message.getSubject(),message.getContent(),message.getDay(),message.getTime(),message.getId()};
		
		try {
			runner.update(conn, sql, objs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
