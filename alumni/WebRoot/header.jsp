<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.alumni.core.*" %>
<%@ page import="com.alumni.struts.dao.*" %>
<%@ page import="com.alumni.struts.form.*" %>
<link rel="stylesheet" type="text/css"  href="css/styleAdmin.css" />
<%
int id=0;
id=(Integer)session.getAttribute("id");
  		if(id == 0) {
  			response.sendRedirect("index.jsp");
  		}
PersonnelDAO dao=new PersonnelDAO();
PersonnelForm personform=null;
personform=(PersonnelForm)dao.query(id).get(0);
String Uname=personform.getName();
int Utype=personform.getStatus();

ChStr chStr=new ChStr();
%><table width="100%"  border="0" cellspacing="0" cellpadding="4">
  <tr> 
    <td width="250px" height="63px" rowspan="2"bgcolor="#f5f5f5"><IMG width="250px" height="59px" alt=Logo src="images/logo.gif"></td> 
  <td  border="0" bgcolor="#f5f5f5">
  <div align="right">用户[ <%=Uname %> ]&nbsp;权限[<%=Utype %>]&nbsp;&nbsp;</div></td>
  </tr>
  <tr>
    <td> 
    <table width="100%" border="0" cellspacing="1" cellpadding="2">
        <tr> 
          <td align="center" width="30%" bgcolor="#f5f5f5"><A href="main.jsp" target="_parent"><IMG height=25 src="images/1.jpeg" width=120 border=0 name=Image6></A></td>
          <td align="center" width="30%" bgcolor="#f5f5f5"><A target="_parent" href="servlet/logout"><IMG height=25 src="images/2.jpeg" width=120 border=0 name=Image3></A></td>
          <td align="center" width="30%" bgcolor="#f5f5f5"><A target="_parent" href="online.jsp"><IMG height=25 src="images/3.jpeg" width=120 border=0 name=Image4></A></td>
        </tr>
      </table>
     </td>
  </tr>
  <tr> 
  <td colspan="2">
    <table width="100%" border="0" cellspacing="1" cellpadding="2">
        <tr> 
          <td id="Bl60" align="center" width="9%" bgcolor="#f5f5f5"><A href="http://localhost:8080/alumni/message/message_detail.jsp" target="main"><font size="2">通知管理</font></A></td>
          <td id="Bl61" align="center" width="9%" bgcolor="#f5f5f5"><A href="http://localhost:8080/alumni/agenda/CalendarDisplay.jsp" target="main"><font size="2">会议日程管理</font></A></td>
          <%if(Utype!=2){ %>
          <td id="Bl62" align="center" width="9%" bgcolor="#f5f5f5"><A href="http://localhost:8080/alumni/agenda/CalendarDisplay1.jsp" target="main"><font size="2">个人日程管理</font></A></td>
          <%} 
          if(Utype==0){%>
          <td id="Bl63" align="center" width="9%" bgcolor="#f5f5f5"><A href="http://localhost:8080/alumni/agenda/Taskdetail.jsp" target="main"><font size="2">刘的日程管理</font></A></td>
          <%}else{ %>
          <td id="Bl63" align="center" width="9%" bgcolor="#f5f5f5"><A href="http://localhost:8080/alumni/agenda/LiuCalendarDisplay.jsp" target="main"><font size="2">刘的日程管理</font></A></td>
          <%} %>
          <td id="Bl64" align="center" width="9%" bgcolor="#f5f5f5"><A href="http://localhost:8080/alumni/fileManage/file.jsp" target="main"><font size="2">文件中心</font></A></td>
          <td id="Bl65" align="center" width="9%" bgcolor="#f5f5f5"><A href="http://localhost:8080/alumni/borrow.do?action=borrowQuery" target="main"><font size="2">设备管理</font></A></td>
          <td id="Bl67" align="center" width="9%" bgcolor="#f5f5f5"><A href="http://localhost:8080/alumni/sendMail.do?action=addMail" target="main"><font size="2">邮件管理</font></A></td>
          <td id="Bl68" align="center" width="9%" bgcolor="#f5f5f5"><A href="http://localhost:8080/alumni/personnel.do?action=personnelQuery" target="main"><font size="2">职工管理</font></A></td>
          <%if(Utype==1){ %>
          <td id="Bl69" align="center" width="9%" bgcolor="#f5f5f5"><A href="http://localhost:8080/alumni/customer.do?action=customerQuery" target="main"><font size="2">客户管理</font></A></td>
          <%} %>
          <td id="Bl70" align="center" width="9%" bgcolor="#f5f5f5"><A href="http://localhost:8080/alumni/searchAlunmi/showAlumni.jsp" target="main"><font size="2">校友查询</font></A></td>
        </tr>
      </table></td>
  </tr>
</table>
