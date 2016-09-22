<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@page import="java.util.*" %>
<jsp:directive.page import="com.alumni.struts.action.*"/>
<jsp:directive.page import="com.alumni.struts.dao.*"/>
<jsp:directive.page import="com.alumni.struts.form.*"/>
<jsp:directive.page import="com.alumni.core.*"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<title>My JSP 'message_add.jsp' starting page</title>
		<link href="../css/style.css" rel="stylesheet">
	

	</head>

	<body>
	<%
	int id=0;
id=(Integer)session.getAttribute("id");
  		if(id == 0) {
  			response.sendRedirect("error.jsp");
  		}
  		PersonnelDAO dao=new PersonnelDAO();
PersonnelForm personform=null;
personform=(PersonnelForm)dao.query(id).get(0);
String Uname=personform.getName();
int Utype=personform.getStatus();
	%>
	<h2>删除通知</h2>
    <%
    
	request.setCharacterEncoding("utf-8"); 
    int mid = Integer.parseInt(request.getParameter("MessageId"));
    MessageServiceImpl messageService=new MessageServiceImpl();
    PersonnelDAO personneldao=new PersonnelDAO();
    Message message=messageService.findById(mid);
    List list=personneldao.query(message.getAuthorid());
    PersonnelForm personnel=null;
    personnel=(PersonnelForm)list.get(0);
    int typeAuthor=personnel.getStatus();
    int typeUser=Utype;
    if(typeUser<=typeAuthor){
     request.setCharacterEncoding("utf-8");
    boolean flag=  messageService.delMessage(mid);
    //del visit
    boolean flag1=false;
    if(flag){
    VisitDAO visitdao=new VisitDAO();
    flag1=  visitdao.delPersonnel(mid);
    }
         if(flag){
         out.println("<script> alert('删除成功！'); location.replace('message_detail.jsp') </script>");
         }else{
         out.println("<script>alert('删除失败！'); location.replace('message_detail.jsp') </script>");
         }
   
    }
    else{
     out.println("<script> alert('没有删除权限！请联系管理员'); location.replace('message_detail.jsp') </script>");
         
    }
   %>
   
	</body>
</html>
