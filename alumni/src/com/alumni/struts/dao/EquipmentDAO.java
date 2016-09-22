package com.alumni.struts.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.alumni.core.ConnDB;
import com.alumni.struts.form.EquipmentForm;

public class EquipmentDAO {
		private ConnDB conn=new ConnDB();
	    
	   public int insert(EquipmentForm cF) {
	       String sql1="SELECT * FROM tb_equipment WHERE ename='"+cF.getEname()+"'";
	       ResultSet rs = conn.executeQuery(sql1);
	       String sql = "";
	       int falg = 0;
	           try {
	               if (rs.next()) {
	                   falg=2;
	               } else {
	                   sql = "INSERT INTO tb_equipment (id,etype,ename,eusage,buy_time) values(seq_equipment.nextval,'" +
	                   cF.getEtype() + "','" +cF.getEname()+"','"+cF.getEusage()+"','"+cF.getBuy_time()+"')";
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
	   	List<EquipmentForm> equipmentList = new ArrayList<EquipmentForm>();
	   	EquipmentForm cF = null;
	       String sql="";
	       if(id==0){
	           sql = "SELECT * FROM tb_equipment";
	       }else{
	       	sql = "SELECT * FROM tb_equipment WHERE id=" +id + "";
	       }
	       ResultSet rs = conn.executeQuery(sql);
	       try {
	           while (rs.next()) {
	               cF = new EquipmentForm();
	               cF.setId(rs.getInt(1));
	               cF.setEtype(rs.getString(2));
	               cF.setEname(rs.getString(3));
	               cF.setEusage(rs.getString(4));
	               cF.setBuy_time(rs.getString(5));
	               equipmentList.add(cF);
	           }
	       } catch (SQLException ex) {}
	       return equipmentList;
	   }
	   //�޸����
	   public int update(EquipmentForm c){
	       String sql="UPDATE tb_equipment SET etype='"+c.getEtype()+"',ename='"+c.getEname()+"',eusage='"+c.getEusage()+"',buy_time='"+c.getBuy_time()+"'  where id="+c.getId()+"";
	       int ret=conn.executeUpdate(sql);
	       System.out.println("SQL:"+sql);
	       conn.close();
	       return ret;
	   }

	//   ɾ�����
	       public int delete(EquipmentForm equipment) {
	           String sql = "DELETE FROM tb_equipment where id=" + equipment.getId() +"";
	           int flag = conn.executeUpdate(sql);
	           conn.close();
	           return flag;
	       }
	

}
