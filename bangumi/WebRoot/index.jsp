<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html >
  <head>
  
    
    <title>番剧数据统计</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="css/MainStyle.css" />

  </head>
	<body>
		<header id="header">
			<h3 class="header-title">番剧数据统计</h3>
			<div class="header-info header-info-l">数据来源：Bilibili &amp; Acfun</div>
			<div class="header-info header-info-r">数据日期：<span id="nowDate"></span></div>
		</header>
		<!-- <div id="canvas-container">
			<canvas id="tree">asdasas</canvas>
			<canvas id="flower"></canvas>
		</div> -->
		<div class="canvas" style="opacity: .2;width: 100%;height: 100%;">
			<iframe frameborder="0" src="js/index.html" style="width: 100%; height: 100%"></iframe>
		</div>
		
		<footer id="footer"></footer>
		
		<div id="container">
			<div id="flexCon">
				<div class="flex-row">
					
					<div class="flex-cell flex-cell-l">
						<div class="chart-wrapper">
							<h3 class="chart-title">番剧排行Top10</h3>
							<div class="chart-div" id="rankChart">
								<div class="chart-loader">
									<div class="loader"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="flex-cell flex-cell-c" style="padding-right:0;">
						<div class="map1">
							<img style="margin: 0 auto;height: 600px;height: 600px;" id="img1"src="imgs/mfz3.png">
						</div>
						<div class="chart-wrapper">
							<h3 class="chart-title">统计数据</h3>
							<div class="chart-div chart-done">
								<table class="data-t">
									<tr>
										<th ><img style="height: 50px;width: 50px;"src="imgs/xm1.png" /></th>
										<td>
											<p><span id="listedCompany">0</span></p>
											<p>在线人数</p>
										</td>
										<th><img style="height: 50px;width: 50px;"src="imgs/xm2.png" /></th>
										<td>
											<p><span id="listedSecurity">0</span></p>
											<p>正在连载</p>
										</td>
									</tr>
									<tr>
										<th><img style="height: 50px;width: 50px;"src="imgs/xm3.png" /></th>
										<td>
											<p><span id="totalMarket">0</span></p>
											<p>新增投币量</p>
										</td>
										<th><img style="height: 50px;width: 50px;"src="imgs/xm4.png" /></th>
										<td>
											<p><span id="circulationMarket">0</span></p>
											<p>新增弹幕量</p>
										</td>
									</tr>
									<tr>
										<th><img style="height: 50px;width: 50px;"src="imgs/xm5.png" /></th>
										<td>
											<p><span id="shRatio">0</span></p>
											<p>新增评论量</p>
										</td>
										<th><img style="height: 50px;width: 50px;"src="imgs/xm6.png" /></th>
										<td>
											<p><span id="szRatio">0</span></p>
											<p>新增播放量</p>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<div class="flex-cell flex-cell-r" style="padding-left:0;">
						<div class="chart-wrapper">
							<h3 class="chart-title">制作公司排行榜</h3>
							<div class="chart-div" id="echart5">
								<div class="chart-loader"><div class="loader"></div></div>
							</div> 
						</div>
					</div>
				</div>
				<div class="flex-row">
					<div class="flex-cell flex-cell-lc" style="padding-bottom:0;">
						<div class="chart-wrapper">
							<h3 class="chart-title">各个时段在线人数</h3>
							<div class="chart-div" id="trendChart">
								<div class="chart-loader"><div class="loader"></div></div>
							</div>
						</div>
					</div>
					<div class="flex-cell flex-cell-r" style="padding-bottom:0;">
						<div class="chart-wrapper">
							<h3 class="chart-title">风格统计</h3>
							<div class="chart-div" id="csrcChart">
								<div class="chart-loader"><div class="loader"></div></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="js/canvas.js"></script>
		<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="js/countUp.min.js"></script>
		<script type="text/javascript" src="js/echarts.min.js"></script>
		<script type="text/javascript" src="js/echarts-map-china.js"></script>
		<script type="text/javascript" src="js/echarts-theme-shine.js"></script>
		<script src="js/left.js"></script>
		<script src="js/middle.js"></script>
		<script type="text/javascript" src="js/echarts.js"></script>
	</body>
</html>
