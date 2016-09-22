<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" pageEncoding="utf-8"%>
<%@ page import="com.alumni.struts.form.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.alumni.struts.dao.*" %>
<%@ page import="com.alumni.core.*" %>
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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

  <head>
  <base href="<%=basePath%>">
    <title>文件提交</title>
    <link href="<%=basePath %>css/style.css" rel="stylesheet">
  </head>
  
  <body>
  <%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
%>
<div class="left02down01_xia noneBox" id="Bli064">
				<table width="70%" border="0" cellspacing="1" cellpadding="2">
				<tr>
					<td align="center" width="30%" bgcolor="#00ff00" onmousemove="show_menu(19)" id="f024"><a href="<%=basePath%>fileManage/fileUp.jsp" target="main" ><font size="2">&middot;文件上传</font></a></td>
					<td align="center" width="30%" bgcolor="#00ff00" onmousemove="show_menu(20)" id="f025"><a href="<%=basePath%>fileManage/file.jsp" target="main" ><font size="2">&middot;文件下载</font></a></td>
				</tr></table>
			</div>
<table width="80%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="510" valign="top" style="padding:5px;"><table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="22" valign="top" class="word_orange">当前位置：文件中心 &gt; 文件上传 &gt;&gt;&gt;</td>
      </tr>
      <tr>
    		<td width="300" height="35" valign="top" align="center"> <FONT SIZE="+1" COLOR="#ff6600">文件提交页面</FONT></td>
    	</tr>
    	<tr>
    		<td rowspan="3" width="200" align="right" valign="top"> 
    			<table width="100%" border="0" cellspacing="2" cellpadding="4">
			        <tr bgcolor="#dcdcdc"> 
			          	<td>&nbsp;<font color=slategray>文件小于10M。</font><hr SIZE="3"><font color="#ff6600"></font></td>
			        </tr>
      			</table>
      		</td>
  		</tr>
	  	<tr> 
	    	<td height="478" valign="top"><p>请提交文件：</p>
	    	<FORM ACTION="<%=basePath %>servlet/fileUpload" METHOD=POST ENCTYPE="multipart/form-data">
	        <table align="center">
	          	<tr valign="baseline"> 
	            	<td class="tableHeading" nowrap align="right" width=110>文件：</td>
	            	<td><input name="file1" type="file" id="subno" size="32" ></td>
	          	</tr>
	          	<tr valign="baseline"> 
	            	<td nowrap align="right">&nbsp;</td>
	            	<td>
	            		<INPUT type="submit" value="上传" id=submit name=submit>
	              		
	              	</td>
	          	</tr>
	        </table>
	     	</FORM>
	    	</td>
		</tr>
 	</table>
</td>
</tr>
</table>
</td></tr></table>
	<center>
		<A HREF="<%=basePath %>fileManage/file.jsp">返回</A>
	</center>
  	
  </body>
</html>