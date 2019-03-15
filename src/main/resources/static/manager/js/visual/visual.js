/*点击切换事件 直接用js吧*/
function visualTransform(){
    var graphTransform2=document.getElementById("")
    var graphTransform1=document.getElementById("")
    if (graphTransform2.style.display=="block"){
        graphTransform2.style.display="none";
        graphTransform1.style.display="block";
    } else {
        graphTransform2.style.display="block";
        graphTransform1.style.display="none";
    }
}

var baodan = echarts.init(document.getElementById('baodan'));
//数据图绘制
var option_baodan = {
    title : {
        text: '报单统计',

    },
    tooltip : {
        trigger: 'axis'
    },
    legend: {
        data:['成交']
    },
    calculable : true,
    xAxis : [
        {
            type : 'category',
            boundaryGap : false,
            data : ['2018-07','2018-08','2018-09','2018-10','2018-11','2018-12','2019-01','2019-02','2019-03']
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:'报单统计',
            type:'line',
            smooth:true,
            itemStyle: {normal: {areaStyle: {type: 'default'}}},
            data:[265,120,260,10, 12, 21, 54, 260, 830, 710]
        }
    ]
};
baodan.setOption(option_baodan);