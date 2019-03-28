<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/manager/js/visual/echarts.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/manager/css/visual/Visual.css"  />

<!-- 可视化数据图 -->
<div class="content_visual">
    <div class="form_visual" >
        <!-- <%--  数据图一  --%> -->
        <div class="form_visual_form1" id="form_visual_form1" style="width: 1690px; height: 840px;display: block;">
            <div class="visual_form_top_box">
                <!-- 报单统计开始 -->
                <div class="visual_form_box">

                    <div class="baodan_left">
                        <div class="  font_color_title" style="margin-bottom: 2%;">报单统计</div>
                        <div style="width: 100%;height: 7%;">
                            <ul class="font_color_1 condition1" >
                                <li>
                                    <input type="text"  value="请输入代理商" onblur="baodanselect()"
                                           onfocus="javascript:if(this.value=='请输入代理商')this.value='';" id="baodanval"/>
                                </li>
                                <li>
                                    <select id="baodansel" onchange="baodanselect()" >
                                        <option selected value="0"> 请选择省份</option>
                                        <option value="0"> 全部</option>
                                        <c:forEach var="list" items="${comm_city}">
                                            <option value="${list.id}">${list.name}</option>
                                        </c:forEach>
                                    </select><i style="padding-left: 5px">></i>
                                </li>
                                <li>
                                    <select id="baodantime" onchange="baodanselect()">
                                        <option selected value="0"> 请选择时间</option>
                                        <option value="0"> 全部</option>
                                        <c:forEach var="list" items="${years }" >
                                            <option value="${list}">${list}</option>
                                        </c:forEach>
                                    </select><i>></i>
                                </li>
                            </ul>
                        </div>
                        <div style="height: 80%;width: 100%; position: relative; top: -10px; padding-left: 4%;" id="baodan">
                        </div>
                    </div>
                    <div class="baodan_right">
                        <div class="paiming_top" >
                            <div class="paiming_top_border" style="width:40%;">
                                <p class="danshu_style font_color_2">${billlist[0].amount }<font>笔</font></p>
                                <p class="font_color_2 font_size_1">本月报单总量</p>
                            </div>
                        </div>
                        <div class="paiming_table" style="display: inline-block">
                            <table  class="paiming_table_style">
                                <tr>
                                    <th >省份</th>
                                    <th colspan="3" class="font_color_1 font_color_4">排名</th>
                                    <th >代理商</th>
                                </tr>

                                <tr>
                                    <td class="font_color_3">${rankinglist[0].name }</td>
                                    <td class="font_size_3 font_color_4">${rankinglist[0].sell }</td>
                                    <td ><div class="paiming_rank">1</div></td>
                                    <td class="font_size_3 font_color_4">${gemslist[0].gems}</td>
                                    <td class="font_color_3">${gemslist[0].name}</td>
                                </tr>
                                <tr>
                                    <td class="font_color_3">${rankinglist[1].name }</td>
                                    <td class="font_size_3 font_color_4">${rankinglist[1].sell }</td>
                                    <td ><div class="paiming_rank">2</div></td>
                                    <td class="font_size_3 font_color_4">${gemslist[1].gems}</td>
                                    <td class="font_color_3">${gemslist[1].name}</td>
                                </tr>
                                <tr>
                                    <td class="font_color_3">${rankinglist[2].name }</td>
                                    <td class="font_size_3 font_color_4">${rankinglist[2].sell }</td>
                                    <td ><div class="paiming_rank">3</div></td>
                                    <td class="font_size_3 font_color_4">${gemslist[2].gems}</td>
                                    <td class="font_color_3">${gemslist[2].name}</td>
                                </tr>
                                <tr>
                                    <td class="font_color_3">${rankinglist[3].name }</td>
                                    <td class="font_size_3 font_color_4">${rankinglist[3].sell }</td>
                                    <td ><div class="paiming_rank">4</div></td>
                                    <td class="font_size_3 font_color_4">${gemslist[3].gems}</td>
                                    <td class="font_color_3">${gemslist[3].name}</td>
                                </tr>
                                <tr>
                                    <td class="font_color_3">${rankinglist[4].name }</td>
                                    <td class="font_size_3 font_color_4">${rankinglist[4].sell }</td>
                                    <td ><div class="paiming_rank">5</div></td>
                                    <td class="font_size_3 font_color_4">${gemslist[4].gems}</td>
                                    <td class="font_color_3">${gemslist[4].name}</td>
                                </tr>

                            </table>
                        </div>
                        <div style="width: 100%; height: 10%;margin-top: 2%;">
                            <div class="paiming_button" onclick="show_bjls('baodan')" style="cursor:pointer">更多</div>
                        </div>
                    </div>
                </div>
                <!-- 报单统计结束 -->
                <!-- 汽车贷款开始 -->
                <div class="visual_form_box">
                    <div class="baodan_left">
                        <div class="font_color_title" style="margin-bottom: 2%;">过件率(汽车贷款通过)</div>
                        <div style="width: 100%;height: 7%;">
                            <ul class="font_color_1 condition1" >
                                <li>
                                    <input type="text"  value="请输入代理商" onblur="guojianselect()"
                                           onfocus="javascript:if(this.value=='请输入代理商')this.value='';" id="guojianval"/>
                                </li>
                                <li>
                                    <select id="guojiansel" onchange="guojianselect()" >
                                        <option selected value="0"> 请选择省份</option>
                                        <option value="0"> 全部</option>
                                        <c:forEach var="list" items="${comm_city}">
                                            <option value="${list.id}">${list.name}</option>
                                        </c:forEach>
                                    </select><i style="padding-left: 5px">></i>
                                </li>
                                <li>
                                    <select id="guojiantime" onchange="guojianselect()">
                                        <option selected value="0"> 请选择时间</option>
                                        <option value="0"> 全部</option>
                                        <c:forEach var="list" items="${years }" >
                                            <option value="${list}">${list}</option>
                                        </c:forEach>
                                    </select><i>></i>
                                </li>
                            </ul>
                        </div>
                        <div style="height: 80%;width: 100%; position: relative; top: -10px; padding-left: 4%;" id="qichedaikuan">
                        </div>
                    </div>
                    <div class="baodan_right">
                        <div class="paiming_top" >
                            <div class="paiming_top_border" style="width:40%;">
                                <p class="danshu_style font_color_2">${carspass }<font>%</font></p>
                                <p class="font_color_2 font_size_1">本月汽车过件率</p>
                            </div>
                        </div>
                        <div class="paiming_table">
                            <table  class="paiming_table_style">
                                <tr>
                                    <th >省份</th>
                                    <th colspan="3" class="font_color_1 font_color_4">排名</th>
                                    <th >代理商</th>
                                </tr>

                                <tr>
                                    <td class="font_color_3  asdf">${cardpasscomm[0].name }</td>
                                    <td class="font_size_3 font_color_4">${Math.round(cardpasscomm[0].rate*100/1) }%</td>
                                    <td ><div class="paiming_rank">1</div></td>
                                    <td class="font_size_3 font_color_4">${Math.round(cardpassgems[0].rate*100/1) }%</td>
                                    <td class="font_color_3  asdf">${cardpassgems[0].name }</td>
                                </tr>
                                <tr>
                                    <td class="font_color_3">${cardpasscomm[1].name }</td>
                                    <td class="font_size_3 font_color_4">${Math.round(cardpasscomm[1].rate*100/1) }%</td>
                                    <td ><div class="paiming_rank">2</div></td>
                                    <td class="font_size_3 font_color_4">${Math.round(cardpassgems[1].rate*100/1) }%</td>
                                    <td class="font_color_3">${cardpassgems[1].name }</td>
                                </tr>
                                <tr>
                                    <td class="font_color_3">${cardpasscomm[2].name }</td>
                                    <td class="font_size_3 font_color_4">${Math.round(cardpasscomm[2].rate*100/1) }%</td>
                                    <td ><div class="paiming_rank">3</div></td>
                                    <td class="font_size_3 font_color_4">${Math.round(cardpassgems[2].rate*100/1) }%</td>
                                    <td class="font_color_3">${cardpassgems[2].name }</td>
                                </tr>
                                <tr>
                                    <td class="font_color_3">${cardpasscomm[3].name }</td>
                                    <td class="font_size_3 font_color_4">${Math.round(cardpasscomm[3].rate*100/1) }%</td>
                                    <td ><div class="paiming_rank">4</div></td>
                                    <td class="font_size_3 font_color_4">${Math.round(cardpassgems[3].rate*100/1) }%</td>
                                    <td class="font_color_3">${cardpassgems[3].name }</td>
                                </tr>
                                <tr>
                                    <td class="font_color_3">${cardpasscomm[4].name }</td>
                                    <td class="font_size_3 font_color_4">${Math.round(cardpasscomm[4].rate*100/1) }%</td>
                                    <td ><div class="paiming_rank">5</div></td>
                                    <td class="font_size_3 font_color_4">${Math.round(cardpassgems[4].rate*100/1) }%</td>
                                    <td class="font_color_3">${cardpassgems[4].name }</td>
                                </tr>

                            </table>
                        </div>
                        <div style="width: 100%; height: 10%;margin-top: 2%;">
                            <div class="paiming_button" onclick="show_bjls('guojian')" style="cursor:pointer">更多</div>
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
                            <ul class="font_color_1 condition1" >
                                <li>
                                    <input type="text"  value="请输入代理商" onblur="fangkuanselect()"
                                           onfocus="javascript:if(this.value=='请输入代理商')this.value='';" id="fangkuanval"/>
                                </li>
                                <li>
                                    <select id="fangkuansel" onchange="fangkuanselect()">
                                        <option selected value="0"> 请选择省份</option>
                                        <option value="0"> 全部</option>
                                        <c:forEach var="list" items="${comm_city}">
                                            <option value="${list.id}">${list.name}</option>
                                        </c:forEach>
                                    </select><i style="padding-left: 5px">></i>
                                </li>
                                <li>
                                    <select id="fangkuantime" onchange="fangkuanselect()">
                                        <option selected value="0"> 请选择时间</option>
                                        <option value="0"> 全部</option>
                                        <c:forEach var="list" items="${years }" >
                                            <option value="${list}">${list}</option>
                                        </c:forEach>
                                    </select><i>></i>
                                </li>
                            </ul>
                        </div>
                        <div style="height: 88%;width: 92%;display: inline-block">

                            <div style="height: 35%; width: 50%; float: left; " id="fangkuan_1"></div>
                            <div style="height: 35%; width: 48%; float: right; " id="fangkuan_2"></div>

                            <div style="height: 63%;width: 100%;margin-left: 10px; display: inline-block" id="fangkuan_3">
                            </div>
                        </div>
                    </div>
                    <div class="baodan_right">
                        <div class="paiming_top" style="margin-top: 10%;">
                            <div class="paiming_top_border" style="width:45%;float: left;">
                                <p class="danshu_style font_color_2">${loanlist[0].amount}<font>笔</font></p>
                                <p class="font_color_2 font_size_1">本月放款总订单</p>
                            </div>
                            <div class="paiming_top_border" style="width: 50%;float: right;">
                                <p class="danshu_style font_color_2">${Math.round(loan * 100)/100}<font>元</font></p>
                                <p class="font_color_2 font_size_1">本月放款均金额</p>
                            </div>
                        </div>

                        <div class="paiming_top_border" style="width: 100%; margin-top: 5%;">
                            <p class="danshu_style font_color_2">${Math.ceil(loanlist[0].money) }<font>元</font></p>
                            <p class="font_color_2 font_size_1">本月累计放款总订单总金额</p>
                        </div>
                        <div class="paiming_table">
                            <table  class="paiming_table_style">
                                <tr>
                                    <th >省份</th>
                                    <th colspan="3" class="font_color_1 font_color_4">排名</th>
                                    <th >代理商</th>
                                </tr>

                                <tr>
                                    <td class="font_color_3">${rankingloanlist[0].name }</td>
                                    <td class="font_size_3 font_color_4">${rankingloanlist[0].sell }</td>
                                    <td ><div class="paiming_rank">1</div></td>
                                    <td class="font_size_3 font_color_4">${gemsloanlist[0].gems }</td>
                                    <td class="font_color_3">${gemsloanlist[0].name }</td>
                                </tr>
                                <tr>
                                    <td class="font_color_3">${rankingloanlist[1].name }</td>
                                    <td class="font_size_3 font_color_4">${rankingloanlist[1].sell }</td>
                                    <td ><div class="paiming_rank">2</div></td>
                                    <td class="font_size_3 font_color_4">${gemsloanlist[1].gems }</td>
                                    <td class="font_color_3">${gemsloanlist[1].name }</td>
                                </tr>
                                <tr>
                                    <td class="font_color_3">${rankingloanlist[2].name }</td>
                                    <td class="font_size_3 font_color_4">${rankingloanlist[2].sell }</td>
                                    <td ><div class="paiming_rank">3</div></td>
                                    <td class="font_size_3 font_color_4">${gemsloanlist[2].gems }</td>
                                    <td class="font_color_3">${gemsloanlist[2].name }</td>
                                </tr>
                                <tr>
                                    <td class="font_color_3">${rankingloanlist[3].name }</td>
                                    <td class="font_size_3 font_color_4">${rankingloanlist[3].sell }</td>
                                    <td ><div class="paiming_rank">4</div></td>
                                    <td class="font_size_3 font_color_4">${gemsloanlist[3].gems }</td>
                                    <td class="font_color_3">${gemsloanlist[3].name }</td>
                                </tr>
                                <tr>
                                    <td class="font_color_3">${rankingloanlist[4].name }</td>
                                    <td class="font_size_3 font_color_4">${rankingloanlist[4].sell }</td>
                                    <td ><div class="paiming_rank">5</div></td>
                                    <td class="font_size_3 font_color_4">${gemsloanlist[4].gems }</td>
                                    <td class="font_color_3">${gemsloanlist[4].name }</td>
                                </tr>

                            </table>
                        </div>
                        <div style="width: 100%; height: 10%;margin-top: 2%;">
                            <div class="paiming_button" onclick="show_bjls('fangkan')" style="cursor:pointer">更多</div>
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
                                <p class="danshu_style font_color_2">${fklist[0].amount }<font>笔</font></p>
                                <p class="font_color_2 font_size_1">本月已放款未完成</p>
                                <p class="font_color_2 font_size_1">抵押的订单总数</p>
                            </div>
                            <div class="paiming_bottom_border" style="width: 50%;float: right;">
                                <p class="danshu_style font_color_2">${Math.ceil(fklist[0].money) }<font>元</font></p>
                                <p class="font_color_2 font_size_1">本月已放款未完成</p>
                                <p class="font_color_2 font_size_1">抵押的订单金额</p>
                            </div>
                        </div>
                        <div style="width: 100%;height: 5%;margin-top: 25px;">
                            <ul class="font_color_1 condition1" >
                                <li>
                                    <input type="text"  value="请输入代理商" onblur="diyaselect()"
                                           onfocus="javascript:if(this.value=='请输入代理商')this.value='';" id="diyaval"/>
                                </li>
                                <li>
                                    <select id="diyasel" onchange="diyaselect()">
                                        <option selected value="0"> 请选择省份</option>
                                        <option value="0"> 全部</option>
                                        <c:forEach var="list" items="${comm_city}">
                                            <option value="${list.id}">${list.name}</option>
                                        </c:forEach>
                                    </select><i style="padding-left: 5px">></i>
                                </li>
                                <li>
                                    <select id="diyatime" onchange="diyaselect()">
                                        <option selected value="0"> 请选择时间</option>
                                        <option value="0"> 全部</option>
                                        <c:forEach var="list" items="${years }" >
                                            <option value="${list}">${list}</option>
                                        </c:forEach>
                                    </select><i>></i>
                                </li>
                            </ul>
                        </div>
                        <div style="height: 68%;width: 90%; position: relative;" id="diyawancheng">

                        </div>
                    </div>
                    <div class="baodan_right_1" style="float: right;">
                        <div class="  font_color_title" style="margin-bottom: 2%;">材料回收情况</div>
                        <div style="width: 100%;height: 7%;">
                            <ul class="font_color_1 condition1" >
                                <li>
                                    <input type="text"  value="请输入代理商" onblur="cailiaoselect()"
                                           onfocus="javascript:if(this.value=='请输入代理商')this.value='';" id="cailiaoval"/>
                                </li>
                                <li>
                                    <select id="cailiaosel" onchange="cailiaoselect()">
                                        <option selected value="0"> 请选择省份</option>
                                        <option value="0"> 全部</option>
                                        <c:forEach var="list" items="${comm_city}">
                                            <option value="${list.id}">${list.name}</option>
                                        </c:forEach>
                                    </select><i style="padding-left: 5px">></i>
                                </li>
                                <li>
                                    <select id="cailiaotime" onchange="cailiaoselect()">
                                        <option selected value="0"> 请选择时间</option>
                                        <option value="0"> 全部</option>
                                        <c:forEach var="list" items="${years }" >
                                            <option value="${list}">${list}</option>
                                        </c:forEach>
                                    </select><i>></i>
                                </li>
                            </ul>
                        </div>
                        <div style="height: 80%;width: 100%; position: relative; top: 10px; padding-left: 4%;" id="cailiaohuishou">
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
                                <ul class="font_color_1 condition2" >
                                    <li>
                                        <input type="text"  value="请输入代理商" onblur="yuqiselect()"
                                               onfocus="javascript:if(this.value=='请输入代理商')this.value='';" id="yuqival"/>
                                    </li>
                                    <li>
                                        <select id="yuqisel" onchange="yuqiselect()">
                                            <option selected value="0"> 请选择省份</option>
                                            <option value="0"> 全部</option>
                                            <c:forEach var="list" items="${comm_city}">
                                                <option value="${list.id}">${list.name}</option>
                                            </c:forEach>
                                        </select><i style="padding-left: 5px">></i>
                                    </li>

                                </ul>

                            </div>
                            <div style="height: 80%;width: 100%; padding-left: 4%;" id="yuqilv_1">
                            </div>

                        </div>
                        <div style="height: 100%;width: 18%; float: left;">
                            <div style="height: 20%;width: 100%;margin-top: 20%;">
                                <div class="graph_statistics_content" style="width: 60%;height: 65%;margin-top: 10%;margin: auto;">
                                    <img src="${pageContext.request.contextPath }/manager/images/724618841177387879.png" style="width: 23px;height: 23px;padding-top: 5px;"/>
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
                                <div class="paiming_button" onclick="show_bjls('yuqi')" style="cursor:pointer">更多</div>
                            </div>
                        </div>
                        <div style="height: 100%;width: 36%; float: left;">
                            <ul class="graph_overdue_right" style="margin-top:15%;" class="font_color_3">
                                <li>
                                    <div  class="paiming_button" style="margin: 0;float: left;">省份</div>
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
                            <ul class="font_color_1 condition1" >
                                <li style="margin-left: 5px;">
                                    <input type="text"  value="请输入代理商" onblur="dailiselect()"
                                           onfocus="javascript:if(this.value=='请输入代理商')this.value='';" id="dailival"/>
                                </li>

                                <li>
                                    <select id="dailitime" onchange="dailiselect()">
                                        <option selected value="0"> 请选择时间</option>
                                        <option value="0"> 全部</option>
                                        <c:forEach var="list" items="${years }" >
                                            <option value="${list}">${list}</option>
                                        </c:forEach>
                                    </select><i>></i>
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
                            <ul class="font_color_1 condition1" >
                                <li>
                                    <input type="text"  value="请输入代理商" onblur="zhengxinselect()"
                                           onfocus="javascript:if(this.value=='请输入代理商')this.value='';" id="zhengxinval"/>
                                </li>
                                <li>
                                    <select id="zhengxinsel" onchange="zhengxinselect()">
                                        <option selected value="0"> 请选择省份</option>
                                        <option value="0"> 全部</option>
                                        <c:forEach var="list" items="${comm_city}">
                                            <option value="${list.id}">${list.name}</option>
                                        </c:forEach>
                                    </select><i style="padding-left: 5px">></i>
                                </li>
                                <li>
                                    <select id="zhengxintime" onchange="zhengxinselect()">
                                        <option selected value="0"> 请选择时间</option>
                                        <option value="0"> 全部</option>
                                        <c:forEach var="year" items="${years }" >
                                            <option value="${year}">${year}</option>
                                        </c:forEach>
                                    </select><i>></i>
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
                    <div style="height: 87%;width: 100%;" >
                        <div class="form2_box_1">
                            <div style="height: 9%;width: 100%; ">
                                <div class="font_color_1 " style="margin-top: 7px;float: left;margin-left: 10px;">所属省份</div>
                                <button class="paiming_button" style="float: left;margin-left: 8px;margin-top: 4px;">客户年龄</button>
                            </div>
                            <div id="kehunianling" style="height: 90%;width: 100%;position: relative; top: -20px; ">
                            </div>
                        </div>
                        <div class="form2_box_1">
                            <div style="height: 9%;width: 100%; margin-left: 20%;">
                                <div class="font_color_1 " style=" margin-top: 7px;float: left;">新车</div>
                                <button class="paiming_button" style="float: left;margin-left: 8px;margin-top: 4px;">车龄</button>
                            </div>
                            <div id="cheliangnianling" style="height: 90%;width: 100%;position: relative; top: -20px; ">
                            </div>
                        </div>
                    </div>

                </div>
                <!-- 客户和车辆画像结束 -->

                <!-- 资金周转时长(垫资方)开始 -->
                <%--<div class="form2_box1">
                    <div class="  font_color_title" style="margin-bottom: 2%;">资金周转时长(垫资方)</div>
                    <div style="width: 100%;height: 5%;margin-top: 25px;">
                        <ul class="font_color_1 condition1"  >
                            <li style="text-align: left; margin-left: 5px;">
                                <select id="dianzisel" onchange="dianziselect()" >
                                    <option selected value="0"> 请选择省份</option>
                                    <option value="0"> 全部</option>
                                    <c:forEach var="list" items="${comm_city}">
                                        <option value="${list.id}">${list.name}</option>
                                    </c:forEach>
                                </select><i style="padding-left: 5px">></i>
                            </li>

                        </ul>
                    </div>
                    <div style="height: 80%;width: 100%;" id="zijinzhouzhuan">
                    </div>
                </div>--%>
                <!-- 资金周转时长(垫资方)结束 -->
            </div>
        </div>
    </div>
