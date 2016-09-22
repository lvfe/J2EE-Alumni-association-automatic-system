<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@page import="com.alumni.struts.form.*"  %>
<%@page import="com.alumni.struts.dao.*" %>
<%@page import="java.util.*" %>
<html>
<head>
<title>操作成功!</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body>

	<%request.setCharacterEncoding("utf-8"); %>
<%int para=Integer.parseInt(request.getParameter("para"));
switch(para){
	case 1:
	%>
		<script language="javascript">
		alert("回复成功!");
		window.location.href="reverse.do?action=queryReply";
		</script>	
	<%	break;
	case 2:
	%>
		<script language="javascript">
		alert("删除成功!");
		window.location.href="reverse.do?action=queryReply";
		</script>		
	<%	break;
}
%>
</body>
</html>