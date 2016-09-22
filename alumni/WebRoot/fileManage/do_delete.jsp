<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.alumni.struts.dao.*" %>
<%@ page import="com.alumni.struts.form.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'do_delete.jsp' starting page</title>
    
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
    int fid=Integer.parseInt((String)request.getParameter("fid"));
    FileDAO fileDao=new FileDAO();
    fileForm file=new fileForm();
    file.setId(fid);
    int flag=fileDao.delete(file);
    if(flag==0){
     %>
     <script>
     alert('删除失败');
     window.location.href="file.jsp";
     </script>
     <%
     }else{ %>
     <script>
     alert('删除成功');
     window.location.href="file.jsp";
     </script>
     <%} %>
  </body>
</html>
