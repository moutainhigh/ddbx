/*点击切换事件 直接用js吧*/
function visualTransform(){
    var form_visual_form1 = document.getElementById("form_visual_form1");
    var form_visual_form2 = document.getElementById("form_visual_form2");
    if (form_visual_form2.style.display=="none"){
        form_visual_form2.style.display="block";
        form_visual_form1.style.display="none";
    }else{
        form_visual_form2.style.display="none";
        form_visual_form1.style.display="block";
    }
}

var axistick="{lineStyle:{color:'white',type:'dashed'}}";//刻度

/* -----------------------------------------报单统计开始----------------------------------------- */
var baodan = echarts.init(document.getElementById('baodan'));
//前台数据图后台获取数据绘制
function baodanselect(){
    var sel=document.getElementById("baodanval").value
    var obj = document.getElementById('baodansel'); //定位id
    var index = obj.selectedIndex; // 选中索引
    var value = obj.options[index].value; // 选中值
    var obj1 = document.getElementById('baodantime'); //定位id
    var index1 = obj1.selectedIndex; // 选中索引
    var time = obj1.options[index1].value; // 选中值
    $.ajax({
        dataType : "json",
        type : "POST",
        url : "/manager/visual/getPathMap.do",
        data : {baodanname:sel,baodancity:value,baodantime:time},
        success : function(data) {
            var summarydata = [];
            var timeline = [];
            var j;
            for(var i=0;i<9;i++){
                j=8-i;
                timeline[i]=data[1][j]=null?'2019-'+i:data[1][j];
                summarydata[i]=data[0][j]=null?'0':data[0][j];
            }

//数据图绘制
            var option_baodan = {
                tooltip : {
                    trigger: 'axis',
                    formatter: "{a} <br/>{b} : {c} "
                },
                xAxis : [
                    {
                        type : 'category',
                        name:'时间',
                        boundaryGap : false,
                        axisTick:axistick,
                        nameTextStyle:{//坐标轴名称的文字样式。
                            padding: [0, 0, 0, -8]
                        },

                        axisLine :{symbolSize:['10', '13'],lineStyle:{color:'#6A5046'}},//轴线
                        data : timeline
                    }
                ],
                yAxis : [
                    {
                        type : 'value',
                        name:'数量',
                        axisTick:axistick,
                        axisLine :{symbol:['none', 'arrow'],symbolSize:['10', '13'],lineStyle:{color:'#6A5046'}},//轴线
                        splitLine:{show: false},//去除网格线
                    }
                ],
                series : [
                    {
                        name:'报单统计',
                        type:'line',
                        smooth:true,
                        lineStyle:{
                            /* color:"#F7A043", */  //颜色，'rgb(128, 128, 128)'，'rgba(128, 128, 128, 0.5)'，支持线性渐变，径向渐变，纹理填充
                            type:"solid",     //坐标轴线线的类型，solid，dashed，dotted
                            width:2          //坐标轴线线宽
                        },
                        areaStyle: {
                            // 线性渐变，前四个参数分别是 x0, y0, x2, y2, 范围从 0 - 1，相当于在图形包围盒中的百分比，如果 globalCoord 为 `true`，则该四个值是绝对的像素位置
                            /* color: {
                                type: 'linear',
                                x: 0,
                                y: 0,
                                x2: 0,
                                y2: 1,
                                colorStops: [{
                                    offset: 0, color: '#F7CB86' // 0% 处的颜色
                                }, {
                                    offset: 1, color: '#F7A043' // 100% 处的颜色
                                }],
                                globalCoord: false // 缺省为 false
                            } */
                        },
                        /* itemStyle: {normal: {areaStyle: {type: 'default',color:'rgb(242,162,42)'}}}, */
                        data:summarydata
                    }
                ]
            };
            baodan.setOption(option_baodan);
//ajax结尾
        },
        error : function(e, type, msg) {
            console.log(type + "=报单统计=" + msg);
        }
    })
}


/* -----------------------------------------报单统计结束----------------------------------------- */

