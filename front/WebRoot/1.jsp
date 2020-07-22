<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/1.css">
	
  </head>
  <body>
  <div id="main">
  		<iframe  id="top"src="4.jsp"></iframe>
    	<iframe id="bottom" src="5.jsp"></iframe>
  </div>
  
  </body>
 <!-- <frameset rows="70%,30%">
  <frame src="4.jsp" />
  <frame src="5.jsp" />
</frameset> -->
</html>
