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
            <label class="col-sm-2 control-label">汽车贷款</label>
            <div class="col-sm-8">
                <ul id="clTab" class="nav nav-tabs">
                    <li class="active"><a href="#clTab1" data-toggle="tab" aria-expanded="false">证明材料</a></li>
                    <li class=""><a href="#clTab2" data-toggle="tab" aria-expanded="true">合同材料</a></li>
                    <li class=""><a href="#clTab3" data-toggle="tab" aria-expanded="false">其他材料</a></li>
                    <li class=""><a href="#clTab4" data-toggle="tab" aria-expanded="false">补充材料</a></li>
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
                                            if (ssImgs1[i] != null && !ssImgs1[i].equals("")) {
                                                sImgs1 = sImgs1 + ssImgs1[i] + "|";
                                            }
                                        }
                                    %>
                                    <%-- 可能这里用<%@include file %>模式更适合--%>
                                    <jsp:include page="<%=upFile1%>">
                                        <jsp:param name="img_MarginImgSrc" value=""/>
                                        <jsp:param name="img_MarginImgClass" value=""/>
                                        <jsp:param name="img_Total" value="6"/>
                                        <jsp:param name="img_NamePre" value="imgstep9_1ss"/>
                                        <jsp:param name="img_DefaultImgSrc" value="images/mgcaraddimg.jpg"/>
                                        <jsp:param name="l1div_Style"
                                                   value="width: 100px;height:140px;display: inline-block;text-align: center;margin: auto;"/>
                                        <jsp:param name="img_Style"
                                                   value="width: 100%;height:100px;border-radius:10px;"/>
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
                                        String imgPreName2 = "imgstep9_2ss";
                                        String[] ssImgs2 = { //设置已有值
                                                !Tools.myIsNull(infodb.get(imgPreName2)) ? infodb.get(imgPreName2) : ""
                                        };
                                        ssImgs2 = ssImgs2[0].split(",");
                                        String sImgs2 = "";
                                        for (int i = 0; i < ssImgs2.length; i++) {
                                            if (ssImgs2[i] != null && !ssImgs2[i].equals("")) {
                                                sImgs2 = sImgs2 + ssImgs2[i] + "|";
                                            }
                                        }
                                    %>
                                    <%-- 可能这里用<%@include file %>模式更适合--%>
                                    <jsp:include page="<%=upFile2%>">
                                        <jsp:param name="img_MarginImgSrc" value=""/>
                                        <jsp:param name="img_MarginImgClass" value=""/>
                                        <jsp:param name="img_Total" value="27"/>
                                        <jsp:param name="img_NamePre" value="imgstep9_2ss"/>
                                        <jsp:param name="img_DefaultImgSrc" value="images/mgcaraddimg.jpg"/>
                                        <jsp:param name="l1div_Style"
                                                   value="width: 100px;height:140px;display: inline-block;text-align: center;margin: auto;"/>
                                        <jsp:param name="img_Style"
                                                   value="width: 100%;height:100px;border-radius:10px;"/>
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

                    <div class="tab-pane fade" id="clTab3">
                        <div class="form-group">
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <%
                                        String upFile3 = "../upfile.inc.jsp";
                                        String imgPreName3 = "imgstep9_3ss";
                                        String[] ssImgs3 = { //设置已有值
                                                !Tools.myIsNull(infodb.get(imgPreName3)) ? infodb.get(imgPreName3) : ""
                                        };
                                        ssImgs3 = ssImgs3[0].split(",");
                                        String sImgs3 = "";
                                        for (int i = 0; i < ssImgs3.length; i++) {
                                            if (ssImgs3[i] != null && !ssImgs3[i].equals("")) {
                                                sImgs3 = sImgs3 + ssImgs3[i] + "|";
                                            }
                                        }
                                    %>
                                    <%-- 可能这里用<%@include file %>模式更适合--%>
                                    <jsp:include page="<%=upFile3%>">
                                        <jsp:param name="img_MarginImgSrc" value=""/>
                                        <jsp:param name="img_MarginImgClass" value=""/>
                                        <jsp:param name="img_Total" value="4"/>
                                        <jsp:param name="img_NamePre" value="imgstep9_3ss"/>
                                        <jsp:param name="img_DefaultImgSrc" value="images/mgcaraddimg.jpg"/>
                                        <jsp:param name="l1div_Style"
                                                   value="width: 100px;height:140px;display: inline-block;text-align: center;margin: auto;"/>
                                        <jsp:param name="img_Style"
                                                   value="width: 100%;height:100px;border-radius:10px;"/>
                                        <jsp:param name="img_FileStyle"
                                                   value="position: absolute;left: 0;top: 0;height: 100%;width: 100%;background: transparent;border: 0;margin: 0;padding: 0;filter: alpha(opacity=0);-moz-opacity: 0;-khtml-opacity: 0;opacity: 0;"/>
                                        <jsp:param name="img_Class" value="imgclass"/>
                                        <jsp:param name="img_FileClass" value="uploadfileclass"/>
                                        <jsp:param name="img_SmallWidth" value="100"/>
                                        <jsp:param name="img_SmallHeight" value="100"/>
                                        <jsp:param name="sImgs" value="<%=sImgs3%>"/>
                                    </jsp:include>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="clTab4">
                        <div class="form-group">
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <%
                                        String upFile4 = "../upfile.inc.jsp";
                                        String imgPreName4 = "imgstep9_4ss";
                                        String[] ssImgs4 = { //设置已有值
                                                !Tools.myIsNull(infodb.get(imgPreName4)) ? infodb.get(imgPreName4) : ""
                                        };
                                        ssImgs4 = ssImgs4[0].split(",");
                                        String sImgs4 = "";
                                        for (int i = 0; i < ssImgs4.length; i++) {
                                            if (ssImgs4[i] != null && !ssImgs4[i].equals("")) {
                                                sImgs4 = sImgs4 + ssImgs4[i] + "|";
                                            }
                                        }
                                    %>
                                    <%-- 可能这里用<%@include file %>模式更适合--%>
                                    <jsp:include page="<%=upFile4%>">
                                        <jsp:param name="img_MarginImgSrc" value=""/>
                                        <jsp:param name="img_MarginImgClass" value=""/>
                                        <jsp:param name="img_Total" value="4"/>
                                        <jsp:param name="img_NamePre" value="imgstep9_4ss"/>
                                        <jsp:param name="img_DefaultImgSrc" value="images/mgcaraddimg.jpg"/>
                                        <jsp:param name="l1div_Style"
                                                   value="width: 100px;height:140px;display: inline-block;text-align: center;margin: auto;"/>
                                        <jsp:param name="img_Style"
                                                   value="width: 100%;height:100px;border-radius:10px;"/>
                                        <jsp:param name="img_FileStyle"
                                                   value="position: absolute;left: 0;top: 0;height: 100%;width: 100%;background: transparent;border: 0;margin: 0;padding: 0;filter: alpha(opacity=0);-moz-opacity: 0;-khtml-opacity: 0;opacity: 0;"/>
                                        <jsp:param name="img_Class" value="imgclass"/>
                                        <jsp:param name="img_FileClass" value="uploadfileclass"/>
                                        <jsp:param name="img_SmallWidth" value="100"/>
                                        <jsp:param name="img_SmallHeight" value="100"/>
                                        <jsp:param name="sImgs" value="<%=sImgs4%>"/>
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
                                <option value="0" selected="selected">请选择</option>
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
    //删除操作
    function showOrders() {
        //定义变量sendData
        var sendData = {
            cn: 'dd_icbc'
        };
        $.ajax({
            url: '/manager/index?cn=car_loanBy&type=into_modal&sdo=form&selBy=icbcName',
            type: 'get',
            dataType: 'json',
            async: true,//异步请求
            cache: false,
            //执行成功的回调函数
            success: function (data) {
                if (data.code) {
                    alert("删除成功！");
                } else {
                    alert("删除失败！");
                }
            },
            //执行失败或错误的回调函数
            error: function (data) {
                alert("删除失败！");
            }
        });
    }
</script>