/* -----------------------------------------汽车贷款开始 --------------------------------------- */
var qichedaikuan = echarts.init(document.getElementById('qichedaikuan'));
//前台数据图后台获取数据绘制
function guojianselect() {
    var sel = document.getElementById("guojianval").value
    var obj = document.getElementById('guojiansel'); //定位id
    var index = obj.selectedIndex; // 选中索引
    var value = obj.options[index].value; // 选中值
    var obj1 = document.getElementById('guojiantime'); //定位id
    var index1 = obj1.selectedIndex; // 选中索引
    var time = obj1.options[index1].value; // 选中值
    $.ajax({
        dataType: "json",
        type: "POST",
        url: "/manager/visual/getCarPathMap.do",
        data : {guojianname:sel,guojiancity:value,guojiantime:time},
        success: function (data) {
            var carpasstime = [];
            var carpassdata = [];
            var j;
            for(var i=0;i<9;i++){
                j=8-i;
                carpasstime[i]=data[1][j]=null?'2019-'+i:data[1][j];
                carpassdata[i]=data[0][j]=null?'0':data[0][j];
            }

//数据图绘制
            var option_qichedaikuan = {

                tooltip: {
                    trigger: 'axis',
                    formatter: "{a} <br/>{b} : {c} "
                },
                xAxis: [
                    {
                        type: 'category',
                        name: '时间',
                        boundaryGap: false,
                        axisTick: axistick,
                        nameTextStyle: {//坐标轴名称的文字样式。
                            padding: [0, 0, 0, -8]
                        },

                        axisLine: {symbolSize: ['10', '13'], lineStyle: {color: '#6A5046'}},//轴线
                        data: carpasstime,
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        name: '数量',
                        axisTick: axistick,
                        axisLine: {symbol: ['none', 'arrow'], symbolSize: ['10', '13'], lineStyle: {color: '#6A5046'}},//轴线
                        splitLine: {show: false},//去除网格线
                    }
                ],
                series: [
                    {
                        name: '过件率',
                        type: 'line',
                        smooth: true,
                        lineStyle: {
                            //color:"#F7A043",   //颜色，'rgb(128, 128, 128)'，'rgba(128, 128, 128, 0.5)'，支持线性渐变，径向渐变，纹理填充
                            type: "solid",     //坐标轴线线的类型，solid，dashed，dotted
                            width: 2          //坐标轴线线宽
                        },
                        areaStyle: {
                            // 线性渐变，前四个参数分别是 x0, y0, x2, y2, 范围从 0 - 1，相当于在图形包围盒中的百分比，如果 globalCoord 为 `true`，则该四个值是绝对的像素位置
                            /* color: {
                                type: 'linear',
                                x: 0,
                                y: 0,
                                x2: 0,
                                y2: 1,
                                colorStops: [{
                                    offset: 0, color: '#F7CB86' // 0% 处的颜色
                                }, {
                                    offset: 1, color: '#F7A043' // 100% 处的颜色
                                }],
                                globalCoord: false // 缺省为 false
                            } */
                        },
                        /*            itemStyle: {normal: {areaStyle: {type: 'default',color:'rgb(242,162,42)'}}}, */
                        data: carpassdata,
                    }
                ]
            };
            qichedaikuan.setOption(option_qichedaikuan);
//ajax结尾
        },
        error: function (e, type, msg) {
            console.log(type + "=汽车贷款=" + msg);
        }
    })
}
/* -------------------------------------------汽车贷款结束--------------------------------------- */
/* -------------------------------------------新车二手车放款开始--------------------------------------- */
var fangkuan_1 = echarts.init(document.getElementById('fangkuan_1'));
function fangkuanselect() {
    var sel = document.getElementById("fangkuanval").value
    var obj = document.getElementById('fangkuansel'); //定位id
    var index = obj.selectedIndex; // 选中索引
    var value = obj.options[index].value; // 选中值
    var obj1 = document.getElementById('fangkuantime'); //定位id
    var index1 = obj1.selectedIndex; // 选中索引
    var time = obj1.options[index1].value; // 选中值
    $.ajax({
        dataType: "json",
        type: "POST",
        url: "/manager/visual/getCarFkPathMap.do",
        data: {fangkuanname: sel,fangkuancity:value,fangkuantime:time},
        success: function (data) {
            var newcar=data[0]=null?'0':data[0];
            var oldcar=data[1]=null?'0':data[1];

            var option_fangkuan_1 = {
                title: {
                    show: true,
                    subtext: '新车二手车放款分布',
                    left: 'center',
                    subtextStyle: {
                        fontSize: 12,
                        color: '#6A5046',

                    },
                    padding: [
                        0, // 上
                        0, // 右
                        3, // 下
                        0, // 左
                    ]
                },
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)",
                },
                legend: {
                    x: 'center',//图例组件离容器下侧的距离
                    bottom: '1',
                    data: [{name: '新车'},
                        {name: '二手车'},
                    ],
                    itemWidth: 20,//图例标记的图形宽度
                    itemHeight: 9,//图例标记的图形高度
                    textStyle: {
                        fontSize: 12,
                    },
                    bottom: -5
                },
                series: [
                    {
                        name: '放款分布',
                        type: 'pie',
                        radius: '55%',
                        hoverOffset: 3,//高亮扇区的偏移距离。
                        labelLine: {
                            length: 12,//视觉引导线第一段的长度。
                            length2: 5, //视觉引导项第二段的长度。
                        },
                        data: [
                            {value: newcar, name: '新车'},
                            {value: oldcar, name: '二手车'},
                        ],
                    }
                ]
            };
            fangkuan_1.setOption(option_fangkuan_1);
//ajax结尾
        },
        error: function (e, type, msg) {
            console.log(type + "=新车二手车放款=" + msg);
        }
    })

    /* -------------------------------------------新车二手车放款结束--------------------------------------- */

    /* -------------------------------------------放款金额分布开始--------------------------------------- */
    var fangkuan_2 = echarts.init(document.getElementById('fangkuan_2'));

    $.ajax({
        dataType: "json",
        type: "POST",
        url: "/manager/visual/getMoneyPathMap.do",
        data: {fangkuanname: sel,fangkuancity:value,fangkuantime:time},
        success: function (data) {
            var singular1=data[0]=null?'0':data[0];
            var singular2=data[1]=null?'0':data[1];
            var singular3=data[2]=null?'0':data[2];
            var singular4=data[3]=null?'0':data[3];

            var option_fangkuan_2 = {
                title: {
                    show: true,
                    subtext: '放款金额分布',
                    left: 'center',
                    subtextStyle: {
                        fontSize: 12,
                        color: '#6A5046',
                    },
                    padding: [
                        0, // 上
                        0, // 右
                        3, // 下
                        0, // 左
                    ]
                },
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    x: 'center',//图例组件离容器下侧的距离
                    bottom: '1',
                    data: [{name: '3-10万'},
                        {name: '10-20万'},
                        {name: '20-50万'},
                        {name: '50万以上'},
                    ],
                    itemWidth: 15,//图例标记的图形宽度
                    itemHeight: 7,//图例标记的图形高度
                    textStyle: {
                        fontSize: 11,
                    },
                    itemGap: 1,
                    bottom: -5,
                },
                series: [
                    {
                        name: '金额分布',
                        type: 'pie',
                        radius: '55%',
                        hoverOffset: 3,//高亮扇区的偏移距离。
                        labelLine: {
                            length: 2,//视觉引导线第一段的长度。
                            length2: 5, //视觉引导项第二段的长度。
                        },
                        data: [{value: singular1, name: '3-10万'},
                            {value: singular2, name: '10-20万'},
                            {value: singular3, name: '20-50万'},
                            {value: singular4, name: '50万以上'},
                        ],
                    }
                ]
            };
            fangkuan_2.setOption(option_fangkuan_2);
//ajax结尾
        },
        error: function (e, type, msg) {
            console.log(type + "=放款金额分布=" + msg);
        }
    })
    /* -------------------------------------------放款金额分布结束--------------------------------------- */

    /* -------------------------------------------新车二手车放款金额单数开始--------------------------------------- */
    var fangkuan_3 = echarts.init(document.getElementById('fangkuan_3'));
    $.ajax({
        dataType: "json",
        type: "POST",
        url: "/manager/visual/getNewOldCarsPathMap.do",
        data: {fangkuanname: sel,fangkuancity:value,fangkuantime:time},
        success: function (data) {
            var carstime = [];
            var newcars = [];
            var newcarsmoney = [];
            var oldcars = [];
            var oldcarsmoney = [];
            var j;
            for(var i=0;i<12;i++){
                j=11-i;
                carstime[i]=data[0][j]=null?'2019-'+i:data[0][j];
                newcars[i]=data[1][j]=null?'0':data[1][j];
                newcarsmoney[i]=data[2][j]=null?'0':data[2][j];
                oldcars[i]=data[3][j]=null?'0':data[3][j];
                oldcarsmoney[i]=data[4][j]=null?'0':data[4][j];
            }
            var option_fangkuan_3 = {
                tooltip: {
                    trigger: 'axis',
                    axisPointer: { //坐标轴指示器配置项。
                        type: 'cross', //指示器类型。 'cross' 十字准星指示器
                        crossStyle: {
                            color: '#999' //交叉风格
                        }
                    }
                },
                legend: {
                    x: 'center',//图例组件离容器下侧的距离
                    width: 300,//图例组件的宽度
                    data: ['新车放款订单数', '新车放贷金额', '二手车放款订单数', '二手车放贷金额'],
                    itemWidth: 15,//图例标记的图形宽度
                    itemHeight: 10,//图例标记的图形高度
                    textStyle: {
                        fontSize: 12,
                        color: '#6A5046'
                    },
                    itemGap: 7,
                    bottom: -5
                },
                grid: {//直角坐标系内绘图网格
                    show: false,//是否显示直角坐标系网格。[ default: false ]
                    right: "12%"
                },
                xAxis: [
                    {
                        type: 'category',
                        axisPointer: {//坐标轴指示器配置项。
                            type: 'shadow'
                        },
                        data: carstime,
                        axisLine: {symbolSize: ['10', '13'], lineStyle: {color: '#6A5046'}},//轴线
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        name: '总放款订单数量',
                        splitLine: {show: false},//去除网格线
                        axisLine: {symbol: ['none', 'arrow'], symbolSize: ['10', '13'], lineStyle: {color: '#6A5046'}},//轴线

                    },
                    {
                        type: 'value',
                        name: '总放款金额:万',
                        splitLine: {show: false},//去除网格线
                        axisLine: {symbol: ['none', 'arrow'], symbolSize: ['10', '13'], lineStyle: {color: '#6A5046'}},//轴线

                    }
                ],
                series: [

                    {
                        name: '新车放款订单数',
                        type: 'bar',
                        data: newcars,
                    },
                    {
                        name: '新车放贷金额',
                        type: 'line',
                        yAxisIndex: 1,
                        data: newcarsmoney,
                    },
                    {
                        name: '二手车放款订单数',
                        type: 'bar',
                        data: oldcars,
                    },

                    {
                        name: '二手车放贷金额',
                        type: 'line',
                        yAxisIndex: 1,
                        data: oldcarsmoney,
                    }
                ],
                /* color:['#e07805','#344bb1'] //全局调色板  好用到爆炸 */
            };
            fangkuan_3.setOption(option_fangkuan_3);
//ajax结尾
        },
        error: function (e, type, msg) {
            console.log(type + "=新车二手车放款金额=" + msg);
        }
    })
}
/* -------------------------------------------新车二手车放款金额单数结束--------------------------------------- */

