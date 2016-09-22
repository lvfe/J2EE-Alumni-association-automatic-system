<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'online.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <h2>在线人数</h2>
    <hr/>
    
     <p>当前在线人数：2</p>
     <table>
     <tr>
     	<TD>姓名：王五</TD>
     	<td>电话：18317082724</td>
     	<td>邮箱：felv1100@qq.com</td>
     </tr>
     <tr>
     <TD>姓名：刘</TD>
     	<td>电话：123</td>
     	<td>邮箱：felv1100@qq.com</td>
     </tr>
     </table>
  </body>
</html>
