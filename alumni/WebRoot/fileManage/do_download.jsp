<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" pageEncoding="utf-8"%>
<%@ page import="com.jspsmart.upload.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.alumni.struts.dao.*" %>
<%@ page import="com.alumni.struts.form.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'do_download.jsp' starting page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <%
  	out.clear(); 
  	request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8"); 
	out = pageContext.pushBody();
    SmartUpload su=new SmartUpload();
	su.initialize(pageContext);
	su.setContentDisposition(null);
	String name=request.getParameter("name");
	name = new String(name.getBytes("iso-8859-1"),"utf-8");
	System.out.println(name);
	String abpath = this.getServletContext().getRealPath("/");
	String dir="upload\\public\\";
su.initialize(pageContext);
su.setContentDisposition(null); 
//String dirName = config.getInitParameter("uploadDir");
    FileDAO fileDao=new FileDAO();
    fileForm file=new fileForm();
    file.setFname(name);
    int flag=0;

try{
	su.downloadFile(abpath+dir+name);
	}catch(SmartUploadException e){
	flag=fileDao.deletefile(file);
	}
	%>
 <script>
 window.location.href="file.jsp";
 </script>
  </body>
</html>
