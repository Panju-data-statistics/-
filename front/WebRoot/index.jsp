<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
  <head>
  
    
    <title>番剧数据统计</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/MainStyle.css">
	
  </head>
  <body >
  <div id="canvas-container">
  		<canvas id="tree"></canvas>
  		<canvas id="flower"></canvas>
  </div>
 <div id="top">
 	这里是头
 </div>
  <div id="main">
  		<iframe id="left" src="1.jsp"></iframe>
  		<iframe id ="middle" src="2.jsp"></iframe>
  		<iframe id="right" src="3.jsp"></iframe>
  </div>
  <div id="bottom">
   		最终解释权归爬山小队所有
  </div>
 <!-- <frameset cols="20%,60%,20%">
  <frame src="1.jsp" />
  <frame src="2.jsp" />
  <frame src="3.jsp" />
</frameset> -->
<script src="js/canvas.js"></script>
<script src="js/vue.js"></script>
</body>
</html>