/* -------------------------------------------抵押完成天数分布开始--------------------------------------- */
var diyawancheng = echarts.init(document.getElementById('diyawancheng'));
function diyaselect() {
    var sel = document.getElementById("diyaval").value
    var obj = document.getElementById('diyasel'); //定位id
    var index = obj.selectedIndex; // 选中索引
    var value = obj.options[index].value; // 选中值
    var obj1 = document.getElementById('diyatime'); //定位id
    var index1 = obj1.selectedIndex; // 选中索引
    var time = obj1.options[index1].value; // 选中值
    $.ajax({
        dataType: "json",
        type: "POST",
        url: "/manager/visual/getPawnPathMap.do",
        data: {diyaname: sel,diyacity:value,diyatime:time},
        success: function (data) {
            var paw1=data[0]=null?'0':data[0];
            var paw2=data[1]=null?'0':data[1];
            var paw3=data[2]=null?'0':data[2];
            var paw4=data[3]=null?'0':data[3];
            var paw5=data[4]=null?'0':data[4];

            var option_diyawancheng = {
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                series: [
                    {
                        name: '抵押完成情况',
                        type: 'pie',
                        radius: '75%',
                        roseType: 'angle',
                        labelLine: {
                            length: 3,//视觉引导线第一段的长度。
                            length2: 5 //视觉引导项第二段的长度。
                        },
                        data: [
                            {value: paw5, name: '60天以上'},
                            {value: paw1, name: '0-15天', itemStyle: {color: '#985858'}},
                            {value: paw2, name: '15-30天'},
                            {value: paw3, name: '30-45天'},
                            {value: paw4, name: '45-60天'}
                        ],
                        label: {
                            normal: {
                                textStyle: {
                                    color: 'rgba(255, 255, 255, 0.3)',
                                    fontSize: 12,
                                    color: '#505050'
                                }
                            }
                        },
                    }
                ]
            };
            diyawancheng.setOption(option_diyawancheng);
//ajax结尾
        },
        error: function (e, type, msg) {
            console.log(type + "=抵押完成天数=" + msg);
        }
    })
}
/* -------------------------------------------抵押完成天数分布结束--------------------------------------- */
/* -------------------------------------------抵押材料回收开始--------------------------------------- */
var cailiaohuishou = echarts.init(document.getElementById('cailiaohuishou'));
function cailiaoselect() {
    var sel = document.getElementById("cailiaoval").value
    var obj = document.getElementById('cailiaosel'); //定位id
    var index = obj.selectedIndex; // 选中索引
    var value = obj.options[index].value; // 选中值
    var obj1 = document.getElementById('cailiaotime'); //定位id
    var index1 = obj1.selectedIndex; // 选中索引
    var time = obj1.options[index1].value; // 选中值
    $.ajax({
        dataType: "json",
        type: "POST",
        url: "/manager/visual/getRecyclePathMap.do",
        data: {cailiaoname: sel,cailiaocity:value,cailiaotime:time},
        success: function (data) {
            var recycletime = [];
            var recycledata = [];
            var j;
            for(var i=0;i<9;i++){
                j=8-i;
                recycledata[i]=data[0][j]=null?'0':data[0][j];
                recycletime[i]=data[1][j]=null?'2019-'+i:data[1][j];
            }

            var option_cailiaohuishou = {
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    x: 'left',//图例组件离容器下侧的距离
                    y: 'top',
                    width: 300,//图例组件的宽度
                    data: ['材料回收'],
                    itemWidth: 15,//图例标记的图形宽度
                    itemHeight: 10,//图例标记的图形高度
                    textStyle: {
                        fontSize: 12,
                        color: '#6A5046'
                    },
                    itemGap: 7,
                    bottom: -5
                },
                grid: {//直角坐标系内绘图网格
                    show: false,//是否显示直角坐标系网格。[ default: false ]
                    right: "12%"
                },
                xAxis: [
                    {
                        type: 'category',
                        data: recycletime,
                        axisLine: {symbol: ['none', 'arrow'], symbolSize: ['10', '13'], lineStyle: {color: '#6A5046'}},//轴线
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        name: '过件数',
                        splitLine: {show: false},//去除网格线
                        axisLine: {symbol: ['none', 'arrow'], symbolSize: ['10', '13'], lineStyle: {color: '#6A5046'}},//轴线

                    },
                ],
                series: [
                    {
                        name: '材料回收',
                        type: 'line',
                        data: recycledata
                    },

                ],
                /* color:['#e07805','#344bb1'] //全局调色板  好用到爆炸 */
            };
            cailiaohuishou.setOption(option_cailiaohuishou);
//ajax结尾
        },
        error: function (e, type, msg) {
            console.log(type + "=抵押完成=" + msg);
        }
    })
}
/* -------------------------------------------抵押完成结束--------------------------------------- */

