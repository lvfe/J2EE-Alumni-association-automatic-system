<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" pageEncoding="utf-8"%>
<%@ page import="com.alumni.struts.form.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.alumni.struts.dao.*" %>
<%@ page import="com.alumni.core.*" %>

<html>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

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

List list=(List)request.getAttribute("equipmentQuery");
%>
<head>
<base href="<%=basePath%>">
<title>设备信息</title>
<link href="<%=basePath %>css/style.css" rel="stylesheet">
</head>
<body>
	<table width="70%" border="0" cellspacing="1" cellpadding="2">
				<tr>
				<%if(Utype==1){ %>
					<td align="center" width="20%" bgcolor="#00ff00" onmousemove="show_menu(21)" id="f034"><a href="http://localhost:8080/alumni/equipment/equipment_add.jsp"  target="main"><font size="2">&middot;添加设备</font></a></td>
					<td align="center" width="20%" bgcolor="#00ff00" onmousemove="show_menu(22)" id="f035"><a href="http://localhost:8080/alumni/equipment.do?action=equipmentQuery" target="main" ><font size="2">&middot;管理设备</font></a></td>
					<%} %>
					<td align="center" width="20%" bgcolor="#00ff00" onmousemove="show_menu(23)" id="f035"><a href="http://localhost:8080/alumni/borrow/borrow_add.jsp" target="main" ><font size="2">&middot;租借设备</font></a></td>
					<td align="center" width="20%" bgcolor="#00ff00" onmousemove="show_menu(24)" id="f035"><a href="http://localhost:8080/alumni/borrow.do?action=borrowQuery" target="main" ><font size="2">&middot;管理租借</font></a></td>
					<td align="center" width="20%" bgcolor="#00ff00" onmousemove="show_menu(25)" id="f035"><a href="http://localhost:8080/alumni/borrow.do?action=overdue" target="main" ><font size="2">&middot;超期提醒</font></a></td>
				</tr></table>
<table  width="80%" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="510" valign="top" style="padding:5px;"><table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="22" valign="top" class="word_orange">当前位置：设备管理 &gt; 设备详细信息 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top"><%
if(list==null || list.isEmpty()){
%>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="36" align="center">暂无设备信息！</td>
            </tr>
          </table>
          <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="5%" align="right"><img src="Images/add.gif" width="19" height="18">&nbsp; </td>
    <td width="95%"><a href="<%=basePath %>equipment/equipment_add.jsp">添加设备信息</a> </td>
  </tr>
</table>
 <%
}else{
  //通过迭代方式显示数据
  Iterator it=list.iterator();
  String ename="";
  String etype="";
  String eusage="";
  String buy_time="";
  %>
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="84%" align="right"><img src="Images/add.gif" width="19" height="18">&nbsp; </td>
<td width="16%">
      <a href="<%=basePath %>equipment/equipment_add.jsp">添加设备信息</a> </td>	  
  </tr>
</table>  
  <table width="91%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#54ABEF">
  <tr align="center" bgcolor="#A8D8FC">
    <td width="17%">设备名称</td>
    <td width="17%">类型</td>
    <td width="30%">用途</td>
    <td width="10%">购入时间</td>
    <td width="9%">修改</td>
    <td width="9%">删除</td>
  </tr>
<%
  while(it.hasNext()){
    EquipmentForm c=(EquipmentForm)it.next();
    id=c.getId();
	ename=c.getEname();
	etype=c.getEtype();
	eusage=c.getEusage();
	buy_time=c.getBuy_time();
	%> 
  <tr>
    <td style="padding:5px;"><%=ename%></td>
    <td align="center"><%=etype%></td>
    <td align="center"><%=eusage%></td>
    <td align="center"><%=buy_time%></td>
    <td align="center"><a href="<%=basePath %>equipment.do?action=equipmentQueryModify&id=<%=id%>">修改</a></td>
    <td align="center"><a href="<%=basePath %>equipment.do?action=equipmentDel&id=<%=id%>">删除</a></td>
  </tr>
<%
  }
}
%>  
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
