<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@page import="java.util.*" %>
<%@page import="com.alumni.core.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<jsp:directive.page import="com.alumni.struts.action.*"/>
<jsp:directive.page import="com.alumni.struts.dao.*"/>
<jsp:directive.page import="com.alumni.struts.form.*"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<base href="<%=basePath%>">
    
    <title>My JSP 'message_detail.jsp' starting page</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="<%=basePath %>css/style.css" rel="stylesheet">
<link href="<%=basePath %>css/index.css" rel="stylesheet">

  </head>
  
  <body>
  <%
  out.clear();
  request.setCharacterEncoding("utf-8"); 
 response.setContentType("text/html;charset=utf-8");
//验证用户是否登录
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
    <div class="left02down01_xia noneBox" id="Bli067">
				<table width="70%" border="0" cellspacing="1" cellpadding="2">
				<tr>
					<td align="center" width="30%" bgcolor="#00ff00" onmousemove="show_menu(32)" id="f040"><a href="http://localhost:8080/alumni/sendMail.do?action=addMail" target="main" ><font size="2">&middot;邮件群发</font></a></td>
					<td align="center" width="30%" bgcolor="#00ff00" onmousemove="show_menu(34)" id="f041"><a href="http://localhost:8080/alumni/mail/unread.jsp" target="main" ><font size="2">&middot;未读邮件</font></a></td>
				</tr></table>
			</div>
<table width="100%" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="auto"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="80%" valign="top" style="padding:5px;"><table width="98%" height="auto"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="22" valign="top" class="word_orange">&nbsp;<br>当前位置：邮件管理 &gt; <a href="<%=basePath%>mail/unread.jsp" target="main">未读邮件</a>&gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top">
        <% 	//achieve the email user and password

        if(personform.getEmail()!=""&&personform.getEmail()!=null){
       String[] str=personform.getEmail().split("@");
String emailName=str[0];
String pass=personform.getEmailpass();
ReciveOneMail receive=null;	
List<ReciveOneMail> list=ReciveOneMail.test(emailName,pass);
		if(list==null || list.isEmpty()){
%>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="36" align="center">暂无邮件！</td>
            </tr>
          </table>
          <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="5%" align="right"><img src="images/add.gif" width="19" height="18">&nbsp;</td>
    <td width="95%"><a href="<%=basePath%>sendMail.do?action=addMail">发邮件</a></td>
  </tr>
</table>
 <%
}else{
  //通过迭代方式显示数据
  Iterator it=list.iterator();
  %>
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="84%" align="right"><img src="Images/add.gif" width="19" height="18">&nbsp;</td>
<td width="16%">
      <a href="<%=basePath%>fileManage/fileUp.jsp">共享文件</a> </td>	  
  </tr>
</table>  
  <table width="91%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#54ABEF">
  <tr><th colspan="5">邮箱邮件数：<%=list.size() %></th></tr>
  <tr align="center" bgcolor="#e3F4F7">
    <td width="5%" height="26" bgcolor="#A8D8FC">序号</td>
    <td width="15%" bgcolor="#A8D8FC">附件</td>
    <td width="30%" bgcolor="#A8D8FC">主题</td>
    <td width="9%" bgcolor="#A8D8FC">发件人</td>
    <td width="9%" bgcolor="#A8D8FC">时间</td>
  </tr>
<%int i=0; 
  while(it.hasNext()){
    receive=(ReciveOneMail)it.next();
    if(receive.isNew()){
    continue;
    }	
    String subject=receive.getSubject();
    String sentdate=receive.getSentDate();
     String from=receive.getFrom();
     String attachPath=receive.getAttachPath();
     String messageid=receive.getMessageId();
	%> 
  <tr>
    <td style="padding:5px;"><a href="<%=basePath%>mail/goin.jsp?messageid=<%=messageid %>"><%=i++%></a></td>
    <td align="center"><a href="<%=basePath%>mail/goin.jsp?messageid=<%=messageid %>"><%=attachPath%></a></td>
    <td align="center"><a href="<%=basePath%>mail/goin.jsp?messageid=<%=messageid %>"><%=subject%></a></td>
    <td align="center"><a href="<%=basePath%>mail/goin.jsp?messageid=<%=messageid %>"><%=from %></a></td>
    <td align="center"><a href="<%=basePath%>mail/goin.jsp?messageid=<%=messageid %>"><%= sentdate%></a></td>
    <%} %>
  </tr>
<%
  }
    }else{%>
   <p>还未关联邮箱！请在更新个人信息处填写qq邮箱！<a href='<%=basePath%>personnel.do?action=personnelModifyQ&id=<%=id%>' target='main' class='btn_grey'>更新信息</a></p>
   <p>或直接进入邮箱</p>
   <% }
    %>
    </tr>
    <tr>
    <td colspan="5"><a href='http://mail.qq.com/' target="main" class="btn_grey">进入邮箱</a></td></tr>
    </table>
   </td>
      </tr>
    </table>
</td>
  </tr>
</table>
</td>
</tr>
</table>
</div>
  </body>
</html>
