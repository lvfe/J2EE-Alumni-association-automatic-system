<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" pageEncoding="utf-8"%>
<html>

<head>
<title>操作成功!</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
<%int para=Integer.parseInt(request.getParameter("para"));
switch(para){
	case 1:
	%>
		<script language="javascript">
		alert("客户信息添加成功!");
		window.location.href="customer.do?action=customerQuery";
		</script>	
	<%	break;
	case 2:
	%>
		<script language="javascript">
		alert("客户信息修改成功!");
		window.location.href="customer.do?action=customerQuery";
		</script>		
	<%	break;
	case 3:
	%>
		<script language="javascript">
		alert("客户信息删除成功!");
		window.location.href="customer.do?action=customerQuery";
		</script>		
	<%	break;
}
%>
</body>
</html>