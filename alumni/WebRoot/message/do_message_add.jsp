<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""pageEncoding="utf-8"%>
<%@page import="java.util.*" %>
<%@page import="com.alumni.core.*" %>
<%@page import="org.apache.commons.dbutils.QueryRunner"%>
<%@page import="org.apache.commons.dbutils.handlers.MapHandler"%>
<jsp:directive.page import="com.alumni.struts.action.*"/>
<jsp:directive.page import="com.alumni.struts.dao.*"/>
<jsp:directive.page import="com.alumni.struts.form.*"/>
<%
 request.setCharacterEncoding("utf-8");
int id=0;
id=(Integer)session.getAttribute("id");
  		if(id == 0) {
  			response.sendRedirect("error.jsp");
  		}
PersonnelDAO dao1=new PersonnelDAO();
PersonnelForm personform=null;
personform=(PersonnelForm)dao1.query(id).get(0);
String Uname=personform.getName();
int Utype=personform.getStatus();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<title>My JSP 'message_add.jsp' starting page</title>
		<link href="../css/style.css" rel="stylesheet">
	

	</head>

	<body>
		
    <%
    Message message=new Message();
    request.setCharacterEncoding("utf-8");
    message.setSubject(request.getParameter("subject")); 
    message.setDay(request.getParameter("date")); 
    message.setTime(request.getParameter("time")); 
    message.setAuthorid(Integer.parseInt(request.getParameter("authorid"))); 
    message.setContent(request.getParameter("content")); 
    MessageServiceImpl messageservice=new MessageServiceImpl();
    int flag=  messageservice.saveMessage(message);
    
    //初始化visit
     if(flag!=0){
     int mid=flag;
    Visit visit=new Visit(); 
    PersonnelDAO dao=new PersonnelDAO();
    int flag1=0;
    List<PersonnelForm> list=dao.query(0);
    for(int i=0;i<list.size();i++)
    {
    PersonnelForm personnel=new PersonnelForm();
    personnel=(PersonnelForm)list.get(i);
    System.out.println("mid:"+mid);System.out.println(personnel.getID());
    visit.setMid(mid);
    visit.setUserid(personnel.getID());
    if(personnel.getID()==message.getAuthorid()) 
    	visit.setIsRead(1);
    else visit.setIsRead(0);
    
    VisitDAO visitdao=new VisitDAO();
    flag1=  visitdao.addMessage(visit);
    }
         if(flag1==1){
         out.println("<script> alert('添加成功！'); location.replace('message_detail.jsp') </script>");
         }else{
         out.println("<script>alert('visit列表初始化失败！'); location.replace('message_add.jsp') </script>");
         }
   }
   else{
         out.println("<script>alert('添加失败！'); location.replace('message_add.jsp') </script>");
         }
    %>
	</body>
</html>
