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
	
	<link rel="stylesheet" href="css/MainStyle.css" />

  </head>
  <body>
		<div class="header">
			<h1 class="header-title">番剧数据统计-123</h1>
		</div>
		<div id="canvas-container">
		  		<canvas id="tree">asdasas</canvas>
		  		<canvas id="flower"></canvas>
          </div>
          
		<div class="wrapper">
			<div class="content">
				<div class="col col-l">
					<div class="xpanel-wrapper xpanel-wrapper-55">
						<div class="xpanel xpanel-l-t">
                            <div class="title">番剧总排行榜</div>
                            <div class="chart-div" id="rankChart">
                        </div>
						</div>
					</div>
					<div class="xpanel-wrapper xpanel-wrapper-45">
						<div class="xpanel xpanel-l-b">
							<div class="title">标签分类图</div>
							<div class="chart-div" id="csrcChart">
								<div class="chart-loader"><div class="loader"></div></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col col-c">
					<div class="xpanel-wrapper xpanel-wrapper-55">
						<div class="xpanel no-bg">
						</div>
					</div>
					<div class="xpanel-wrapper xpanel-wrapper-45">
						<div class="xpanel xpanel-c-b">
							<div class="title title-long"></div>
							<div class="chart-div" id="trendChart">
								<div class="chart-loader"><div class="loader"></div></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col col-r">
					<div class="xpanel-wrapper xpanel-wrapper-25">
						<div class="xpanel xpanel-r-t">
							<div class="title"></div>
						</div>
					</div>
					<div class="xpanel-wrapper xpanel-wrapper-30">
						<div class="xpanel xpanel-r-m">
							<div class="title"></div>
						</div>
					</div>
					<div class="xpanel-wrapper xpanel-wrapper-45">
						<div class="xpanel xpanel-r-b">
							<div class="title"></div>

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
	</body>
</html>
