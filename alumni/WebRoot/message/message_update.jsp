<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@page import="java.util.*" %>
<%@include file="/commons/taglibs.jsp"%>
<%@ taglib uri="http://fckeditor.net/tags-fckeditor" prefix="FCK" %>
<jsp:directive.page import="com.alumni.struts.action.*"/>
<jsp:directive.page import="com.alumni.struts.dao.*"/>
<jsp:directive.page import="com.alumni.struts.form.*"/>
<jsp:directive.page import="com.alumni.core.*"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	 %>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<title>My JSP 'message_upload.jsp' starting page</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="../css/style.css" rel="stylesheet">
<script src="${ctx}/js/setdate.js"></script>
	
<script src="${ctx}/fckeditor/fckeditor.js"></script>
	<script type="text/javascript" src="fckeditor/fckeditor.js"></script>
	<script type="text/javascript">
	window.onload = function() 
   {
	var oFCKeditor = new FCKeditor('content')
				oFCKeditor.BasePath = "${ctx}/fckeditor/";
 	oFCKeditor.ReplaceTextarea();
 	oFCKeditor.Height = 300;
	} 
</script>
<%
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
String autoDetectLanguageStr;
String defaultLanguageStr;

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
	</head>
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
	<body>
	<%request.setCharacterEncoding("utf-8"); %>
	<div class="left02down01_xia noneBox" id="Bli060">
			<table width="70%" border="0" cellspacing="1" cellpadding="2" >
				<tr>
					<td align="center" width="30%" bgcolor="#00ff00" onmousemove="show_menu(10)" id="f011"><a href="<%=basePath%>message/message_unread.jsp" target="main" ><font size="2">&middot;未读通知</font></a></td>
					<td align="center" width="30%" bgcolor="#00ff00" onmousemove="show_menu(11)" id="f010"><a href="<%=basePath%>message/message_add.jsp" target="main" ><font size="2">&middot;添加通知</font></a></td>
					<td align="center" width="30%" bgcolor="#00ff00" onmousemove="show_menu(12)" id="f011"><a href="<%=basePath%>message/message_detail.jsp" target="main" ><font size="2">&middot;管理通知</font></a></td>
					
				</tr>
				</table>
		 </div>
<table width="80%" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="510" valign="top" style="padding:5px;"><table width="98%" height="504"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="39" valign="top" class="word_orange">当前位置：公告管理 &gt; 通知管理 &gt; 修改通知信息 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top"><table width="68%"  border="0" cellpadding="0" cellspacing="0">
        <% 
        int mid = Integer.parseInt(request.getParameter("MessageId"));
        MessageServiceImpl messageService=new MessageServiceImpl();
        Message message=messageService.findById(mid);
       PersonnelDAO personneldao=new PersonnelDAO();
    
       List list=personneldao.query(message.getAuthorid());
        PersonnelForm personnel=null;
        personnel=(PersonnelForm)list.get(0);
       int typeAuthor=personnel.getStatus();
    
       int typeUser=Utype;
      
      if(typeUser==1||typeAuthor==typeUser){
        %>
        <table>
			<form action="<%=basePath %>message/do_message_update.jsp" name="mesfrm" method="post" onSubmit="return checkSubject()">
			<input type="hidden" name="messageId" maxlength="250" value="<%=mid %>" />
			<input type="hidden" name="authorid" maxlength="250" value="<%=message.getAuthorid() %>" />			
		    <tr>
              <td width="20%" height="27" align="center">题&nbsp;&nbsp;&nbsp;&nbsp;目：</td>
              <td width="80%"><input name="subject" type="text" id="subject" size="20" value=<%= message.getSubject() %>>
                *</td>
            </tr>
            <tr>
            <td width="20%" height="27" align="center">内&nbsp;&nbsp;&nbsp;&nbsp;容：</td>
            <td><textarea rows="20" cols="10" id="content" name="content"><%=message.getContent()%></textarea></td></tr>
            <tr>
              <td height="27" align="center">日&nbsp;&nbsp;&nbsp;&nbsp;期：</td>
              <td>
								<input type="text" name="day" maxlength="250" value=<%=message.getDay()  %> onfocus="setday(this)" readonly>
						</td>
            </tr>
            <tr>
              <td height="27" align="center">时&nbsp;&nbsp;&nbsp;&nbsp;间：</td>
              <%java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("HH:mm");

java.util.Date currentTime = new java.util.Date();//得到当前系统时间

String str = formatter.format(currentTime); //将日期时间格式化 
 %>
              <td><input name="time" type="text" id="time" size="50" value=<%=message.getTime() %>>
             </td>
            </tr>
            <tr>
              <td height="27" colspan="2" align="center"><input name="Submit" type="submit" class="btn_grey" value="提交">
                &nbsp;
                <input name="Submit2" type="reset" class="btn_grey" value="重置">
&nbsp;
<input name="Submit3" type="button" class="btn_grey" value="返回" onClick="window.location.href='<%=basePath %>message/message_detail.jsp';"></td>
              </tr>
			  </form>
			  </table>
			  <% }else{
			  out.println("<script>alert('没有更改权限！请联系管理员'); location.replace('message_detail.jsp') </script>");
			  }%>
          <td>c</td>
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

	</body>
</html>