/* -------------------------------------------征信查询开始--------------------------------------- */

var zhengxinchaxun = echarts.init(document.getElementById('zhengxinchaxun'));
function zhengxinselect() {
    var sel = document.getElementById("zhengxinval").value
    var obj = document.getElementById('zhengxinsel'); //定位id
    var index = obj.selectedIndex; // 选中索引
    var value = obj.options[index].value; // 选中值
    var obj1 = document.getElementById('zhengxintime'); //定位id
    var index1 = obj1.selectedIndex; // 选中索引
    var time = obj1.options[index1].value; // 选中值
    $.ajax({
        dataType: "json",
        type: "POST",
        url: "/manager/visual/getCreditPathMap.do",
        data: {zhengxinname: sel,zhengxincity:value,zhengxintime:time},
        success: function (data) {
            var credit1= data[0]=null?'0':data[0];
            var credit2= data[1]=null?'0':data[1];

            var option_zhengxinchaxun = {
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    y: 'bottom',
                    x: 'center',
                    width: 180,
                    itemWidth: 15,//图例标记的图形宽度
                    itemHeight: 10,//图例标记的图形高度
                    data: ['征信通过', '征信不通过'],
                    bottom: -5,
                },

                series: [
                    {
                        name: '征信查询通过率',
                        type: 'pie',
                        radius: '62%',
                        center: ['51%', '45%'],//圆心位置[width，height]
                        data: [
                            {value: credit1, name: '征信通过'},
                            {value: credit2, name: '征信不通过'},
                        ]
                    }
                ]
            };

            zhengxinchaxun.setOption(option_zhengxinchaxun);
//ajax结尾
        },
        error: function (e, type, msg) {
            console.log(type + "=征信查询=" + msg);
        }
    })
}
/* -------------------------------------------征信查询结束--------------------------------------- */

