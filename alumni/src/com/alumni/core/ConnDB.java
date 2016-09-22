package com.alumni.core;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnDB {


	private String dburl = "jdbc:oracle:thin:@localhost:1521:orclorcl";
	private String dbdriver = "oracle.jdbc.driver.OracleDriver";
	private String USER = "dhuaa_xiaoyouzhijia";
	private String PWD = "xiaoyouzhijia";
	public Connection conn = null; // Connection
	public Statement stmt = null; // Statement
	public ResultSet rs = null; //Resultset
	public ConnDB() {	
		try {
			Class.forName(dbdriver);
		} catch (ClassNotFoundException cnfe) {
			System.out.println(cnfe.getMessage());
		}
	}

	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(dburl, USER, PWD);
		} catch (SQLException sqle) {
			System.out.println(sqle.getMessage());
		}
		return conn;
	}

	
	public ResultSet executeQuery(String sql) {
		try { 
			conn = getConnection(); 
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(sql);
		} catch (SQLException ex) {
			System.err.println(ex.getMessage()); 
		}
		return rs; 
	}

	
	public int executeUpdate(String sql) {
		int result = 0; 
		try {
			conn = getConnection(); 
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			result = stmt.executeUpdate(sql); 
		} catch (SQLException ex) {
			result = 0;
		}
		return result; 
	}

	public void close() {
		try { 
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) { 
				stmt.close(); 
			}
			if (conn != null) { 
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace(System.err);
		}
		
	}
}
