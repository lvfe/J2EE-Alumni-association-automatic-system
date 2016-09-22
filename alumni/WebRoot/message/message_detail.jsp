<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage="" pageEncoding="utf-8"%>
<%@page import="java.util.*" %>
<%@page import="com.alumni.struts.action.*" %>
<%@page import="com.alumni.struts.dao.*" %>
<%@page import="com.alumni.struts.form.*"%>
<%@page import="com.alumni.core.*"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<% String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'message_detail.jsp' starting page</title>
    
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
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
	<%request.setCharacterEncoding("utf-8"); 
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

ChStr chStr=new ChStr();%>
	
<table width="80%" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="510" valign="top" style="padding:5px;"><table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="22" valign="top" class="word_orange">当前位置：通知管理 &gt; 通知列表 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top">
  <%
         request.setCharacterEncoding("utf-8");
    MessageServiceImpl messageService=new MessageServiceImpl();
    VisitDAO visitDao=new VisitDAO();
    List<Message> list= messageService.listMessage(); 
if(list==null || list.isEmpty()){
%>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="36" align="center">暂无通知！</td>
            </tr>
          </table>
          <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="5%" align="right">&nbsp;</td>
    <td width="95%"><input name="add"width="19" height="18"type="button" onClick="location.href='<%=basePath %>message/message_add.jsp'" value="添加通知"></td>
  </tr>
</table>
 <%
}else{%>
    <table width="100%" border="1">
    <tr><td>
    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="5%" align="right">&nbsp;</td>
    <td width="95%"><input name="add"width="19" height="18"type="button" onClick="location.href='<%=basePath %>message/message_add.jsp'" value="添加通知"></td>
  </tr>
</table></td></tr>
<tr>
<%

if(Utype==1){ %>
    	<th width="10%" align="center">阅读量
    	</th>
    	<%} %>
    	<th width="7%" align="center">回复
    	</th>
    	<th width="34%" align="center">主题
    	</th>
    	<th width="10%" align="center">日期
    	</th>
    	<th width="10%" align="center">时间
    	</th>
    	<th width="7%" align="center">作者
    	</th>
    	<th width="7%" align="center">编辑
    	</th>
    	<th width="7%" align="center">删除</th>
    </tr>
    <%
    ReverseDAO reverseDao=new ReverseDAO();
   
								for (int i = 0; i < list.size(); i++) {
									Message message = (Message) list.get(i);
									List listVisit=visitDao.messageList(message.getId());
									System.out.println(listVisit.size());
									
									List listun=visitDao.unVisitList(message.getId());
									System.out.println(listun.size());
									int num=listVisit.size()-listun.size();
									List listreply=reverseDao.queryReplyMessage(message.getId());
									int numreply=listreply.size();
    %>
    <tr>
    <%if(Utype==1){ %>
    	<td class="td"  align="center">
			<a href="<%=basePath%>message/unvisit.jsp?MessageId=<%= message.getId() %>"><%=num %></a></td>
			<%} %>
		<td  class="td" align="center">
			<a href="<%=basePath%>message/look.jsp?MessageId=<%=message.getId() %>"><%=numreply%></a></td>
		<td  class="td" align="center">
			<a href="<%=basePath%>message/look.jsp?MessageId=<%=message.getId() %>"><%=message.getSubject()%></a></td>
		<td class="td"  align="center">
			<a href="<%=basePath%>message/look.jsp?MessageId=<%=message.getId() %>"><%=message.getDay()%></a></td>
		<td class="td" align="center">
			<a href="<%=basePath%>message/look.jsp?MessageId=<%=message.getId() %>"><%= message.getTime() %></a>							  </td>
		<td class="td" align="center">
			<a href="<%=basePath%>message/look.jsp?MessageId=<%=message.getId() %>"><%=message.getAuthorid() %></a></td>					
    	<td class="td" align="center" valign="middle">
    		<a href="<%=basePath%>message/message_update.jsp?MessageId=<%= message.getId() %>">编辑</a></td>
    	<td class="td" align="center" valign="middle">
    		<a href="<%=basePath%>message/do_message_del.jsp?MessageId=<%= message.getId() %>">删除</a>
    	</td>
    	<% }}%>
    </tr>
    </table></td>
      </tr>
    </table>
</td>
  </tr>
</table></td>
  </tr>
</table>
    
  </body>
</html>