/* -------------------------------------------客户年龄开始--------------------------------------- */
var kehunianling = echarts.init(document.getElementById('kehunianling'));
$.ajax({
    dataType : "json",
    type : "POST",
    url : "/manager/visual/getAgePathMap.do",
    success : function(data) {
        var age1=data[0]=null?'0':data[0];
        var age2=data[1]=null?'0':data[1];
        var age3=data[2]=null?'0':data[2];
        var age4=data[3]=null?'0':data[3];
         
var option_kehunianling = {
    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    legend: {
        x : 'center',
        width:180,
        itemWidth:18,//图例标记的图形宽度
        itemHeight:13,//图例标记的图形高度
        data:[{name:'18-30岁'} ,
            {name:'30-40岁'},
            {name:'40-50岁'},
            {name:'50岁以上'},
        ],
        bottom:-5,
    },

    series : [
        {
            name:'客户年龄分布',
            type:'pie',
            radius : '65%',
            center: ['50%', '45%'],//圆心位置[width，height]
            data:[
                {value:age1, name:'18-30岁'},
                {value:age2, name:'30-40岁'},
                {value:age3, name:'40-50岁'},
                {value:age4, name:'50岁以上'}
            ]
        }
    ]
};

kehunianling.setOption(option_kehunianling);
//ajax结尾
},
error : function(e, type, msg) {
    console.log(type + "=客户年龄=" + msg);
}
})
/* -------------------------------------------客户年龄结束--------------------------------------- */


