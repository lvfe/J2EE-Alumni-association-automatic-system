<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" pageEncoding="utf-8" %>
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
 %>
<head>
<base href="<%=basePath%>">
<title>添加客户</title>
<link href="<%=basePath%>css/style.css" rel="stylesheet">
<script language="javascript">
function checkform(myform){
	if(myform.name.value==""){
		alert("请输入客户全称！");myform.name.focus();return false;
	}
	if(myform.mobileTel.value==""){
		alert("请输入手机号码！");myform.mobileTel.focus();return false;
	}
	if(!checkTel(myform.mobileTel.value)){
		alert("您输入的手机号码有误，请重新输入！");myform.mobileTel.focus();return false;
	}
	if(myform.email.value==""){
		alert("请输入邮箱！");myform.email.focus();return false;
	}
	if(!checkemail(myform.email.value)){
		alert("您输入的邮箱有误，请重新输入！");myform.email.focus();return false;
	}
	return true;		
}
</script>
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
    <td height="510" valign="top" style="padding:5px;"><table width="98%" height="504"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="39" valign="top" class="word_orange">当前位置：名片夹管理 &gt; 客户管理 &gt; 添加客户信息 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top"><table width="68%"  border="0" cellpadding="0" cellspacing="0">
		<form name="form1" action="<%=basePath %>customer.do?action=customerAdd" method="post" onSubmit="return checkform(form1)">
            <tr>
              <td width="20%" height="27" align="center">客户全称：</td>
              <td width="80%"><input name="name" type="text" id="name" size="50">
                *</td>
            </tr>
            <tr>
              <td height="27" align="center">手&nbsp;&nbsp;&nbsp;&nbsp;机：</td>
              <td><input name="mobileTel" type="text" id="mobileTel" size="30">
                *</td>
            </tr>
            <tr>
              <td height="27" align="center">邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</td>
              <td><input name="email" type="text" id="email" size="50">
                *</td>
            </tr>
            <tr>
              <td height="27" colspan="2" align="center"><input name="Submit" type="submit" class="btn_grey" value="提交">
                &nbsp;
                <input name="Submit2" type="reset" class="btn_grey" value="重置">
&nbsp;
<input name="Submit3" type="button" class="btn_grey" value="返回" onClick="window.location.href='<%=basePath %>customer.do?action=customerQuery';"></td>
              </tr>
			  </form>
          </table>
          </td>
      </tr>
    </table>
</td>
  </tr>
</table>
<%@include file="../copyright.jsp"%>
</body>
</html>
