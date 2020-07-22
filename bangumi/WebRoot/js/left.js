$(function() {
	//获取当天日期
	(function() {
		const now = new Date();
		const year = now.getFullYear();
		const month = now.getMonth()+1;
		const day = now.getDate();
		$("#nowDate").html(year+"年"+month+"月"+day+"日");
	})();
	
	//获取统计数据
	$.ajax({
		url: "data/count-data.json",
		dataType: "json"
	}).done(function(data) {
		//console.log('Data: ', data);
		rollNum("listedCompany", 0, data.listed_companies_total);
		rollNum("listedSecurity", 0, data.listed_securities_total);
		rollNum("totalMarket", 0, data.total_market_value, 2);
		rollNum("circulationMarket", 0, data.circulation_market_value, 2);
		rollNum("shRatio", 0, data.sh_pe_ratio, 2);
		rollNum("szRatio", 0, data.sz_pe_ratio, 2);
	}).fail(function(jqXHR, textStatus) {
		console.log("Ajax Error: ", textStatus);
	});
	
	//获取排行数据
	const rankChart = echarts.init(document.getElementById("rankChart"), "shine");
	const rankChartOpt = {
		tooltip: {
			trigger: "axis",
			axisPointer: {
				type: "shadow"
			},
			formatter: function(params) {
				const param = params[0];
				const marker = '<span style="display:inline-block;margin-right:5px;border-radius:10px;width:10px;height:10px;background-color:#e6b600;"></span>';
				const suffix = '<span style="margin-left:5px;font-size:12px;">亿元</span>';
				return param.name + "<br />" +
					marker + "排名：" + (param.dataIndex+1) + "<br />" +
					marker + "市价总值：" + param.value + suffix;
			}
		},
		grid: {
			top: 10,
			bottom: 10,
			left: 60
		},
		xAxis: {
			show: false,
			type: "value"
		},
		yAxis: {
			type: "category",
			inverse: true,
			axisLine: {show: false},
			axisTick: {show: false},
			axisLabel: {
				fontSize: 12,
				color: "#b0c2f9"
			}
		},
		series: [{
			name: "市价总值排行",
			type: "bar",
			barCategoryGap: "60%",
			label: {
				show: true,
				position: "right",
				fontSize: 12,
				color: "#188df0",
				emphasis: {
					color: "#e6b600"
				}
			},
			itemStyle: {
				normal: {
					color: new echarts.graphic.LinearGradient(
						0, 1, 1, 1,
						[
							{offset: 0, color: '#b0c2f9'},
							{offset: 0.5, color: '#188df0'},
							{offset: 1, color: '#185bff'}
						]
					)
				},
				emphasis: {
					color: new echarts.graphic.LinearGradient(
						0, 1, 1, 1,
						[
							{offset: 0, color: '#b0c2f9'},
							{offset: 0.7, color: '#e6b600'},
							{offset: 1, color: '#ceac09'}
						]
					)
				}
			}
		}]
	};
	rankChart.setOption(rankChartOpt);
	$.ajax({
		url: "data/ranking-list.json",
		dataType: "json"
	}).done(function() {
		$("#rankChart").addClass("chart-done");
	}).done(function(data) {
		//console.log('Data: ', data);
		const xData = [];
		const yData = [];
		for(let i in data) {
			xData.push(data[i].market_capitalization);
			yData.push(data[i].stock_name);
		}
		rankChart.setOption({
			yAxis: {
				data: yData
			},
			series: [{
				name: "市价总值排行",
				data: xData
			}]
		});
	}).fail(function(jqXHR) {
		console.log("Ajax Fail: ", jqXHR.status, jqXHR.statusText);
	});
	
	//获取地域分布数据
	// const mapChart = echarts.init(document.getElementById("mapChart"), "shine");
	// const mapChartOpt = {
	// 	tooltip: {
	// 		formatter: function(params) {
	// 			const data = params.data;
	// 			return data.name + "<br />上市公司数：" + data.value;
	// 		}
	// 	},
	// 	visualMap: {
	// 		type: "piecewise",
	// 		splitNumber: 6,
	// 		itemWidth: 10,
	// 		itemHeight: 10,
	// 		itemGap: 5,
	// 		textGap: 5,
	// 		textStyle: {
	// 			fontSize: 10,
	// 			color: "#b0c2f9"
	// 		},
	// 		min: 0,
	// 		max: 600,
	// 		calculable: true,
	// 		seriesIndex: [0]
	// 	},
	// 	geo: {
	// 		map: "china",
	// 		roam: true, //开启鼠标缩放和漫游
	// 		zoom: 1, //地图缩放级别
	// 		selectedMode: "single",
	// 		top: 10,
	// 		bottom: 10,
	// 		layoutCenter: ["50%", "50%"],
	// 		//layoutSize: "100%", //保持地图宽高比
	// 		label: {
	// 			show: true,
	// 			fontSize: 10,
	// 			color: "#ceac09"
	// 		}
	// 	},
	// 	series: [{
	// 		name: "地域分布",
	// 		type: "map",
	// 		geoIndex: 0
	// 	}]
	// };
	// mapChart.setOption(mapChartOpt);
	// $.ajax({
	// 	url: "data/region-count.json",
	// 	dataType: "json"
	// }).done(function() {
	// 	$("#mapChart").addClass("chart-done");
	// }).done(function(data) {
	// 	//console.log('Data: ', data);
	// 	const chartData = [];
	// 	for(let i in data) {
	// 		chartData.push({
	// 			name: data[i].region,
	// 			value: data[i].count
	// 		});
	// 	}
	// 	mapChart.setOption({
	// 		series: [{
	// 			name: "地域分布",
	// 			data: chartData
	// 		}]
	// 	});
	// }).fail(function(jqXHR) {
	// 	console.log("Ajax Fail: ", jqXHR.status, jqXHR.statusText);
	// });
	
	//获取月度股票情况数据
	const trendChart = echarts.init(document.getElementById("trendChart"), "shine");
	const trendChartOpt = {
		tooltip: {
			trigger: "axis",
			axisPointer: {
				type: "none"
			}
		},
		legend: {
			left: "center",
			bottom: 3,
			itemWidth: 15,
			itemHeight: 10,
			textStyle: {
				fontSize: 12,
				color: "#b0c2f9"
			},
			data: ["市价总值", "成交总额", "平均市盈率"]
		},
		grid: {
			top: 40,
			bottom: 50,
			left: 60,
			right: 60
		},
		xAxis: {
			type: "category",
			axisLine: {
				lineStyle: {color: "#b0c2f9"}
			},
			axisTick: {show: false},
			axisLabel: {
				fontSize: 12,
				color: "#b0c2f9"
			}
		},
		yAxis: [{
			name: "金额",
			type: "value",
			splitNumber: 5,
			axisLine: {
				lineStyle: {color: "#b0c2f9"}
			},
			splitLine: {show: false},
			axisTick: {color: "#b0c2f9"},
			axisLabel: {
				fontSize: 12,
				color: "#b0c2f9",
				formatter: (value, index) => {
					return parseInt(value / 10000) + "万亿";
				}
			}
		}, {
			name: "市盈率",
			type: "value",
			splitNumber: 5,
			maxInterval: 5,
			minInterval: 5,
			interval: 5,
			axisLine: {
				lineStyle: {color: "#b0c2f9"}
			},
			splitLine: {show: false},
			axisTick: {color: "#b0c2f9"},
			axisLabel: {
				fontSize: 12,
				color: "#b0c2f9"
			}
		}],
		visualMap: {
			show: false,
			seriesIndex: 2,
			dimension: 0,
			pieces: [{
				lte: 9,
				color: "rgba(176, 58, 91, 1)"
			}, {
				gt: 9,
				lte: 11,
				color: "rgba(176, 58, 91, 0.5)"
			}]
		},
		series: [{
			name: "市价总值",
			type: "pictorialBar",
			symbol: 'path://d="M150 50 L130 130 L170 130  Z"',
			barCategoryGap: "40%",
			itemStyle: {
				color: function(params) {
					if(params.dataIndex >= 10) {
						return "rgba(119, 96, 246, 0.5)";
					}
					return "rgba(119, 96, 246, 1)";
				}
			},
			markPoint: {
				itemStyle: {
					color: "rgba(119, 96, 246, 1)"
				},
				data: [{
					name: "最大值",
					type: "max"
				}]
			},
			markLine: {
				lineStyle: {
					color: "rgba(119, 96, 246, 1)"
				},
				label: {
					position: "middle",
					formatter: "月度平均市价总值：{c}亿元"
				},
				data: [{
					name: "平均值",
					type: "average"
				}]
			}
		}, {
			name: "成交总额",
			type: "pictorialBar",
			symbol: 'path://d="M150 50 L130 130 L170 130  Z"',
			barCategoryGap: "40%",
			itemStyle: {
				color: function(params) {
					if(params.dataIndex >= 10) {
						return "rgba(230, 182, 0, 0.5)";
					}
					return "rgba(230, 182, 0, 1)";
				}
			},
			markPoint: {
				itemStyle: {
					color: "rgba(230, 182, 0, 1)"
				},
				data: [{
					name: "最大值",
					type: "max"
				}]
			},
			markLine: {
				lineStyle: {
					color: "rgba(230, 182, 0, 1)"
				},
				label: {
					position: "middle",
					formatter: "月度平均成交总额：{c}亿元"
				},
				data: [{
					name: "平均值",
					type: "average"
				}]
			}
		}, {
			name: "平均市盈率",
			type: "line",
			yAxisIndex: 1
		}]
	};
	trendChart.setOption(trendChartOpt);
	$.ajax({
		url: "data/month-count.json",
		dataType: "json"
	}).done(function() {
		$("#trendChart").addClass("chart-done");
	}).done(function(data) {
		//console.log('Data: ', data);
		const xData = [];
		const yData1 = [];
		const yData2 = [];
		const yData3 = [];
		for(let i in data) {
			xData.push(data[i].month);
			yData1.push(data[i].sh_market_capitalization);
			yData2.push(data[i].sh_transaction_amount);
			yData3.push(data[i].sh_pe_ratio);
		}
		trendChart.setOption({
			xAxis: {
				data: xData,
			},
			series: [{
				name: "市价总值",
				data: yData1
			}, {
				name: "成交总额",
				data: yData2
			}, {
				name: "平均市盈率",
				data: yData3
			}]
		});
	}).fail(function(jqXHR) {
		console.log("Ajax Fail: ", jqXHR.status, jqXHR.statusText);
	});
	
	//获取CSRC行业分类数据
	const csrcChart = echarts.init(document.getElementById("csrcChart"), "shine");
	const csrcChartOpt = {
		tooltip: {
			trigger: "item",
			formatter: "{b0}<br />股票数：{c0}<br />占比：{d0}%"
		},
		legend: {
			type: "scroll",
			orient: "vertical",
			padding: 0,
			top: 15,
			right: 0,
			itemGap: 5,
			itemWidth: 10,
			itemHeight: 10,
			textStyle: {
				fontSize: 10,
				color: "#b0c2f9"
			}
		},
		series: [{
			name: "CSRC行业分类",
			type: "pie",
			center: ["47%", "55%"],
			radius: ["30%", "85%"]
		}]
	};
	csrcChart.setOption(csrcChartOpt);
	$.ajax({
		url: "data/csrc-industry.json",
		dataType: "json"
	}).done(function() {
		$("#csrcChart").addClass("chart-done");
	}).done(function(data) {
		//console.log('Data: ', data);
		const chartData = [];
		for(let i in data) {
			chartData.push({
				name: data[i].alias,
				value: data[i].stock
			});
		}
		csrcChart.setOption({
			series: [{
				name: "CSRC行业分类",
				data: chartData
			}]
		});
	}).fail(function(jqXHR) {
		console.log("Ajax Fail: ", jqXHR.status, jqXHR.statusText);
	});
	
	//浏览器窗口大小变化时，重置报表大小
	$(window).resize(function() {
		rankChart.resize();
		mapChart.resize();
		trendChart.resize();
		csrcChart.resize();
	});
});

//数字变化特效
function rollNum(elId, startVal, endVal, decimalNum) {
	let n = decimalNum || 0;
	let countUp = new CountUp(elId, startVal, endVal, n, 2.5, {
		useEasing: true, 
		useGrouping: true, 
		separator: ',', 
		decimal: '.'
	});
	if(!countUp.error) {
		countUp.start();
	}else {
		console.error(countUp.error);
	}
}