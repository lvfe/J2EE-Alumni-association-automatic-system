<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:directive.page import="com.alumni.struts.dao.*"/>
<jsp:directive.page import="com.alumni.struts.form.*"/>
<%@ page import="org.json.simple.*"%>
<%
out.clear();
request.setCharacterEncoding("utf-8");
String action = request.getParameter("action");             //获取action信息
AgendaDAO agendaDao=new AgendaDAO();
    //根据action不同执行不同的操作
    if ("add".equals(action)) {    
        Task task=new Task();
       
        task.setSubject(request.getParameter("subject"));
        task.setYear(request.getParameter("year"));
        task.setMonth(request.getParameter("month"));
        task.setDay(request.getParameter("day"));
        task.setDescription(request.getParameter("description"));
        task.setLocation(request.getParameter("location"));
        task.setStart_time(request.getParameter("start_time"));
        task.setEnd_time(request.getParameter("end_time"));
        task.setState(request.getParameter("state"));
         %>
    <%      
        out.print(agendaDao.addTask(task));
    } else if ("getTasks".equals(action)) {                     //获取整月任务信息
      System.out.println("action");
        JSONArray array= new JSONArray();
        String month = request.getParameter("month");
        String year = request.getParameter("year");
        month=String.valueOf(Integer.parseInt(month)+1);
        List<Task> list=(List<Task>)agendaDao.getTasks(year,month);
        Iterator<Task> it=list.iterator();
        Task task=null;
        
        while(it.hasNext()){
       JSONObject obj = new JSONObject();
        task=(Task)it.next();
        obj.put("id",task.getId());
        obj.put("subject",task.getSubject());	
        obj.put("wholeDate",task.getYear()+"-"+task.getMonth()+"-"+task.getDay());	
        obj.put("start_time",task.getStart_time());
        array.add(obj);
       }
        out.print(array.toString());
    } else if ("del".equals(action)) {                      //删除任务
    System.out.println(action);
        String taskId = request.getParameter("taskId").trim();
       
        int id=Integer.parseInt(taskId); 
        agendaDao.delTask(id);
        out.print(String.valueOf(id));
    } else if ("update".equals(action)) {                   //更新任务信息
        Task task=new Task();
        String taskId = request.getParameter("taskId").trim();
        int id=Integer.parseInt(taskId);
        task.setId(id);
        task.setSubject(request.getParameter("subject"));
        task.setYear(request.getParameter("year"));
        task.setMonth(request.getParameter("month"));
        task.setDay(request.getParameter("day"));
        task.setDescription(request.getParameter("description"));
        task.setLocation(request.getParameter("location"));
        agendaDao.updateTask(task);
        out.print(String.valueOf(id));
        
    }else if("getById".equals(action)){
    	Task task=null;
    	JSONArray array= new JSONArray();
    	String idstr=request.getParameter("taskId").trim();
    	int id=Integer.parseInt(idstr);
    	System.out.print(id);
    	task=agendaDao.getById(id);
    	JSONObject obj=new JSONObject();
    	obj.put("id",task.getId());
    	obj.put("subject",task.getSubject());
    	obj.put("location",task.getLocation());
    	obj.put("wholeDate",task.getYear()+"-"+task.getMonth()+"-"+task.getDay());
    	obj.put("start_time",task.getStart_time());
    	obj.put("end_time",task.getEnd_time());
    	obj.put("state",task.getState());
    	obj.put("description",task.getDescription());
    	array.add(obj);
    	out.print(array.toString());
    }
%>

