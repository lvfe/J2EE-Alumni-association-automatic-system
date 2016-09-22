package com.alumni.struts.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.alumni.core.ConnDB;
import com.alumni.struts.form.fileForm;


public class FileDAO {
	private ConnDB conn=new ConnDB();
    //������
   public int insert(fileForm cF) {
       String sql1="SELECT * FROM tb_file WHERE fname='"+cF.getFname()+"'";
       ResultSet rs = conn.executeQuery(sql1);
       String sql = "";
       int falg = 0;
           try {
               if (rs.next()) {
                   falg=2;
               } else {
                   sql = "INSERT INTO tb_file (id,pid,fname) values(seq_file.nextval,"+cF.getPid()+",'" +
                   cF.getFname()+"')";
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
   @SuppressWarnings("unchecked")
public List query(int id) {
   	List fileList = new ArrayList();
       fileForm cF = null;
       String sql="";
       if(id==0){
           sql = "SELECT * FROM tb_file";
       }else{
       	sql = "SELECT * FROM tb_file WHERE id=" +id + "";
       }
       ResultSet rs = conn.executeQuery(sql);
       try {
           while (rs.next()) {
               cF = new fileForm();
               cF.setId(rs.getInt(1));
               cF.setPid(rs.getInt(2));
               cF.setFname(rs.getString(3));
               fileList.add(cF);
           }
       } catch (SQLException ex) {}
       return fileList;
   }
   //�޸����
   public int update(fileForm c){
       String sql="UPDATE tb_file SET fname='"+c.getFname()+"',pid="+c.getPid()+"'  where id="+c.getId()+"";
       int ret=conn.executeUpdate(sql);
       System.out.println("SQL:"+sql);
       conn.close();
       return ret;
   }

//   ɾ�����
       public int delete(fileForm fileForm) {
    	   int flag=0;
           String sql = "DELETE FROM tb_file where id=" + fileForm.getId() +"";
           flag = conn.executeUpdate(sql);
           conn.close();
           return flag;
       }
       public int deletefile(fileForm fileForm) {
    	   int flag=0;
           String sql = "DELETE FROM tb_file where name='" + fileForm.getFname() +"'";
           flag = conn.executeUpdate(sql);
           conn.close();
           return flag;
       }
}
