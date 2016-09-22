package com.alumni.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import com.alumni.core.ConnDB;
import com.alumni.core.bean;
import com.alumni.struts.form.*;
import com.alunmi.md5.MD5;

@SuppressWarnings("serial")
public class loginCheck extends HttpServlet {
	public static bean userBean = new bean();
	/**
	 * Constructor of the object.
	 */
	public loginCheck() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8"); 
		response.setCharacterEncoding("utf-8");
		String username = request.getParameter("username").trim();
		String pwd = request.getParameter("pwd").trim();
		MD5 oMD5=new MD5();
		pwd=oMD5.getMD5ofStr(pwd);

		userBean.username = username;
		userBean.pwd = pwd;
		
		String sql = "select * from users where username = '" + username + "' and password ='" + pwd + "'";
		PersonnelForm personnel = null;

		List<PersonnelForm> personnelList = new ArrayList<PersonnelForm>();
		
		ConnDB conn=new ConnDB();
		System.out.println(sql);
			ResultSet rs = conn.executeQuery(sql);
			try {
            while (rs.next()) {
					personnel = new PersonnelForm();
					personnel.setID(rs.getInt(1));
					personnel.setUsername(rs.getString(2));
					personnel.setPassword(rs.getString(3));
					personnel.setStatus(rs.getInt(4));
					personnel.setName(rs.getString(5));
					personnel.setEmail(rs.getString(6));
					personnel.setEmailpass(rs.getString(7));
					personnel.setMobileTel(rs.getString(8));
					personnelList.add(personnel);
				}conn.close();
			} catch (SQLException e) {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('服务器错！'); location.replace('http://localhost:8080/alumni/index.jsp') </script>");
				e.printStackTrace();
			}
  
    	
    	
		if(personnelList.isEmpty()){
			PrintWriter out = response.getWriter();
			out.println("<script>alert('登录错！'); location.replace('http://hp-pc:8080/alumni/index.jsp') </script>");
			
		}else{personnel=personnelList.get(0);
		if(personnel.getStatus()==1){
			PrintWriter out = response.getWriter();
			out.println("<script>alert('管理员登陆成功！'); </script>");
			userBean.type=1;
			userBean.ID=personnel.getID();
			HttpSession session = request.getSession();
			session.setAttribute("username", userBean.username);
			session.setAttribute("id", userBean.ID);
			session.setAttribute("status", userBean.type);
			response.sendRedirect("http://hp-pc:8080/alumni/main.jsp");
		}
		else{
			PrintWriter out = response.getWriter();
			out.println("<script>alert('login successfully'); </script>");
			userBean.type=personnel.getStatus();
			userBean.ID=personnel.getID();
			HttpSession session = request.getSession();
			session.setAttribute("id", userBean.ID);
			session.setAttribute("username", userBean.username);
			session.setAttribute("status", userBean.type);
			response.sendRedirect("http://hp-pc:8080/alumni/main.jsp");
		}
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}
}