</div>


<div class="modal fade in" id="addModal_tdtf" tabindex="-1" role="dialog" aria-labelledby="imgs_yyclLabel"
     aria-hidden="false">
    <div class="modal-dialog modal-lg" style="width: 400px;height: 600px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" align="center" id="aayyclModalLabel">代理商/省份排名</h4>
            </div>
            <div id="modal_add" class="modal-body modal-open"
                 style="height:100%;border:1px solid #ccc;background-color:#F7F7F7;border-radius: 10px;margin:30px;">
                <div class="paiming_table">
                    <table  class="paiming_table_style">
                        <tr>
                            <th >省份</th>
                            <th colspan="3" class="font_color_1 font_color_4">排名</th>
                            <th >代理商</th>
                        </tr>
                        <%

                            for(int i=0;i<10;i++ ){
                        %>
                            <tr>
                                <td class="font_color_3">${rankingloanlist[0].name }</td>
                                <td class="font_size_3 font_color_4">${rankingloanlist[0].sell }</td>
                                <td ><div class="paiming_rank"><%= i+1%></div></td>
                                <td class="font_size_3 font_color_4">${gemsloanlist[0].gems }</td>
                                <td class="font_color_3">${gemsloanlist[0].name }</td>
                            </tr>

                        <% } %>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="closet" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath }/manager/js/visual/visual.js"></script>
<script type="text/javascript">
    window.onload =function(){
        document.getElementById("form_visual_form2").style.display="none";

        //加载可视化组件
        baodanselect();
        guojianselect();
        fangkuanselect();
        diyaselect();
        cailiaoselect();
        zhengxinselect();
        dailiselect();
        yuqiselect();
        /*dianziselect();*/
    };

    function show_bjls(type) {
        if(type == 'baodan'){

        }
        if(type == 'guojian'){

        }
        if(type == 'fangkuan'){

        }
        if(type == 'yuqi'){

        }

        $('#addModal_tdtf').modal({show: true});
    }
</script>







