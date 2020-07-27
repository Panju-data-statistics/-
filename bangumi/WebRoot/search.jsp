<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>番剧百宝箱</title>
<link rel="stylesheet" href="css/common.css"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome/css/font-awesome.min.css">
<script src="/js/jquery-1.8.3.min.js"></script>
<style>#wimoban_p,#wimoban_p a{color:rgba(0, 0, 0, 0.746); font-family:"微软雅黑";}
#wimoban_p{text-align:center; font-size:14px; clear:both;}
</style>
  </head>
 <body oncontextmenu='return false' ondragstart='return false'>
<div id="canvas-container">
		<canvas id="tree"></canvas>
		<canvas id="flower"></canvas>
	</div>
<div id="wrapper">
	<div class="skinBg" ></div>
	<header id="header">
		<div class="weather fl">
			<span class="cityW">
				<span>南京：</span>
				<span>
					<span class="weatherIcon wI1"></span>
					<span>23 ~ 31℃</span>
				</span>
			</span>
			<span class="sp">|</span>
			<span class="pollution">
				<span>空气质量：83</span>
				<span class="polutionLevel">良</span>
			</span>
			<div class="cityWeather">
				
			</div>
		</div>
		<nav class="headNavs fr tr">
			<a href="#"><span class="s-icon s-icon-treasure"></span><span>宝箱</span></a>
			<a href="#"><span class="s-icon s-icon-skin"></span><span>换肤</span></a>
			<a href="#"><span class="s-icon s-icon-msg"></span><span>消息</span></a>
			<a><span class="s-icon s-icon-line"></span></a>
			<a href="#"><span>设为首页</span></a>
			<div class="topMenus dn">
				<span class="arrowTop"></span>
				<a href="#">个人中心</a>
				<a href="#">帐号设置</a>
				<a href="#">搜索设置</a>
				<a href="#">意见反馈</a>
				<a href="#">首页教程</a>
				<a href="#">安全退出</a>
			</div>
		</nav>
	</header>
	<div class="content tc" >
		<p class="logo" style="margin-top: 100px;margin-bottom: 20px;"><img width="320" height="179" src="imgs/logo233.png" alt="logo" /></p>
		<nav class="mainNavs">
			<!-- <a href="#">新闻</a>
			<a href="#">网页</a>
			<a href="#">贴吧</a>
			<a href="#">知道</a>
			<a href="#">音乐</a>
			<a href="#">图片</a>
			<a href="#">视频</a>
			<a href="#">地图</a>
			<a href="#">百科</a>
			<a href="#">文库</a>
			<a href="#">更多&gt;&gt;</a> -->
		</nav>
		<div class="searchBox">
			<form action="searchSevelt" method="get">
				<input type="text" class="searchIpt f14" name="wd" maxlength="200" autocomplete="off"/>
				<input type="submit" class="btn cp" value="搜索番剧" />
			</form>
		</div>
		<div class="bigdata" >
			<p id="tips">点此进入神秘世界</p>
			<a href="index.jsp">
				<img style="height: 200px;width: 200px;" src="imgs/mfz2.png"/>
			</a>
		</div>
	</div>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.autocomplete.min.js"></script>
<script src="js/canvas.js"></script>
<script src="js/autoload.js"></script>
<!-- 代码结束 -->
</body>
</html>