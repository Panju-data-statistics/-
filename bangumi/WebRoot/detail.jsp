<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!doctype html>
<html>
<head>
<title>番剧详细页</title>
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

<script src="js/china.js"></script>
<script src="js/chartMap.js"></script>
<link rel="stylesheet" type="text/css" href="css/visual.css">

</head>
<body class="ksh" style="background-image: url(img/data08.png);">
	<!-- style="background-image: url(img/data08.png);"	 -->
	
	<div class="visual">
		<div class="visual_left">
			<div class="visual_box">
				<div style="height:100%;width:40%;float:left">
				<img style="height:300px;width:225px;margin-top: 20px;"  id="pic1" ></img></div>
				<div style="height:100%;width:55%;float: right;margin: 10px auto;">
				  <br><br><br>
				  <nobr style="display:inline;font-size:22px;color: rgb(214, 214, 255)">剧名:</nobr> 
				  <p style="display:inline;font-size:18px;color: rgb(239, 255, 205)" id="text1">
					${requestScope.title}
				 </p><br><br>
				  <p style="display:inline;font-size:22px;color: rgb(214, 214, 255)">类别:</p>
				  <p style="display:inline;font-size:18px;color: rgb(239, 255, 205);" id="text2">
					${requestScope.tag}
				  </p><br><br>
				  <p style="display:inline;font-size:22px;color: rgb(214, 214, 255)">连载情况:</p>
				  <p style="display:inline;font-size:18px;color: rgb(239, 255, 205);" id="text3">
					${requestScope.is_finish}
				  </p><br><br>
				  <p style="display:inline;font-size:22px;color: rgb(214, 214, 255)">评分:</p>
				  <p style="display:inline;font-size:18px;color: rgb(239, 255, 205)" id="text4">
					${requestScope.score}
				  </p><br><br>
				  
				</div>
			</div>
			<div class="visual_box">
				<br><br>
				<div>
					<title style="display:inline;font-size:22px;color: rgb(214, 214, 255)">简介:</title>
				</div>
				
				<p style="display:inline;font-size:18px;color: white" id="text">
					${requestScope.intro}
				</p>
			</div>
			<div class="visual_box">
				
			</div>
		</div>
		
		<div class="visual_right">
			<div class="visual_box">
				<div class="visual_title">
					<span>综合数据</span>
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
					<span>热度走势</span>
					<img src="img/ksh33.png">
				</div>
				    <div class="visual_chart" id="main2">
					
				</div>
					
				</div>
			</div>
	
		</div>
		
	</div>
	<script src="js/detail.js"></script>
	<script>
		var img="${requestScope.cover}";
		// var img="imgs/xm8.png";
		document.getElementById('pic1').src=img;
	</script>
	<script>
		var gmvamounts = [];
		gmvamounts[0]="${requestScope.coinsX}";
		gmvamounts[1]="${requestScope.followX}";
		gmvamounts[2]="${requestScope.danmakusX}";
		gmvamounts[3]="${requestScope.commentX}";
		gmvamounts[4]="${requestScope.viewsX}";
		 option = {
				  //  backgroundColor: '#00265f',
				    		tooltip: {
				    	        show: true,
				    	        trigger: "item"
				    	    },
				    	    radar: {
				    	        center: ["50%", "50%"],//偏移位置
				    	        radius: "80%",
				    	        startAngle: 40, // 起始角度
				    	        splitNumber: 4,
				    	        shape: "circle",
				    	        splitArea: {
				    	            areaStyle: {
				    	                color: 'transparent'
				    	            }
				    	        },
				    	        axisLabel: {
				    	            show: false,
				    	            fontSize: 20,
				    	            color: "#000",
				    	            fontStyle: "normal",
				    	            fontWeight: "normal"
				    	        },
				    	        axisLine: {
									show: true,
									
				    	            lineStyle: {
										color: "rgba(248,248,255)",
										fontSize:30
				    	            }
				    	        },
				    	        splitLine: {
				    	            show: true,
				    	            lineStyle: {
				    	                color: "rgba(255, 255, 255, 0.5)"
				    	            }
				    	        },
				    	        indicator:  [
				    	                     { name: '追番系数', max: 1},
				    	                     { name: '投币系数', max: 1},
				    	                     { name: '弹幕系数', max: 1},
				    	                     { name: '评论系数', max: 1},
				    	                     { name: '播放系数', max: 1}
				    	                 ]
				    	    },
				    	    series: [{
				    	        type: "radar",
				    	        data: [{value:gmvamounts,
				    	        	name: "番剧综合评估",
				    	            symbol: 'none',
				    	            lineStyle: {
				    	                normal: {
				    	                    color: '#ecc03e',
				    	                    width: 2
				    	                }
				    	            },
				    	            areaStyle: {
				    	                normal: {
				    	                    color: new echarts.graphic.LinearGradient(0, 0, 1, 0,
				    	                        [{
				    	                            offset: 0,
				    	                            color: 'rgba(203, 158, 24, 0.8)'
				    	                        }, {
				    	                            offset: 1,
				    	                            color: 'rgba(190, 96, 20, 0.8)'
				    	                        }],
				    	                        false)
				    	                }
				    	            }
				    	              }]
				    	    }]
				};
		var myChart = echarts.init(document.getElementById("main3"));

