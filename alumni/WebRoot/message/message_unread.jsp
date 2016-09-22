<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@page import="java.util.*" %>
<%@page import="com.alumni.core.*" %>
<jsp:directive.page import="com.alumni.struts.action.*"/>
<jsp:directive.page import="com.alumni.struts.dao.*"/>
<jsp:directive.page import="com.alumni.struts.form.*"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	 %>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'message_detail.jsp' starting page</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="<%=basePath %>css/style.css" rel="stylesheet">

  </head>
  
  <body>
  <div class="left02down01_xia noneBox" id="Bli060">
			<table width="70%" border="0" cellspacing="1" cellpadding="2" >
				<tr>
					<td align="center" width="30%" bgcolor="#00ff00" onmousemove="show_menu(10)" id="f011"><a href="<%=basePath%>message/message_unread.jsp" target="main" ><font size="2">&middot;未读通知</font></a></td>
					<td align="center" width="30%" bgcolor="#00ff00" onmousemove="show_menu(11)" id="f010"><a href="<%=basePath%>message/message_add.jsp" target="main" ><font size="2">&middot;添加通知</font></a></td>
					<td align="center" width="30%" bgcolor="#00ff00" onmousemove="show_menu(12)" id="f011"><a href="<%=basePath%>message/message_detail.jsp" target="main" ><font size="2">&middot;管理通知</font></a></td>
					
				</tr>
				</table>
		 </div>
<table  width="100%" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="auto"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="80%" valign="top" style="padding:5px;"><table width="98%" height="auto"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="22" valign="top" class="word_orange">当前位置：通知管理 &gt; <a href="message/message_unread.jsp" target="main" >未读通知</a>&gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top">
    <%
    request.setCharacterEncoding("utf-8");
//验证用户是否登录
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

ChStr chStr=new ChStr();
    MessageServiceImpl messageService=new MessageServiceImpl();
    VisitDAO visitDao=new VisitDAO();
    List<Visit> listV=visitDao.unVisitMessageList(id);
    Iterator<Visit> it=listV.iterator();
    Visit visit=null;
    if(!it.hasNext()){ %>
    <p>没有未读通知</p>
    <p><%}else{ %>
    <p>
    <table width="100%" border="1">
    <tr>
    	<th width="40%" align="center">主题
    	</th>
    	<th width="10%" align="center">日期
    	</th>
    	<th width="10%" align="center">时间
    	</th>
    	<th width="7%" align="center">作者
    	</th>
    </tr>
    <%
    
    while(it.hasNext()) {
									visit= (Visit)it.next();
									Message message=null;
									message=messageService.findById(visit.getMid());
									System.out.print(message.getSubject());
    %>
    <tr>
		<td width="255" class="td">
			<a href="<%=basePath%>message/look.jsp?MessageId=<%=message.getId() %>"><%=message.getSubject()%></a></td>
		<td class="td" width="202">
			<a href="<%=basePath%>message/look.jsp?MessageId=<%=message.getId() %>"><%=message.getDay()%></a></td>
		<td class="td" width="238">
			<a href="<%=basePath%>message/look.jsp?MessageId=<%=message.getId() %>"><%= message.getTime() %></a></td>
		<td class="td" width="202">
			<a href="<%=basePath%>message/look.jsp?MessageId=<%=message.getId() %>"><%=message.getAuthorid() %></a></td>					
    	
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
