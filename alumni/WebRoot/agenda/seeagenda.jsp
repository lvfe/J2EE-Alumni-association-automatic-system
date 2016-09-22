<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.alumni.struts.dao.*" %>
<%@ page import="com.alumni.core.*" %>
<%@ page import="com.alumni.struts.form.*"%>
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
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="../css/style.css" rel="stylesheet">
<link href="../css/index1.css" rel="stylesheet">
<title>个人日程表</title>

<script type="text/javascript" src="calendar_jquery.js"></script>
<script language="javascript"> 

var daysInMonth = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);    //每月天数
var today = new Today();    //今日对象
var year = today.year;      //当前显示的年份
var month = today.month;    //当前显示的月份
$(function() {
    fillBox();
});

//今日对象
function Today() {
    this.now = new Date();
    this.year = this.now.getFullYear();
    this.month = this.now.getMonth();
    this.day = this.now.getDate();
}

//根据当前年月填充每日单元格
function fillBox() {
    updateDateInfo();                   //更新年月提示
    $("td.calBox").empty();             //清空每日单元格

    var dayCounter = 1;                 //设置天数计数器并初始化为1
    var cal = new Date(year, month, 1); //以当前年月第一天为参数创建日期对象
    var startDay = cal.getDay();        //计算填充开始位置
    //计算填充结束位置
    var endDay = startDay + getDays(cal.getMonth(), cal.getFullYear()) - 1;

    //如果显示的是今日所在月份的日程，设置day变量为今日日期
    var day = -1;
    if (today.year == year && today.month == month) {
        day = today.day;
    }

    //从startDay开始到endDay结束，在每日单元格内填入日期信息
    for (var i=startDay; i<=endDay; i++) {
        if (dayCounter==day) {
            $("#calBox" + i).html("<div class='date today' id='" + year + "-" + (month + 1) + "-" + dayCounter + "' >" + dayCounter + "</div>");
        } else {
            $("#calBox" + i).html("<div class='date' id='" + year + "-" + (month + 1) + "-" + dayCounter + "'>" + dayCounter + "</div>");
        }
        dayCounter++;
    }
    getTasks();                    //从服务器获取任务信息
}
//从服务器获取任务信息
function getTasks() {
    $.getJSON("calendar1.jsp",               //服务器页面地址
        {
            action: "getTasks",             //action参数
            month: month,
            year:year
        },
        function(json) {                    //回调函数
            //遍历JSON数组，建立任务信息
            $(json).each(function(i){
                buildTask(json[i].wholeDate, json[i].id, json[i].subject);
            });
        }
    );
}

//根据日期、任务编号、任务内容在页面上创建任务节点
function buildTask(buildDate, taskId, subject) {
    $("#" + buildDate).parent().append("<div id='task" + taskId + "' class='task' onclick='editTask(this)'>" + subject + "</div>");
}

//判断是否闰年返回每月天数
function getDays(month, year) {
    if (1 == month) {
        if (((0 == year % 4) && (0 != (year % 100))) || (0 == year % 400)) {
            return 29;
        } else {
            return 28;
        }
    } else {
        return daysInMonth[month];
    }
}

//显示上月日程
function prevMonth() {
    if ((month - 1) < 0) {
        month = 11;
        year--;
    } else {
        month--;
    }
    fillBox();              //填充每日单元格
}

//显示下月日程
function nextMonth() {
    if((month + 1) > 11) {
        month = 0;
        year++;
    } else {
        month++;
    }
    fillBox();              //填充每日单元格
}

//显示本月日程
function thisMonth() {
    year = today.year;
    month = today.month;
    fillBox();              //填充每日单元格
}

//更新年月提示
function updateDateInfo() {
    $("#dateInfo").html(year + "年" + (month + 1) + "月");
}

//打开新建任务box
function openAddBox(src) {
	alert("新建任务");
    $("#taskDate").val(src.id);                    //设置新建日期
    $("#subject").val("");                         //初始化新建任务内容 
    $("#addBox").slideDown();   //显示新建任务box
}
//向服务器提交新任务信息
function addTask() {
    var subject = $("#subject").val();                //获取任务信息
    //检查任务信息是否为空
    if ($.trim(subject)=="") {
        alert("请输入信息");
    } else {
        var wholeDate = $("#taskDate").val();          //获取任务日期
        alert(subject+wholeDate);
        var strs= new Array();
        strs=wholeDate.split("-");
		var year=strs[0];
		var month=strs[1];
		var day=strs[2];
		var location=$("#location").val();
		
		var state=$("#state").val();
		var start_time=$("#start_time").val();
		var end_time=$("#end_time").val();
		var description=$("#description").val();
        $.post("calendar1.jsp",                          //服务器页面地址
            {
                action: "add",                      //action参数
				year:year,
                month:month,
				day:day,
				subject:subject,
				state:state,
				start_time:start_time,
				end_time:end_time,
				description:description,
				location:location
            },
            function(taskId) {                          //回调函数
                buildTask(wholeDate, taskId, subject); //建立任务节点
                closeAddBox();                          //关闭新建任务box
            }
        );
    }
}
//关闭新建任务box
function closeAddBox() {
    $("#addBox").slideUp();
}

