<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@page import="java.util.*" %>
<jsp:directive.page import="com.alumni.struts.action.*"/>
<jsp:directive.page import="com.alumni.struts.dao.*"/>
<jsp:directive.page import="com.alumni.struts.form.*"/>
<jsp:directive.page import="com.alumni.core.*"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%String path = request.getContextPath();
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
    <title>My JSP 'unvisit.jsp' starting page</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
	<link href="../css/style.css" rel="stylesheet">

</head>
  <base href="<%=basePath%>">
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
    <td height="510" valign="top" style="padding:5px;"><table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="22" valign="top" class="word_orange">当前位置：公文管理 &gt; 未读列表 &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top">
  <table>
  <tr>
    <% 
    int mid = Integer.parseInt(request.getParameter("MessageId"));
    VisitDAO visitDao=new VisitDAO();
    Visit visit=new Visit();
    List<Visit> list=(List<Visit>)visitDao.unVisitList(mid);
    int length=list.size();
    out.println("<th>"+"未读员工人数:"+length+"</th>");
    Iterator it=list.iterator();
    while(it.hasNext()){
   		visit=(Visit)it.next();
   		out.println("<tr>");
    	out.println("<td>"+"编号："+visit.getUserid()+"</td>");
    	PersonnelForm personnel= (PersonnelForm)new PersonnelDAO().query(visit.getUserid()).get(0);
    	out.println("<td>"+"名字："+personnel.getName()+"</td>");
    	out.println("<td>"+"邮箱："+personnel.getEmail()+"</td>");
    	out.println("<td>"+"手机："+personnel.getMobileTel()+"</td>");
    	out.println("</tr>");
    }
    
    %>
    </tr>
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
  </body>
</html>
