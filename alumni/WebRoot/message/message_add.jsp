<%@page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" pageEncoding="utf-8"%>
<%@page import="java.util.*" %>
<%@page import="com.alumni.struts.dao.*" %>
<%@page import="com.alumni.struts.form.*" %>
<%@include file="/commons/taglibs.jsp"%>
<jsp:directive.page import="com.alumni.core.bean"/>
<%@ taglib uri="http://fckeditor.net/tags-fckeditor" prefix="FCK" %>
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

request.setCharacterEncoding("utf-8");
response.setContentType("text/html;charset=utf-8"); 
response.setCharacterEncoding("utf-8");
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
<base href="<%=basePath%>">
		<title>My JSP 'message_add.jsp' starting page</title>
		<jsp:useBean id="message" class="com.alumni.struts.form.Message" scope="request"/>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="expires" content="0"/>
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
		<meta http-equiv="description" content="This is my page"/>
		<link href="<%=basePath %>css/styleAdmin.css" rel="stylesheet"/>
	<link href="<%=basePath %>css/style.css" rel="stylesheet"/>
	
<script src="${ctx}/js/setdate.js"></script>
	
<script src="${ctx}/fckeditor/fckeditor.js"></script>
	<script type="text/javascript" src="fckeditor/fckeditor.js"></script>
<%
String autoDetectLanguageStr;
String defaultLanguageStr;
request.setCharacterEncoding("utf-8");
String codeStr=request.getParameter("code");
if(codeStr==null) {
	autoDetectLanguageStr="true";
	defaultLanguageStr="en";
}
else {
	autoDetectLanguageStr="false";
	defaultLanguageStr=codeStr;
}

%>	
	
<script type="text/javascript">
function   checkSubject(){

    var  writer = document.mesfrm.subject.value();
    if(writer==""){
       alert("请输入通知题目");
       return false;
    }
    return true;
    
}


</script>
</head>

	<body>
	<div class="left02down01_xia noneBox" id="Bli060">
			<table width="70%" border="0" cellspacing="1" cellpadding="2" >
				<tr>
					<td align="center" width="30%" bgcolor="#00ff00" onmousemove="show_menu(10)" id="f011"><a href="<%=basePath%>message/message_unread.jsp" target="main" ><font size="2">&middot;未读通知</font></a></td>
					<td align="center" width="30%" bgcolor="#00ff00" onmousemove="show_menu(11)" id="f010"><a href="<%=basePath%>message/message_add.jsp" target="main" ><font size="2">&middot;添加通知</font></a></td>
					<td align="center" width="30%" bgcolor="#00ff00" onmousemove="show_menu(12)" id="f011"><a href="<%=basePath%>message/message_detail.jsp" target="main" ><font size="2">&middot;管理通知</font></a></td>
					
				</tr>
				</table>
		 </div>
<div class="rrcc" id="RightBox">
	<table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
		    <td align="center" height="100%">
		       <div class="center" id="Mobile" onclick="show_menuC()"></div>
		    </td>
				
		    <td width="100%" height="100%">     
	<table width="100%" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="510" valign="top" style="padding:5px;"><table width="98%" height="504"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="39" valign="top" class="word_orange">当前位置：公告管理 &gt;  添加公告 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top">
        
		<form action="<%=basePath%>message/do_message_add.jsp" name="mesfrm" method="post" onSubmit="return checkSubject()">
		    <input type="hidden" name="authorid" maxlength="250" value="<%=String.valueOf(id) %>" />
			<table width="68%"  border="0" cellpadding="0" cellspacing="0">			
		    <tr>
              <td width="20%" height="27" align="center">题&nbsp;&nbsp;&nbsp;&nbsp;目：</td>
              <td width="80%"><input name="subject" type="text" id="subject" size="20">
                *</td>
            </tr>
            <tr>
            <td width="20%" height="27" align="center">内&nbsp;&nbsp;&nbsp;&nbsp;容：</td>
            <td><script type="text/javascript">
			var oFCKeditor = new FCKeditor('content');
				oFCKeditor.BasePath = "${ctx}/fckeditor/";
				
				oFCKeditor.Height = 300;
			oFCKeditor.Value = '${message.content==null?" ":message.content}';
			oFCKeditor.Create();
			</script></td></tr>
            <tr>
              <td height="27" align="center">日&nbsp;&nbsp;&nbsp;&nbsp;期：</td>
              <td>
								<input type="text" name="date" maxlength="250" value="${message.day }" onfocus="setday(this)" readonly>
						</td>
            </tr>
            <tr>
              <td height="27" align="center">时&nbsp;&nbsp;&nbsp;&nbsp;间：</td>
              <%java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("HH:mm");

java.util.Date currentTime = new java.util.Date();//得到当前系统时间

String str = formatter.format(currentTime); //将日期时间格式化 
 %>
              <td><input name="time" type="text" id="time" size="50" value=<%=str %>>
             </td>
            </tr>
            <tr>
              <td height="27" colspan="2" align="center"><input name="Submit" type="submit" class="btn_grey" value="提交">
                &nbsp;
                <input name="Submit2" type="reset" class="btn_grey" value="重置">
&nbsp;
<input name="Submit3" type="button" class="btn_grey" value="返回" onClick="window.location.href='<%=basePath %>message/message_detail.jsp';"></td>
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
			</td>
		</tr>
	</table>
</div>

	
	</body>
</html>
