package com.alumni.struts.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.util.List;

import com.alumni.core.ConnDB;
import com.alumni.struts.form.PersonnelForm;


public class PersonnelDAO {
	private ConnDB conn=new ConnDB();
	public int findItId(PersonnelForm cF){
		int id=0;
		String sql="select * from users where name='"+cF.getName()+"'";
		ResultSet rs = conn.executeQuery(sql);
		try {
			if(rs.next()){
				id=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
		
	}
   public int insert(PersonnelForm cF) {
       String sql1="SELECT * FROM users WHERE username='"+cF.getUsername()+"'";
       ResultSet rs = conn.executeQuery(sql1);
       String sql = "";
       int falg = 0;
           try {
               if (rs.next()) {
                   falg=2;
               } else {
                   sql = "INSERT INTO users (userID,username,name,password,status,mobileTel,email,emailpass) values(seq_users.nextval,'" +
                   cF.getUsername()+"','"+cF.getName() + "','" +cF.getPassword()+"',"+cF.getStatus()+",'"+cF.getMobileTel()+"','"+cF.getEmail()+"','"+cF.getEmailpass()+"')";
                   falg = conn.executeUpdate(sql);
                   System.out.println("SQL:" + sql);
                   conn.close();
               }
           } catch (SQLException ex) {
               falg=0;
           }
       return falg;
   }
   public List query(int id) {
   	List personnelList = new ArrayList();
       PersonnelForm cF = null;
       String sql="";
       if(id==0){
           sql = "SELECT * FROM users";
       }else{
       	sql = "SELECT * FROM users WHERE userID=" +id + "";
       }
       ResultSet rs = conn.executeQuery(sql);
       try {
           while (rs.next()) {
               cF = new PersonnelForm();
               cF.setID(rs.getInt(1));
               cF.setUsername(rs.getString(2));
               cF.setPassword(rs.getString(3));
               cF.setStatus(rs.getInt(4));
               cF.setName(rs.getString(5));
               cF.setEmail(rs.getString(6));
               cF.setEmailpass(rs.getString(7));
               cF.setMobileTel(rs.getString(8));
               personnelList.add(cF);
           }
       } catch (SQLException ex) {}
       return personnelList;
   }
 
   public int update(PersonnelForm c){
       String sql="UPDATE users SET username='"+c.getUsername()+"',name='"+c.getName()+"',password='"+c.getPassword()+"',status="+c.getStatus()+",mobileTel='"+c.getMobileTel()+"',email='"+c.getEmail()+"',emailpass='"+c.getEmailpass()+"'  where userID="+c.getID()+"";
       int ret=conn.executeUpdate(sql);
       System.out.println("SQL:"+sql);
       conn.close();
       return ret;
   }


       public int delete(PersonnelForm personnelForm) {
           String sql = "DELETE FROM users where userID=" + personnelForm.getID() +"";
           int flag = conn.executeUpdate(sql);
           conn.close();
           return flag;
       }
}