//打开编辑任务box
function editTask(src){
alert("查看任务");
	$("#taskId").val(src.id.substr(4));
	var taskId=$("#taskId").val();
	alert(taskId+"editsrc");
	$.getJSON("calendar1.jsp",                          //服务器页面地址
            {
                action: "getById", 
                taskId:taskId                   
            },
            function(json){
            $(json).each(function(i){
            $("#editsubject").val(json[i].subject);
   			$("#edittaskDate").val(json[i].wholeDate);
   			$("#editstart_time").val(json[i].start_time);
  			$("#editend_time").val(json[i].end_time);
 			$("#editlocation").val(json[i].location);
 			$("#editdescription").val(json[i].description);
 			$("#editstate").val(json[i].state);
            $("#editBox").slideDown();
            	
            });
            });
}
//关闭编辑box
function closeEditBox() {
    $("#editBox").slideUp();
}

//更新任务信息
function updateTask() {
    var taskId = $("#taskId").val();                //任务编号
    var subject = $("#editsubject").val();        //任务内容
    //检查任务信息是否为空
    if ($.trim(subject)=="") {
        alert("请输入任务信息。");
    } else {
        var wholeDate = $("#edittaskDate").val();          //获取任务日期
        var strs= new Array();
        strs=wholeDate.split("-");
		var year=strs[0];
		var month=strs[1];
		var day=strs[2];
		var location=$("#editlocation").val();
		var state=$("#editstate").val();
		var start_time=$("#editstart_time").val();
		var end_time=$("#editend_time").val;
		var description=$("#editdescription").val();
        $.post("calendar1.jsp",                      //服务器页面地址
            {
                action: "update",               //action参数
                year:year,
                month:month,
				day:day,
				subject:subject,
				state:state,
				start_time:start_time,
				end_time:end_time,
				description:description,
				taskId:taskId
            },
            function(id) {                            //回调函数
            
               id = $.trim(id);
                $("#task" + id).html(subject); //更新页面任务内容
                closeEditBox();                     //关闭编辑box
            }
        );
    }
}
  
//删除任务
function delTask() {
    var taskId = $("#taskId").val();                //获取任务编号
    alert(taskId);
    $.post("calendar1.jsp",                          //服务器页面地址
        {
            action: "del",                      //action参数
            taskId: taskId                          //任务编号参数
        },
        function(id) {                                //回调函数
            $("#task" + id).remove();           //在页面删除任务节点
            closeEditBox();                         //关闭编辑box
        }
    );
}
   
</script>
</head>

<body>
<%if(Utype!=2){%>
		<div class="left02down01_xia noneBox" id="Bli062">
				<table width="70%" border="0" cellspacing="1" cellpadding="2">
				<tr height="25px">
					<td align="center" width="25%" bgcolor="#00ff00" onmousemove="show_menu(16)" id="f018"><a href="<%=basePath%>agenda/todayAgenda.jsp" target="main" ><font size="2">&middot;今日个人日程</font></a></td>
					<td align="center" width="25%" bgcolor="#00ff00" onmousemove="show_menu(17)" id="f018"><a href="<%=basePath%>agenda/CalendarDisplay1.jsp" target="main" ><font size="2">&middot;管理个人日程</font></a></td>
					<td align="center" width="25%" bgcolor="#00ff00" onmousemove="show_menu(18)" id="f019"><a href="<%=basePath%>agenda/Agendadetail.jsp" target="main" ><font size="2">&middot;查看个人日程(表格)</font></a></td>
					<td align="center" width="25%" bgcolor="#00ff00" onmousemove="show_menu(18)" id="f019"><a href="<%=basePath%>agenda/seeagenda.jsp" target="main" ><font size="2">&middot;查看个人日程(日历)</font></a></td>
				</tr></table>
			</div>
			<%} %>
<table width="100%" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="100%" valign="top" style="padding:5px;"><table width="98%" height="504"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="39" valign="top" class="word_orange">当前位置：日程管理 &gt; <a href="agenda/CalendarDisplay.jsp" target="main">个人日程管理 </a> &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top">
<!-- 日历表格 -->
<table id="calTable">
<tr>
<th align="center" valign="middle">个人日程表</th>
</tr>
<tr>
    <td colspan="7">
        <input type="button" value="上月" onclick="prevMonth()">
        <input type="button" value="本月" onclick="thisMonth()">
        <input type="button" value="下月" onclick="nextMonth()">
        <span id="dateInfo"></span>
    </td>
