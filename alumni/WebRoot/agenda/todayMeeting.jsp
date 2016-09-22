<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@page import="java.util.*" %>
<%@page import="com.alumni.core.*" %>
<jsp:directive.page import="java.text.*"/>
<jsp:directive.page import="java.util.Date"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:directive.page import="com.alumni.struts.action.*"/>
<jsp:directive.page import="com.alumni.struts.dao.*"/>
<jsp:directive.page import="com.alumni.struts.form.*"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<base href="<%=basePath%>">
    
    <title>My JSP 'todayAgenda.jsp' starting page</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="<%=basePath%>css/style.css" rel="stylesheet">
	<link href="../css/style.css" rel="stylesheet">

  </head>
  
  <body>
  <%
  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");
  response.setContentType("text/html;charset=utf-8"); 
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
    <div class="left02down01_xia noneBox" id="Bli061">
				<table width="80%" border="0" cellspacing="1" cellpadding="2">
				<tr height="25px">
					<td align="center" width="25%" bgcolor="#00ff00"onmousemove="show_menu(13)" id="f016"><a href="<%=basePath%>agenda/todayMeeting.jsp" target="main" ><font size="2">&middot;今日会议日程</font></a></td>
					<%if(Utype==1) {%>
					<td align="center" width="25%" bgcolor="#00ff00"onmousemove="show_menu(14)" id="f016"><a href="<%=basePath%>agenda/CalendarDisplay.jsp" target="main" ><font size="2">&middot;管理会议日程</font></a></td>
					<%} %>
					<td align="center" width="25%" bgcolor="#00ff00"onmousemove="show_menu(15)" id="f017"><a href="<%=basePath%>agenda/Meetingdetail.jsp" target="main" ><font size="2">&middot;查看会议日程(表格)</font></a></td>
					<td align="center" width="25%" bgcolor="#00ff00"onmousemove="show_menu(15)" id="f017"><a href="<%=basePath%>agenda/seemeeting.jsp" target="main" ><font size="2">&middot;查看会议日程(日历)</font></a></td>
				</tr></table>
			</div>
<table  width="100%" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="auto"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="80%" valign="top" style="padding:5px;"><table width="98%" height="auto"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="22" valign="top" class="word_orange">当前位置：日程管理 &gt; <a href="agenda/CalendarDisplay.jsp" target="main">今日会议日程 </a> &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top">
    <%
    Task task=null;
    MeetingDAO meetingDao=new MeetingDAO();
    Calendar cal=Calendar.getInstance();   
int y=cal.get(Calendar.YEAR);   
int m=cal.get(Calendar.MONTH)+1;   
int d=cal.get(Calendar.DATE);     
    String year=String.valueOf(y);
    String month=String.valueOf(m);
    String day=String.valueOf(d);
    System.out.println(year+"-"+month+"-"+day);
    List<Task> listT=meetingDao.taskToday(year,month,day);
    Iterator<Task> it=listT.iterator();
    if(!it.hasNext()){ %>
    <p>没有会议日程</p>
    <%}else{ %>
    <p>
    <table width="91%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#54ABEF">
  <tr align="center" bgcolor="#e3F4F7">
    <td width="20%" height="26" bgcolor="#A8D8FC">主题</td>
    <td width="20%" bgcolor="#A8D8FC">描述</td>
    <td width="10%" align="center"bgcolor="#A8D8FC">日期
    	</td>
    	<td width="8%" align="center"bgcolor="#A8D8FC">开始时间
    	</td>
    	<td width="8%" align="center"bgcolor="#A8D8FC">结束时间
    	</td>
    	<td width="14%" align="center"bgcolor="#A8D8FC">地点
    	</td>
    	
    </tr>
    <%
    
    while(it.hasNext()) {
									task= (Task)it.next();
									
    %>
    <tr>
		<td class="td">
			<a href="javascript:;"><%=task.getSubject()%></a></td>
			<td class="td">
			<a href="javascript:;"><%=task.getDescription()%></a></td>
		<td class="td">
			<a href="javascript:;"><%=task.getYear()+"-"+task.getMonth()+"-"+task.getDay()%></a></td>
		<td class="td" width="238">
			<a href="javascript:;"><%= task.getStart_time() %></a></td>
		<td class="td">
			<a href="javascript:;"><%= task.getEnd_time() %></a></td>
		<td class="td">
			<a href="javascript:;"><%= task.getLocation() %></a></td>				
    	
    	<% }}%>
    </tr>
    </table>
   </td>
      </tr>
    </table>
</td>
  </tr>
</table></td>
  </tr>
</table>
  </body>
</html>
