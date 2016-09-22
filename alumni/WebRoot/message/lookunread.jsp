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

	


	<body background="image/bookbg.gif" leftmargin="0" topmargin="3"
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
	<%request.setCharacterEncoding("utf-8"); %>
		<div align='center'></div>
		<!--   留言信息显示    开始 -->
		<%
		
			int mid;
			if(request.getParameter("MessageId")!=null){
				mid=Integer.parseInt(request.getParameter("MessageId"));
			}
			else{
				mid=Integer.parseInt((String)request.getAttribute("MessageId"));
			}
			MessageServiceImpl messageService = new MessageServiceImpl();
			Message message = messageService.findById(mid);
		%>
		<table align='center' style='width=750'>
		<tr>
		<td align="center">查看通知</td>
		</tr><tr>
				<td>
				<input type="button"  class='btn_grey' onclick="location.href='<%=basePath %>message/message_unread.jsp" value="返回"/>					
</td></tr><tr><td>
			<TABLE width='750' border=1 align=center cellPadding=0 cellSpacing=0
				 style='border-collapse:collapse'>
						<tr>
								<td height='20' bgcolor="#00FFFF"style='overflow:scroll;table-layout:fixed;word-break:break-all;word-wrap:break-word;'>
									&nbsp; ※&nbsp;
									<b><%=message.getSubject()%> </b>
								</td>
							</tr>
						<tr bgcolor="#98F5FF">
								<td   valign='top' bgcolor="#98F5FF" height="150px"style='overflow:scroll;table-layout:fixed;word-break:break-all;word-wrap:break-word;'>
									<div>
										<%=message.getContent()%>
									</div>
								</td>
						</tr>
				<tr>
					<td height='18' valign='bottom' 
						style='font-size: 12px;' bgcolor='#00FFFF'>
						<%
						int authorid=message.getAuthorid();
						PersonnelDAO personnelDao=new PersonnelDAO();
				List<PersonnelForm> listq=(List<PersonnelForm>)personnelDao.query(authorid);
				PersonnelForm personnelForm=listq.get(0);
				String authoridstr=personnelForm.getName();
						 %>
						<font color='#000' ><b><%=authoridstr%>写于&nbsp;<%=message.getDay()%>&nbsp<%=message.getTime() %>;
							&nbsp;</b></font>
					</td>
				</tr>
			</TABLE></td></tr>
			<%
                VisitDAO visitdao=new VisitDAO();
                boolean read=visitdao.visitMessage(mid,id);
				if(!read){
				out.println("<script> alert('未更新到visit表！');</script>");
				}
			 %>
			
		</table>
		<br>
		<!-- 留言显示  结束 -->
			<!-- 回复   开始 -->
<TABLE width='750' height=0 border=1 align=center cellPadding=0
				cellSpacing=0  style='border-collapse:collapse'>
				<TBODY>
					<TR>
						<TD height=25 >
							<div align='center'>
								<strong>快 速 回 复 </strong>
							</div>
						</TD>
					</TR>
					<TR>
						<TD align="center" valign='top'>
							<form name='myform' method='post' action='<%=basePath%>reverse.do?action=addReply'>
								<table width='100%' border='0' align='center' cellpadding='1'
									cellspacing='1' class='unnamed1'>
									<tr>
										<td align='right' bgcolor='#00FFFF'>
											<span>标题：</span>
										</td>
										<td bgcolor="#98F5FF">
										<input type="hidden" name="mid" id="mid" value=<%= String.valueOf(mid) %>>
										<input type="hidden" name="pid" id="pid" value=<%= String.valueOf(id) %>>
										<%
										Date date = new Date();
										SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd-hh-mm-ss");
										String time=dateFormat.format(date); %>
										<input type="hidden" name="time" id="time" value=<%=time  %>/>
											<input name="subject" id="subject" type="text"  size="20" maxlength="20" />
											*
										</td>
									</tr>
									<tr>
										<td align='right' valign='top' bgcolor='#00FFFF'>
											<span>内容：</span>
										</td>
										<td bgcolor="#98F5FF">
											<textarea name='content' id='content' cols='60' rows='3' class='input1'
												></textarea>
											*
											<br>
											&nbsp;&nbsp;
											<input type='submit' name='Submit' value=' 提 交 '>
										</td>
									</tr>
								</table>
							</form>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			<br>
			<TABLE width='750' border=0 align='center' cellPadding=0
				cellSpacing=0>
				<TR>
					<TD height=5 align="center">
						<span class="STYLE3">回复内容：</span>
					</TD>
				</TR>
			</TABLE>
			<!-- 回复列表开始 -->
			<%
				ReverseDAO replyDao = new ReverseDAO();
					List list = replyDao.queryReplyMessage(mid);
					for (int i = 0; i < list.size(); i++) {
						ReverseForm reply = (ReverseForm) list.get(i);
			%>
			<TABLE width='750' border=0 align='center' cellPadding=0
				cellSpacing=0 borderColor=#111111 style='BORDER-COLLAPSE: collapse'>
				<TBODY>
					<TR>
						<TD width='2%'>
							<IMG src='image/T_left.jpg' border=0>
						</TD>
						<TD width='96%' background=''></TD>
					</TR>
				</TBODY>
			</TABLE>
			<TABLE width='750' border=1 align=center cellPadding=0 cellSpacing=0 style='border-collapse:collapse'>
<%
int personid=reply.getPid();
PersonnelForm personnelFormreply=personform=(PersonnelForm)dao.query(personid).get(0);
String namereply=personnelFormreply.getName();
String timereply=reply.getTime();
 %>
				<tr>
					<td valign='top'>
						<table width='100%' border='0' cellpadding='3'
							style='table-layout:fixed;word-break:break-all;word-wrap:break-word;'>
							<tr>
							<td bgcolor="#00FFFF"rowspan="2" width="130px" align="center" vlian="center">
							<img src="<%=basePath%>images/image.gif" vlign="center" width="100"/>
							<font><%=namereply %></font>
							<font><%=timereply %></font>
							</td>
								<td height='20px' style='word-break:break-all'bgcolor="#00FFFF">
									<div>
										<b><%=reply.getSubject()%></b>
										&nbsp;
									</div>
								</td>
							</tr>
							<tr>
								<td height='75px'valign='top' style='word-break:break-all'bgcolor="#98F5FF">
									<div>
										<%=reply.getContent()%>
										&nbsp;
									</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<%
			}
			%>


			
			
		<br>
	</body>
</html>
