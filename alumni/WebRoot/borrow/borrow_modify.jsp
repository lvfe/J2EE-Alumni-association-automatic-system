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

List list=(List)request.getAttribute("borrowQuery");
%>
<head>
<base href="<%=basePath%>">
<title>信息修改</title>
<script src="${ctx}/js/setdate.js"></script>
<jsp:useBean id="borrow" class="com.alumni.struts.form.BorrowForm" scope="request"/>
<link href="<%=basePath %>css/style.css" rel="stylesheet">
<script language="javascript">
function checkform(myform){
	if(myform.eid.value==""){
		alert("请选择设备全称！");myform.eid.focus();return false;
	}
	if(myform.name.value==""){
		alert("请输入借用人姓名！");myform.name.focus();return false;
	}
	if(myform.start_date.value==""){
		alert("请输入租借的开始时间！");myform.start_date.focus();return false;
	}
	if(myform.end_date.value==""){
		alert("请输入租借的结束时间！");myform.end_date.focus();return false;
	}
	if(myform.end_time.value>myform.start_time.value){
		alert("您输入的时间区间有误，请重新输入！");myform.start_time.focus();return false;
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
        <td height="39" valign="top" class="word_orange">当前位置：固定资产管理 &gt; 设备管理 &gt; 修改租赁信息 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top"><table width="68%"  border="0" cellpadding="0" cellspacing="0">
		<form name="form1" action="<%=basePath %>borrow.do?action=borrowModify" method="post" onSubmit="return checkform(form1)">
		<%if(list.size()==1){
		BorrowForm c=(BorrowForm)list.get(0);
		%>
            <tr>
              <td width="20%" height="27" align="center">设备全称：</td>
              <td width="80%"><input name="eid" type="text" id="eid" value="<%=c.getEid()%>" size="50">
                *
                  <input name="id" type="hidden" id="id" value="<%=c.getId()%>"></td>
            </tr>
            <tr>
              <td height="27" align="center">借用人名：</td>
              <td><input name="name" type="text" id="name" size="30"  value="<%=c.getName()%>">
                *</td>
            </tr>
            <tr>
              <td height="27" align="center">开始日期：</td>
              <td><input name="start_date" type="text" id="start_date" maxlength="250" value=<%=c.getStart_date() %> >
                *</td>
            </tr>
            <tr>
              <td height="27" align="center">结束日期：</td>
              <td><input name="end_date" type="text" id="end_date" maxlength="250" value=<%=c.getEnd_date() %> >
                *</td>
            </tr>
            <tr>
              <td height="27" align="center">用&nbsp;&nbsp;&nbsp;&nbsp;途：</td>
              <td><input name="eusage" type="text" id="eusage" size="50" value="<%=c.getEusage()%>">
                *</td>
            </tr>
			<%}else{%>
				<script language="javascript">
				window.location.href="<%=basePath%>borrow.do?action=borrowQuery";
				</script>
			<%}%>
            <tr>
              <td height="27" colspan="2" align="center"><input name="Submit" type="submit" class="btn_grey" value="提交">
                &nbsp;
                <input name="Submit2" type="reset" class="btn_grey" value="重置">
&nbsp;
<input name="Submit3" type="button" class="btn_grey" value="返回" onClick="window.location.href='<%=basePath %>borrow.do?action=borrowQuery';"></td>
              </tr>
			  </form>
          </table>
          </td>
      </tr>
    </table>
</td>
  </tr>
</table></td>
  </tr>
</table>
</body>
</html>