/* -------------------------------------------车辆年龄开始--------------------------------------- */
var cheliangnianling = echarts.init(document.getElementById('cheliangnianling'));
$.ajax({
    dataType : "json",
    type : "POST",
    url : "/manager/visual/getCarsAgePathMap.do",
    success : function(data) {
        var age1=data[0]=null?'0':data[0];
        var age2=data[1]=null?'0':data[1];
        var age3=data[2]=null?'0':data[2];
        var age4=data[3]=null?'0':data[3];
         
var option_cheliangnianling = {
    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    legend: {
        x : 'center',
        width:180,
        itemWidth:18,//图例标记的图形宽度
        itemHeight:13,//图例标记的图形高度
        data:[{name:'1-3年'},
            {name:'3-6年'},
            {name:'6-9年'},
            {name:'9年以上'},
        ],
        bottom:-5,

    },

    series : [
        {
            name:'车辆年龄分布',
            type:'pie',
            radius : '62%',
            center: ['50%', '45%'],//圆心位置[width，height]
            data:[
                {value:age1, name:'1-3年'},
                {value:age2, name:'3-6年'},
                {value:age3, name:'6-9年'},
                {value:age4, name:'9年以上'}
            ]
        }
    ]
};

cheliangnianling.setOption(option_cheliangnianling);
//ajax结尾
},
error : function(e, type, msg) {
    console.log(type + "=车辆年龄=" + msg);
}
})
/* -------------------------------------------车辆年龄结束--------------------------------------- */

/* -------------------------------------------(垫资)资金使用时长开始--------------------------------------- */
/*var zijinzhouzhuan = echarts.init(document.getElementById('zijinzhouzhuan'));
function dianziselect(){
    var obj = document.getElementById('dianzisel'); //定位id
    var index = obj.selectedIndex; // 选中索引
    var value = obj.options[index].value; // 选中值
var option_zijinzhouzhuan = {
    tooltip : {
        trigger: 'axis',
        axisPointer: { //坐标轴指示器配置项。
            type: 'cross', //指示器类型。 'cross' 十字准星指示器
            crossStyle: {
                color: '#999' //交叉风格
            }
        }
    },
    legend: {
        x : 'center',//图例组件离容器下侧的距离
        width: 300,//图例组件的宽度
        data:['资金使用时长',/!*'资金周转率'*!/],
        itemWidth:15,//图例标记的图形宽度
        itemHeight:15,//图例标记的图形高度
        textStyle:{
            fontSize:13,
            color:'#6A5046'
        },
        itemGap:7,
        bottom:-5
    },
    grid:{//直角坐标系内绘图网格
        show:false,//是否显示直角坐标系网格。[ default: false ]
        right:"12%"
    },
    xAxis : [
        {
            type : 'category',
            axisTick:axistick,
            axisLine :{symbolSize:['10', '13'],lineStyle:{color:'#6A5046'}},//轴线
            axisPointer: {//坐标轴指示器配置项。
                type: 'shadow'
            },
            data : ['2018-04','2018-05','2018-06','2018-07','2018-08','2018-09','2018-10','2018-11','2018-12','2019-01','2019-02','2019-03']
        }
    ],
    yAxis : [
        {
            name: '资金使用时长(天)',
            type : 'value',
            axisTick:axistick,
            axisLine :{symbol:['none', 'arrow'],symbolSize:['10', '13'],lineStyle:{color:'#6A5046'}},//轴线
            splitLine:{show: false},//去除网格线
        }
    ],
    series : [
        {
            name:'资金使用时长',
            type:'bar',
            barWidth:28,
            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],

        },
    ]
};
zijinzhouzhuan.setOption(option_zijinzhouzhuan);
}*/
/* -------------------------------------------(垫资)资金使用时长结束--------------------------------------- */

