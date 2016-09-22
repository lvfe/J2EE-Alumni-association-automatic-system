<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" %>
<%@ page import="com.alumni.struts.form.*"%>
<%@ page import="com.alumni.struts.dao.*"%>
<%@ page import="com.alumni.struts.form.*"%>
<%@ page import="com.alumni.core.*"%>
<%
List<PersonnelForm> list_p=(List<PersonnelForm>)request.getAttribute("personnelQuery");
List<CustomerForm> list_c=(List<CustomerForm>)request.getAttribute("customerQuery");
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

%>
<html>
<head>
<base href="<%=basePath%>">
<title>邮件</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=basePath %>css/style.css" rel="stylesheet">
<link href="<%=basePath %>css/index.css" rel="stylesheet">
<script language="javascript">
function checkform(myform){
	for(i=0;i<myform.length;i++){
		if(myform.elements[i].value=="" && myform.elements[i]!=myform.adjunct){
			alert(myform.elements[i].title+"不能为空！");
			myform.elements[i].focus();
			return false;
		}
	}
	if(!checkemail(myform.addressee.value)){
		alert("您输入的收件人地址不正确！");myform.addressee.focus();return false;
	}
	if(!checkemail(myform.addresser.value)){
		alert("您输入的发件人地址不正确！");myform.addresser.focus();return false;
	}	
}
function add(email){
	if(checkemail(email)){
		s=form1.addressee.value;
		if(s!=""){
			arrS=s.split(",");
			flag=false;		//标记是否已经添加
			for(i=0;i<arrS.length;i++){
				if(arrS[i]==email){	//判断该Email地址是否已经添加
					flag=true;
					break;
				}
			}
			if(!flag){
				form1.addressee.value=s+","+email;
			}
		}else{
			form1.addressee.value=email;
		}
	}
}
function checkemail(email){
var Check = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/; 
return Check.test(email);
}
function ShowTR(Oimg,OpenRep){
	if(OpenRep.style.display==""){
OpenRep.style.display="none";
}else{
OpenRep.style.display="block";
}
}
</script>
</head>
<body>
<div class="left02down01_xia noneBox" id="Bli067">
				<table width="70%" border="0" cellspacing="1" cellpadding="2">
				<tr>
					<td align="center" width="30%" bgcolor="#00ff00" onmousemove="show_menu(32)" id="f040"><a href="http://localhost:8080/alumni/sendMail.do?action=addMail" target="main" ><font size="2">&middot;邮件群发</font></a></td>
					<td align="center" width="30%" bgcolor="#00ff00" onmousemove="show_menu(34)" id="f041"><a href="http://localhost:8080/alumni/mail/unread.jsp" target="main" ><font size="2">&middot;未读邮件</font></a></td>
				</tr></table>
			</div>
<table width="80%" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="510" valign="top" style="padding:5px;"><table width="100%" height="504"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="26" valign="top" class="word_orange">当前位置：邮件群发 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top">
<form action="<%=basePath %>sendMail.do?action=sendMail" method="post" name="form1" onSubmit="return checkform(form1)">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="177" height="469" align="right" valign="top" background="Images/left_bg.gif" class="tableBorder">
      <table width="92%" border="0" cellpadding="0" cellspacing="0">
	<%if(list_c.size()>0){%>
      <tr>
        <td height="27"><a  onclick="javascript:ShowTR(img_1,OpenRep1);"href="javascript:void(0)"><img src="Images/jia.gif" alt="展开" name="img_1" width="10" height="10" border="0"> 客户列表</a></td>
      </tr>
      <tr id="OpenRep1" style="display:none">
        <td height="27">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <%  for(int i=0;i<list_c.size();i++){
    			CustomerForm c=(CustomerForm)list_c.get(i);%>
            <tr>
              <td>&nbsp;<a  onclick="add('<%=c.getEmail()%>');" href="javascript:void(0)"><%=c.getName()%></a></td>
            </tr>
			<%}%>
          </table>		  </td>
      </tr>
	<%}
	if(list_p.size()>0){%>  
      <tr>
        <td height="27"><a onclick="javascript:ShowTR(img_2,OpenRep2);"href="javascript:void(0)"><img src="Images/jia.gif" alt="展开" name="img_2" width="10" height="10" border="0"> 员工列表</a></td>
      </tr>
      <tr id="OpenRep2" style="display:none">
        <td height="27">
		 <table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <%  for(int i=0;i<list_p.size();i++){
    			PersonnelForm p=(PersonnelForm)list_p.get(i);%>
            <tr>
              <td>&nbsp;<a  onclick="add('<%=p.getEmail()%>');"href="javascript:void(0)"><%=p.getName()%></a></td>
            </tr>
			<%}%>
          </table>		</td>
      </tr>
	 <%}%>
    </table></td>
	<td background="images/title.jpg">&nbsp;</td>
    <td valign="top" background="images/title.jpg" class="tableBorder">
      <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
	    <tr>
          <td height="23" align="center">&nbsp;</td>
          <td height="23" align="center">&nbsp;</td>
          <td align="left">&nbsp;</td>
        </tr>
        <tr>
          <td width="16%" height="55" align="center">收件人：</td>
          <td width="84%" colspan="2" align="left">
            <textarea name="addressee" cols="58" rows="3"  id="addressee" title="收件人"></textarea>          </td>
        </tr>
        <%
        String from=personform.getEmail();
        if(from=="")
        {
         %>
        <tr>
          <td height="28" align="center">发件人：</td>
          <td colspan="2" align="left"><input name="addresser" type="text" id="addresser" title="发件人" size="60"></td>
        </tr>
        <tr>
          <td height="28" align="center">密&nbsp;&nbsp;码：</td>
          <td colspan="2" align="left"><input name="pwd" type="password" id="pwd" title="发件人信箱密码" size="60"></td>
        </tr>
        <%
        }
        else{
        %>
        <tr>
        <td><input name="addresser" type="hidden" id="addresser" title="发件人" value=<%=personform.getEmail() %>></td>
        <td><input name="pwd" type="hidden" id="pwd" title="发件人信箱密码" value=<%=personform.getEmailpass() %> ></td>
       
        </tr>
         <%} %>
        <tr>
          <td height="28" align="center">主&nbsp;&nbsp;题：</td>
          <td colspan="2" align="left"><input name="title" type="text" id="title" title="邮件主题" size="60"></td>
        </tr>
        <tr>
          <td height="28" align="center">附&nbsp;&nbsp;件：</td>
          <td colspan="2" align="left"><input name="adjunct" type="text" id="adjunct" title="附件" size="45" readonly="yes">
            &nbsp;
            <input name="Submit3" type="button" class="btn_grey" value="上传附件" onClick="window.open('mail/upFile.jsp','','width=350,height=150');"></td>
        </tr>
        <tr>
          <td height="171" align="center">内&nbsp;&nbsp;容：</td>
          <td colspan="2" align="left"><textarea name="content" cols="58" rows="12" class="wenbenkuang" id="content" title="邮件内容"></textarea></td>
        </tr>
        <tr>
          <td height="32" align="center">&nbsp;</td>
          <td height="23" align="center"><input name="Submit" type="submit" class="btn_grey" value="发送">
            &nbsp;
            <input name="Submit2" type="reset" class="btn_grey" value="重置">
            &nbsp;</td>
          <td align="left">&nbsp;</td>
        </tr>

        </table>
      </td>

  </tr>
</table>
</form>
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
