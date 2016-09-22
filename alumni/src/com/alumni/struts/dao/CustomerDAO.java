package com.alumni.struts.dao;

import java.sql.*;
import java.util.*;

import com.alumni.struts.form.CustomerForm;
import com.alumni.core.ConnDB;

public class CustomerDAO {
	private ConnDB conn=new ConnDB();
    public int insert(CustomerForm cF) {
        String sql1="SELECT * FROM tb_customer WHERE name='"+cF.getName()+"'";
        ResultSet rs = conn.executeQuery(sql1);
        String sql = "";
        int falg = 0;
            try {
                if (rs.next()) {
                    falg=2;
                } else {
                    sql = "INSERT INTO tb_customer (id,name,mobileTel,email) values(seq_customer.nextval,'" +
                    cF.getName() + "','" +cF.getMobileTel()+"','"+
                    cF.getEmail()+"')";
                    falg = conn.executeUpdate(sql);
                    System.out.println("SQL:" + sql);
                    conn.close();
                }
            } catch (SQLException ex) {
                falg=0;
            }
        return falg;
    }
    //��ѯ����
    public List<CustomerForm> query(int id) {
    	List<CustomerForm> customerList = new ArrayList<CustomerForm>();
        CustomerForm cF = null;
        String sql="";
        System.out.print(id);
        if(id==0){
            sql = "SELECT * FROM tb_customer";
        }else{
        	sql = "SELECT * FROM tb_customer WHERE id=" +id+ "";
        }
        ResultSet rs = conn.executeQuery(sql);
            
				try {
					while (rs.next()) {
					    cF = new CustomerForm();
					    
					    cF.setID(rs.getInt(1));
					    cF.setName(rs.getString(2));
					    cF.setEmail(rs.getString(3));
					    cF.setMobileTel(rs.getString(4));
					    
					    customerList.add(cF);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
      
        	conn.close();							
        return customerList;
    }
    //�޸����
    public int update(CustomerForm c){
        String sql="UPDATE tb_customer SET name='"+c.getName()+"',email='"+c.getEmail()+"',mobileTel='"+c.getMobileTel()+"'  where id="+c.getID()+"";
        int ret=conn.executeUpdate(sql);
        System.out.println("SQL:"+sql);
        conn.close();
        return ret;
    }

//    ɾ�����
        public int delete(CustomerForm customerForm) {
        	int flag=0;
        	try{
            String sql = "DELETE FROM tb_customer where id=" + customerForm.getID() +"";
            flag = conn.executeUpdate(sql);
        	}catch(Exception e){
        		System.out.println("error"+e.getMessage());
        	}finally{
        		conn.close();	
        	}
             return flag;
        }
}
