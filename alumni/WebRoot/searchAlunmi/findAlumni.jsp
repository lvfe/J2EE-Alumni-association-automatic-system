<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ page import="com.alumni.core.*" %>
<%@ page import="com.alumni.struts.dao.*" %>
<%@ page import="com.alumni.struts.form.*" %>             
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    	<title>找校友</title>
    	<link href="../css/css.css" rel="stylesheet" type="text/css" />
		<link href="../css/main.css" rel="stylesheet" type="text/css" />
		<link href="../css/page.css" rel="stylesheet" type="text/css" />
		<link rel="shortcut icon" href="../favicon.ico" >
		<link rel="icon" type="image/gif" href="../animated_favicon1.gif" >
		
		<script type="text/javascript">
		
		function fun_check_form(){
			
			if(document.myform.searchCondition.value==""){
				alert("请选择查询条件。");
				return false;
			}else if(document.myform.contents.value==""){
				alert("请输入查询内容。");
				return false;
			}else{
				return true;
			}
		}
		
		</script>
		
	</head>

	<%
		//if (session.getAttribute("id") == null){
		//	response.sendRedirect("../jsp/alumniLogin.jsp");
		//	return;
		//}
	%>

	<body>
	<div class="left02down01_xia noneBox" id="Bli070">
				<table width="70%" border="0" cellspacing="1" cellpadding="2">
				<tr>
					<td align="center" width="30%" bgcolor="#00ff00" onmousemove="show_menu(39)" id="f041"><a href="http://localhost:8080/alumni/searchAlunmi/findAlumni.jsp" target="main" ><font size="2">&middot;搜索校友</font></a></td>
					<td align="center" width="30%" bgcolor="#00ff00" onmousemove="show_menu(40)" id="f040"><a href="http://localhost:8080/alumni/searchAlunmi/showAlumni.jsp" target="main" ><font size="2">&middot;校友信息</font></a></td>
				</tr></table>
			</div>
		<div class="main">
			<div class="m_left">
				<div class="list_nav"><a href="index.jsp">首页</a> > 校友查询 > <span>找校友</span></div>

				<div align="center">
				<form name="myform" action="showAlumni.jsp" method="post" onSubmit="return fun_check_form()">
					<table cellspacing="0" cellpadding="0" width="100%" border="0" >
						
						<tr>
							<td background="../images/search_input_bei.png" height="40">
								
								<div align="center">
									查询条件：
									<select name="searchCondition">
										<option value="realName">姓名</option>
										<option value="gender">性别</option>
										<option value="enterYear">入学年</option>
										<option value="college">学院</option>
										<option value="classNum">班级</option>
										<option value="stuID">学号</option>
									</select>
									&nbsp;
									<input type="text" name="contents" size="50" />
									&nbsp;
									<input type="submit" value="查询" name="B1" />
								</div>
							</td>		
						</tr>
						
				    </table>
				</form>
				</div>
				
				<br/>
				<div align="center">
				<h2>新校友</h2>
				<table cellspacing="0" cellpadding="0" width="100%" border="0" align="center">
				
					<tr>
						<td width="10%" align="center" bgcolor="#f5f5f5" class="altbg1"><span class="STYLE4">姓名</span></td>
						<td width="7%" align="center" bgcolor="#f5f5f5" class="altbg1"><span class="STYLE4">入学年</span></td>
						<td width="16%" align="center" bgcolor="#f5f5f5" class="altbg1"><span class="STYLE4">学院</span></td>
						<td width="10%" align="center" bgcolor="#f5f5f5" class="altbg1"><span class="STYLE4">班级</span></td>
						<td width="7%" align="center" bgcolor="#f5f5f5" class="altbg1"><span class="STYLE4">学号</span></td>
					</tr>
	
					<!-- 列表 -->
					<%
						
						AlumniDao alumniDao = new AlumniDao();
						List list = alumniDao.queryCheckedUserlistBy20();
						for (int i = 0; i < list.size(); i++) {
							Alumni alumni = (Alumni) list.get(i);
					%>
					<tr>
						<td align="center"><span class="STYLE2"><%=alumni.getRealName()%></span></td>
						<td align="center"><span class="STYLE2"><%=alumni.getEnterYear()%></span></td>
						<td align="center"><span class="STYLE2"><%=alumni.getCollege()%></span></td>
						<td align="center"><span class="STYLE2"><%=alumni.getClassNum()%></span></td>
						<td align="center"><span class="STYLE2"><%=alumni.getStuID()%></span></td>
					</tr>
					
					<%
					}
					%>
				</table>
				</div>


			</div>
			
			<div class="clear"></div>
		</div>
		
	</body>
</html>