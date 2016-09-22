package com.alumni.struts.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;

import com.alumni.core.ConnDB;
import com.alumni.struts.form.ReverseForm;


public class ReverseDAO extends BaseDAO {
	QueryRunner runner= new QueryRunner();
	private ConnDB conn=new ConnDB();
	@SuppressWarnings("unchecked")
	public List queryReplyMessage(int messageid){
		List list=new ArrayList();
		String sql="select * from reply where mid="+messageid;
		ResultSet rs = conn.executeQuery(sql);
		try {
			while(rs.next()){
				int id=rs.getInt("id");
				int mid=rs.getInt("mid");
				int pid=rs.getInt("pid");
				String subject=rs.getString("subject");
				String content=rs.getString("content");
				String time=rs.getString("time");
				ReverseForm reply=new ReverseForm();
				reply.setId(id);
				reply.setMid(mid);
				reply.setPid(pid);
				reply.setSubject(subject);
				reply.setTime(time);
				reply.setContent(content);
				list.add(reply);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeC();
		}
		return list;
	}
	
	public  boolean  addReply(ReverseForm reply){
		ConnDB conn = new ConnDB();
		String sql="insert into reply(id,mid,pid,subject,content,time) values(seq_reply.nextval,"+reply.getMid()+","+reply.getPid()+",'"+reply.getSubject()+"','"+reply.getContent()+"','"+reply.getTime()+"')" ;
		System.out.println("sql:"+sql);
		int flag=conn.executeUpdate(sql);
		if(flag==0) return false;
		return true;
	}
	public boolean delReply(int id) {
		int rid=id;
		
			Connection conn = new ConnDB().getConnection();
		
		String sql="delete from reply where id=?";
			try {
				runner.update(conn, sql, rid);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return true;
		
	}
}
