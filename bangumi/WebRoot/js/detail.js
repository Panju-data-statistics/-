
$(function () {
echarts_1();
echarts_2();
function echarts_1() {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main3'));
        var dts = [];
        var gmvamounts = [];
    	$.ajax({
    		type : "GET",
    		async : true, 
    		url : "http://127.0.0.1:8080/bangumi/searchServlet",
    		dataType : "JSON",
    		success : function(data) {

				gmvamounts[0]=data[0].followX;
				gmvamounts[1]=data[0].coinsX;
				gmvamounts[2]=data[0].danmakusX;
				gmvamounts[3]=data[0].commentX;
				gmvamounts[4]=data[0].viewsX;
				
	      			
	              
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
				    	                color: "rgba(255, 255, 255, 0.5)"
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
				    	        	name: "告警类型TOP5",
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
				       
       
       
      
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
        window.addEventListener("resize",function(){    myChart.resize();   });
        
        
        
    			}

	});

}
        
        
        
        





function echarts_2() {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main2'));
        var dts = [];
        var gmvamounts = [];
    	$.ajax({
    		type : "POST",
    		async : true, 
    		url : "http://127.0.0.1:8080/echartsDemo/zhe",
    		dataType : "JSON",
    		success : function(data) {

    			for(var i = 0;i<data.length;i++){
	      				
    				dts[i]= data[i].dt;
	      				
    				gmvamounts[i] = data[i].gmvAmount;
    				
	      		}
       option = {
  //  backgroundColor: '#00265f',
    		   tooltip: {//鼠标指上时的标线
    		        trigger: 'axis',
    		        axisPointer: {
    		            lineStyle: {
    		                color: '#fff'
    		            }
    		        }
    		    },
    		    legend: {
    		        icon: 'rect',
    		        itemWidth: 14,
    		        itemHeight: 5,
    		        itemGap: 13,
    		        data: ['中型车'],
    		        right: '10px',
    		        top: '0px',
    		        textStyle: {
    		            fontSize: 12,
    		            color: '#fff'
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
    		                color: '#57617B'
    		            }
    		        },
    		        axisLabel: {
    		            textStyle: {
    		                color:'#fff',
    		            },
    		        },
    		        data:['第一天', '第二天', '第三天', '第四天', '第五天']
    		    }],
    		    yAxis: [{
    		        type: 'value',
    		        axisTick: {
    		            show: false
    		        },
    		        axisLine: {
    		            lineStyle: {
    		                color: '#57617B'
    		            }
    		        },
    		        axisLabel: {
    		            margin: 10,
    		            textStyle: {
    		                fontSize: 14
    		            },
    		            textStyle: {
    		                color:'#fff',
    		            },
    		        },
    		        splitLine: {
    		            lineStyle: {
    		                color: '#57617B'
    		            }
    		        }
    		    }],
    		    series: [{
    		        name: '中型车',
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
    		                    color: 'rgba(0, 136, 212, 0.3)'
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
    		        data:gmvamounts//[97.3,99.2,99.3,100.0,99.6,90.6,80.0,91.5,69.8,67.5,90.4,84.9]
    		    },  ]
};
      
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
        window.addEventListener("resize",function(){
            myChart.resize();
        });
   			}

    	});
    }

})



		
		
		


		









