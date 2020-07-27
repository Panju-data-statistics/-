<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>

<title>山西省交通大数据分析平台</title>
<!--设置是否为缩放模式 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 新 Bootstrap 核心 CSS 文件 --> 
<link rel="stylesheet" type="text/css" href="https://apps.bdimg.com/libs/bootstrap/3.3.4/css/bootstrap.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 --> 
<script src="js/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 --> 
<script src="js/bootstrap.min.js"></script>
<!--echarts JS-->
<script src="js/echarts.min.js"></script>
<!-- 轮播swiper文件 -->
<link rel="stylesheet" type="text/css" href="css/swiper.min.css">
<script src="js/swiper.min.js"></script>
<!--界面样式-->
<script src="js/visual.js"></script>
<script src="js/china.js"></script>
<script src="js/chartMap.js"></script>
<link rel="stylesheet" type="text/css" href="css/visual.css">

</head>
<body class="ksh" background-image:url(img/data08.png)>
	<div id="load">
		<div class="load_img"><!-- 加载动画 -->
			<img class="jzxz1" src="img/jzxz1.png">
			<img class="jzxz2" src="img/jzxz2.png">
		</div>
	</div>
	<div class="head_top">
		<img class="img-responsive" src="img/jcdsj_logo.gif">
		
	</div>
	<div class="visual">
		<div class="visual_left">
			<div class="visual_box">
				<div class="visual_title">
					
				</div>
				
			</div>
			<div class="visual_box">
				<div class="visual_title">
					
				</div>
				
			</div>
			<div class="visual_box">
				
			</div>
		</div>
		
		<div class="visual_right">
			<div class="visual_box">
				<div class="visual_title">
					<span>本月发生事件</span>
					<img src="img/ksh33.png">
				</div>
				<div class="swiper-container visual_swiper1 visual_chart">
					<div class="swiper-wrapper">
						<div class="swiper-slide"  id="main3"></div>
					</div>
				</div>
			</div>
			<div class="visual_box visualSfzsfl">
				<div class="visual_title">
					<span>收费站收费量</span>
					<img src="img/ksh33.png">
				</div>
				    <div class="visual_chart" id="main2">
					
				</div>
					
				</div>
			</div>
	
		</div>
		<div class="clear">
		<div class="visual_chart" id="main1">
					
				</div></div>
	</div>
	<script type="text/javascript">
		$(function(){
			var a=$('.visualSssf_left a')
			for(var i=0;i<a.length;i++){
				a[i].index=i;
				a[i].onclick=function(){
					for(var i=0;i<a.length;i++){
						a[i].className=''
						}
					this.className='active'
				}
			}

			var sfzcllH=$('.sfzcll_box').height()
			var sfzcllHtwo=sfzcllH-2
			$('.sfzcll_box').css('line-height',sfzcllH+'px')
			$('.sfzcll_smallBk>div').css('line-height',sfzcllHtwo+'px')

			//删除加载动画
			$('#load').fadeOut(1000)
    		setTimeout(function(){    
    			$('#load').remove()
    		}
    		,1100);
		})

	//交通流量
	var myChart1 = echarts.init(document.getElementById('main1'));
    myChart1.setOption(option1);
	//交通工具流量
	var myChart2 = echarts.init(document.getElementById('main2'));
    myChart2.setOption(option2);
    //本月发生事件
	var myChart3 = echarts.init(document.getElementById('main3'));
    myChart3.setOption(option3);
    var myChart31 = echarts.init(document.getElementById('main31'));
    myChart31.setOption(option31);
    var mySwiper1 = new Swiper('.visual_swiper1', {
		autoplay: true,//可选选项，自动滑动
		speed:800,//可选选项，滑动速度
		autoplay: {
		    delay: 5000,//1秒切换一次
		  },
	})
    //收费站收费排行
	
    var mySwiper2 = new Swiper('.visual_swiper2', {
		autoplay: true,//可选选项，自动滑动
		direction : 'vertical',//可选选项，滑动方向
		speed:2000,//可选选项，滑动速度
	})
    //今日实时收费
    
	</script>
</body>
</html>
