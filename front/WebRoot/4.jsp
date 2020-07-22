<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
 <select width="80%">
   <option value="">总热度榜</option>
   <option value="">总点赞榜</option>
   <option value="">总投币榜</option> 
 </select><br><br><br>
 <body style="height:100%;"> 1.</body>
 <button style="margin-left: %; width:170px;height:20px;background-color: #CC0000"></button><br><body>2  .</body>
 <button style="margin-left: %; width:166px;height:20px;background-color: #CCCC00"></button><br><body>3  .</body>
 <button style="margin-left: %; width:160px;height:20px;background-color: #CC9900"></button><br><body>4  .</body>
 <button style="margin-left: %; width:159px;height:20px;background-color: #99FF99"></button><br><body>5  .</body>
 <button style="margin-left: %; width:155px;height:20px;background-color: #99FF99"></button><br><body>6  .</body>
 <button style="margin-left: %; width:149px;height:20px;background-color: #99FF99"></button><br><body>7  .</body>
 <button style="margin-left: %; width:148px;height:20px;background-color: #99FF99"></button><br><body>8  .</body>
 <button style="margin-left: %; width:143px;height:20px;background-color: #99FF99"></button><br><body>9  .</body>
 <button style="margin-left: %; width:140px;height:20px;background-color: #99FF99"></button><br><body>10.</body>
 <button style="margin-left: %; width:140px;height:20px;background-color: #99FF99"></button><br>
</html>
