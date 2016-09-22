<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" pageEncoding="utf-8"%>
<%@ page import="com.alumni.struts.form.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.alumni.core.*" %>
<%@ page import="com.alumni.struts.dao.*" %>
<html>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
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
List list=(List)request.getAttribute("personnelQuery");
%>
<head>
<base href="<%=basePath%>">
<title>邮件</title>
<link href="<%=basePath %>css/style.css" rel="stylesheet">
<script language="javascript">
function checkform(form1){
	if(myform.name.value==""){
		alert("请输入员工姓名！");myform.name.focus();return false;
	}
	if(myform.type.value==""){
		alert("请输入员工权限！");myform.name.focus();return false;
	}
	if(myform.password.value==""){
		alert("请输入员工密码！");myform.password.focus();return false;
	}
	if(myform.password.value!=myform.password1.value){
		alert("密码不一致！");myform.password.value="";myform.password1.value="";return false;
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
	if(myform.emailpass.value==""){
		alert("请输入邮箱密码！");myform.emailpass.focus();return false;
	}
	if(myform.emailpass.value!=myform.emailpass1.value){
		alert("密码不一致！");myform.password.value="";myform.password1.value="";return false;
	}
	if(!checkemail(myform.email.value)){
		alert("您输入的邮箱有误，请重新输入！");myform.email.focus();return false;
	}
	return true;		
}
</script>
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
<table width="80%" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="510" valign="top" style="padding:5px;"><table width="98%" height="504"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="39" valign="top" class="word_orange">当前位置： 员工管理 &gt; 修改员工信息 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top"><table width="68%"  border="0" cellpadding="0" cellspacing="0">
		<form name="form1" action="<%=basePath %>personnel.do?action=personnelModify" method="post" onSubmit="return checkform(form1)">
		<%if(list.size()==1){
		PersonnelForm p=(PersonnelForm)list.get(0);
		%>
		<tr>
              <td width="20%" height="27" align="center">用户名&nbsp;：</td>
              <td width="80%"><input name="username" type="text" id="username" value="<%=p.getUsername()%>"size="20">
                *</td>
            </tr>
            <tr>
              <td width="20%" height="27" align="center">员工姓名：</td>
              <td width="80%"><input name="name" type="text" id="name" value="<%=p.getName()%>" size="20">
                *
                  <input name="ID" type="hidden" id="ID" value="<%=p.getID()%>"></td>
            </tr>
            <tr>
              <td width="20%" height="27" align="center">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
              <td width="80%"><input name="password" type="password" id="password" size="20">
                *</td>
            </tr>
            <tr>
              <td width="20%" height="27" align="center">密码确认：</td>
              <td width="80%"><input name="password1" type="password" id="password1" size="20">
                *</td>
                <td><input name="status" type="hidden" id="status" value=<%=p.getStatus() %> /></td>
            </tr>
            <tr>
              <td height="27" align="center">手机号码：</td>
              <td><input name="mobileTel" type="text" id="mobileTel" value="<%=p.getMobileTel()%>" size="20">
                *</td>
            </tr>
            <tr>
              <td height="27" align="center">邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</td>
              <td><input name="email" type="text" id="email" value="<%=p.getEmail()%>" size="50">
                *</td>
            </tr>
             <tr>
              <td width="20%" height="27" align="center">邮箱密码：</td>
              <td width="80%"><input name="emailpass" type="password" id="emailpass" size="20">
                *</td>
            </tr>
            <tr>
              <td width="20%" height="27" align="center">密码确认：</td>
              <td width="80%"><input name="emailpass1" type="password" id="emailpass1" size="20">
                *</td>
            </tr>
			<%}else{%>
				<script language="javascript">
				window.location.href="personnel.do?action=personnelQuery";
				</script>
			<%}%>
            <tr>
              <td height="27" colspan="2" align="center"><input name="Submit" type="submit" class="btn_grey" value="提交">
                &nbsp;
                <input name="Submit2" type="reset" class="btn_grey" value="重置">
                &nbsp;
                <input name="Submit3" type="button" class="btn_grey" value="返回" onClick="window.location.href='<%=basePath %>personnel.do?action=personnelQuery';"></td>
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
