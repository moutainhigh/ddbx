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
<input id="gems_id" name="gems_id" value="<%=minfo.get("id")%>" type="hidden"/>
<input id="gems_fs_id" name="gems_fs_id" value="<%=minfo.get("fsid")%>" type="hidden"/>
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
                <label class="col-sm-2 control-label">主贷人信息</label>
                <div class="col-sm-10">
                    <div class="row inline-from">
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">客户姓名</span>
                                <input type="text" class="form-control" id="c_name" name="c_name" placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">客户身份证号</span>
                                <input type="text" class="form-control" id="c_cardno" name="c_cardno" placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">客户电话</span>
                                <input type="text" class="form-control" id="c_tel" name="c_tel" placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">客户性别</span>
                                <select class="form-control" id="c_sex" name="c_sex">
                                    <option value="0">请选择</option>
                                    <option value="1">男</option>
                                    <option value="2">女</option>
                                </select>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">配偶信息</label>
                <div class="col-sm-10">
                    <div class="row inline-from">
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">配偶姓名</span>
                                <input type="text" class="form-control" id="po_c_name" name="po_c_name"
                                       placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">配偶身份证</span>
                                <input type="text" class="form-control" id="po_c_cardno" name="po_c_cardno"
                                       placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">配偶电话</span>
                                <input type="text" class="form-control" id="po_c_tel" name="po_c_tel" placeholder="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">共同借款人1信息</label>
                <div class="col-sm-10">
                    <div class="row inline-from">
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">共同借款人1姓名</span>
                                <input type="text" class="form-control" id="c_name_gj1" name="c_name_gj1"
                                       placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">共同借款人1身份证</span>
                                <input type="text" class="form-control" id="c_cardno_gj1" name="c_cardno_gj1"
                                       placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">共同借款人1电话</span>
                                <input type="text" class="form-control" id="c_tel_gj1" name="c_tel_gj1" placeholder="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">共同借款人2信息</label>
                <div class="col-sm-10">
                    <div class="row inline-from">
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">共同借款人2姓名</span>
                                <input type="text" class="form-control" id="c_name_gj2" name="c_name_gj2"
                                       placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">共同借款人2身份证</span>
                                <input type="text" class="form-control" id="c_cardno_gj2" name="c_cardno_gj2"
                                       placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">共同借款人2电话</span>
                                <input type="text" class="form-control" id="c_tel_gj2" name="c_tel_gj2" placeholder="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">贷款产品</label>
                <div class="col-sm-10">
                    <div class="row inline-from">
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">按揭银行</span>
                                <select class="form-control" id="bank_id" name="bank_id">
                                    <option value="0">请选择按揭银行</option>
                                    <option value="1">工行绍兴分行</option>
                                    <option value="2">工行武林支行</option>
                                    <option value="3">工行义乌支行</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">贷款产品</span>
                                <select class="form-control" id="loan_tpid" name="loan_tpid">
                                    <option value="0">请选择贷款产品</option>
                                    <option value="1">卡分期</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">业务等级</span>
                                <select class="form-control" id="loan_level" name="loan_level">
                                    <option value="0">请选择业务等级</option>
                                    <option value="1">预期贷款额度10万以下(含10万)</option>
                                    <option value="2">预期贷款额度10万以上</option>
                                </select>
                            </div>
                        </div>
                        <%
                            //dicopt功能演示，指定表里面的name和id，并用name组成<option></option>
                            String sp = Tools.dicopt("comm_states", 0);//省会，
                        %>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">所在省</span>
                                <select class="form-control" id="state_id" name="state_id">
                                    <option value="0">请选择</option>
                                    <%=sp%>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">所在市</span>
                                <select class="form-control" id="city_id" name="city_id">
                                    <option value="0">请选择</option>
                                </select>
                            </div>
                        </div>


                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">erp相关操作</label>
                <div class="col-sm-10">
                    <div class="row inline-from">
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">erp所属类型</span>
                                <select class="form-control" id="type_id" name="type_id">
                                    <option value="0">请选择</option>
                                    <c:forEach var="e" items="${requestScope.erplist}">
                                        <option value="${e.id}" ${infodb.bc_status eq e.id?"selected='selected'":''}>${e.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">相关文件</label>
                <div class="col-sm-8">
                    <ul id="clTab" class="nav nav-tabs">
                        <li class="active"><a href="#clTab1" data-toggle="tab" aria-expanded="false">主贷人</a></li>
                        <li class=""><a href="#clTab2" data-toggle="tab" aria-expanded="true">配偶</a></li>
                        <li class=""><a href="#clTab3" data-toggle="tab" aria-expanded="false">共借人1</a></li>
                        <li class=""><a href="#clTab4" data-toggle="tab" aria-expanded="false">共借人2</a></li>
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
                                            <jsp:param name="img_Total" value="4"/>
                                            <jsp:param name="img_NamePre" value="imgstep1_1ss"/>
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
                                            String imgPreName2 = "imgstep1_2ss";
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
                                            <jsp:param name="img_Total" value="4"/>
                                            <jsp:param name="img_NamePre" value="imgstep1_2ss"/>
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
                                            String imgPreName3 = "imgstep1_3ss";
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
                                            <jsp:param name="img_NamePre" value="imgstep1_3ss"/>
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
                                            String imgPreName4 = "imgstep1_4ss";
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
                                            <jsp:param name="img_NamePre" value="imgstep1_4ss"/>
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
                <label class="col-sm-2 control-label">大数据查询</label>
                <div class="col-sm-8">

                    <ul id="dsjTab" class="nav nav-tabs">
                        <li class="active"><a href="#dsjTab1" data-toggle="tab" aria-expanded="false">主贷人</a></li>
                        <li class=""><a href="#dsjTab2" data-toggle="tab" aria-expanded="true">配偶</a></li>
                        <li class=""><a href="#dsjTab3" data-toggle="tab" aria-expanded="false">共借人1</a></li>
                        <li class=""><a href="#dsjTab4" data-toggle="tab" aria-expanded="false">共借人2</a></li>
                    </ul>
                    <div id="dsjTabContent" class="tab-content">
                        <div class="tab-pane fade active in" id="dsjTab1">
                            <div class="box-body">
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="row inline-from">
                                            <div class="input-group">
                                                <span class="input-group-addon">大数据编码</span>
                                                <input class="form-control" name="zdr_dsj_code" id="zdr_dsj_code"
                                                       value="" type="text">
                                                <span class="input-group-addon">
						<a style="color: #72afd2;"
                           href="">获取编码</a>
						</span>
                                                <span class="input-group-addon">
						<a style="color: #72afd2;" href="">查看报告</a>
						</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="dsjTab2">
                            <div class="box-body">
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="row inline-from">
                                            <div class="input-group">
                                                <span class="input-group-addon">大数据编码</span>
                                                <input class="form-control" name="zdrpo_dsj_code"
                                                       id="zdrpo_dsj_code" value="" type="text">
                                                <span class="input-group-addon">
						<a style="color: #72afd2;" href="javascript:">获取编码</a>
						</span>
                                                <span class="input-group-addon">
						<a style="color: #72afd2;" href="javascript:">查看报告</a>
						</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="dsjTab3">
                            <div class="box-body">
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="row inline-from">
                                            <div class="input-group">
                                                <span class="input-group-addon">大数据编码</span>
                                                <input class="form-control" name="gjr1_dsj_code"
                                                       id="gjr1_dsj_code" value="" type="text">
                                                <span class="input-group-addon">
						<a style="color: #72afd2;" href="javascript:">获取编码</a>
						</span>
                                                <span class="input-group-addon">
						<a style="color: #72afd2;" href="javascript:">查看报告</a>
						</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="dsjTab4">
                            <div class="box-body">
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="row inline-from">
                                            <div class="input-group">
                                                <span class="input-group-addon">大数据编码</span>
                                                <input class="form-control" name="gjr2_dsj_code"
                                                       id="gjr2_dsj_code" value="" type="text">
                                                <span class="input-group-addon">
						<a style="color: #72afd2;" href="javascript:">获取编码</a>
						</span>
                                                <span class="input-group-addon">
						<a style="color: #72afd2;" href="javascript:">查看报告</a>
						</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%----%>
            <div class="form-group">
                <label class="col-sm-2 control-label">征信结果返回</label>
                <div class="col-sm-10">
                    <!--


                    <textarea id="zx_result" name="zx_result" style="width: 80%; height: 200px" class="form-control"></textarea>

                    -->
                    <ul id="zxTab" class="nav nav-tabs">
                        <li class="active">
                            <a href="#tbstep1" data-toggle="tab" aria-expanded="true">主贷人</a>
                        </li>
                        <li class=""><a href="#tbstep2" data-toggle="tab" aria-expanded="false">配偶</a></li>
                        <li class=""><a href="#tbstep3" data-toggle="tab" aria-expanded="false">共借人1</a></li>
                        <li class=""><a href="#tbstep4" data-toggle="tab" aria-expanded="false">共借人2</a></li>
                    </ul>
                    <div id="zxTabContent" class="tab-content">
                        <div class="tab-pane fade active in" id="tbstep1">
                            <div class="box-body">
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="row inline-from">
                                            <textarea id="zdr_zx1_result" name="zdr_zx1_result"
                                                      style="width: 80%; height: 200px" class="form-control"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tbstep2">
                            <div class="box-body">
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="row inline-from">
                                            <textarea id="zdrpo_zx1_result" name="zdrpo_zx1_result"
                                                      style="width: 80%; height: 200px" class="form-control"></textarea>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tbstep3">
                            <div class="box-body">
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="row inline-from">
                                            <textarea id="gjr1_zx1_result" name="gjr1_zx1_result"
                                                      style="width: 80%; height: 200px" class="form-control"></textarea>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tbstep4">
                            <div class="box-body">
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="row inline-from">
                                            <textarea id="gjr2_zx1_result" name="gjr2_zx1_result"
                                                      style="width: 80%; height: 200px" class="form-control"></textarea>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-2 control-label">通融留言：</label>
                <div class="col-sm-10">
                <textarea style="width: 80%; height: 80px" class="form-control" id="tr_msg" name="tr_msg">

                </textarea>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">通融材料：</label>
                <div class="col-sm-10">
                    <div class="row inline-from">
                        <%
                            String upFile1_1 = "../upfile.inc.jsp";
                            String imgPreName1_1 = "imgstep1_5ss";
                            String[] ssImgs1_1 = { //设置已有值
                                    !Tools.myIsNull(infodb.get(imgPreName1_1)) ? infodb.get(imgPreName1_1) : ""
                            };
                            ssImgs1_1=ssImgs1_1[0].split(",");
                            String sImgs1_1 = "";
                            for (int i = 0; i < ssImgs1_1.length; i++) {
                                if(ssImgs1_1[i]!=null&&!ssImgs1_1[i].equals("")) {
                                    sImgs1_1 = sImgs1_1 + ssImgs1_1[i] + "|";
                                }
                            }
                        %>
                        <%-- 可能这里用<%@include file %>模式更适合--%>
                        <jsp:include page="<%=upFile1_1%>">
                            <jsp:param name="img_MarginImgSrc" value=""/>
                            <jsp:param name="img_MarginImgClass" value=""/>
                            <jsp:param name="img_Total" value="4"/>
                            <jsp:param name="img_NamePre" value="imgstep1_5ss"/>
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
                            <jsp:param name="sImgs" value="<%=sImgs1_1%>"/>
                        </jsp:include>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">审核状态(主状态)</label>
                <div class="col-sm-10">
                    <div class="row inline-from">
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">征信审核状态</span>
                                <select class="form-control" id="zx_status" name="zx_status">
                                    <option value="0">请选择</option>
                                    <option value="1">草稿箱</option>
                                    <option value="2">提交查询</option>
                                    <option value="3">审核通过</option>
                                    <option value="4">回退补件</option>
                                    <option value="5">审核不通过</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">通融审核状态</span>
                                <select class="form-control" id="tr_status" name="tr_status">
                                    <option value="0">请选择</option>
                                    <option value="1">提交通融信息</option>
                                    <option value="2">通融不通过</option>
                                    <option value="3">通融通过</option>
                                    <option value="4">通融回退补件</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--相关状态--%>
            <div class="form-group">
                <label class="col-sm-2 control-label">相关状态</label>
                <div class="col-sm-10">
                    <div class="row inline-from">
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">主贷人征信状态</span>
                                <select class="form-control" id="zdr_zx1_tag" name="zdr_zx1_tag">
                                    <option value="0">请选择</option>
                                    <option value="1">通过</option>
                                    <option value="2">不通过</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">主贷人配偶征信状态</span>
                                <select class="form-control" id="zdrpo_zx1_tag" name="zdrpo_zx1_tag">
                                    <option value="0">请选择</option>
                                    <option value="1">通过</option>
                                    <option value="2">不通过</option>
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
                                <span class="input-group-addon">共同借款人1征信状态</span>
                                <select class="form-control" id="gjr1_zx1_tag" name="gjr1_zx1_tag">
                                    <option value="0">请选择</option>
                                    <option value="1">通过</option>
                                    <option value="2">不通过</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">共同借款人2征信状态</span>
                                <select class="form-control" id="gjr2_zx1_tag" name="gjr2_zx1_tag">
                                    <option value="0">请选择</option>
                                    <option value="1">通过</option>
                                    <option value="2">不通过</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%--相关状态--%>
            <div class="form-group">
                <label class="col-sm-2 control-label">留言</label>
                <div class="col-sm-10">
                    <textarea style="width: 80%; height: 200px" class="form-control">


                    </textarea>
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