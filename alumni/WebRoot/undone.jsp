<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>"/>
    
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
    <table>
    <tr>
    	<td>
    	<table border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#54ABEF">
    	<tr>
    	<td align="center" bgcolor="#A8D8FC">未读通知</td>
    	</tr><tr><td>
    	   <iframe frameBorder="1" id="message" name="message" scrolling="auto"
                    src="<%=basePath%>message/message_unread.jsp" height="250px" width="600px"></iframe>
        </td>
        </tr>
        </table>
   		</td><td>&nbsp;&nbsp;</td><td>
   		<table border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#54ABEF">
    	<tr>
    	<td align="center" bgcolor="#A8D8FC">未读邮件</td>
    	</tr><tr>
   		<td>
   			<iframe frameBorder="1" id="mail" name="mail" scrolling="auto"
                    src="<%=basePath%>mail/unread.jsp" height="250px" width="600px"></iframe>
   		</td>
    </tr></table></td></tr>
    <tr><td>
    <table border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#54ABEF">
    	<tr>
    	<td align="center" bgcolor="#A8D8FC">今日会议日程</td>
    	</tr><tr>
    <td>
    	<iframe frameBorder="1" id="file" name="file" scrolling="auto"
                    src="<%=basePath%>agenda/todayMeeting.jsp" height="250px" width="600px"></iframe>
    	</td></tr></table></td><td>&nbsp;&nbsp;</td>
    	<td>
    	<table border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#54ABEF">
    	<tr>
    	<td align="center" bgcolor="#A8D8FC">今日个人日程</td>
    	</tr><tr>
    	<td><h3 align="center"></h3>
    		<iframe frameBorder="1" id="agenda" name="agenda" scrolling="auto"
                    src="<%=basePath%>agenda/todayAgenda.jsp" height="250px" width="600px"></iframe>
    	</td>
    </tr></table>
    </td></tr></table>
  </body>
</html>
