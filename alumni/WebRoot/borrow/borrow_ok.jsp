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
		alert("租赁成功!");
		window.location.href="borrow.do?action=borrowQuery";
		</script>	
	<%	break;
	case 2:
	%>
		<script language="javascript">
		alert("租赁信息修改成功!");
		window.location.href="borrow.do?action=borrowQuery";
		</script>		
	<%	break;
	case 3:
	%>
		<script language="javascript">
		alert("删除租赁!");
		window.location.href="borrow.do?action=borrowQuery";
		</script>		
	<%	break;
	case 4:
	%>
		<script language="javascript">
		alert("归还设备!");
		window.location.href="borrow.do?action=borrowQuery";
		</script>		
	<%	break;
	case 5:
	%>
		<script language="javascript">
		alert("还原记录!");
		window.location.href="borrow.do?action=borrowQuery";
		</script>		
	<%	break;
}
%>
</body>
</html>