</tr>
<tr>
    <td class="day">周日</td>
    <td class="day">周一</td>
    <td class="day">周二</td>
    <td class="day">周三</td>
    <td class="day">周四</td>
    <td class="day">周五</td>
    <td class="day">周六</td>
</tr>
<tr>
    <td class="calBox sun" id="calBox0"></td>
    <td class="calBox" id="calBox1"></td>
    <td class="calBox" id="calBox2"></td>
    <td class="calBox" id="calBox3"></td>
    <td class="calBox" id="calBox4"></td>
    <td class="calBox" id="calBox5"></td>
    <td class="calBox sat" id="calBox6"></td>
</tr>
<tr>
    <td class="calBox sun" id="calBox7"></td>
    <td class="calBox" id="calBox8"></td>
    <td class="calBox" id="calBox9"></td>
    <td class="calBox" id="calBox10"></td>
    <td class="calBox" id="calBox11"></td>
    <td class="calBox" id="calBox12"></td>
    <td class="calBox sat" id="calBox13"></td>
</tr>
<tr>
    <td class="calBox sun" id="calBox14"></td>
    <td class="calBox" id="calBox15"></td>
    <td class="calBox" id="calBox16"></td>
    <td class="calBox" id="calBox17"></td>
    <td class="calBox" id="calBox18"></td>
    <td class="calBox" id="calBox19"></td>
    <td class="calBox sat" id="calBox20"></td>
</tr>
<tr>
    <td class="calBox sun" id="calBox21"></td>
    <td class="calBox" id="calBox22"></td>
    <td class="calBox" id="calBox23"></td>
    <td class="calBox" id="calBox24"></td>
    <td class="calBox" id="calBox25"></td>
    <td class="calBox" id="calBox26"></td>
    <td class="calBox sat" id="calBox27"></td>
</tr>
<tr>
    <td class="calBox sun" id="calBox28"></td>
    <td class="calBox" id="calBox29"></td>
    <td class="calBox" id="calBox30"></td>
    <td class="calBox" id="calBox31"></td>
    <td class="calBox" id="calBox32"></td>
    <td class="calBox" id="calBox33"></td>
    <td class="calBox sat" id="calBox34"></td>
</tr>
<tr>
    <td class="calBox sun" id="calBox35"></td>
    <td class="calBox" id="calBox36"></td>
    <td class="calBox" id="calBox37"></td>
    <td class="calBox" id="calBox38"></td>
    <td class="calBox" id="calBox39"></td>
    <td class="calBox" id="calBox40"></td>
    <td class="calBox sat" id="calBox41">il</td>
</tr>
</table>
	<form method="post">
	<!-- 查看任务box -->
<div id="editBox" style="position:absolute; left: 109px; top: 133px;">
    <input type="hidden" id="taskId">
    <table>
   	<tr>
   	<th>查看日程安排</th>
   	</tr><tr>
   	<td>*标题</td>
   	<td><input type="text" name="editsubject" id="editsubject" width="500" value=""/></td>
   	</tr><tr>
   	<td>描述</td>
   	<td><textarea row="300" width="500" name="editdescription" id="editdescription" ></textarea>
   	</td>
   	</tr><tr>
   	<td>日期</td>
   	<td><input type="text" name="edittaskDate" id="edittaskDate" maxlength="250" onfocus="setday(this)"></input></td>
   	</tr><tr>
   	<td>开始于：</td>
   	<td>
   	<input type="text" name="editstart_time" id="editstart_time" value=""/>
   	</td>
	<td>&nbsp;&nbsp;</td>
   	<td>结束于：</td>
   	<td><input type="text" name="editend_time" id="editend_time" value=""/></td>
   	</tr><tr>
   	<td>地点</td>
   	<td><input type="text" name="editlocation" id="editlocation" value=""/></td>
   	</tr><tr>
   	<td>完成状况</td>
   	<td>
   	<input type="radio" name="editstate" id="editstate" value="complete"/>完成
   	<input type="radio" name="editstate" id="editstate" value="wait" checked />等待
   	</td>
   	</tr><tr>
   	<td>
	<div class="taskBtn">
    <input type="button" value="收起" onclick="closeEditBox()">
	</div>
	</td>
   	</tr>
   	</table>
</div>
</form>
 </td>
      </tr>
    </table>
</td>
  </tr>
</table></td>
  </tr>
</table>
</body>
</html>