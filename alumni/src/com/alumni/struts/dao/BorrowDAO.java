package com.alumni.struts.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.alumni.core.ConnDB;
import com.alumni.struts.form.BorrowForm;

public class BorrowDAO {
	private ConnDB conn=new ConnDB();
   public int insert(BorrowForm cF) {
       String sql = "";
       int falg = 0;
           try {
               
                   sql = "INSERT INTO borrow (id,eid,name,start_date,end_date,eusage,status) values(seq_borrow.nextval,"+cF.getEid()+",'" +
                   cF.getName() + "','" +cF.getStart_date()+"','"+
                   cF.getEnd_date()+"','"+cF.getEusage()+"',0)";
                   falg = conn.executeUpdate(sql);
                   System.out.println("SQL:" + sql);
                   conn.close();
           } catch (Exception ex) {
               falg=0;
           }
       return falg;
   }
   
   public List<BorrowForm> query(int id) {
   	List<BorrowForm> borrowList = new ArrayList<BorrowForm>();
   	BorrowForm cF = null;
       String sql="";
       if(id==0){
           sql = "SELECT * FROM borrow";
       }else{
       	sql = "SELECT * FROM borrow WHERE id=" +id+ "";
       }
       ResultSet rs = conn.executeQuery(sql);
           
				try {
					while (rs.next()) {
					    cF = new BorrowForm();
					    
					    cF.setId(rs.getInt(1));
					    cF.setEid(rs.getInt(2));
					    cF.setName(rs.getString(3));
					    cF.setStart_date(rs.getString(4));
					    cF.setEnd_date(rs.getString(5));
					    cF.setEusage(rs.getString(6));
					    cF.setStatus(rs.getInt(7));
					    borrowList.add(cF);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
     
       	conn.close();											
       return borrowList;
   }
   
   public int update(BorrowForm c){
       String sql="UPDATE borrow SET eid="+c.getEid()+",name='"+c.getName()+"',start_date='"+c.getStart_date()+"',end_date='"+c.getEnd_date()+"',eusage='"+c.getEusage()+"',status=0  where id="+c.getId()+"";
       int ret=conn.executeUpdate(sql);
       System.out.println("SQL:"+sql);
       conn.close();
       return ret;
   }
   public int returnUpdate(BorrowForm c){
       String sql="UPDATE borrow SET status=1  where id="+c.getId()+"";
       int ret=conn.executeUpdate(sql);
       System.out.println("SQL:"+sql);
       conn.close();
       return ret;
   }
   public int storeUpdate(BorrowForm c){
       String sql="UPDATE borrow SET status=0  where id="+c.getId()+"";
       int ret=conn.executeUpdate(sql);
       System.out.println("SQL:"+sql);
       conn.close();
       return ret;
   }

       public int delete(BorrowForm borrowForm) {
       	int flag=0;
       	try{
           String sql = "DELETE FROM borrow where id=" + borrowForm.getId() +"";
           flag = conn.executeUpdate(sql);
       	}catch(Exception e){
       		System.out.println("error"+e.getMessage());
       	}finally{
       		conn.close();	
       	}
            return flag;
       }
	public List<BorrowForm> queryRe() {
		List<BorrowForm> borrowList = new ArrayList<BorrowForm>();
	   	BorrowForm cF = null;
	       String sql="";
	       	sql = "SELECT * FROM borrow WHERE status=1";
	       
	       ResultSet rs = conn.executeQuery(sql);
	           
					try {
						while (rs.next()) {
						    cF = new BorrowForm();
						    
						    cF.setId(rs.getInt(1));
						    cF.setEid(rs.getInt(2));
						    cF.setName(rs.getString(3));
						    cF.setStart_date(rs.getString(4));
						    cF.setEnd_date(rs.getString(5));
						    cF.setEusage(rs.getString(6));
						    cF.setStatus(rs.getInt(7));
						    borrowList.add(cF);
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	     
	       	conn.close();											
	       return borrowList;
	}
	public List<BorrowForm> queryUre() {
		List<BorrowForm> borrowList = new ArrayList<BorrowForm>();
	   	BorrowForm cF = null;
	       String sql="";
	       	sql = "SELECT * FROM borrow WHERE status=0";
	       ResultSet rs = conn.executeQuery(sql);
	           
					try {
						while (rs.next()) {
						    cF = new BorrowForm();
						    
						    cF.setId(rs.getInt(1));
						    cF.setEid(rs.getInt(2));
						    cF.setName(rs.getString(3));
						    cF.setStart_date(rs.getString(4));
						    cF.setEnd_date(rs.getString(5));
						    cF.setEusage(rs.getString(6));
						    cF.setStatus(rs.getInt(7));
						    borrowList.add(cF);
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	     
	       	conn.close();											
	       return borrowList;
	}
}
