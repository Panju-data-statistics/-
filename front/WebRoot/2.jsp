<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
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
	
	<link rel="stylesheet" type="text/css" href="css/2.css">
	
  </head>
  <body>
	  <div id="main">
		<iframe id="top"src="6.jsp"></iframe>
		<iframe id="middle"src="7.jsp"></iframe>
		<iframe id="bottom"src="8.jsp"></iframe>
	  </div>
	
  </body>
 <!-- <frameset rows="22%,60%,18%">
  <frame src="6.jsp" />
  <frame src="7.jsp" />
  <frame src="8.jsp" />
</frameset> -->
</html>
