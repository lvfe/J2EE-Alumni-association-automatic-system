package com.alumni.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.alumni.core.Constants;
import com.alumni.core.bean;
import com.alumni.struts.dao.FileDAO;
import com.alumni.struts.form.fileForm;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class fileUpload extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String dirName;
	  
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		// read the uploadDir from the servlet parameters
		String abpath = this.getServletContext().getRealPath("/"); 
		System.out.println("abpath = " + abpath);		
		dirName = config.getInitParameter("uploadDir");
		dirName = abpath + dirName;
		System.out.println("dirName = " + dirName);
		if (dirName == null) {
			throw new ServletException("Please supply uploadDir parameter");
		}
	}
  
	public void doPost(HttpServletRequest request, HttpServletResponse response)
      	throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		////response.setContentType("text/plain");
    	///out.println("Demo Upload Servlet using MultipartRequest");
		////out.println();
	  
		HttpSession session = request.getSession();
		int id=(Integer)session.getAttribute("id");
		RequestDispatcher dispatcher; 
      
		try {
		// Use an advanced form of the constructor that specifies a character
		// encoding of the request (not of the file contents) and a file
		// rename policy.
			MultipartRequest multi = 
				new MultipartRequest(request, dirName, 10*1024*1024,
                             "utf-8", new DefaultFileRenamePolicy());
        
      /**
      out.println("PARAMS:");
      Enumeration params = multi.getParameterNames();
      while (params.hasMoreElements()) {
        String name = (String)params.nextElement();
        String value = multi.getParameter(name);
        out.println(name + "=" + value);
      }
      out.println();
      */
              
		out.println("FILES:");
			Enumeration files = multi.getFileNames();
			while (files.hasMoreElements()) {
				String name = (String)files.nextElement();
				String filename = multi.getFilesystemName(name);
				String originalFilename = multi.getOriginalFileName(name);
				String type = multi.getContentType(name);
				File f = multi.getFile(name);
        out.println("name: " + name);
        out.println("filename: " + filename);
        out.println("originalFilename: " + originalFilename);
        out.println("type: " + type);
				if (f == null || !f.exists()){
					System.out.println("update file failed");
					dispatcher = request.getRequestDispatcher("/fileManage/fileUp.jsp");
					dispatcher.forward(request, response);
				}				
				else if (f != null) {
          out.println("f.toString(): " + f.toString());
          out.println("f.getName(): " + f.getName());
          out.println("f.exists(): " + f.exists());
          out.println("f.length(): " + f.length());
        	
          		fileForm cF=new fileForm();
          		cF.setFname(filename);
          		cF.setPid(id);
					@SuppressWarnings("unused")
					DataSource ds = null;
					FileDAO fileDao=new FileDAO();
					try{
						InitialContext ctx=new InitialContext();
						ds=(DataSource)ctx.lookup(Constants.DB_TOMCAT_CONTEXT);
						int n = fileDao.insert(cF);
						System.out.println("n=" + n);
						if(n > 0){
							System.out.println("add success");
							out.println("<script language='javascript'>");
							out.println("alert('上传成功');");
							out.println("window.location.href='/alumni/fileManage/file.jsp';</script>");
							//dispatcher = request.getRequestDispatcher("/fileManage/file.jsp");
							//dispatcher.forward(request, response);
						}
						else{
							System.out.println("add failed");
							out.println("alert('上传失败');");
							dispatcher = request.getRequestDispatcher("/alumni/fileManage/fileUp.jsp");
							dispatcher.forward(request, response);
						}
					}
					catch(Exception e){
						System.out.println(e.toString());
					}     	
				}
			}
		} 
		catch (IOException lEx) {
      ////this.getServletContext().log(lEx, "error reading or saving file");
			System.out.println(lEx.toString());
		}
	}
}
