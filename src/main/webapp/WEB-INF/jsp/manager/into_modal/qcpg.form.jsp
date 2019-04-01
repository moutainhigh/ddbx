<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.ddbx.tt.data.TtMap" %>
<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@ page import="com.example.ddbx.tt.tool.DataDic" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    TtMap infodb = (TtMap) request.getAttribute("infodb");
    TtMap minfo = (TtMap) request.getAttribute("minfo");
    long id_uplevel = 0;
    if (!Tools.myIsNull(infodb.get("id_uplevel"))) {
        id_uplevel = Long.parseLong(infodb.get("id_uplevel"));
    }
    TtMap cars = (TtMap) request.getAttribute("cars");
%>
<input id="gems_id" name="gems_id" value="<%=minfo.get("id")%>" type="hidden" />
<input id="gems_fs_id" name="gems_fs_id" value="<%=minfo.get("fsid")%>" type="hidden" />
<div class="admin-content nav-tabs-custom box">
    <div class="box-header with-border">
        <c:if test="${id ne 0}">
            <div class="box-header with-border">
                <h3 class="box-title">订单来自：${gsnamemap.fs_name}-${gsnamemap.admin_name}</h3>
                <h3 class="box-title">提交时间：${infodb.dt_add}</h3>
                <div class="box-tools pull-right">

                    <h3 class="box-title">订单编号：${infodb.order_code}</h3>
                </div>
            </div>
        </c:if>
        <c:if test="${id eq 0}">
            <div class="box-header with-border">
                <h3 class="box-title">新增订单</h3>
            </div>
        </c:if>


        <div class="box-body" id="tab-content">
            <div class="form-group">
                <label class="col-sm-2 control-label">车辆信息</label>
                <div class="col-sm-10">
                    <div class="row inline-from">
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">车辆类型</span>
                                <select class="form-control" id="car_type" name="car_type">
                                    <option selected = "selected">请选择</option>
                                    <option value="1">新车</option>
                                    <option value="2">二手车</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">国产/进口</span>
                                <select class="form-control" id="source_id" name="source_id">
                                    <option selected = "selected">请选择</option>
                                    <option value="1">国产</option>
                                    <option value="2">进口</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">使用性质</span>
                                <select class="form-control" id="property_id" name="property_id">
                                    <option selected = "selected">请选择</option>
                                    <option value="1">营运</option>
                                    <option value="2">非营运</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">变速箱</span>
                                <select class="form-control" id="gear_box_id" name="gear_box_id">
                                    <option selected = "selected">请选择</option>
                                    <option value="1">自动</option>
                                    <option value="2">手动</option>
                                </select>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <%

                int brid = 0;
                if (cars.get("brid") != null && !cars.get("brid").equals("")) {
                    brid = Integer.parseInt(cars.get("brid"));
                }

                String sp = Tools.dicopt("car_brand_v2", brid);//品牌

            %>
            <div class="form-group">
                <label class="col-sm-2 control-label">品牌车型</label>
                <div class="col-sm-10">
                    <div class="row inline-from">
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">品牌</span>
                                <select name="brid" id="brid" class="form-control">
                                    <option value="0">请选择</option>
                                    <%=sp%>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">车系</span>
                                <select name="seid" id="seid" class="form-control">
                                    <option value="0">请选择</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">型号</span>
                                <select name="carid" id="carid" class="form-control">
                                    <option value="0">请选择</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                objacl('#brid', '#seid', '/ttAjax?do=opt&cn=car_series_v2&id=0&brand_id=', '${infodb.brid}', '${infodb.seid}');
                objacl('#seid', '#carid', '/ttAjax?do=opt&cn=car_model_v2&id=0&series_id=', '${infodb.seid}', '${infodb.carid}');
            </script>

            <div class="form-group">
                <label class="col-sm-2 control-label"></label>
                <div class="col-sm-10">
                    <div class="row inline-from">
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">车辆状况</span>
                                <select class="form-control" id="" name="car_status">
                                    <%=Tools.dicopt(DataDic.dic_car_status,infodb.get("car_status"))%>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">行驶里程(公里)</span>
                                <input type="text" class="form-control" id="" name="car_km" placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">出厂日期</span>
                                <input type="text" class="form-control" id="cardt1" name="cardt1" placeholder="">
                                <span class="input-group-addon" style="font-size: 18px;">
                                    <i class="fa fa-calendar"></i>
                                </span>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">初次登记日期</span>
                                <input type="text" class="form-control" id="cardt2" name="cardt2" placeholder="">
                                <span class="input-group-addon" style="font-size: 18px;">
                                    <i class="fa fa-calendar"></i>
                                </span>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">颜色</span>
                                <select class="form-control" id="" name="car_color_id">
                                    <option selected = "selected">请选择</option>
                                    <option value="1">黑</option>
                                    <option value="2">白</option>
                                    <option value="3">灰</option>
                                    <option value="4">红</option>
                                    <option value="5">银</option>
                                    <option value="6">蓝</option>
                                    <option value="7">金</option>
                                    <option value="8">棕</option>
                                    <option value="9">橙</option>
                                    <option value="10">黄</option>
                                </select>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


            <%
                String sh = Tools.dicopt("comm_states", 0);//省
            %>
            <div class="form-group">
                <label class="col-sm-2 control-label">上牌地址</label>
                <div class="col-sm-10">
                    <div class="row inline-from">
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">所在省</span>
                                <select name="local_states" id="local_states" class="form-control">
                                    <option value="0">请选择</option>
                                    <%=sh%>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">所在市</span>
                                <select name="local_citys" id="local_citys" class="form-control">
                                    <option value="0">请选择</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                objacl('#local_states', '#local_citys', '/ttAjax?do=opt&cn=comm_citys&id=0&state_id=', '${infodb.local_states}', '${infodb.local_citys}');
            </script>


            <div class="form-group">
                <label class="col-sm-2 control-label"></label>
                <div class="col-sm-10">
                    <div class="row inline-from">
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">车牌号码</span>
                                <input type="text" class="form-control" id="" name="carno" placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">车架号</span>
                                <input type="text" class="form-control" id="" name="car_vin" placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">品牌型号</span>
                                <input type="text" class="form-control" id="" name="ppxh" placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">发动机号</span>
                                <input type="text" class="form-control" id="" name="motorcode" placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">预期价格</span>
                                <input type="text" class="form-control" id="" name="expect_price" placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">原车主姓名</span>
                                <input type="text" class="form-control" id="" name="old_owner" placeholder="">
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">相关文件</label>
                <div class="col-sm-8">
                    <ul id="clTab" class="nav nav-tabs">
                        <li class="active"><a href="#clTab1" data-toggle="tab" aria-expanded="false">上传评估材料信息</a></li>
                        <li class=""><a href="#clTab2" data-toggle="tab" aria-expanded="true">上传车辆评估车辆照片</a></li>
                    </ul>
                    <div id="clTabContent" class="tab-content">
                        <div class="tab-pane fade active in" id="clTab1">
                            <div class="form-group">
                                <div class="col-sm-10">
                                    <div class="row inline-from">
                                        <%
                                            String upFile1 = "../upfile.inc.jsp";
                                            String imgPreName1 = "imgstep9_1ss";
                                            String[] ssImgs1 = { //设置已有值
                                                    !Tools.myIsNull(infodb.get(imgPreName1)) ? infodb.get(imgPreName1) : ""
                                            };
                                            ssImgs1 = ssImgs1[0].split(",");
                                            String sImgs1 = "";
                                            for (int i = 0; i < ssImgs1.length; i++) {
                                                sImgs1 = sImgs1 + ssImgs1[i] + "|";
                                            }
                                        %>
                                        <%-- 可能这里用<%@include file %>模式更适合--%>
                                        <jsp:include page="<%=upFile1%>">
                                            <jsp:param name="img_MarginImgSrc" value=""/>
                                            <jsp:param name="img_MarginImgClass" value=""/>
                                            <jsp:param name="img_Total" value="5"/>
                                            <jsp:param name="img_NamePre" value="imgstep9_1ss"/>
                                            <jsp:param name="img_DefaultImgSrc" value="images/mgcaraddimg.jpg"/>
                                            <jsp:param name="l1div_Style"
                                                       value="width: 100px;height:140px;display: inline-block;text-align: center;margin: auto;"/>
                                            <jsp:param name="img_Style" value="width: 100%;height:100px;border-radius:10px;"/>
                                            <jsp:param name="img_FileStyle"
                                                       value="position: absolute;left: 0;top: 0;height: 100%;width: 100%;background: transparent;border: 0;margin: 0;padding: 0;filter: alpha(opacity=0);-moz-opacity: 0;-khtml-opacity: 0;opacity: 0;"/>
                                            <jsp:param name="img_Class" value="imgclass"/>
                                            <jsp:param name="img_FileClass" value="uploadfileclass"/>
                                            <jsp:param name="img_SmallWidth" value="100"/>
                                            <jsp:param name="img_SmallHeight" value="100"/>
                                            <jsp:param name="sImgs" value="<%=sImgs1%>"/>
                                        </jsp:include>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="clTab2">
                            <div class="form-group">
                                <div class="col-sm-10">
                                    <div class="row inline-from">
                                        <%
                                            String upFile2 = "../upfile.inc.jsp";
                                            String imgPreName2= "imgstep9_2ss";
                                            String[] ssImgs2 = { //设置已有值
                                                    !Tools.myIsNull(infodb.get(imgPreName2)) ? infodb.get(imgPreName2) : ""
                                            };
                                            ssImgs2 = ssImgs2[0].split(",");
                                            String sImgs2 = "";
                                            for (int i = 0; i < ssImgs2.length; i++) {
                                                sImgs2 = sImgs2 + ssImgs2[i] + "|";
                                            }
                                        %>
                                        <%-- 可能这里用<%@include file %>模式更适合--%>
                                        <jsp:include page="<%=upFile2%>">
                                            <jsp:param name="img_MarginImgSrc" value=""/>
                                            <jsp:param name="img_MarginImgClass" value=""/>
                                            <jsp:param name="img_Total" value="10"/>
                                            <jsp:param name="img_NamePre" value="imgstep9_2ss"/>
                                            <jsp:param name="img_DefaultImgSrc" value="images/mgcaraddimg.jpg"/>
                                            <jsp:param name="l1div_Style"
                                                       value="width: 100px;height:140px;display: inline-block;text-align: center;margin: auto;"/>
                                            <jsp:param name="img_Style" value="width: 100%;height:100px;border-radius:10px;"/>
                                            <jsp:param name="img_FileStyle"
                                                       value="position: absolute;left: 0;top: 0;height: 100%;width: 100%;background: transparent;border: 0;margin: 0;padding: 0;filter: alpha(opacity=0);-moz-opacity: 0;-khtml-opacity: 0;opacity: 0;"/>
                                            <jsp:param name="img_Class" value="imgclass"/>
                                            <jsp:param name="img_FileClass" value="uploadfileclass"/>
                                            <jsp:param name="img_SmallWidth" value="100"/>
                                            <jsp:param name="img_SmallHeight" value="100"/>
                                            <jsp:param name="sImgs" value="<%=sImgs2%>"/>
                                        </jsp:include>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">选择进件客户</label>
                <div class="col-sm-10">
                    <div class="row inline-from">
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">客户名字</span>
                                <select class="form-control" id="icbc_id" name="icbc_id">
                                    <option value="0" selected="selected"></option>
                                    <c:forEach items="${names}" var="s" varStatus="num">
                                        <option value="${s.id}">${s.c_name}</option>
                                    </c:forEach>
                                </select>
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
    objacl('#state_id', '#city_id', '/ttAjax?do=opt&cn=comm_citys&id=0&state_id=', '${infodb.state_id}', '${infodb.city_id}');
</script>
<script>
    //执行一个laydate实例
    laydate.render({
        elem: '#cardt2', //指定元素
        type: 'date'
    });
    //执行一个laydate实例
    laydate.render({
        elem: '#cardt1', //指定元素
        type: 'date'
    });
</script>