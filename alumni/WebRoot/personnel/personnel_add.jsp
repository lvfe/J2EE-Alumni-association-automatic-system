<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.alumni.struts.dao.*" %>
<%@ page import="com.alumni.core.*" %>
<%@ page import="com.alumni.struts.form.*"%>
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
<html>
<head>
<base href="<%=basePath%>">
<title>邮件</title>
<link href="<%=basePath %>css/style.css" rel="stylesheet">
<link href="<%=basePath %>css/index.css" rel="stylesheet">
<script language="javascript">
function checkform(myform){
	if(myform.username.value==""){
		alert("请输入员工姓名！");myform.username.focus();return false;
	}
	if(myform.name.value==""){
		alert("请输入员工姓名！");myform.name.focus();return false;
	}
	if(myform.status.value==""){
		alert("请输入员工权限！");myform.status.focus();return false;
	}
	if(myform.password.value==""){
		alert("请输入员工密码！");myform.password.focus();return false;
	}
	if(myform.password.value!=myform.password1.value){
		alert("密码不一致！");myform.password.value="";myform.password1.value="";return false;
	}
	if(myform.emailpass.value!=myform.emailpass1.value){
		alert("密码不一致！");myform.password.value="";myform.password1.value="";return false;
	}
	
    var Check = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/; 

	if(!Check.test(myform.email.value)&&myform.email.value!=""){
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
        <td height="39" valign="top" class="word_orange">&nbsp;<br>当前位置：职工管理  &gt; 添加员工信息 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top"><table width="68%"  border="0" cellpadding="0" cellspacing="0">
		<form name="form1" action="<%=basePath %>personnel.do?action=personnelAdd" method="post" onSubmit="return checkform(form1)">
            <tr>
              <td width="20%" height="27" align="center">用户名&nbsp;：</td>
              <td width="80%"><input name="username" type="text" id="username" size="20">
                *</td>
            </tr>
            <tr>
              <td width="20%" height="27" align="center">员工姓名：</td>
              <td width="80%"><input name="name" type="text" id="name" size="20">
                *</td>
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
            </tr>
            <tr>
              <td width="20%" height="27" align="center">权&nbsp;&nbsp;&nbsp;&nbsp;限：</td>
              <td width="80%"><select name="status" id="status">
							<option value="0" selected>普通用户</option>
							<option value="1">超级管理员</option>
							<option value="2">特殊用户</option>
						</select>
                </td>
            </tr>
            <tr>
              <td height="27" align="center">手机号码：</td>
              <td><input name="mobileTel" type="text" id="mobileTel" size="20">
              *</td>
            </tr>
            <tr>
              <td height="27" align="center">邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</td>
              <td><input name="email" type="text" id="email" size="50">
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
