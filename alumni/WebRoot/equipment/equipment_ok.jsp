<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" pageEncoding="utf-8"%>
<html>
<head>
<title>操作成功!</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
    <%
    String para=request.getParameter("para");
    int selection=Integer.parseInt(para);
    switch(selection){
    case 1:%>
    <script>
    alert("设备信息添加成功！");
    window.location.href="equipment.do?action=equipmentQuery";
    </script>
   <% break;
   
    case 2:%>
    <script>
    alert("设备修改成功！");
    window.location.href="equipment.do?action=equipmentQuery";
    </script>
   <% break;
   
    case 3:%>
    <script>
    alert("设备删除成功！");
    window.location.href="equipment.do?action=equipmentQuery";
    </script>
   <% break;
    }
     %>
  </body>
  </html>
