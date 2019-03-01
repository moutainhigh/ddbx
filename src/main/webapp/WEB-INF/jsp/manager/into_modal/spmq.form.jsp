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
            <h3 class="box-title">提交时间：2019-02-25 11:40:16</h3>
            <div class="box-tools pull-right">

                <h3 class="box-title">订单编号：ICBCKJY0000754</h3>
            </div>
        </div>
        <div class="box-body" id="tab-content">
            <div class="form-group">
                <label class="col-sm-2 control-label">视频面签</label>
                <div class="col-sm-10">
                    <div class="row inline-from">
                        <div class="col-sm-6">
                            <div class="input-group">
                                <span class="input-group-addon">客户姓名</span>
                                <input type="text" class="form-control" id="c_name" name="c_name" placeholder="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">身份证信息</label>
                <div class="col-sm-10">
                    <div class="row inline-from">
                        <div class="col-sm-4">
                            <div class="input-group">
                                <img  id="" name="" onclick="yyclimage(this)" class="img-thumbnail"  style="width: 500px;height: 500px;" src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                <p class="fileUpload_filename ng-binding" style="position:absolute;top:505px;left:220px;font-size:12px;" >身份证</p>
                            </div>

                        </div>
                        <div class="col-sm-4">
                            <div class="row inline-from" style="position:absolute;top:375px;">
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
                                    <jsp:param name="img_Total" value="1"/>
                                    <jsp:param name="img_NamePre" value="videostep1"/>
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
                                    <jsp:param name="img_Accept" value="vedio/*"/>
                                    <jsp:param name="sImgs" value="<%=sImgs1%>"/>
                                </jsp:include>
                                <p class="fileUpload_filename ng-binding" style="position:absolute;top:125px;left:32px;font-size:12px;" >本人照片</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">视频认证</label>
                <div class="col-sm-10">
                    <div class="row inline-from">
                        <div class="col-sm-12" style="padding-top:10px;">
                            <div class="input-group">
                                <p class="fileUpload_filename ng-binding" style="font-size: 16px">身份证验证真实：<span style="color: red">未开始验证</span></p>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="input-group">
                                <p class="fileUpload_filename ng-binding" style="font-size: 16px" >人脸识别相似度：<span style="color: red">未开始验证</span></p>
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
    /*选择省后，动态获取省下面的市，并默认选中你指定的id的市，/ttAjax在Ajax.java中处理
                                            /ttAjax也可以单独使用，比如
                                            /ttAjax?do=opt&cn=kjb_user&id=3&mid_add=100000 //显示创建人id为100000的所有用户，默认选择id为3的记录
                                            * */
    objacl('#state_id', '#city_id', '/ttAjax?do=opt&cn=comm_citys&id=3&state_id=', '${infodb.state_id}', '${infodb.city_id}');
</script>