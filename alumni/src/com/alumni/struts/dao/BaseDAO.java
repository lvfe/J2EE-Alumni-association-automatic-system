package com.alumni.struts.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import com.alumni.core.*;;

public class BaseDAO {
	protected static Connection conn = null;
	

	protected static PreparedStatement ps = null;

	protected static Statement st = null;

	protected static ResultSet rs = null;

	public void closeC() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (st != null) {
				st.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public boolean executeSQL(String SQL, List param) {
		conn = null;
		ps = null;
		int num = 0;
		conn = new ConnDB().getConnection();

		try {
			ps = conn.prepareStatement(SQL);
			if (param != null) {
				for (int i = 0; i < param.size(); i++) {
					ps.setObject(i + 1, param.get(i));
				}
				
			}
				num = ps.executeUpdate();
				if (num > 0) {
					return true;
				}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeC();
		}

		return false;
	}

}
