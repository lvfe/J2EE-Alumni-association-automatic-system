<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" pageEncoding="utf-8"%>
<%@ page import="com.alumni.struts.form.*"%>
<%@ page import="com.alumni.struts.dao.*" %>
<%@ page import="com.alumni.core.*" %>
<%@ page import="java.util.*"%>
<%@include file="/commons/taglibs.jsp"%>
<%@ taglib uri="http://fckeditor.net/tags-fckeditor" prefix="FCK" %>

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
<title>添加设备</title>
<jsp:useBean id="equipment" class="com.alumni.struts.form.EquipmentForm" scope="request"/>
<link href="<%=basePath %>css/style.css" rel="stylesheet">
<script src="${ctx}/js/setdate.js"></script>

<script language="javascript">
function checkform(myform){
	if(myform.ename.value==""){
		alert("请输入设备全称！");myform.ename.focus();return false;
	}
	if(myform.etype.value==""){
		alert("请输入设备类型！");myform.etype.focus();return false;
	}
	if(myform.eusage.value==""){
		alert("请输入用途！");myform.eusage.focus();return false;
	}
	
	return true;		
}
</script>
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
    <td height="100%" valign="top" style="padding:5px;"><table width="98%" height="504"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="39" valign="top" class="word_orange">当前位置：设备管理 &gt; 添加设备信息 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top"><table width="68%"  border="0" cellpadding="0" cellspacing="0">
		<form name="form1" action="<%=basePath %>equipment.do?action=equipmentAdd" method="post" onSubmit="return checkform(form1)">
            <tr>
              <td width="20%" height="27" align="center">设备全称：</td>
              <td width="80%"><input name="ename" type="text" id="ename" size="30">
                *（唯一）</td>
            </tr>
            <tr>
              <td height="27" align="center">类&nbsp;&nbsp;&nbsp;&nbsp;型：</td>
              <td><input name="etype" type="text" id="etype" size="30">
                *</td>
            </tr>
            <tr>
              <td height="27" align="center">用&nbsp;&nbsp;&nbsp;&nbsp;途：</td>
              <td><input name="eusage" type="text" id="eusage" size="50">
                *</td>
            </tr>
            <tr>
              <td height="27" align="center">购买时间：</td>
              <td><input name="buy_time" type="text" id="buy_time" size="30" value="${equipment.buy_time }" onfocus="setday(this)" readonly>
                *(2013-01-01)</td>
            </tr>
            <tr>
              <td height="27" colspan="2" align="center"><input name="Submit" type="submit" class="btn_grey" value="提交">
                &nbsp;
                <input name="Submit2" type="reset" class="btn_grey" value="重置">
&nbsp;
<input name="Submit3" type="button" class="btn_grey" value="返回" onClick="window.location.href='<%=basePath %>equipment.do?action=equipmentQuery';"></td>
              </tr>
			  </form>
          </table>
          </td>
      </tr>
    </table>
</td>
  </tr>
</table>
</body>
</html>
