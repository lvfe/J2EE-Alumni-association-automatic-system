<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" pageEncoding="utf-8"%>
<%@ page import="com.alumni.core.*" %>
<%@ page import="com.alumni.struts.dao.*" %>
<%@ page import="com.alumni.struts.form.*" %>
<%@ page import="java.util.*"%>

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

List list=(List)request.getAttribute("customerQuery");
%>
<head>
<base href="<%=basePath%>">
<title>客户信息</title>
<link href="<%=basePath %>css/style.css" rel="stylesheet">
</head>
<body>
<%if(Utype==1){ %>
			<div class="left02down01_xia noneBox" id="Bli068">
				<table width="70%" border="0" cellspacing="1" cellpadding="2">
				<tr>
					<td align="center" width="30%" bgcolor="#00ff00" onmousemove="show_menu(35)" id="f041"><a href="http://localhost:8080/alumni/customer/customer_add.jsp" target="main" ><font size="2">&middot;添加客户</font></a></td>
					<td align="center" width="30%" bgcolor="#00ff00" onmousemove="show_menu(36)" id="f040"><a href="http://localhost:8080/alumni/customer.do?action=customerQuery" target="main" ><font size="2">&middot;管理客户信息</font></a></td>
				</tr></table>
			</div>	
		<%} %>
<table  width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="510" valign="top" style="padding:5px;"><table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="22" valign="top" class="word_orange">当前位置：名片夹管理 &gt; 客户管理 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top"><%
if(list==null || list.isEmpty()){
%>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="36" align="center">暂无客户信息！</td>
            </tr>
          </table>
          <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="5%" align="right"><img src="Images/add.gif" width="19" height="18">&nbsp; </td>
    <td width="95%"><a href="<%=basePath %>customer/customer_add.jsp">添加客户信息</a> </td>
    
  </tr>
</table>
 <%
}else{
  //通过迭代方式显示数据
  Iterator it=list.iterator();
  String name="";
  String mobileTel="";
  String email="";
  %>
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="84%" align="right"><img src="Images/add.gif" width="19" height="18">&nbsp; </td>
<td width="16%">
      <a href="<%=basePath %>customer/customer_add.jsp">添加客户信息</a> </td>	  
  </tr>
</table>  
  <table width="91%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#54ABEF">
  <tr align="center" bgcolor="#A8D8FC">
    <td width="20%">客户名称</td>
    <td width="30%">手机</td>
    <td width="30%">邮箱</td>
    <td width="9%">修改</td>
    <td width="9%">删除</td>
  </tr>
<%
  while(it.hasNext()){
    CustomerForm c=(CustomerForm)it.next();
    id=c.getID();
	name=c.getName();
	email=c.getEmail();
	mobileTel=c.getMobileTel();
	%> 
  <tr>
    <td style="padding:5px;"><%=name%></td>
    <td align="center"><%=mobileTel%></td>
    <td align="center"><%=email%></td>
    <td align="center"><a href="customer.do?action=customerModifyQ&id=<%=id%>">修改</a></td>
    <td align="center"><a href="customer.do?action=customerDel&id=<%=id%>">删除</a></td>
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
<%@include file="../copyright.jsp"%>
</body>
</html>
