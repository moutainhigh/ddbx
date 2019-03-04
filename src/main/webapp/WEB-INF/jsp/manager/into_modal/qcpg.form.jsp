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
                                <select class="form-control" id="" name="cars_type">
                                    <option selected = "selected"></option>
                                    <option value="新车">新车</option>
                                    <option value="二手车">二手车</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">国产/进口</span>
                                <select class="form-control" id="" name="origin_type">
                                    <option selected = "selected"></option>
                                    <option value="国产">国产</option>
                                    <option value="进口">进口</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">使用性质</span>
                                <select class="form-control" id="" name="using_nature">
                                    <option selected = "selected"></option>
                                    <option value="运营">运营</option>
                                    <option value="非运营">非运营</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">变速箱</span>
                                <select class="form-control" id="" name="transmission">
                                    <option selected = "selected"></option>
                                    <option value="自动">自动</option>
                                    <option value="手动">手动</option>
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
                                <select class="form-control" id="" name="models1">
                                    <option selected = "selected"></option>
                                    <option value="本田">本田</option>
                                    <option value="别克">别克</option>
                                    <option value="宝马">宝马</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <select class="form-control" id="" name="models2">
                                    <option selected = "selected"></option>
                                    <option value="本田">本田</option>
                                    <option value="别克">别克</option>
                                    <option value="宝马">宝马</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon"></span>
                                <select class="form-control" id="" name="models3">
                                    <option selected = "selected"></option>
                                    <option value="本田">本田</option>
                                    <option value="别克">别克</option>
                                    <option value="宝马">宝马</option>
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
                                <select class="form-control" id="" name="cars_vehicles">
                                    <option selected = "selected"></option>
                                    <option value="车辆优秀">车辆优秀</option>
                                    <option value="车辆良好">车辆良好</option>
                                    <option value="车辆一般">车辆一般</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">行驶里程(公里)</span>
                                <input type="text" class="form-control" id="" name="mileage" placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">出厂日期</span>
                                <input type="text" class="form-control" id="" name="manufacture_date" placeholder="">
                                <span class="input-group-addon" style="font-size: 18px;">
                                    <i class="fa fa-calendar"></i>
                                </span>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">初次登记日期</span>
                                <input type="text" class="form-control" id="" name="firstregistration_date" placeholder="">
                                <span class="input-group-addon" style="font-size: 18px;">
                                    <i class="fa fa-calendar"></i>
                                </span>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">颜色</span>
                                <select class="form-control" id="" name="cars_color">
                                    <option selected = "selected"></option>
                                    <option value="黑">黑</option>
                                    <option value="白">白</option>
                                    <option value="灰">灰</option>
                                    <option value="红">红</option>
                                    <option value="银">银</option>
                                    <option value="蓝">蓝</option>
                                    <option value="金">金</option>
                                    <option value="棕">棕</option>
                                    <option value="橙">橙</option>
                                    <option value="黄">黄</option>
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
                                <select class="form-control" id="" name="cars_province">
                                    <option selected = "selected"></option>
                                    <option value="安徽省">安徽省</option>
                                    <option value="北京市">北京市</option>
                                    <option value="福建省">福建省</option>
                                    <option value="甘肃省">甘肃省</option>
                                    <option value="贵州省">贵州省</option>
                                    <option value="广西省">广西省</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">所在市</span>
                                <select class="form-control" id="" name="cars_city">
                                    <option selected = "selected"></option>
                                    <option value="安徽省">安徽省</option>
                                    <option value="北京市">北京市</option>
                                    <option value="福建省">福建省</option>
                                    <option value="甘肃省">甘肃省</option>
                                    <option value="贵州省">贵州省</option>
                                    <option value="广西省">广西省</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">车牌号码</span>
                                <input type="text" class="form-control" id="" name="license_plate" placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">车架号</span>
                                <input type="text" class="form-control" id="" name="chassis_number" placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">品牌型号</span>
                                <input type="text" class="form-control" id="" name="brand_models" placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">发动机号</span>
                                <input type="text" class="form-control" id="" name="engine_number" placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">预期价格</span>
                                <input type="text" class="form-control" id="" name="expected_price" placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">原车主姓名</span>
                                <input type="text" class="form-control" id="" name="owner_name" placeholder="">
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
                                            String imgPreName1 = "imgstep1_1qp";
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
                                            <jsp:param name="img_Total" value="6"/>
                                            <jsp:param name="img_NamePre" value="imgstep1_1qp"/>
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
                                            String imgPreName2= "imgstep1_2qp";
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
                                            <jsp:param name="img_NamePre" value="imgstep1_2qp"/>
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



        </div>
    </div>


    <script>
    /*选择省后，动态获取省下面的市，并默认选中你指定的id的市，/ttAjax在Ajax.java中处理
                                            /ttAjax也可以单独使用，比如
                                            /ttAjax?do=opt&cn=kjb_user&id=3&mid_add=100000 //显示创建人id为100000的所有用户，默认选择id为3的记录
                                            * */
    objacl('#state_id', '#city_id', '/ttAjax?do=opt&cn=comm_citys&id=3&state_id=', '${infodb.state_id}', '${infodb.city_id}');
</script>