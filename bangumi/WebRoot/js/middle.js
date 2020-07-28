option = {
    //  backgroundColor: '#00265f',
      tooltip: {
          trigger: 'axis',
          axisPointer: {
              type: 'shadow'
          }
      },
      
      grid: {
          left: '0%',
          top:'10px',
          right: '0%',
          bottom: '2%',
         containLabel: true
      },
      xAxis: [{
          type: 'category',
                // data: xData,
          axisLine: {
              show: true,
           lineStyle: {
                  color: "rgba(255,255,255,.1)",
                  width: 1,
                  type: "solid"
              },
          },
          
          axisTick: {
              show: false,
          },
          axisLabel:  {
                  interval: 0,
                 // rotate:50,
                  show: true,
                  splitNumber: 15,
                  textStyle: {
                       color: "rgba(255,255,255,.6)",
                      fontSize: '12',
                  },
              },
      }],
      yAxis: [{
          type: 'value',
          axisLabel: {
             //formatter: '{value} %'
              show:true,
               textStyle: {
                       color: "rgba(255,255,255,.6)",
                      fontSize: '12',
                  },
          },
          axisTick: {
              show: false,
          },
          axisLine: {
              show: true,
              lineStyle: {
                  color: "rgba(255,255,255,.1	)",
                  width: 1,
                  type: "solid"
              },
          },
          splitLine: {
              lineStyle: {
                 color: "rgba(255,255,255,.1)",
              }
          }
      }],
      series: [{
          type: 'bar',
          
          barWidth:'35%', //柱子宽度
         // barGap: 1, //柱子之间间距
          itemStyle: {
              normal: {
                  color:'#2f89cf',
                  opacity: 1,
                  barBorderRadius: 5,
              }
          }
      }
      ]
  };
 
var myChart = echarts.init(document.getElementById("echart5"));

//使用制定的配置项和数据显示图表
myChart.setOption(option);
    $.ajax({
        url: "http://127.0.0.1:8080/bangumi/companyServlet",
        dataType: "json"
    }).done(function() {
        $("#myChart").addClass("chart-done");
    }).done(function(data) {
        //console.log('Data: ', data);
        const xData = [];
        const yData = [];
        for(let i in data) {
            xData.push(data[i].company);
            yData.push(data[i].fame);
        }
        myChart.setOption({
            xAxis: {
                data: xData
            },
            series: [{
                name: "热度总值排行",
                data: yData
            }]
        });
    }).fail(function(jqXHR) {
        console.log("Ajax Fail: ", jqXHR.status, jqXHR.statusText);
    });

    // $.ajax({
    //     type : "POST",
    //     async : true, 
    //     url : "http://127.0.0.1:8080/bangumi/peopleServlet",
    //     dataType : "JSON",
    //     success : function(data) {
    //         document.getElementById('pic').src=data.time;
            
            
    
    //         }
    // })