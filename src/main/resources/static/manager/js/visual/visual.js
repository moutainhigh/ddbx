    var axistick="{lineStyle:{color:'white',type:'dashed'}}";//刻度
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

        grid: {show:'true',borderWidth:'0'},//去除边框
        legend: {
            data:['蒸发量','降水量','平均温度'],
            y:"bottom",
        },
        xAxis : [
            {
                type : 'category',
                splitLine:{show: false},//去除网格线
                data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
            }
        ],
        yAxis : [
            {
                type : 'value',
                name : '水量',
                splitLine:{show: false},//去除网格线
                axisLabel : {
                    formatter: '{value} ml'
                },
                axisTick:axistick,
                axisLine :{symbol:['none', 'arrow'],symbolSize:['10', '13']}//轴线


            },
            {
                type : 'value',
                name : '温度',
                splitLine:{show: false},//去除网格线
                axisTick:axistick,
                axisLine :{symbol:['none', 'arrow'],symbolSize:['10', '13']},//轴线
                axisLabel : {
                    formatter: '{value} °C'
                }
            }
        ],
        series : [

            {
                name:'蒸发量',
                type:'bar',
                itemStyle: {color:'rgb(025,156,222)'},
                data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]
            },
            {
                name:'降水量',
                type:'bar',
                itemStyle: {color:'rgb(168,156,169)'},//柱形颜色
                data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
            },
            {
                name:'平均温度',
                type:'line',
                yAxisIndex: 1,
                // lineStyle: {
                //          color:"#F7331E",
                // },
                /*折线拐点标志的样式。*/
                itemStyle:{
                    color:"#F7331E",         //颜色
                    //borderType:"solid",  //柱条的描边类型，默认为实线，支持 'dashed', 'dotted'。
                    //shadowBlur:10,       //图形阴影的模糊大小。
                    //shadowColor:"#000"  //阴影颜色
                },
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
            option1 = {
                tooltip : {
                    trigger: 'axis'
                },
                grid: {show:'true',borderWidth:'0'},//去除边框
                legend: {
                    data:['意向','预购','成交'],
                    y:"bottom",//图例位置
                },

                xAxis : [
                    {

                        splitLine:{show: false},//去除网格线
                        type : 'category',
                        boundaryGap : false,
                        data : ['周一','周二','周三','周四','周五','周六','周日'],
                        axisTick:axistick,
                        axisLine :{symbol:['none', 'arrow'],symbolSize:['10', '13']},//轴线

                    }
                ],
                yAxis : [
                    {
                        splitLine:{show: false},//去除网格线
                        type : 'value',
                        axisTick:axistick,
                        axisLine :{symbol:['none', 'arrow'],symbolSize:['10', '13']},//轴线
                    }
                ],
                series : [
                    {
                        name:'成交',
                        type:'line',
                        smooth:true,
                        /*线条样式。*/

                        itemStyle: {normal: {areaStyle: {type: 'default',color:'rgb(213,085,135)'}}},
                        data:[10, 12, 21, 54, 260, 830, 710]
                    },

                    {
                        name:'预购',
                        type:'line',
                        smooth:true,
                        /*线条样式。*/
                        // lineStyle:{
                        //     color:"#4667f2",   //颜色，'rgb(128, 128, 128)'，'rgba(128, 128, 128, 0.5)'，支持线性渐变，径向渐变，纹理填充
                        //     type:"solid",     //坐标轴线线的类型，solid，dashed，dotted
                        //     width:2          //坐标轴线线宽
                        // },
                        itemStyle: {normal: {areaStyle: {type: 'default',color:'rgb(168,156,169)'}}},
                        data:[30, 182, 434, 791, 390, 30, 10]
                    },
                    {
                        name:'意向',
                        type:'line',
                        smooth:true,
                        /*线条样式。*/
                        // lineStyle:{
                        //     color:"#4667f2",   //颜色，'rgb(128, 128, 128)'，'rgba(128, 128, 128, 0.5)'，支持线性渐变，径向渐变，纹理填充
                        //     type:"solid",     //坐标轴线线的类型，solid，dashed，dotted
                        //     width:2          //坐标轴线线宽
                        // },
                        itemStyle: {normal: {areaStyle: {type: 'default',color:'rgb(065,168,148)'}}},//color 线条下阴影颜色
                        data:[1320, 1132, 601, 234, 120, 90, 20]
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
    var myChart2 = echarts.init(document.getElementById('main2'));
    option2 = {
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient : 'horizontal',//布局方式 默认为水平布局horizontal，可选为：'horizontal' | 'vertical'
            x : 'left',//水平布局位置
            data:['直接访问','邮件营销','联盟广告','视频广告','搜索引擎'],
            y:"bottom",//垂直布局位置
        },
        series : [
            {
                name:'访问来源',
                type:'pie',
                radius : '60%',//百分比计算比，min(width, height) / 2 * 75%， 传数组实现环形图，[内半径，外半径]
                center: ['50%', '45%'],//圆心位置[width，height]
                data:[
                    {value:335, name:'直接访问',itemStyle:{color:'#F24F46'}},//数值，名称，颜色
                    {value:310, name:'邮件营销',itemStyle:{color:'#F28B1E'}},
                    {value:234, name:'联盟广告',itemStyle:{color:'#F2B00D'}},
                    {value:135, name:'视频广告',itemStyle:{color:'#35F25E'}},
                    {value:1548, name:'搜索引擎',itemStyle:{color:'#7368F2'}}
                ]
            }
        ]
    };
    myChart2.setOption(option2);