/* -------------------------------------------代理商综合能力分析开始--------------------------------------- */
var dalifenxi = echarts.init(document.getElementById('dalifenxi'));
function dailiselect() {
    var sel = document.getElementById("dailival").value
    var option_dalifenxi = {
        tooltip: {
            trigger: 'item',
            show: true,
            formatter: function (params) {
                var s = '';
                s += params.name + '\n';
                var values = params.value.toString().split(",");
                s += '业务能力:' + values[0] + '\n';
                s += '进件效率' + values[1] + '\n';
                s += '运营能力' + values[2] + '\n';
                s += '贷后能力' + values[3] + '\n';
                s += '风控能力' + values[4] + '\n';
                //系列名称:seriesName: string  数据名，类目名 : name: string   传入的数据值:value: number|Array
                return s;
            },
            extraCssText: 'width:120px; white-space:pre-wrap'//额外附加到浮层的 css 样式 pre-wrap:保留空白符序列，可是正常地进行换行。
        },
        visualMap: {
            show: false,
            top: 'middle',
            right: 10,
            color: ['#C23531', '#D48265'],//线条颜色
            calculable: true
        },
        radar: {
            indicator: [
                {text: '业务能力-报单量', max: 400},
                {text: '进件效率-银行放款-订单提交时长', max: 400},
                {text: '运营能力-抵押完成情况', max: 400},
                {text: '贷后能力-M3及以上逾期率', max: 400},
                {text: '风控能力-M1逾期率', max: 400}
            ],
            radius: '58%',
            nameGap: -2,
            name: {//这里以-分割
                formatter: function (value, indicator) {
                    var values = value.split('-');
                    var v = '';
                    v += '{a|' + values[0] + '}\n{b|' + values[1] + '}';
                    if (!!values[2]) {
                        v += '\n{b|' + values[2] + '}'
                    }
                    ;
                    return v;
                },
                width: 100,
                rich: {//富文本标签
                    a: {
                        color: '#2F4554',
                        lineHeight: 20,
                        fontSize: 12,
                        align: 'center'
                    },
                    b: {
                        color: '#61A0A8',
                        lineHeight: 15,
                        fontSize: 10,
                        align: 'center'
                    }
                }
            },
            splitArea: {
                areaStyle: {
                    // color: ['#D48265', '#D48265','#C48976','#9D6F5F'] //分隔区域的样式设置。
                }
            },
            axisLine: {//坐标线 直接隐藏
                show: false
            },
            splitLine: {//区域中的分隔线。
                show: true,
                lineStyle: {
                    /* color: ['#415fe0'] */
                }
            }
        },
        series: (function () {
            var series = [];
            for (var i = 1; i <= 28; i++) {
                series.push({
                    name: '代理商综合能力分析',
                    type: 'radar',
                    symbol: 'none',
                    lineStyle: {
                        width: 1
                    },
                    emphasis: {
                        areaStyle: {
                            color: 'rgb(97,160,168)'
                        }
                    },
                    data: [
                        {
                            value: [
                                (40 - i) * 10,
                                (38 - i) * 4 + 60,
                                i * 5 + 10,
                                i * 9,
                                i * i / 2
                            ],
                            name: i + 2000 + ''
                        }
                    ]
                });
            }
            return series;
        })()
    };

    dalifenxi.setOption(option_dalifenxi);
}
/* -------------------------------------------代理商综合能力分析结束--------------------------------------- */

