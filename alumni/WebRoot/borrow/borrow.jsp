<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" pageEncoding="utf-8"%>
<%@ page import="com.alumni.struts.form.*"%>
<%@ page import="com.alumni.struts.dao.*"%>
<%@ page import="com.alumni.core.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="org.apache.commons.lang.time.DateFormatUtils"%>

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

List list=(List)request.getAttribute("borrowQuery");
%>
<head>
<base href="<%=basePath%>">
<title>租赁信息</title>
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
<table  width="100%" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="100%" valign="top" style="padding:5px;"><table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="22" valign="top" class="word_orange">当前位置：固定资产管理 &gt; 设备管理 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top"><%
if(list==null || list.isEmpty()){
%>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="36" align="center">暂无租借记录！</td>
            </tr>
          </table>
          <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="5%" align="right"><img src="Images/add.gif" width="19" height="18">&nbsp; </td>
    <td width="95%"><a href="<%=basePath %>borrow_add.jsp">租借设备添加</a> </td>
  </tr>
</table>
 <%
}else{
List listRe=(List)request.getAttribute("borrowReQuery");
List listUre=(List)request.getAttribute("borrowUreQuery");
  //通过迭代方式显示数据
  Iterator itRe=listRe.iterator();
  Iterator itUre=listUre.iterator();
  int eid;
  String name="";
  String start_date="";
  String end_date="";
  String eusage="";
  %>
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="84%" align="right"><img src="Images/add.gif" width="19" height="18">&nbsp; </td>
<td width="16%">
      <a href="<%=basePath %>borrow_add.jsp">租借设备添加</a> </td>	  
  </tr>
</table>  
  <table width="91%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#54ABEF">
  <tr>
              <td colspan="8"height="36" align="center">未还记录！</td>
            </tr>
  <tr align="center" bgcolor="#A8D8FC">
    <td width="15%">设备全称</td>
    <td width="15%">租借人</td>
    <td width="15%">开始时间</td>
    <td width="15%">结束时间</td>
    <td width="15%">用途</td>
    <td width="9%">修改</td>
    <td width="9%">删除</td>
    <td width="9%">状态操作</td>
  </tr>
<%
EquipmentForm equipment=new EquipmentForm();
EquipmentDAO equipmentDAO=new EquipmentDAO();
Date  now = new  Date();
       String thisDate = DateFormatUtils.ISO_DATE_FORMAT.format(now);
       System.out.println("thisDate:"+thisDate);
  while(itUre.hasNext()){
    BorrowForm c=(BorrowForm)itUre.next();
    int bid=c.getId();
    eid=c.getEid();
	name=c.getName();
	end_date=c.getEnd_date();
	start_date=c.getStart_date();
	eusage=c.getEusage();
	List list1=(List)equipmentDAO.query(eid);
	equipment=(EquipmentForm)list1.get(0);
	%> 
  <tr>
    <td align="center"><%=equipment.getEname()%></td>
    <td align="center"><%=name%></td>
    <td align="center"><%=start_date%></td>
    <td align="center"><%=end_date%></td>
    <td align="center"><%=eusage%></td>
    <td align="center"><a href="<%=basePath %>borrow.do?action=borrowModifyQ&id=<%=bid%>">修改</a></td>
    <td align="center"><a href="<%=basePath %>borrow.do?action=borrowDel&id=<%=bid%>">删除</a></td>
    <%
    
    if(c.getEnd_date().compareToIgnoreCase(thisDate)<0) {%>
    <td align="center"><a href="<%=basePath %>borrow.do?action=borrowReturn&id=<%=bid%>">超期</a></td>
    <%}else{ %>
    <td align="center"><a href="<%=basePath %>borrow.do?action=borrowReturn&id=<%=bid%>">归还</a></td>
    <%} %>
  </tr>
<%
  }
%>  
</table>
<table width="91%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#54ABEF">
  <tr>
              <td colspan="8"height="36" align="center">已还记录！</td>
            </tr>
  <tr align="center" bgcolor="#A8D8FC">
    <td width="15%">设备全称</td>
    <td width="15%">租借人</td>
    <td width="15%">开始时间</td>
    <td width="15%">结束时间</td>
    <td width="15%">用途</td>
    <td width="9%">修改</td>
    <td width="9%">删除</td>
    <td width="9%">操作</td>
  </tr>
<%
  while(itRe.hasNext()){
    BorrowForm c=(BorrowForm)itRe.next();
    int bid=c.getId();
    eid=c.getEid();
	name=c.getName();
	end_date=c.getEnd_date();
	start_date=c.getStart_date();
	eusage=c.getEusage();
	List list1=(List)equipmentDAO.query(eid);
	equipment=(EquipmentForm)list1.get(0);
	%> 
  <tr>
    <td align="center"><%=equipment.getEname()%></td>
    <td align="center"><%=name%></td>
    <td align="center"><%=start_date%></td>
    <td align="center"><%=end_date%></td>
    <td align="center"><%=eusage%></td>
    <td align="center"><a href="<%=basePath %>borrow.do?action=borrowModifyQ&id=<%=bid%>">修改</a></td>
    <td align="center"><a href="<%=basePath %>borrow.do?action=borrowDel&id=<%=bid%>">删除</a></td>
    <td align="center"><a href="<%=basePath %>borrow.do?action=borrowRestore&id=<%=bid%>">还原</a></td>
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
