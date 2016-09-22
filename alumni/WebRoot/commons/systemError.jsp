<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>空指针异常</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
body { text-align:center; }
div#wrap {
text-align:left;
width:760px;
margin:0 auto;
border:1px solid #333;
background-color:#ccc;
} 
</style>
  </head>
  
  <body>
  <div id="wrap">
    <table>
    <tr>
    	<td>访问提示</td>
    </tr>
    <tr>
    	<td>
    		<div align="center" >
    		<p>对不起，代码出错！空指针异常</p>
    		<a href="<%=basePath%>servlet/logout">重新登录</a>&nbsp;&nbsp;&nbsp;&nbsp;
    		<a href="javascript:void();" onclick="history.back(-1)">返回上一页</a></div>
    	</td>
    </tr>
    </table>
    </div>
    <%@include file="../copyright.jsp" %> 
  </body>
</html>