//使用制定的配置项和数据显示图表
		myChart.setOption(option);
	</script>
	<script>
		var myChart = echarts.init(document.getElementById('main2'));
		var gmvamounts = [];
		gmvamounts[0]="${requestScope.hot1}";
		gmvamounts[1]="${requestScope.hot2}";
		gmvamounts[2]="${requestScope.hot3}";
		gmvamounts[3]="${requestScope.hot4}";
		gmvamounts[4]="${requestScope.hot5}";
		option = {
  //  backgroundColor: '#00265f',
    		   tooltip: {//鼠标指上时的标线
    		        trigger: 'axis',
    		        axisPointer: {
    		            lineStyle: {
    		                color: 'rgba(248,248,255)'
    		            }
    		        }
    		    },
    		    legend: {
    		        icon: 'rect',
    		        itemWidth: 14,
    		        itemHeight: 5,
    		        itemGap: 13,
    		        data: ['热度值'],
    		        right: '10px',
    		        top: '0px',
    		        textStyle: {
    		            fontSize: 12,
    		            color: 'rgba(248,248,255)'
    		        }
    		    },
    		    grid: {
    		        x: 35,
    		        y: 25,
    		        x2: 8,
    		        y2: 25,
    		    },
    		    xAxis: [{
    		        type: 'category',
					boundaryGap: false,
					
    		        axisLine: {
    		            lineStyle: {
    		                color: 'rgba(248,248,255)'
    		            }
    		        },
    		        axisLabel: {
    		            textStyle: {
    		                color:'rgba(248,248,255)',
    		            },
    		        },
    		        data:['第一天', '第二天', '第三天', '第四天', '第五天','第六天']
    		    }],
    		    yAxis: [{
    		        type: 'value',
    		        axisTick: {
    		            show: false
    		        },
    		        axisLine: {
    		            lineStyle: {
    		                color: 'rgba(248,248,255)'
    		            }
    		        },
    		        axisLabel: {
    		            margin: 10,
    		            textStyle: {
    		                fontSize: 14
    		            },
    		            textStyle: {
    		                color:'rgba(248,248,255)',
    		            },
    		        },
    		        splitLine: {
    		            lineStyle: {
    		                color: '#57617B'
    		            }
    		        }
    		    }],
    		    series: [{
    		        name: '热度',
    		        type: 'line',
    		        smooth: true,
    		        lineStyle: {
    		            normal: {
    		                width: 2
    		            }
    		        },
    		        areaStyle: {
    		            normal: {
    		                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
    		                    offset: 0,
    		                    color: 'rgba(248,248,255)'
    		                }, {
    		                    offset: 0.8,
    		                    color: 'rgba(0, 136, 212, 0)'
    		                }], false),
    		                shadowColor: 'rgba(0, 0, 0, 0.1)',
    		                shadowBlur: 10
    		            }
    		        },
    		        itemStyle: {
    		            normal: {
    		                color: 'rgb(0,136,212)'
    		            }
    		        },
    		        data:gmvamounts
    		    },  ]
};
      
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
        window.addEventListener("resize",function(){
            myChart.resize();
        });
	</script>
</body>
</html>
