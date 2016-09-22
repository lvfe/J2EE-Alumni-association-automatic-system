<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
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
List list=(List)request.getAttribute("personnelQuery");
%>
<head>
<base href="<%=basePath%>">
<title>邮件</title>
<link href="<%=basePath %>css/style.css" rel="stylesheet">
</head>
<body>
<div class="left02down01_xia noneBox" id="Bli069">
				<table width="70%" border="0" cellspacing="1" cellpadding="2">
				<tr>
				<%if(Utype==1){ %>
					<td align="center" width="20%" bgcolor="#00ff00" onmousemove="show_menu(37)" id="f041"><a href="http://localhost:8080/alumni/personnel/personnel_add.jsp" target="main" ><font size="2">&middot;添加职工</font></a></td>
					<td align="center" width="20%" bgcolor="#00ff00" onmousemove="show_menu(38)" id="f040"><a href="http://localhost:8080/alumni/personnel.do?action=personnelQuery" target="main" ><font size="2">&middot;管理职工信息</font></a></td>
					<td align="center" width="20%" bgcolor="#00ff00" onmousemove="show_menu(38)" id="f040"><a href="http://localhost:8080/alumni/personnel.do?action=personnelModifyQ&id=<%=id%>" target="main" ><font size="2">&middot;修改个人信息信息</font></a></td>
					<%} else{%>
					<td align="center" width="20%" bgcolor="#00ff00" onmousemove="show_menu(38)" id="f040"><a href="http://localhost:8080/alumni/personnel.do?action=personnelModifyQM&id=<%=id%>" target="main" ><font size="2">&middot;修改个人信息信息</font></a></td>
				<%} %>
				</tr></table>
			</div>	
<br>
<table width="80%" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="510" valign="top" style="padding:5px;"><table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="22" valign="top" class="word_orange">当前位置：员工管理 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top"><%
if(list==null || list.isEmpty()){
%>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="36" align="center">暂无员工信息！</td>
               <td><a href="<%=basePath %>personnel/personnel_add.jsp">添加员工信息</a> </td>	 
            </tr>
          </table>
          <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
     </tr>
</table>
 <%
}else{
  //通过迭代方式显示数据
  Iterator it=list.iterator();
  String username="";
  String name="";
  String mobileTel="";
  String email="";
  %>
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="84%" align="right"><img src="Images/add.gif" width="19" height="18">&nbsp;</td>
<td width="16%">
      <a href="<%=basePath %>personnel/personnel_add.jsp">添加员工信息</a> </td>	  
  </tr>
</table>  
  <table width="91%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#54ABEF">
  <tr align="center" bgcolor="#e3F4F7">
    <td width="15%" height="26" bgcolor="#A8D8FC">用户名</td>
    <td width="15%" height="26" bgcolor="#A8D8FC">员工姓名</td>
    <td width="25%" bgcolor="#A8D8FC">手机</td>
    <td width="25%" bgcolor="#A8D8FC">邮箱</td>
    <td width="9%" bgcolor="#A8D8FC">修改</td>
    <td width="9%" bgcolor="#A8D8FC">删除</td>
  </tr>
<%
  while(it.hasNext()){
    PersonnelForm p=(PersonnelForm)it.next();
    id=p.getID();
    username=p.getUsername();
	name=p.getName();
	mobileTel=p.getMobileTel();
	email=p.getEmail();
	%> 
  <tr>
   <td style="padding:5px;"><%=username%></td>
    <td style="padding:5px;"><%=name%></td>
    <td align="center"><%=mobileTel%></td>
    <td align="center"><%=email%></td>
    <%if(Utype==1){ %>
    <td align="center"><a href="personnel.do?action=personnelModifyQ&id=<%=id%>">修改</a></td>
    <td align="center"><a href="personnel.do?action=personnelDel&id=<%=id%>">删除</a></td>
    <%}else{ %>
    <td align="center"><font color="#f5f5f5">修改</font></td>
    <td align="center"><font color="#f5f5f5">删除</font></td>
    <%} %>
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
