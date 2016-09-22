<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" pageEncoding="utf-8"%>
<%@ page import="com.alumni.struts.form.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.alumni.struts.dao.*"%>
<%@ page import="com.alumni.struts.form.*" %>
<%@ page import="com.alumni.core.*"  %>

<html>
<%
int id=0;
id=(Integer)session.getAttribute("id");
  		if(id == 0) {
  			response.sendRedirect("error.jsp");
  		}
PersonnelDAO dao=new PersonnelDAO();
PersonnelForm personform=null;
List listpersonform=(List<PersonnelForm>)dao.query(id);
personform=(PersonnelForm)listpersonform.get(0);
String Uname=personform.getName();
int Utype=personform.getStatus();


String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

FileDAO fileDao=new FileDAO();
List list=fileDao.query(0);
System.out.println(list);

%>
<head>
<base href="<%=basePath%>">
<title>文件下载</title>
<link href="<%=basePath %>css/style.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
        <td height="22" valign="top" class="word_orange">当前位置：文件中心 &gt; 下载中心 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top"><%
if(list==null || list.isEmpty()){
%>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="36" align="center">暂无文件信息！</td>
            </tr>
          </table>
          <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="5%" align="right"><img src="images/add.gif" width="19" height="18">&nbsp;</td>
    <td width="95%"><a href="<%=basePath%>fileManage/fileUp.jsp">共享文件</a></td>
  </tr>
</table>
 <%
}else{
  //通过迭代方式显示数据
  Iterator it=list.iterator();
  int fid;
  String fname="";
  int pid;
  %>
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="84%" align="right"><img src="Images/add.gif" width="19" height="18">&nbsp;</td>
<td width="16%">
      <a href="<%=basePath%>fileManage/fileUp.jsp">共享文件</a> </td>	  
  </tr>
</table>  
  <table width="91%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#54ABEF">
  <tr align="center" bgcolor="#e3F4F7">
    <td width="20%" height="26" bgcolor="#A8D8FC">文件名</td>
    <td width="30%" bgcolor="#A8D8FC">作者</td>
    <td width="9%" bgcolor="#A8D8FC">下载</td>
    <td width="9%" bgcolor="#A8D8FC">删除</td>
  </tr>
<%
  while(it.hasNext()){
    
    fileForm f=(fileForm)it.next();
	fname=f.getFname();
	System.out.println(fname);
	fid=f.getId();
	pid=f.getPid();
	System.out.println(pid);
	PersonnelDAO personnelDao=new PersonnelDAO();
	PersonnelForm personForm=(PersonnelForm)personnelDao.query(pid).get(0);
	%> 
  <tr>
    <td style="padding:5px;"><%=fname%></td>
    <td align="center"><%=personForm.getName()%></td>
    
    <%
    int Autype=personForm.getStatus();
    if(Utype==Autype||Utype==1){
     %>
    <td align="center"><a href="<%=basePath%>fileManage/do_download.jsp?name=<%=fname%>">下载</a></td>
    <td align="center"><a href="<%=basePath%>fileManage/do_delete.jsp?fid=<%=fid%>">删除</a></td>
    <%} else{%>
    <td align="center"><a href="<%=basePath%>fileManage/do_download.jsp?name=<%=fname%>">下载</a></td>
    <td align="center"><a href="javascript:;">无权限</a></td>
    <%} %>
  </tr>
<%
  }
}
%>  
</table></td>
      </tr>
    </table>
</td>
  </tr>
</table></td>
  </tr>
</table>
</body>
</html>
