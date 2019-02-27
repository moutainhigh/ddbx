<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.ddbx.tt.data.TtMap" %>
<%@ page import="com.example.ddbx.tt.tool.Tools" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="admin-content nav-tabs-custom box">
    <div class="box-header with-border">
        <div class="box-header with-border">
            <h3 class="box-title">订单来自：快加云-秦扬</h3>
            <h3 class="box-title">提交时间：2019-02-20 16:57:00</h3>
            <div class="box-tools pull-right">
                <h3 class="box-title">订单编号：</h3>
            </div>
        </div>
        <%
            TtMap infodb = (TtMap) request.getAttribute("infodb");
            TtMap minfo = (TtMap) request.getAttribute("minfo");
            long id_uplevel = 0;
            if (!Tools.myIsNull(infodb.get("id_uplevel"))) {
                id_uplevel = Long.parseLong(infodb.get("id_uplevel"));
            }
        %>
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
                                    String imgPreName1 = "imgstep1_1ss";
                                    String[] ssImgs1 = { //设置已有值
                                            !Tools.myIsNull(infodb.get(imgPreName1)) ? infodb.get(imgPreName1) : ""
                                    };
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
                                    <jsp:param name="img_NamePre" value="imgstep1_1ss"/>
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
                                        String imgPreName2= "imgstep1_2ss";
                                        String[] ssImgs2 = { //设置已有值
                                                !Tools.myIsNull(infodb.get(imgPreName2)) ? infodb.get(imgPreName2) : ""
                                        };
                                        String sImgs2 = "";
                                        for (int i = 0; i < ssImgs2.length; i++) {
                                            sImgs2 = sImgs2 + ssImgs2[i] + "|";
                                        }
                                    %>
                                    <%-- 可能这里用<%@include file %>模式更适合--%>
                                    <jsp:include page="<%=upFile2%>">
                                        <jsp:param name="img_MarginImgSrc" value=""/>
                                        <jsp:param name="img_MarginImgClass" value=""/>
                                        <jsp:param name="img_Total" value="27"/>
                                        <jsp:param name="img_NamePre" value="imgstep1_2ss"/>
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

                    <div class="tab-pane fade" id="clTab3">
                        <div class="form-group">
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <%
                                        String upFile3 = "../upfile.inc.jsp";
                                        String imgPreName3 = "imgstep1_3ss";
                                        String[] ssImgs3 = { //设置已有值
                                                !Tools.myIsNull(infodb.get(imgPreName3)) ? infodb.get(imgPreName3) : ""
                                        };
                                        String sImgs3 = "";
                                        for (int i = 0; i < ssImgs3.length; i++) {
                                            sImgs3 = sImgs3 + ssImgs3[i] + "|";
                                        }
                                    %>
                                    <%-- 可能这里用<%@include file %>模式更适合--%>
                                    <jsp:include page="<%=upFile3%>">
                                        <jsp:param name="img_MarginImgSrc" value=""/>
                                        <jsp:param name="img_MarginImgClass" value=""/>
                                        <jsp:param name="img_Total" value="4"/>
                                        <jsp:param name="img_NamePre" value="imgstep1_3ss"/>
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
                                        String imgPreName4 = "imgstep1_4ss";
                                        String[] ssImgs4 = { //设置已有值
                                                !Tools.myIsNull(infodb.get(imgPreName4)) ? infodb.get(imgPreName4) : ""
                                        };
                                        String sImgs4 = "";
                                        for (int i = 0; i < ssImgs4.length; i++) {
                                            sImgs4 = sImgs4 + ssImgs4[i] + "|";
                                        }
                                    %>
                                    <%-- 可能这里用<%@include file %>模式更适合--%>
                                    <jsp:include page="<%=upFile4%>">
                                        <jsp:param name="img_MarginImgSrc" value=""/>
                                        <jsp:param name="img_MarginImgClass" value=""/>
                                        <jsp:param name="img_Total" value="4"/>
                                        <jsp:param name="img_NamePre" value="imgstep1_4ss"/>
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
                                        <jsp:param name="sImgs" value="<%=sImgs4%>"/>
                                    </jsp:include>
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
