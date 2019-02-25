<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.ddbx.tt.data.TtMap" %>
<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    TtMap infodb = (TtMap) request.getAttribute("infodb");
    TtMap minfo = (TtMap) request.getAttribute("minfo");
    long id_uplevel = 0;
    if (!Tools.myIsNull(infodb.get("id_uplevel"))) {
        id_uplevel = Long.parseLong(infodb.get("id_uplevel"));
    }
%>
<div class="admin-content nav-tabs-custom box">
    <div class="box-header with-border">
        <div class="box-header with-border">
            <h3 class="box-title">订单来自：快加云-秦扬</h3>
            <h3 class="box-title">提交时间：2019-02-20 16:57:00</h3>
            <div class="box-tools pull-right">

                <h3 class="box-title">订单编号：</h3>
            </div>
        </div>
        <div class="box-body" id="tab-content">
            <div class="form-group">
                <label class="col-sm-2 control-label">车辆信息</label>
                <div class="col-sm-10">
                    <div class="row inline-from">
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">车辆类型</span>
                                <select class="form-control" id="" name="">
                                    <option value="0">新车</option>
                                    <option value="1">二手车</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">国产/进口</span>
                                <select class="form-control" id="" name="">
                                    <option value="0">国产</option>
                                    <option value="1">进口</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">使用性质</span>
                                <select class="form-control" id="" name="">
                                    <option value="0">运营</option>
                                    <option value="1">非运营</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">变速箱</span>
                                <select class="form-control" id="" name="">
                                    <option value="0">自动</option>
                                    <option value="1">手动</option>
                                </select>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label"></label>
                <div class="col-sm-10">
                    <div class="row inline-from">
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">车型</span>
                                <select class="form-control" id="" name="">
                                    <option value="0">本田</option>
                                    <option value="1">别克</option>
                                    <option value="1">宝马</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <select class="form-control" id="" name="">
                                    <option value="0">本田</option>
                                    <option value="1">别克</option>
                                    <option value="1">宝马</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <select class="form-control" id="" name="">
                                    <option value="0">本田</option>
                                    <option value="1">别克</option>
                                    <option value="1">宝马</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label"></label>
                <div class="col-sm-10">
                    <div class="row inline-from">
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">车辆状况</span>
                                <select class="form-control" id="" name="">
                                    <option value="0">车辆状况</option>
                                    <option value="0">车辆优秀</option>
                                    <option value="1">车辆良好</option>
                                    <option value="1">车辆一般</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">行驶里程(公里)</span>
                                <input type="text" class="form-control" id="" name="" placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">出厂日期</span>
                                <input type="text" class="form-control" id="" name="" placeholder="">
                                <span class="input-group-addon" style="font-size: 18px;">
                                    <i class="fa fa-calendar"></i>
                                </span>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">初次登记日期</span>
                                <input type="text" class="form-control" id="" name="" placeholder="">
                                <span class="input-group-addon" style="font-size: 18px;">
                                    <i class="fa fa-calendar"></i>
                                </span>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">颜色</span>
                                <select class="form-control" id="" name="">
                                    <option value="0">黑</option>
                                    <option value="0">白</option>
                                    <option value="0">灰</option>
                                    <option value="0">红</option>
                                    <option value="0">银</option>
                                    <option value="0">蓝</option>
                                    <option value="0">金</option>
                                    <option value="0">棕</option>
                                    <option value="0">橙</option>
                                    <option value="0">黄</option>
                                </select>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label"></label>
                <div class="col-sm-10">
                    <div class="row inline-from">
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">所在省</span>
                                <select class="form-control" id="" name="">
                                    <option value="0">安徽省</option>
                                    <option value="0">北京市</option>
                                    <option value="0">福建省</option>
                                    <option value="0">甘肃省</option>
                                    <option value="0">贵州省</option>
                                    <option value="0">广西省</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">所在市</span>
                                <select class="form-control" id="" name="">
                                    <option value="0">安徽省</option>
                                    <option value="0">北京市</option>
                                    <option value="0">福建省</option>
                                    <option value="0">甘肃省</option>
                                    <option value="0">贵州省</option>
                                    <option value="0">广西省</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">车牌号码</span>
                                <input type="text" class="form-control" id="" name="" placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">车架号</span>
                                <input type="text" class="form-control" id="" name="" placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">品牌型号</span>
                                <input type="text" class="form-control" id="" name="" placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">发动机号</span>
                                <input type="text" class="form-control" id="" name="" placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">预期价格</span>
                                <input type="text" class="form-control" id="" name="" placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">原车主姓名</span>
                                <input type="text" class="form-control" id="" name="" placeholder="">
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<script>
    /*选择省后，动态获取省下面的市，并默认选中你指定的id的市，/ttAjax在Ajax.java中处理
                                            /ttAjax也可以单独使用，比如
                                            /ttAjax?do=opt&cn=kjb_user&id=3&mid_add=100000 //显示创建人id为100000的所有用户，默认选择id为3的记录
                                            * */
    objacl('#state_id', '#city_id', '/ttAjax?do=opt&cn=comm_citys&id=3&state_id=', '${infodb.state_id}', '${infodb.city_id}');
</script>