<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int id1=0;
try{
id1=(Integer)session.getAttribute("id");
}
catch(IllegalStateException e1){
  			response.sendRedirect("index.jsp");
  		
  		}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'main.jsp' starting page</title>
    
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
    <%@include file="header.jsp" %>
	<table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
				
		    <td width="100%" height="100%" align="center">
				<iframe frameBorder="0" id="main" name="main" scrolling="auto"
                     src="undone.jsp"height="100%" width="100%">
    
    </iframe>
			</td>
		</tr>
	</table>
    
   <%@include file="copyright.jsp" %> 
  </body>
</html>
