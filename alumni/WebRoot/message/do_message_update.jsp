<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@page import="java.util.*" %>
<%@page import="com.alumni.struts.action.*" %>
<%@page import="com.alumni.struts.dao.*"  %>
<%@page import="com.alumni.struts.form.*" %>
<%@page import="com.alumni.core.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<title>My JSP 'message_update.jsp' starting page</title>
		<link href="../css/style.css" rel="stylesheet">
	

	</head>

	<body>
	<h2>更改通知</h2>
		
    <%
	int mid = Integer.parseInt(request.getParameter("messageId"));
    MessageServiceImpl messageService=new MessageServiceImpl();
    Message message=messageService.findById(mid);

    request.setCharacterEncoding("utf-8");
    message.setId(mid);
    message.setSubject(request.getParameter("subject")); 
    message.setDay(request.getParameter("day")); 
    message.setTime(request.getParameter("time"));
    int aid=Integer.parseInt(request.getParameter("authorid").trim()); 
    System.out.print(aid);
    message.setAuthorid(aid); 
    message.setContent(request.getParameter("content")); 
    MessageServiceImpl messageservice=new MessageServiceImpl();
    boolean flag=  messageservice.updateMessage(message);
         if(flag){
         out.println("<script> alert('更新成功！'); location.replace('message_detail.jsp') </script>");
         }else{
         out.println("<script>alert('更新失败！'); location.replace('message_detail.jsp') </script>");
         }
    %>
	</body>
</html>
