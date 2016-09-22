<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@page import="com.alumni.struts.form.*"  %>
<%@page import="com.alumni.struts.dao.*" %>
<%@page import="java.util.*" %>
<html>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	 %>
<head>
<base href="<%=basePath%>">
<title>操作成功!</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
<%int para=Integer.parseInt(request.getParameter("para"));
switch(para){
	case 1:
	%>
		<script language="javascript">
		alert("员工信息添加成功!");
		
		window.location.href="personnel.do?action=personnelQuery";
		</script>	
	<%	break;
	case 2:
	%>
		<script language="javascript">
		alert("员工信息修改成功!");
		window.location.href="personnel.do?action=personnelQuery";
		</script>		
	<%	break;
	case 3:
	%>
		<script language="javascript">
		alert("员工信息删除成功!");
		window.location.href="personnel.do?action=personnelQuery";
		</script>		
	<%	break;
}
%>
</body>
</html>