package com.alumni.struts.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;



import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.alumni.core.ConnDB;
import com.alumni.struts.form.Task;

public class AgendaDAO {
	QueryRunner runner= new QueryRunner();
	/*
	 * get by id
	 */
	public int findItId(Task task){
		ConnDB conn=new ConnDB();
		int id=0;
		String sql="select * from task where subject='"+task.getSubject()+"' and year='"+task.getYear()+"' and month='"+task.getMonth()+"'and day='"+task.getDay()+"'";
		System.out.println("SQL:"+sql);
		ResultSet rs = conn.executeQuery(sql);
		try {
			if(rs.next()){
				id=rs.getInt(1);
				System.out.println(id);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
		
	}
	public List<Task> taskToday(String year,String month,String day){
		Connection conn = new ConnDB().getConnection();
		 String sql = "select * from task where year=? and month=? and day=?";  
		 Object[] obj={year,month,day};
		 System.out.println("SQL:"+sql);
		List<Task> list=null;
		try {
			list=(List<Task>)runner.query(conn, sql,obj, new BeanListHandler<Task>(Task.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 return list;	
	}
	@SuppressWarnings("deprecation")
	public Task getById(int ID){
		Task task=null;
		Connection	conn = new ConnDB().getConnection();
		int messageid=ID;
		String sql="select * from task where id=?";
		System.out.println("SQL:"+sql);
		try {
			task=(Task)runner.query(conn, sql, messageid, new BeanHandler<Task>(Task.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return task;
	}
	/*
	 * get tasks in a month
	 */
	@SuppressWarnings("deprecation")
	public List<Task> getTasks(String year,String month){
		Connection conn = new ConnDB().getConnection();
		 String sql = "select * from task where year=? and month=? order by id asc";   //����SQL���
		 Object[] obj={year,month};
		 System.out.println("SQL:"+sql);
		List<Task> list=null;
		try {
			list=(List<Task>)runner.query(conn, sql,obj, new BeanListHandler<Task>(Task.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 return list;	
	}
	/*
	 * list of the task
	 */
	public List<Task> listTask(){
		Connection conn = new ConnDB().getConnection();
		 String sql = "select * from task";   
		 System.out.println("SQL:"+sql);
		List<Task> list=null;
		try {
			list=(List<Task>)runner.query(conn, sql, new BeanListHandler<Task>(Task.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 return list;	
	}
	/*
	 * add task return taskid
	 */
	 public int addTask(Task task){
		 ConnDB conn=new ConnDB();
		 int id=-1;
		 String sql="insert into task(ID,year,month,day,start_time,end_time,state,subject,description,location)" +
		 		"values(seq_task.nextval,'"+task.getYear()+"','"+task.getMonth()+"','"+task.getDay()+"','"+task.getStart_time()+"','"+task.getEnd_time()+"','"+task.getState()+"','"+task.getSubject()+"','"+task.getDescription()+"','"+task.getLocation()+"')";
		 id=conn.executeUpdate(sql);
			
		 System.out.println("SQL:" + sql);
		 System.out.println("id:"+id);
			
		id=this.findItId(task);
		conn.close();
		return id; 
	 }
	 /*
	  * del task
	  */
	 public boolean delTask(int taskId) {
		 Connection conn=new ConnDB().getConnection();
		 String sql="delete from task where id=?";
		 System.out.println("SQL:"+sql);
		 try {
			runner.update(conn, sql,taskId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
		 
	 }
	    /*
	     * update task
	     */
	   public boolean updateTask(Task task) {
		   Connection conn=new ConnDB().getConnection();
			String sql="update task set subject=?,description=?,start_time=?,end_time=?,location=?  where id=?" ;
			Object[] objs={task.getSubject(),task.getDescription(),task.getStart_time(),task.getEnd_time(),task.getLocation(),task.getId()};
			System.out.println("SQL:"+sql);
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
