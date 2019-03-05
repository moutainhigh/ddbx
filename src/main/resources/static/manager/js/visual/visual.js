    //var axistick="{lineStyle:{color:'white',type:'dashed'}}";//刻度
    // 基于准备好的dom，初始化echarts图表
    var myChart = echarts.init(document.getElementById('main'));
    //前台数据图后台获取数据绘制
    $.ajax({
        dataType : "json",
        type : "post",
        url : "visual/select",
        success : function(data) {
            var summarydata = [];
            var timeline = [];
            var j;
            alert(data[0],data[1]);
           /* for(var i=0;i<9;i++){
                j=8-i;
                timeline[i]=data[1][j]=null?'2019-'+i:data[1][j];
                summarydata[i]=data[0][j]=null?'0':data[0][j];
            }*/
    var option = {
        tooltip : {
            trigger: 'axis'
        },

        calculable : true,
        legend: {
            data:['蒸发量','降水量','平均温度'],
            y:"bottom",
        },
        xAxis : [
            {
                type : 'category',
                splitLine:{show: false},//去除网格线
                data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
            }
        ],
        yAxis : [
            {
                type : 'value',
                name : '水量',
                splitLine:{show: false},//去除网格线
                axisLabel : {
                    formatter: '{value} ml'
                }
            },
            {
                type : 'value',
                name : '温度',
                splitLine:{show: false},//去除网格线
                axisLabel : {
                    formatter: '{value} °C'
                }
            }
        ],
        series : [

            {
                name:'蒸发量',
                type:'bar',
                data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]
            },
            {
                name:'降水量',
                type:'bar',
                data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
            },
            {
                name:'平均温度',
                type:'line',
                yAxisIndex: 1,
                data:[2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 20.3, 23.4, 23.0, 16.5, 12.0, 6.2]
            }
        ]
    };


    // 为echarts对象加载数据
    myChart.setOption(option);
            //ajax结尾
        },
        error : function(e, type, msg) {
            alert(type + "=测试=" + msg);
        }
    })



    //var axistick="{lineStyle:{color:'white',type:'dashed'}}";//刻度
    // 基于准备好的dom，初始化echarts图表
    var myChart1 = echarts.init(document.getElementById('main1'));
    //前台数据图后台获取数据绘制
    $.ajax({
        dataType : "json",
        type : "post",
        url : "visual/select",
        success : function(data) {
            var summarydata = [];
            var timeline = [];
            var j;
            alert(222);
            /* for(var i=0;i<9;i++){
                 j=8-i;
                 timeline[i]=data[1][j]=null?'2019-'+i:data[1][j];
                 summarydata[i]=data[0][j]=null?'0':data[0][j];
             }*/
            var option1 = {
                tooltip : {
                    trigger: 'axis'
                },

                calculable : true,
                legend: {
                    data:['蒸发量','降水量','平均温度'],
                    y:"bottom",
                },
                xAxis : [
                    {
                        type : 'category',
                        splitLine:{show: false},//去除网格线
                        data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
                    }
                ],
                yAxis : [
                    {
                        type : 'value',
                        name : '水量',
                        splitLine:{show: false},//去除网格线
                        axisLabel : {
                            formatter: '{value} ml'
                        }
                    },
                    {
                        type : 'value',
                        name : '温度',
                        splitLine:{show: false},//去除网格线
                        axisLabel : {
                            formatter: '{value} °C'
                        }
                    }
                ],
                series : [

                    {
                        name:'蒸发量',
                        type:'bar',
                        data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]
                    },
                    {
                        name:'降水量',
                        type:'bar',
                        data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
                    },
                    {
                        name:'平均温度',
                        type:'line',
                        yAxisIndex: 1,
                        data:[2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 20.3, 23.4, 23.0, 16.5, 12.0, 6.2]
                    }
                ]
            };


            // 为echarts对象加载数据
            myChart1.setOption(option1);
            //ajax结尾
        },
        error : function(e, type, msg) {
            alert(type + "=测试1=" + msg);
        }
    })