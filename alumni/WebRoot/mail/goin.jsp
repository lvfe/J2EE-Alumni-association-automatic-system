<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:directive.page import="com.alumni.struts.action.*"/>
<jsp:directive.page import="com.alumni.struts.dao.*"/>
<jsp:directive.page import="com.alumni.struts.form.*"/>
<jsp:directive.page import="com.alumni.core.*"/>
<jsp:directive.page import="java.text.*"/>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	request.setCharacterEncoding("utf-8");
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
		<title>查看通知</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="description" content="通知内容">
<link href="<%=basePath %>css/style.css" rel="stylesheet">
<link href="<%=basePath %>css/index.css" rel="stylesheet">
<base href="<%=basePath%>">
<script>
function  validateSubject(){
	      var code=document.myform.subject.value;
	      
	      document.getElementById("subject").innerHTML="";
	        if(code==""){
            document.getElementById("subject").innerHTML="<font color=red >标题不能为空</font>";
               return false;
               }
              return true;
	}
	function   validateContent(){
	       var  content=document.myform.content.value;
	       
	       document.getElementById("content").innerHTML="";
	      if(content==""){
            document.getElementById("content").innerHTML="<font color=red >内容不能为空</font>";
              return false;
               }
               return  true;
	}
function validateAll(){

if(validateSubject()&&validateContent()){
	            return true;
	     }else{
	         return false;
	     }
}

</script>
	</head>

	


	<body leftmargin="0" topmargin="3"
		marginwidth="0" marginheight="0">
		<div class="left02down01_xia noneBox" id="Bli060">
			<table width="70%" border="0" cellspacing="1" cellpadding="2" >
				<tr>
					<td align="center" width="30%" bgcolor="#00ff00" onmousemove="show_menu(10)" id="f011"><a href="<%=basePath%>message/message_unread.jsp" target="main" ><font size="2">&middot;未读通知</font></a></td>
					<td align="center" width="30%" bgcolor="#00ff00" onmousemove="show_menu(11)" id="f010"><a href="<%=basePath%>message/message_add.jsp" target="main" ><font size="2">&middot;添加通知</font></a></td>
					<td align="center" width="30%" bgcolor="#00ff00" onmousemove="show_menu(12)" id="f011"><a href="<%=basePath%>message/message_detail.jsp" target="main" ><font size="2">&middot;管理通知</font></a></td>
					
				</tr>
				</table>
		 </div>
		
	<%request.setCharacterEncoding("utf-8"); 
	%>
		<div align='center'></div>
		<!--   留言信息显示    开始 -->
		<%
		String[] str=personform.getEmail().split("@");
String emailName=str[0];
String pass=personform.getEmailpass();
		ReciveOneMail receive=null;	
List<ReciveOneMail> list=ReciveOneMail.test(emailName,pass);
		String messageid=request.getParameter("messageid").trim();
		Iterator it=list.iterator();
		while(it.hasNext()){
    receive=(ReciveOneMail)it.next();	
    
     String messageid1=receive.getMessageId();
     if(!messageid1.equalsIgnoreCase(messageid)){
     continue;
     }else{
		%>
		<table id="calTable" align='center' style='width=750'>
		<tr>
		<td align="center" bgcolor="#C3D9FF"><strong>查看通知</strong></td>
		</tr><tr>
				<td bgcolor="#C3D9FF">
				<input type="button"  class='btn_grey' onclick="location.href='<%=basePath %>mail/unread.jsp'" value="返回"/>					
</td></tr><tr><td>
			<TABLE width='750' border=1 align=center cellPadding=0 cellSpacing=0
				 style='border-collapse:collapse'>
						<tr bgcolor="#668CB3">
								<td colspan="2" bgcolor="#668CB3"height='20'style='overflow:scroll;table-layout:fixed;word-break:break-all;word-wrap:break-word;'>
									&nbsp; ※&nbsp;

									<b><%=receive.getSubject()%> </b>
								</td>
							</tr>
						<tr>
							<TD width="10%">发件人:</TD><td width="90%"><%=receive.getFrom() %>
							</td>
						</tr>
						<tr>
							<TD>时间:</TD><td><%=receive.getSentDate() %>
							</td>
						</tr>
						<tr>
						
							<TD>附件:</TD><td><%=receive.getAttachPath() %>
							</td>
						</tr>
						<tr>
							<TD>内容</TD>
								<td   bgcolor="#FFFFFF"valign='top' height="150px"style='overflow:scroll;table-layout:fixed;word-break:break-all;word-wrap:break-word;'>
									<div>
										<%=receive.getcontent()%>
										<%=receive.getBodyText()%>
									</div>
								</td>
						</tr>
			</TABLE></td></tr>
		</table>
		<%
		return;}
		} %>
		<br>
		
		<br>
	</body>
</html>
