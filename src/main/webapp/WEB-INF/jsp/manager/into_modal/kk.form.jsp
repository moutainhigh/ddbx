<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.ddbx.tt.data.TtMap" %>
<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@ page import="com.example.ddbx.tt.data.TtList" %>
<%@ page import="com.example.ddbx.tt.tool.DataDic" %>
<%@ page import="static com.example.ddbx.tt.utils.MapUtil.nullToEmpty" %>
<%--
  Created by IntelliJ IDEA.
  User: 86176
  Date: 2019/3/12
  Time: 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    TtMap infodb = (TtMap) request.getAttribute("infodb");
    TtMap minfo = (TtMap) request.getAttribute("minfo");
%>
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
            <%--基础资料--%>
            <div class="form-group">
                <label class="col-sm-1 control-label">基础资料</label>
                <div class="col-sm-10">
                    <div class="row inline-from">
                        <%
                            TtList icbcs = Tools.reclist("select id,c_name from dd_icbc");
                        %>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">关联客户</span>
                                <select class="form-control" id="icbc_id" name="icbc_id">
                                    <option value="0">请选择</option>
                                    <%
                                        for (TtMap icbc : icbcs) {
                                    %>
                                    <option value="<%=icbc.get("id")%>"><%=icbc.get("c_name")%>
                                    </option>
                                    <% }%>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">客户姓名</span>
                                <input type="text" class="form-control" id="c_name" name="c_name" placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">身份证号码</span>
                                <input type="text" class="form-control" id="c_cardno" name="c_cardno" placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">手机号码</span>
                                <input type="text" class="form-control" id="c_tel" name="c_tel" placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">车辆类型</span>
                                <select class="form-control" id="cars_type" name="cars_type">
                                    <%=Tools.dicopt(DataDic.dic_cars_type,infodb.get("cars_type"))%>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">开票价</span>
                                <input type="number" step="0.01" class="form-control" id="kp_price" name="kp_price" placeholder="">
                                <span class="input-group-addon" style="font-size: 16px;">元</span>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">购车分期本金</span>
                                <input type="number" step="0.01" class="form-control" id="gcfqbj" name="gcfqbj" placeholder="">
                                <span class="input-group-addon" style="font-size: 16px;">元</span>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">金融服务费</span>
                                <input type="number" class="form-control" id="jrfw_price" name="jrfw_price"
                                       placeholder="" step="0.01">
                                <span class="input-group-addon" style="font-size: 16px;">元</span>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">贷款总额</span>
                                <input type="number" class="form-control" id="dk_total_price" name="dk_total_price"
                                       placeholder="" step="0.01">
                                <span class="input-group-addon" style="font-size: 16px;">元</span>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">首付金额</span>
                                <input type="number" class="form-control" id="sfje" name="sfje" placeholder="" step="0.01">
                                <span class="input-group-addon" style="font-size: 16px;">元</span>
                            </div>
                        </div>
                        <%
                            TtList aj_banks = Tools.reclist("select * from icbc_banklist");
                        %>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">按揭银行</span>
                                <select class="form-control" id="aj_bank" name="aj_bank">
                                    <option value="0">请选择</option>
                                    <%
                                        for (TtMap aj_bank : aj_banks) {
                                    %>
                                    <option value="<%=aj_bank.get("id")%>"><%=aj_bank.get("name")%>
                                    </option>
                                    <%}%>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">按揭期限</span>
                                <select class="form-control" id="aj_date" name="aj_date">
                                   <%=Tools.dicopt(DataDic.dic_aj_date,infodb.get("aj_date"))%>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">按揭利率</span>
                                <input type="number" step="1" min="0"
                                       onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''"
                                       class="form-control" id="aj_lv" name="aj_lv" placeholder="">
                                <span class="input-group-addon" style="font-size: 16px;">%</span>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">垫资类型</span>
                                <select class="form-control" id="dz_type" name="dz_type">
                                    <%=Tools.dicopt(DataDic.dic_dz_type,infodb.get("dz_type"))%>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                //dicopt功能演示，指定表里面的name和id，并用name组成<option></option>
                String sp = Tools.dicopt("comm_states", 0);//省会，
            %>
            <%--上牌地--%>
            <div class="form-group">
                <label class="col-sm-1 control-label">上牌地</label>
                <div class="col-sm-10">
                    <div class="row inline-from">
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">上牌省</span>
                                <select class="form-control" id="kk_car_stateid" name="kk_car_stateid">
                                    <option value="0">请选择</option>
                                    <%=sp%>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">上牌市</span>
                                <select class="form-control" id="kk_car_cityid" name="kk_car_cityid">
                                    <option value="0">请选择</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--业务地--%>
            <div class="form-group">
                <label class="col-sm-1 control-label">业务地</label>
                <div class="col-sm-10">
                    <div class="row inline-from">
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">业务省</span>
                                <select class="form-control" id="kk_loan_stateid" name="kk_loan_stateid">
                                    <option value="0">请选择</option>
                                    <%=sp%>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">业务市</span>
                                <select class="form-control" id="kk_loan_cityid" name="kk_loan_cityid">
                                    <option value="0">请选择</option>
                                </select>
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
                objacl('#kk_car_stateid', '#kk_car_cityid', '/ttAjax?do=opt&cn=comm_citys&id=3&state_id=', '${infodb.kk_car_stateid}', '${infodb.kk_car_cityid}');
                objacl('#kk_loan_stateid', '#kk_loan_cityid', '/ttAjax?do=opt&cn=comm_citys&id=3&state_id=', '${infodb.kk_loan_stateid}', '${infodb.kk_loan_cityid}');
            </script>
            <%--配偶信息--%>
            <div class="form-group">
                <label class="col-sm-1 control-label">补充材料</label>
                <div class="col-sm-10">
                    <ul id="clTab" class="nav nav-tabs">
                        <li class="active"><a href="#clTab1" data-toggle="tab" aria-expanded="true">主贷人材料</a></li>
                        <li class=""><a href="#clTab2" data-toggle="tab" aria-expanded="false">配偶材料</a></li>
                        <li class=""><a href="#clTab3" data-toggle="tab" aria-expanded="false">共借人1材料</a></li>
                        <li class=""><a href="#clTab4" data-toggle="tab" aria-expanded="false">共借人2材料</a></li>
                    </ul>
                    <div id="clTabContent" class="tab-content">
                        <%
                            TtList bclist =(TtList)request.getAttribute("bclist");

                            for (int i = 1; i <= 4; i++) {
                                TtMap bcmap=new TtMap();
                                if(!bclist.isEmpty()&&bclist.size()>0){
                                   bcmap=bclist.get(i-1);
                                   request.setAttribute("bcmap",bcmap);
                                }
                                if (i == 1) {
                        %>

                        <div class="tab-pane fade active in" id="clTab<%=i%>">
                            <%
                            } else {
                            %>
                            <div class="tab-pane fade" id="clTab<%=i%>">
                                <%
                                    }
                                %>
                                <input id="bc_type<%=i%>" name="bc_type<%=i%>" value="<%=i%>" type="hidden">
                                <div class="form-group" style="margin-top: 10px">
                                    <div class="col-sm-10">
                                        <div class="row inline-from">
                                            <div class="col-sm-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon">婚姻状况</span>
                                                    <select class="form-control" id="hyzk<%=i%>" name="hyzk<%=i%>">
                                                        <%=Tools.dicopt(DataDic.dic_hyzk,bcmap.get("hyzk"))%>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon">个人月收入</span>
                                                    <input value="${bcmap.ysr}" step="0.01" type="number" class="form-control" id="ysr<%=i%>"
                                                           name="ysr<%=i%>"
                                                           placeholder="">
                                                    <span class="input-group-addon" style="font-size: 16px;">元</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon">最高学历</span>
                                                    <select class="form-control" id="xl<%=i%>" name="xl<%=i%>">
                                                        <%=Tools.dicopt(DataDic.dic_xl,bcmap.get("xl"))%>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon">居住状况</span>
                                                    <select class="form-control" id="jzzk<%=i%>" name="jzzk<%=i%>">
                                                        <%=Tools.dicopt(DataDic.dic_jzzk,bcmap.get("jzzk"))%>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon">现住地址</span>
                                                    <input value="${bcmap.xzdz}" type="text" class="form-control" id="xzdz<%=i%>"
                                                           name="xzdz<%=i%>"
                                                           placeholder="">
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon">邮政编码</span>
                                                    <input value="${bcmap.yzbm}" type="text" class="form-control" id="yzbm<%=i%>"
                                                           name="yzbm<%=i%>"
                                                           placeholder="">
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon">工作单位</span>
                                                    <input value="${bcmap.gzdw}"  type="text" class="form-control" id="gzdw<%=i%>"
                                                           name="gzdw<%=i%>"
                                                           placeholder="">
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon">单位电话</span>
                                                    <input value="${bcmap.dwdh}" type="text" class="form-control" id="dwdh<%=i%>"
                                                           name="dwdh<%=i%>"
                                                           placeholder="">
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon">单位地址</span>
                                                    <input value="${bcmap.dwdz}" type="text" class="form-control" id="dwdz<%=i%>"
                                                           name="dwdz<%=i%>"
                                                           placeholder="">
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon">文书地址</span>
                                                    <input value="${bcmap.wsdz}" type="text" class="form-control" id="wsdz<%=i%>"
                                                           name="wsdz<%=i%>"
                                                           placeholder="">
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon">文书送达地址</span>
                                                    <input value="${bcmap.wssddz}" type="text" class="form-control" id="wssddz<%=i%>"
                                                           name="wssddz<%=i%>"
                                                           placeholder="">
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon">单位性质</span>
                                                    <select class="form-control" id="dwxz<%=i%>" name="dwxz<%=i%>">
                                                        <%=Tools.dicopt(DataDic.dic_dwxz,bcmap.get("dwxz"))%>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon">所属行业</span>
                                                    <select class="form-control" id="sshy<%=i%>" name="sshy<%=i%>">
                                                        <%=Tools.dicopt(DataDic.dic_sshy,bcmap.get("sshy"))%>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon">职业</span>
                                                    <select class="form-control" id="zy<%=i%>" name="zy<%=i%>">
                                                        <%=Tools.dicopt(DataDic.dic_zy,bcmap.get("zy"))%>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon">职务</span>
                                                    <select class="form-control" id="zw<%=i%>" name="zw<%=i%>">
                                                        <%=Tools.dicopt(DataDic.dic_zw,bcmap.get("zw"))%>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="input-group">
                                                    <span class="input-group-addon">工作年限</span>
                                                    <input value="${bcmap.gznx}" type="text" class="form-control" id="gznx<%=i%>"
                                                           name="gznx<%=i%>"
                                                           placeholder="">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%
                                }
                            %>
                        </div>


                    </div>
                </div>
            </div>
            <%--紧急联系人-亲属--%>
            <div class="form-group">
                <label class="col-sm-1 control-label">紧急联系人-亲属</label>
                <div class="col-sm-10">
                    <div class="row inline-from">
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">姓名</span>
                                <input type="text" class="form-control" id="jjlxr_c_name" name="jjlxr_c_name"
                                       placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">电话</span>
                                <input type="text" class="form-control" id="jjlxr_c_tel" name="jjlxr_c_tel"
                                       placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">与主贷人关系</span>
                                <input type="text" class="form-control" id="jjlxr_jdrgx" name="jjlxr_jdrgx"
                                       placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">现住地址</span>
                                <input type="text" class="form-control" id="jjlxr_xzdz" name="jjlxr_xzdz"
                                       placeholder="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--紧急联系人-亲属--%>
            <div class="form-group">
                <label class="col-sm-1 control-label">紧急联系人-亲属</label>
                <div class="col-sm-10">
                    <div class="row inline-from">
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">姓名</span>
                                <input type="text" class="form-control" id="qtlxr_c_name" name="qtlxr_c_name"
                                       placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">电话</span>
                                <input type="text" class="form-control" id="qtlxr_c_tel" name="qtlxr_c_tel"
                                       placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">与主贷人关系</span>
                                <input type="text" class="form-control" id="qtlxr_jdrgx" name="qtlxr_jdrgx"
                                       placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">现住地址</span>
                                <input type="text" class="form-control" id="qtlxr_xzdz" name="qtlxr_xzdz"
                                       placeholder="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--材料照片--%>
            <div class="form-group">
                <label class="col-sm-1 control-label">材料照片</label>
                <div class="col-sm-10">
                    <div class="row inline-from" id="imgs_div">
                        <%
                            String upFile1 = "../upfiles.inc.jsp";
                            String imgName = "imgstep3_1,imgstep3_2,imgstep3_3,imgstep3_4,imgstep3_5,imgstep3_6,imgstep3_7,imgstep3_8,imgstep3_9";
                            String imgNames_title = "身份证正面, 身份证反面, 面签照片, 借款人资料1, 借款人资料2, 信用卡申请1, 信用卡申请2, 个人税收声明, 电话调查申请";

                            String[] imgNames= imgName.split(",");
                            String[] imgNames_titles= imgNames_title.split(",");


                                for(int s = 0; s < imgNames.length; s++){
                                String[] ssImgs1 = { //设置已有值
                                        !Tools.myIsNull(infodb.get(imgNames[s])) ? infodb.get(imgNames[s]) : ""
                                };
                                ssImgs1 = ssImgs1[0].split(",");
                                String sImgs1 = "";
                                for (int i = 0; i < ssImgs1.length; i++) {
                                    if (ssImgs1[i] != null && !ssImgs1[i].equals("")) {
                                        sImgs1 = sImgs1 + ssImgs1[i] + "|";
                                    }
                                }

                        %>
                        <%--&lt;%&ndash; 可能这里用<%@include file %>模式更适合&ndash;%&gt;--%>
                        <jsp:include page="<%=upFile1%>">
                            <jsp:param name="img_MarginImgSrc" value=""/>
                            <jsp:param name="img_MarginImgClass" value=""/>
                            <jsp:param name="img_Total" value="1"/>
                            <jsp:param name="img_NamePre" value="<%=imgNames[s]%>"/>
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
                            <jsp:param name="img_title" value="<%=imgNames_titles[s]%>"/>
                        </jsp:include>
                        <%
                            }
                        %>
                        <%
                            String upFile2 = "../upfiles.inc.jsp";
                            String[] ssImgs2 = { //设置已有值
                                    !Tools.myIsNull(infodb.get("imgstep3_1s")) ? infodb.get("imgstep3_1s") : ""
                            };
                            int num=0;
                           if(ssImgs2[0]!=null&&!ssImgs2[0].equals("")&&ssImgs2[0].length()>0){
                            ssImgs2 = ssImgs2[0].split(",");

                            if(ssImgs2.length>0){
                                num=ssImgs2.length;
                            }
                            String sImgs2 = "";
                            for (int i = 0; i < ssImgs2.length; i++) {
                                if (ssImgs2[i] != null && !ssImgs2[i].equals("")) {
                                    sImgs2 = sImgs2 + ssImgs2[i] + "|";
                                }
                            }
                            System.out.println("长度:"+ssImgs2.length);
                        %>
                        <%--&lt;%&ndash; 可能这里用<%@include file %>模式更适合&ndash;%&gt;--%>
                        <jsp:include page="<%=upFile2%>">
                            <jsp:param name="img_MarginImgSrc" value=""/>
                            <jsp:param name="img_MarginImgClass" value=""/>
                            <jsp:param name="img_Total" value="<%=num%>"/>
                            <jsp:param name="img_NamePre" value="imgstep3_1s"/>
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
                            <jsp:param name="img_title" value="补充材料"/>
                        </jsp:include>
                        <%}%>
                        <div style="position: relative;width: 100px;height:140px;display: inline-block;text-align: center;margin: auto;"
                             id="div_imgstep3_1s">
                            <img id="imgstep3_1s_view" onclick="addimgFileup('imgstep3_1s');" name="imgstep3_1s_view" src="images/mgcaraddimg.jpg"
                                 class="imgclass gallery-pic" style="width: 100%;height:100px;border-radius:10px;">
                            <img onclick="addimgFileup('imgstep3_1s');" id="imgstep3_1s_views" name="imgstep3_1s_views"
                                 style="float:center;width:12px;height:12px;text-align:center;display:none;"
                                 src="iframe/dist/img/loading/loading-spinner-grey.gif">
                            <input id="imgstep3_1s_num" name="imgstep3_1s_num" value="<%=num%>" type="hidden"/>
                            <%-- <input type="hidden" id="imgstep3_1" name="imgstep3_1" value="images/mgcaraddimg.jpg">
                            <input type="file" id="upload_imgstep3_1" runat="server" name="upload_immm" accept="image/*" style="position: absolute;left: 0;top: 0;height: 100%;width: 100%;background: transparent;border: 0;margin: 0;padding: 0;filter: alpha(opacity=0);-moz-opacity: 0;-khtml-opacity: 0;opacity: 0;" class="uploadfileclass">--%>
                            <div style="padding-top:20px;"><a href="javascript:addimgFileup('imgstep3_1s');">补充材料</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--相关审核--%>
            <div class="form-group" style="margin-top: 30px">
                <label class="col-sm-1 control-label">相关审核</label>
                <div class="col-sm-10">
                    <div class="row inline-from">
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">当前状态</span>
                                <select class="form-control" id="bc_status" name="bc_status">
                                    <%=Tools.dicopt(DataDic.dic_kk_status,infodb.get("bc_status"))%>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">开卡卡号</span>
                                <input type="text" class="form-control" id="kk_kh" name="kk_kh"
                                       placeholder="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>
    <script>
        //点击生成上传入口
        function addimgFileup(imgName) {
            var num = $("#" + imgName+"_num").val();
            //alert(num);
            num++;
            var newimgName = imgName+num;
            $("#" + imgName+"_num").val(num);
            $("#imgs_div").append(
                "<div style=\"position: relative;width: 100px;height:140px;" +
                "display: inline-block;text-align: center;margin: auto;" +
                "\" id=\"div_" + newimgName + "\" class=\"gallerys\">\n" +
                "<img id=\"" + imgName + "_view"+num+"\" name=\"" + imgName + "_view"+num+"\" src=\"images/mgcaraddimg.jpg\"" +
                " class=\"imgclass gallery-pic\" style=\"width: 100%;height:100px;border-radius:10px;\">\n" +
                "<img id=\"" + imgName + "_view"+num+"s\" name=\"" + imgName + "_view"+num+"s\" style=\"float:center;" +
                "width:12px;height:12px;text-align:center;display:none;\" src=\"iframe/dist/img/loading/loading-spinner-grey.gif\" />" +
                "<input type=\"hidden\" id=\"" + newimgName + "\" name=\"" + newimgName + "\" value=\"images/mgcaraddimg.jpg\" />" +
                "<input type=\"file\" id=\"upload_" + newimgName + "\" runat=\"server\" name=\"upload_immm\" accept=\"image/*\" style=\"position: absolute;left: 0;top: 0;height: 80%;width: 100%;background: transparent;border: 0;margin: 0;padding: 0;filter: alpha(opacity=0);-moz-opacity: 0;-khtml-opacity: 0;opacity: 0\" class=\"uploadfileclass\">" +
                "<div style=\"padding-top:20px;\">" +
                "<a onclick=\"$.openPhotoGallery($('#" + imgName + "_view"+num+"'));\">新增补充材料</a></div>" +
                "</div>" +
                "<script>" +
                "$('#upload_" + newimgName + "').fileUpload({" +
                "\"url\": \"/ttAjaxPost?do=fileup&smallwidth=100&smallheight=100&shuitext=快加认证\"," +
                "\"success\": function (res) {" +
                "eval(\"var data=\" + res);" +
                "var msg = data.msg;" +
                "$('#upload_" + newimgName + "').attr('filename', '');" +
                "$('#upload_" + newimgName + "').val('');" +
                "if (data.url) {" +
                "var imgstep3_9 =data.url;" +
                "var smallimgstep3_9 = data.small ? data.small : data.url;" +
                "if (msg) {" +
                "alert(msg);" +
                "} else {" +
                "$('#" + newimgName + "').val(imgstep3_9);" +
                "$('#" + imgName + "_view"+num+"').attr('src', smallimgstep3_9);" +
                "$('#" + imgName + "_view"+num+"').parents('div.hide:first').removeClass('hide');" +
                "}" +
                "} else {" +
                "if (msg) {" +
                "alert(msg);" +
                "}" +
                "}" +
                "if (typeof (cloaseuplayer) == 'function') {" +
                "cloaseuplayer(\"#" + imgName + "_view"+num+"\");" +
                "}" +
                "}," +
                "'fail': function (res) {" +
                "eval('var data='+res);" +
                "var msg = data.msg;" +
                "if (msg) {" +
                "alert(msg);" +
                "}" +
                "}" +
                "});" +
                "$('#upload_" + newimgName + "').on('change', function () {" +
                "if (typeof (beforeup) == 'function') {" +
                "beforeup(\"#" + imgName + "_view"+num+"\");}" +
                "});</" + "script>"
            );
        }
    </script>