/* -------------------------------------------逾期率开始--------------------------------------- */
var yuqilv_1 = echarts.init(document.getElementById('yuqilv_1'));
function yuqiselect() {
    var sel = document.getElementById("yuqival").value
    var option_yuqilv_1 = {
        tooltip: { //提示框组件。
            trigger: 'axis',//触发类型:'axis'坐标轴触发，主要在柱状图，折线图等会使用类目轴的图表中使用。
            axisPointer: { //坐标轴指示器配置项。
                type: 'cross', //指示器类型。 'cross' 十字准星指示器
                crossStyle: {
                    color: '#999' //交叉风格
                }
            }
        },
        legend: {
            x: 'center',//图例组件离容器下侧的距离
            width: 250,//图例组件的宽度
            data: ['订单总数量', '新车数量', '二手车数量', '订单总金额', '新车金额', '二手车金额'],
            itemWidth: 15,//图例标记的图形宽度
            itemHeight: 10,//图例标记的图形高度
            textStyle: {
                fontSize: 12,

            },
            itemGap: 7,
            bottom: -5
        },
        grid: {//直角坐标系内绘图网格
            show: false,//是否显示直角坐标系网格。[ default: false ]
            right: "12%"
        },
        xAxis: [
            {
                name: '逾期率',
                nameTextStyle: {//坐标轴名称的文字样式。
                    padding: [27, 0, 0, -6]
                },
                type: 'category',
                data: ['M1', 'M2', 'M3'],
                axisPointer: {//坐标轴指示器配置项。
                    type: 'shadow'
                },
                axisTick: axistick,
                axisLine: {symbolSize: ['10', '13'], lineStyle: {color: '#6A5046'}}//轴线
            }
        ],
        yAxis: [
            {
                type: 'value',
                name: '逾期订单数量',
                min: 0,
                max: 250,
                interval: 50,
                axisLabel: {
                    formatter: '{value}'
                },
                nameTextStyle: {//坐标轴名称的文字样式。
                    padding: [0, 0, 0, 20]
                },
                splitLine: {show: false},//去除网格线
                axisTick: axistick,
                axisLine: {lineStyle: {color: '#6A5046'}}//轴线
            },
            {
                type: 'value',
                name: '逾期订单金额(万)',
                axisLabel: {
                    formatter: '{value} '
                },
                nameTextStyle: {//坐标轴名称的文字样式。
                    padding: [0, 0, 0, -20]
                },
                splitLine: {show: false},//去除网格线
                axisTick: axistick,
                axisLine: {lineStyle: {color: '#6A5046'}}//轴线
            }
        ],
        series: [
            {
                name: '订单总数量',
                type: 'bar',
                data: [200, 156, 187],
                barWidth: 16
            },
            {
                name: '新车数量',
                type: 'bar',
                data: [35, 56, 57],
                barWidth: 16
            },
            {
                name: '二手车数量',
                type: 'bar',
                data: [165, 100, 130],
                barWidth: 16
            },
            {
                name: '订单总金额',
                type: 'line',
                yAxisIndex: 1,
                data: [140, 100, 132]
            },
            {
                name: '新车金额',
                type: 'line',
                yAxisIndex: 1,
                data: [40, 35, 72]

            },
            {
                name: '二手车金额',
                type: 'line',
                yAxisIndex: 1,
                data: [100, 65, 60]

            }
        ],
    };
    yuqilv_1.setOption(option_yuqilv_1);
}
/* -------------------------------------------------------------------------------------------逾期率right------------------------------------------------------------- */
var yuqilv_2 = echarts.init(document.getElementById('yuqilv_2'));
option_yuqilv_2= {
    tooltip: {
        trigger: 'item',
        formatter: "{a}<br/>{b}: {c} "
    },
    series: [
        {
            name:'省份逾期数量',
            type:'pie',
            selectedMode: 'single',
            radius: [0, '30%'],
            label: {
                show:false
            },
            labelLine: {
                normal: {
                    show: false
                }
            },
            data:[
                {value:52, name:'河南省'},
                {value:36, name:'江西省'},
                {value:78, name:'山东省'},
                {value:68, name:'安徽省'},
                {value:48, name:'河北省'},
                {value:58, name:'其他'}
            ],
        },
        {
            name:'省份逾期金额',
            type:'pie',
            radius: ['40%', '55%'],
            data:[
                {value:1640000, name:'河南省'},
                {value:2040000, name:'江西省'},
                {value:2640000, name:'山东省'},
                {value:1855900, name:'安徽省'},
                {value:2250800, name:'河北省'},
                {value:1166900, name:'其他'},
            ]
        }
    ],

};
yuqilv_2.setOption(option_yuqilv_2);

/* -------------------------------------------逾期率结束--------------------------------------- */
