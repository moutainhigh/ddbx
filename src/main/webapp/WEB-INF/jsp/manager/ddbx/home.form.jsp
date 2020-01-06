<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<script type="text/javascript" src="${pageContext.request.contextPath }/manager/js/visual/echarts.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/manager/css/visual/Visual.css"/>


<!-- 可视化数据图 -->
<div class="content_visual">
    <div class="form_visual">
        <!-- <%--  数据图一  --%> -->
        <div class="form_visual_form1" id="form_visual_form1" style="width: 1670px; height: 800px;display: block;">
            <div class="visual_form_top_box">
                <!-- 报单统计开始 -->
                <div class="visual_form_box">

                    <div class="baodan_left">
                        <div class="  font_color_title" style="margin-bottom: 2%;">报单统计</div>
                        <div style="width: 100%;height: 7%;">
                            <ul class="font_color_1 condition1">
                                <li>
                                    <input type="text" placeholder="请输入代理商"/>
                                </li>
                                <li>
                                    <div>请选择省份<i>></i></div>
                                </li>
                                <li>
                                    <div>请选择时间<i>></i></div>
                                </li>
                            </ul>
                        </div>
                        <div style="height: 80%;width: 100%; position: relative; top: -20px; padding-left: 4%;"
                             id="baodan">
                        </div>
                    </div>
                    <div class="baodan_right">
                        <div class="paiming_top">
                            <div class="paiming_top_border" style="width:40%;">
                                <p class="danshu_style font_color_2">568<font>笔</font></p>
                                <p class="font_color_2 font_size_1">本月报单总量</p>
                            </div>
                        </div>
                        <div class="paiming_table">
                            <table class="paiming_table_style">
                                <tr>
                                    <th>省份</th>
                                    <th colspan="3" class="font_color_1">排名</th>
                                    <th>代理商</th>
                                </tr>

                                <tr>
                                    <td class="font_color_3">上海市</td>
                                    <td class="font_size_3 font_color_4">232</td>
                                    <td>
                                        <div class="paiming_rank">1</div>
                                    </td>
                                    <td class="font_size_3 font_color_4">261</td>
                                    <td class="font_color_3">快车道</td>
                                </tr>
                                <tr>
                                    <td class="font_color_3">北京市</td>
                                    <td class="font_size_3 font_color_4">221</td>
                                    <td>
                                        <div class="paiming_rank">2</div>
                                    </td>
                                    <td class="font_size_3 font_color_4">256</td>
                                    <td class="font_color_3">快金所</td>
                                </tr>
                                <tr>
                                    <td class="font_color_3">广东省</td>
                                    <td class="font_size_3 font_color_4">212</td>
                                    <td>
                                        <div class="paiming_rank">3</div>
                                    </td>
                                    <td class="font_size_3 font_color_4">243</td>
                                    <td class="font_color_3">快加认证</td>
                                </tr>
                                <tr>
                                    <td class="font_color_3">深圳市</td>
                                    <td class="font_size_3 font_color_4">209</td>
                                    <td>
                                        <div class="paiming_rank">4</div>
                                    </td>
                                    <td class="font_size_3 font_color_4">232</td>
                                    <td class="font_color_3">金稻谷</td>
                                </tr>
                                <tr>
                                    <td class="font_color_3">福建市</td>
                                    <td class="font_size_3 font_color_4">201</td>
                                    <td>
                                        <div class="paiming_rank">5</div>
                                    </td>
                                    <td class="font_size_3 font_color_4">221</td>
                                    <td class="font_color_3">中投信安</td>
                                </tr>

                            </table>
                        </div>
                        <div style="width: 100%; height: 10%;margin-top: 2%;">
                            <button class="paiming_button">更多</button>
                        </div>
                    </div>
                </div>
                <!-- 报单统计结束 -->
                <!-- 汽车贷款开始 -->
                <div class="visual_form_box">
                    <div class="baodan_left">
                        <div class="font_color_title" style="margin-bottom: 2%;">过件率(汽车贷款通过)</div>
                        <div style="width: 100%;height: 7%;">
                            <ul class="font_color_1 condition1">
                                <li>
                                    <input type="text" placeholder="请输入代理商"/>
                                </li>
                                <li>
                                    <div>请选择省份<i>></i></div>
                                </li>
                                <li>
                                    <div>请选择时间<i>></i></div>
                                </li>
                            </ul>
                        </div>
                        <div style="height: 80%;width: 100%; position: relative; top: -20px; padding-left: 4%;"
                             id="qichedaikuan">
                        </div>
                    </div>
                    <div class="baodan_right">
                        <div class="paiming_top">
                            <div class="paiming_top_border" style="width:40%;">
                                <p class="danshu_style font_color_2">89<font>%</font></p>
                                <p class="font_color_2 font_size_1">本月报单总量</p>
                            </div>
                        </div>
                        <div class="paiming_table">
                            <table class="paiming_table_style">
                                <tr>
                                    <th>省份</th>
                                    <th colspan="3" class="font_color_1">排名</th>
                                    <th>代理商</th>
                                </tr>

                                <tr>
                                    <td class="font_color_3">上海市</td>
                                    <td class="font_size_3 font_color_4">95%</td>
                                    <td>
                                        <div class="paiming_rank">1</div>
                                    </td>
                                    <td class="font_size_3 font_color_4">92%</td>
                                    <td class="font_color_3">快车道</td>
                                </tr>
                                <tr>
                                    <td class="font_color_3">北京市</td>
                                    <td class="font_size_3 font_color_4">91%</td>
                                    <td>
                                        <div class="paiming_rank">2</div>
                                    </td>
                                    <td class="font_size_3 font_color_4">90%</td>
                                    <td class="font_color_3">快金所</td>
                                </tr>
                                <tr>
                                    <td class="font_color_3">广东省</td>
                                    <td class="font_size_3 font_color_4">88%</td>
                                    <td>
                                        <div class="paiming_rank">3</div>
                                    </td>
                                    <td class="font_size_3 font_color_4">89%</td>
                                    <td class="font_color_3">快加认证</td>
                                </tr>
                                <tr>
                                    <td class="font_color_3">深圳市</td>
                                    <td class="font_size_3 font_color_4">85%</td>
                                    <td>
                                        <div class="paiming_rank">4</div>
                                    </td>
                                    <td class="font_size_3 font_color_4">86%</td>
                                    <td class="font_color_3">金稻谷</td>
                                </tr>
                                <tr>
                                    <td class="font_color_3">福建市</td>
                                    <td class="font_size_3 font_color_4">82%</td>
                                    <td>
                                        <div class="paiming_rank">5</div>
                                    </td>
                                    <td class="font_size_3 font_color_4">81%</td>
                                    <td class="font_color_3">中投信安</td>
                                </tr>

                            </table>
                        </div>
                        <div style="width: 100%; height: 10%;margin-top: 2%;">
                            <button class="paiming_button">更多</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 汽车贷款结束 -->
            <div class="visual_form_bottom_box">
                <!-- 放款统计分析开始 -->
                <div class="visual_form_box">
                    <div class="baodan_left">
                        <div class="font_color_title" style="margin-bottom: 2%;">放款统计分析</div>
                        <div style="width: 100%;height: 5%;">
                            <ul class="font_color_1 condition1">
                                <li>
                                    <input type="text" placeholder="请输入代理商"/>
                                </li>
                                <li>
                                    <div>请选择省份<i>></i></div>
                                </li>
                                <li>
                                    <div>请选择时间<i>></i></div>
                                </li>
                            </ul>
                        </div>
                        <div style="height: 88%;width: 92%;display: inline-block">

                            <div style="height: 35%; width: 50%; float: left; " id="fangkuan_1"></div>
                            <div style="height: 35%; width: 48%; float: right; " id="fangkuan_2"></div>

                            <div style="height: 63%;width: 100%;margin-left: 10px; display: inline-block"
                                 id="fangkuan_3">
                            </div>
                        </div>
                    </div>
                    <div class="baodan_right">
                        <div class="paiming_top" style="margin-top: 10%;">
                            <div class="paiming_top_border" style="width:45%;float: left;">
                                <p class="danshu_style font_color_2">598<font>笔</font></p>
                                <p class="font_color_2 font_size_1">本月放款总订单</p>
                            </div>
                            <div class="paiming_top_border" style="width: 50%;float: right;">
                                <p class="danshu_style font_color_2">5625263.23<font>元</font></p>
                                <p class="font_color_2 font_size_1">本月放款均金额</p>
                            </div>
                        </div>

                        <div class="paiming_top_border" style="width: 100%; margin-top: 5%;">
                            <p class="danshu_style font_color_2">6585245.26<font>元</font></p>
                            <p class="font_color_2 font_size_1">本月累计放款总订单总金额</p>
                        </div>
                        <div class="paiming_table">
                            <table class="paiming_table_style">
                                <tr>
                                    <th>省份</th>
                                    <th colspan="3" class="font_color_1">排名</th>
                                    <th>代理商</th>
                                </tr>

                                <tr>
                                    <td class="font_color_3">上海市</td>
                                    <td class="font_size_3 font_color_4">92</td>
                                    <td>
                                        <div class="paiming_rank">1</div>
                                    </td>
                                    <td class="font_size_3 font_color_4">92</td>
                                    <td class="font_color_3">快车道</td>
                                </tr>
                                <tr>
                                    <td class="font_color_3">北京市</td>
                                    <td class="font_size_3 font_color_4">91</td>
                                    <td>
                                        <div class="paiming_rank">2</div>
                                    </td>
                                    <td class="font_size_3 font_color_4">90</td>
                                    <td class="font_color_3">快金所</td>
                                </tr>
                                <tr>
                                    <td class="font_color_3">广东省</td>
                                    <td class="font_size_3 font_color_4">88</td>
                                    <td>
                                        <div class="paiming_rank">3</div>
                                    </td>
                                    <td class="font_size_3 font_color_4">89</td>
                                    <td class="font_color_3">快加认证</td>
                                </tr>
                                <tr>
                                    <td class="font_color_3">深圳市</td>
                                    <td class="font_size_3 font_color_4">85</td>
                                    <td>
                                        <div class="paiming_rank">4</div>
                                    </td>
                                    <td class="font_size_3 font_color_4">86</td>
                                    <td class="font_color_3">金稻谷</td>
                                </tr>
                                <tr>
                                    <td class="font_color_3">福建市</td>
                                    <td class="font_size_3 font_color_4">82</td>
                                    <td>
                                        <div class="paiming_rank">5</div>
                                    </td>
                                    <td class="font_size_3 font_color_4">81</td>
                                    <td class="font_color_3">中投信安</td>
                                </tr>

                            </table>
                        </div>
                        <div style="width: 100%; height: 10%;margin-top: 2%;">
                            <button class="paiming_button">更多</button>
                        </div>
                    </div>
                </div>
                <!-- 放款统计分析结束 -->

                <!-- 抵押材料开始 -->
                <div class="visual_form_box" style="float: left;">
                    <div class="baodan_right_1">
                        <div class="  font_color_title" style="margin-bottom: 2%;">抵押完成情况</div>
                        <div class="paiming_top" style="margin-top: 0;">
                            <div class="paiming_bottom_border" style="width:46%;float: left;">
                                <p class="danshu_style font_color_2">298<font>笔</font></p>
                                <p class="font_color_2 font_size_1">本月已放款未完成</p>
                                <p class="font_color_2 font_size_1">抵押的订单总数</p>
                            </div>
                            <div class="paiming_bottom_border" style="width: 50%;float: right;">
                                <p class="danshu_style font_color_2">2325263.23<font>元</font></p>
                                <p class="font_color_2 font_size_1">本月已放款未完成</p>
                                <p class="font_color_2 font_size_1">抵押的订单金额</p>
                            </div>
                        </div>
                        <div style="width: 100%;height: 5%;margin-top: 25px;">
                            <ul class="font_color_1 condition1">
                                <li>
                                    <input type="text" placeholder="请输入代理商"/>
                                </li>
                                <li>
                                    <div>请选择省份<i>></i></div>
                                </li>
                                <li>
                                    <div>请选择时间<i>></i></div>
                                </li>
                            </ul>
                        </div>
                        <div style="height: 68%;width: 92%; position: relative;" id="diyawancheng">

                        </div>
                    </div>
                    <div class="baodan_right_1" style="float: right;">
                        <div class="  font_color_title" style="margin-bottom: 2%;">材料回收情况</div>
                        <div style="width: 100%;height: 7%;">
                            <ul class="font_color_1 condition1">
                                <li>
                                    <input type="text" placeholder="请输入代理商"/>
                                </li>
                                <li>
                                    <div>请选择省份<i>></i></div>
                                </li>
                                <li>
                                    <div>请选择时间<i>></i></div>
                                </li>
                            </ul>
                        </div>
                        <div style="height: 80%;width: 100%; position: relative; top: 10px; padding-left: 4%;"
                             id="cailiaohuishou">
                        </div>
                    </div>
                </div>
                <!-- 抵押材料结束 -->
            </div>
        </div>

        <!--  数据图切换按钮  -->
        <div class="qiehuanbutton" id="qiehuanbutton" onclick="visualTransform()">切</br>换</div>


        <!--   数据图二   -->
        <div class="form_visual_form2" id="form_visual_form2" style="width: 1670px; height: 800px;">
            <div class="visual_form2_box">
                <!-- 逾期率开始 -->
                <div class="form2_box" style="margin-bottom: 20px;">
                    <div class="form2_box_left">
                        <div style="height: 100%;width: 40%; float: left;">
                            <div class="  font_color_title" style="margin-bottom: 2%;">逾期率</div>
                            <div style="width: 100%;height: 7%;">
                                <ul class="font_color_1 condition2">
                                    <li>
                                        <input type="text" placeholder="请输入代理商"/>
                                    </li>
                                    <li>
                                        <div>请选择省份<i>></i></div>
                                    </li>
                                </ul>

                            </div>
                            <div style="height: 80%;width: 100%; padding-left: 4%;" id="yuqilv_1">
                            </div>

                        </div>
                        <div style="height: 100%;width: 18%; float: left;">
                            <div style="height: 20%;width: 100%;margin-top: 20%;">
                                <div class="graph_statistics_content"
                                     style="width: 60%;height: 65%;margin-top: 10%;margin: auto;">
                                    <img src="${pageContext.request.contextPath }/manager/images/724618841177387879.png"
                                         style="width: 23px;height: 23px;padding-top: 5px;"/>
                                    <p style="color:#2F4554;font-size: 12px;padding-top: 2px;">逾期率预警</p>
                                </div>
                            </div>
                            <table class="graph_overdue_center">
                                <tr>
                                    <th>代理商</th>
                                    <th>逾期率</th>
                                </tr>
                                <tr>
                                    <td>金稻谷</td>
                                    <td>0.98%</td>
                                </tr>
                                <tr>
                                    <td>联众</td>
                                    <td>0.96%</td>
                                </tr>
                                <tr>
                                    <td>厦门远景</td>
                                    <td>0.94%</td>
                                </tr>
                                <tr>
                                    <td>灿谷</td>
                                    <td>0.88%</td>
                                </tr>
                                <tr>
                                    <td>泰州索普</td>
                                    <td>0.83%</td>
                                </tr>
                            </table>
                            <div style="width: 100%; height: 10%;margin-top: 2%;">
                                <button class="paiming_button">更多</button>
                            </div>
                        </div>
                        <div style="height: 100%;width: 36%; float: left;">
                            <ul class="graph_overdue_right" style="margin-top:15%;" class="font_color_3">
                                <li>
                                    <div class="paiming_button" style="margin: 0;float: left;">省份</div>
                                </li>
                                <li class="font_color_3">代理商</li>
                                <li class="font_color_3">客户年龄</li>
                                <li class="font_color_3">贷款金额</li>
                            </ul>
                            <div style="width: 100%;height:80%; margin-left: 5%;" id="yuqilv_2">
                            </div>
                        </div>
                    </div>
                    <!-- <div class="form2_box_right">

                    </div> -->
                </div>
                <!-- 逾期率结束 -->

                <div class="form2_box1" style="margin-bottom: 20px;">
                    <!-- 代理商综合能力分析开始 -->
                    <div class="form2_box_1">
                        <div class="  font_color_title" style="margin-bottom: 2%;">代理商综合能力分析</div>
                        <div style="width: 100%;height: 5%;">
                            <ul class="font_color_1 condition1">
                                <li style="margin-left: 5px;">
                                    <input type="text" placeholder="请输入代理商"/>
                                </li>
                                <li>
                                    <div>请选择时间<i>></i></div>
                                </li>
                            </ul>
                        </div>
                        <div style="height: 90%;width: 100%;" id="dalifenxi">
                        </div>

                    </div>
                    <!-- 代理商综合能力分析结束 -->

                    <!-- 征信查询通过率开始 -->
                    <div class="form2_box_2">
                        <div class="  font_color_title" style="margin-bottom: 2%;">征信查询通过率</div>
                        <div style="width: 100%;height: 5%;margin-top: 25px;">
                            <ul class="font_color_1 condition1">
                                <li>
                                    <input type="text" placeholder="请输入代理商"/>
                                </li>
                                <li>
                                    <div>请选择省份<i>></i></div>
                                </li>
                                <li>
                                    <div>请选择时间<i>></i></div>
                                </li>
                            </ul>
                        </div>
                        <div style="height: 80%;width: 100%;" id="zhengxinchaxun">
                        </div>
                    </div>
                    <!-- 征信查询通过率结束 -->
                </div>
            </div>
            <!-- 数据图二下 -->
            <div class="visual_form2_box">
                <!-- 客户和车辆画像开始 -->
                <div class="form2_box">
                    <div class="  font_color_title" style="margin-bottom: 1%;width: 100%;">客户和车辆画像</div>
                    <div style="height: 87%;width: 100%;">
                        <div class="form2_box_1">
                            <div style="height: 9%;width: 100%; ">
                                <div class="font_color_1 " style="margin-top: 7px;float: left;margin-left: 10px;">所属省份
                                </div>
                                <button class="paiming_button" style="float: left;margin-left: 8px;margin-top: 4px;">
                                    客户年龄
                                </button>
                            </div>
                            <div id="kehunianling" style="height: 90%;width: 100%;position: relative; top: -20px; ">
                            </div>
                        </div>
                        <div class="form2_box_1">
                            <div style="height: 9%;width: 100%; margin-left: 20%;">
                                <div class="font_color_1 " style=" margin-top: 7px;float: left;">新车</div>
                                <button class="paiming_button" style="float: left;margin-left: 8px;margin-top: 4px;">
                                    车龄
                                </button>
                            </div>
                            <div id="cheliangnianling" style="height: 90%;width: 100%;position: relative; top: -20px; ">
                            </div>
                        </div>
                    </div>

                </div>
                <!-- 客户和车辆画像结束 -->

                <!-- 资金周转时长(垫资方)开始 -->
                <div class="form2_box1">
                    <div class="  font_color_title" style="margin-bottom: 2%;">资金周转时长(垫资方)</div>
                    <div style="width: 100%;height: 5%;margin-top: 25px;">
                        <ul class="font_color_1 condition1">
                            <li style="text-align: left; margin-left: 5px;">
                                <div>请选择时间<i>></i></div>
                            </li>
                        </ul>
                    </div>
                    <div style="height: 80%;width: 100%;" id="zijinzhouzhuan">
                    </div>
                </div>
                <!-- 资金周转时长(垫资方)结束 -->
            </div>
        </div>
    </div>
</div>


<script type="text/javascript" src="${pageContext.request.contextPath }/manager/js/visual/visual.js"></script>
<script type="text/javascript">
    window.onload = function () {
        document.getElementById("form_visual_form2").style.display = "none";
    };


</script>





