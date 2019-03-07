<<<<<<< HEAD
<%@ page import="com.example.ddbx.tt.data.TtList" %>
<%@ page import="com.example.ddbx.tt.data.TtMap" %>
<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    TtMap infodb = (TtMap) request.getAttribute("infodb");
    TtMap minfo = (TtMap) request.getAttribute("minfo");
    long id_uplevel = 0;
    if (!Tools.myIsNull(infodb.get("id_uplevel"))) {
        id_uplevel = Long.parseLong(infodb.get("id_uplevel"));
    }
    String url = Tools.urlKill("sdo|id|type_id|tab") + "&sdo=form&id=";
    String type_id = (String) request.getAttribute("type_id");

    //获取下一任务节点name
    TtMap modals = (TtMap) request.getAttribute("modals");

    String rwcl_path = "/WEB-INF/jsp/manager/rwcl/";
    if (modals!=null&&!modals.equals("")){
        switch (modals.get("name")) {

            case "开始":
                rwcl_path = rwcl_path + "modal_son/begin.jsp";
                break;
            case "提交查询":
                rwcl_path = rwcl_path + "modal_son/submit.jsp";
                break;
            case "完成":
                rwcl_path = rwcl_path + "modal_son/end.jsp";
                break;
            default:
                rwcl_path = rwcl_path + type_id + "/" + infodb.get("later_status") + ".jsp";
                break;

        }

    } else {
        rwcl_path=rwcl_path+"modal_son/null.jsp";
    }

    TtList erp_stylelist = (TtList) request.getAttribute("erp_stylelist");

    TtList jdlist = (TtList) request.getAttribute("jdlist");

    TtList clgc_list= (TtList) request.getAttribute("clgc_list");
%>
<head>
    <script src="js/jQueryRotate.2.2.js" type="text/javascript"></script>
</head>

<div class="admin-content nav-tabs-custom box">
    <div class="box-header with-border">

        <input type="hidden" name="adminop_tag" value="0">

        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li ${param.tab eq 6?"class='active'":''}>
                    <a href="<%=url%><%=infodb.get("id")%>&type_id=${infodb.type_id}&tab=6">任务处理</a>
                </li>
                <li ${param.tab eq 0?"class='active'":''}>
                    <a href="<%=url%><%=infodb.get("id")%>&type_id=${infodb.type_id}&tab=0">处理过程</a>
                </li>
                <li ${param.tab eq 1?"class='active'":''}><a href="<%=url%><%=infodb.get("id")%>&type_id=${infodb.type_id}&tab=1">基础信息</a></li>
                <li ${param.tab eq 2?"class='active'":''}><a href="<%=url%><%=infodb.get("id")%>&type_id=${infodb.type_id}&tab=2">客户管理</a></li>
                <li ${param.tab eq 3?"class='active'":''}><a href="<%=url%><%=infodb.get("id")%>&type_id=${infodb.type_id}&tab=3">贷款管理</a></li>
                <li ${param.tab eq 4?"class='active'":''}><a href="<%=url%><%=infodb.get("id")%>&type_id=${infodb.type_id}&tab=4">车辆信息</a></li>
                <li ${param.tab eq 5?"class='active'":''}><a href="<%=url%><%=infodb.get("id")%>&type_id=${infodb.type_id}&tab=5">影音材料</a></li>
            </ul>
            <div class="tab-content">

                <div ${param.tab eq 6?"class='tab-pane active'":"class='tab-pane'"} id="tab_6">
                    <c:if test="${param.tab eq 6}">
                        <jsp:include page="<%=rwcl_path%>"></jsp:include>
                    </c:if>
                </div>

                <div ${param.tab eq 0?"class='tab-pane active'":"class='tab-pane'"} id="tab_0">
                    <div class="box-body">
                        <div style="border:1px solid #478FCA;   margin:5px; padding:20px;border-radius: 10px;">
                            <ul id="yw" class="nav nav-tabs">
                                <c:forEach items="${requestScope.clgc_list}" var="c" varStatus="status">
                                    <c:set var="flag" value="true"></c:set>
                                    <c:choose>
                                        <c:when test="${fn:contains(requestScope.erp_stylelist,c.id)}">
                                            <li ${c.id eq requestScope.type_id?"class='active'":'' }>
                                                <c:forEach items="${requestScope.jdlist}" var="e" varStatus="status">
                                                    <c:if test="${c.id eq e.type_id}">
                                                        <a ${c.id eq requestScope.type_id?"style='background-color: rgb(25, 53, 78); color: rgb(255, 255, 255);'":"style='background-color: rgb(51, 122, 183); color: rgb(255, 255, 255);'" }
                                                                id="${c.cn}"
                                                                href="<%=url%>${e.id}&type_id=${c.id}&tab=0"
                                                                class="btn btn-block btn-info">
                                                                ${c.name}
                                                                <%--
                                                                rgb(25, 53, 78) 点击后
                                                                rgb(167, 167, 167) 无内容
                                                                style="background-color: rgb(51, 122, 183); color: rgb(255, 255, 255);"点击前

                                                                style="background-color:#3c8dbc;color: #ffffff;"
                                                                --%>
                                                        </a>
                                                        <c:set var="flag" value="false"></c:set>
                                                    </c:if>

                                                </c:forEach>
                                                <c:set var="flag" value="true"></c:set>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li>
                                                <a style="background-color: rgb(167, 167, 167); color: rgb(255, 255, 255);"
                                                   id="${c.cn}"
                                                   href="javascript:alert('暂无处理过程!!!');"
                                                   class="btn btn-block btn-info">
                                                        ${c.name}
                                                </a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>

                                    <c:choose>
                                        <c:when test="${status.last}">
                                        </c:when>
                                        <c:otherwise>
                                            <li style="display:block;text-align:center; line-height:50px">
                                                <i class="fa fa-long-arrow-right"></i>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>

                                </c:forEach>

                            </ul>
                        </div>
                        <jsp:include page="/WEB-INF/jsp/manager/rwcl/rwcl.jsp"></jsp:include>
                    </div>
                </div>
                <div ${param.tab eq 1?"class='tab-pane active'":"class='tab-pane'"} id="tab_1">
                    <div class="box-header with-border">
                        <h3 class="box-title">基础信息</h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">基础信息</label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">姓名</span>
                                            <input type="text" value="${icbc.c_name}" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="c_name_1" name="c_name_1">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">身份证</span>
                                            <input type="text" value="${icbc.c_cardno}" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="c_cardno_1" name="c_cardno_1">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">电话</span>
                                            <input type="text" value="${icbc.c_tel}" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="c_tel_1" name="c_tel_1">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">性别</span>
                                            <select name="c_sex_1" id="c_sex_1" class="form-control">
                                                <option value="0">请选择性别</option>
                                                <option value="1" ${icbc.c_sex eq 1?"selected='selected'":''}>男</option>
                                                <option value="2" ${icbc.c_sex eq 2?"selected='selected'":''}>女</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">按揭银行</span>
                                            <select id="bank_id_1" name="bank_id_1" class="form-control">
                                                <option value="0">请选择按揭银行</option>
                                                <option value="1" ${icbc.bank_id eq 1?"selected='selected'":''}>工行绍兴分行</option>
                                                <option value="2" ${icbc.bank_id eq 2?"selected='selected'":''}>工行武林支行</option>
                                                <option value="3" ${icbc.bank_id eq 3?"selected='selected'":''}>工行义乌支行</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">贷款产品</span>
                                            <select name="loan_tpid_1" id="loan_tpid_1" class="form-control">
                                                <option value="0">请选择贷款产品</option>
                                                <option value="1" ${icbc.loan_tpid eq 1?"selected='selected'":''}>卡分期</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">业务等级</span>
                                            <select id="loan_level" name="loan_level" class="form-control">
                                                <option value="0">请选择业务等级</option>
                                                <option value="1" ${icbc.loan_level eq 1?"selected='selected'":''}>预期贷款额10万以下（含10万）</option>
                                                <option value="2" ${icbc.loan_level eq 1?"selected='selected'":''}>预期贷款额10万以上</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box-header with-border">
                        <h3 class="box-title">共还人信息</h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">配偶信息</label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">姓名</span>
                                            <input type="text" class="form-control" name="po_c_name" id="po_c_name"
                                                   value="${icbc.po_c_name}">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">身份证</span>
                                            <input type="text" class="form-control" name="po_c_cardno" id="po_c_cardno"
                                                   value="${icbc.po_c_cardno}">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">手机号</span>
                                            <input type="text" class="form-control" name="po_c_tel" id="po_c_tel"
                                                   value="${icbc.po_c_tel}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">共还人1信息</label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">姓名</span>
                                            <input type="text" class="form-control" name="c_name_gj1" id="c_name_gj1"
                                                   value="${icbc.c_name_gj1}">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">身份证</span>
                                            <input type="text" class="form-control" name="c_cardno_gj1"
                                                   id="c_cardno_gj1" value="${icbc.c_cardno_gj1}">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">手机号</span>
                                            <input type="text" class="form-control" name="c_tel_gj1" id="c_tel_gj1"
                                                   value="${icbc.c_tel_gj1}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">共还人2信息</label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">姓名</span>
                                            <input type="text" class="form-control" name="c_name_gj2" id="c_name_gj2"
                                                   value="${icbc.c_name_gj2}">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">身份证</span>
                                            <input type="text" class="form-control" name="c_cardno_gj2"
                                                   id="c_cardno_gj2" value="${icbc.c_cardno_gj2}">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">手机号</span>
                                            <input type="text" class="form-control" name="c_tel_gj2" id="c_tel_gj2"
                                                   value="${icbc.c_tel_gj2}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.tab-pane -->
                <div ${param.tab eq 2?"class='tab-pane active'":"class='tab-pane'"} id="tab_2"><!-- 客户管理 -->
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab_10" data-toggle="tab">主贷人信息</a></li>
                            <li><a href="#tab_11" data-toggle="tab">共还人信息</a></li>
                            <li><a href="#tab_12" data-toggle="tab">紧急联系人</a></li>
                            <li><a href="#tab_13" data-toggle="tab">收入信息</a></li>
                            <li><a href="#tab_14" data-toggle="tab">家庭信息</a></li>
                            <li><a href="#tab_15" data-toggle="tab">房产信息</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab_10">
                                <div class="box-header with-border">
                                    <h3 class="box-title">主贷人信息</h3>
                                </div>
                                <div class="box-body">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">主贷人信息</label>
                                        <div class="col-sm-10">
                                            <div class="row inline-from">
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">姓名</span>
                                                        <input type="text" class="form-control" name="c_name"
                                                               id="c_name" value="${icbc.c_name}">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">拼音</span>
                                                        <input type="text" class="form-control" name="c_name_py"
                                                               id="c_name_py" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">出生日期</span>
                                                        <input type="text" class="form-control" name="birthday"
                                                               id="birthday" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">性别</span>
                                                        <select name="" id="" class="form-control">
                                                            <option value="0">请选择</option>
                                                            <option value="1">大专</option>
                                                            <option value="2">本科</option>
                                                            <option value="3">研究生</option>
                                                            <option value="4">博士</option>
                                                            <option value="5">硕士</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">身份证号</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">业务员姓名</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">所属机构</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">手机号码</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">婚姻状况</span>
                                                        <select name="" id="" class="form-control">
                                                            <option value="0">请选择</option>
                                                            <option value="1">未婚</option>
                                                            <option value="2">已婚</option>
                                                            <option value="3">离异</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">有无子女</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">赌博记录</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">法院经济案</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">最高学历</span>
                                                        <select name="" id="" class="form-control">
                                                            <option value="0">请选择</option>
                                                            <option value="1">大专</option>
                                                            <option value="2">本科</option>
                                                            <option value="3">研究生</option>
                                                            <option value="4">博士</option>
                                                            <option value="5">硕士</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">邮编</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">居住状况</span>
                                                        <select name="" id="" class="form-control">
                                                            <option value="0">请选择</option>
                                                            <option value="1">租房</option>
                                                            <option value="2">自有住房</option>
                                                            <option value="3">其他</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">现住电话</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">单位电话</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">现住地址</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">工作单位</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">单位地址</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">单位性质</span>
                                                        <select name="" id="" class="form-control">
                                                            <option value="0">请选择</option>
                                                            <option value="1">国有</option>
                                                            <option value="2">私有</option>
                                                            <option value="3">民营</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">职业</span>
                                                        <select name="" id="" class="form-control">
                                                            <option value="0">请选择</option>
                                                            <option value="1">公务员</option>
                                                            <option value="2">农民</option>
                                                            <option value="3">工人</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">职务</span>
                                                        <select name="" id="" class="form-control">
                                                            <option value="0">请选择</option>
                                                            <option value="1">总经理</option>
                                                            <option value="2">部门经理</option>
                                                            <option value="3">职员</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">月收入(元)</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">工作年限(年)</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">文书送达地址</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
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
                                                        <button type="button" class="btn btn-block btn-primary">生成合同文件
                                                        </button>
                                                    </div>
                                                </div>

                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <button type="button" class="btn btn-block btn-primary">
                                                            生成Excel文件
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane" id="tab_11">
                                <div class="box-header with-border">
                                    <h3 class="box-title">共还人信息</h3>
                                </div>
                                <div class="box-body">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">共还人信息</label>
                                        <div class="col-sm-10">
                                            <div class="row inline-from">
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">姓名</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">关系</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">月收入(元)</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">学历</span>
                                                        <select name="" id="" class="form-control">
                                                            <option value="0">请选择</option>
                                                            <option value="1">大专</option>
                                                            <option value="2">本科</option>
                                                            <option value="3">研究生</option>
                                                            <option value="4">博士</option>
                                                            <option value="5">硕士</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">现住地址</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">邮政编码</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">工作单位</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">单位地址</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">文书送达地址</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">主要从事或职务</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">联系人级别</span>
                                                        <select name="" id="" class="form-control">
                                                            <option value="0">请选择</option>
                                                            <option value="1">一级</option>
                                                            <option value="2">二级</option>
                                                            <option value="3">三级</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">联系人电话区号</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">手机号码</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">性别</span>
                                                        <select name="" id="" class="form-control">
                                                            <option value="0">请选择</option>
                                                            <option value="1">男</option>
                                                            <option value="2">女</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">婚姻状况</span>
                                                        <select name="" id="" class="form-control">
                                                            <option value="0">请选择</option>
                                                            <option value="1">已婚</option>
                                                            <option value="2">未婚</option>
                                                            <option value="3">离异</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">身份证号</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane" id="tab_12">
                                <div class="box-header with-border">
                                    <h3 class="box-title">紧急联系人</h3>
                                </div>
                                <div class="box-body">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">亲属</label>
                                        <div class="col-sm-10">
                                            <div class="row inline-from">
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">姓名</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">电话</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">与主贷人关系</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label"></label>
                                        <div class="col-sm-10">
                                            <div class="row inline-from">
                                                <div class="col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">地址</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">其他</label>
                                        <div class="col-sm-10">
                                            <div class="row inline-from">
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">姓名</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">电话</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">与主贷人关系</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label"></label>
                                        <div class="col-sm-10">
                                            <div class="row inline-from">
                                                <div class="col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">地址</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane" id="tab_13">
                                <div class="box-header with-border">
                                    <h3 class="box-title">收入信息</h3>
                                </div>
                                <div class="box-body">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">收入信息</label>
                                        <div class="col-sm-10">
                                            <div class="row inline-from">
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">收入类型</span>
                                                        <select name="" id="" class="form-control">
                                                            <option value="0">请选择收入</option>
                                                            <option value="1">工资性收入</option>
                                                            <option value="2">租赁型收入</option>
                                                            <option value="3">经营型收入</option>
                                                            <option value="4">其他收入</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">收入币种</span>
                                                        <select name="" id="" class="form-control">
                                                            <option value="0">请选择</option>
                                                            <option value="1">人民币</option>
                                                            <option value="2">美元</option>
                                                            <option value="3">欧元</option>
                                                            <option value="4">其他</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">月收入(元)</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">家庭月收入(元)</span>
                                                        <input type="text" class="form-control" name=""
                                                               id="" value="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane" id="tab_14">
                                <div class="box-header with-border">
                                    <h3 class="box-title">家庭信息</h3>
                                </div>
                                <div class="box-body">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">家庭信息</label>
                                        <div class="col-sm-10">
                                            <div class="row inline-from">
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">家庭月收入(元)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">供养人数</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">人均月收入(元)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">月负债(万元)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">净资产(元)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">负债(元)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">净资产贷款比</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">年均存款(元)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">人均住房面积(平方)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">住房存款净值(万元)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">有价证券净值(万元)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">实物资产净值(万元)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">对外投资净值(万元)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">自建房净值(万元)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane" id="tab_15">
                                <div class="box-header with-border">
                                    <h3 class="box-title">房产信息</h3>
                                </div>
                                <div class="box-body">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">房产信息</label>
                                        <div class="col-sm-10">
                                            <div class="row inline-from">
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">房屋权属人</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="" disabled="disabled">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">关系</span>
                                                        <select name="" id="" class="form-control" disabled="disabled">
                                                            <option value="">请选择</option>
                                                            <option value="">父子</option>
                                                            <option value="">朋友</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">产权证号</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="" disabled="disabled">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">是否共有资产</span>
                                                        <select name="" id="" class="form-control" disabled="disabled">
                                                            <option value="">请选择</option>
                                                            <option value="">是</option>
                                                            <option value="">否</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">建购价格(元)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="" disabled="disabled">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">所占份额(%)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="" disabled="disabled">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">房屋性质</span>
                                                        <select name="" id="" class="form-control" disabled="disabled">
                                                            <option value="">请选择</option>
                                                            <option value=""></option>
                                                            <option value=""></option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">房屋面积(平方)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="" disabled="disabled">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">房屋地址</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="" disabled="disabled">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">房产抵押情况</span>
                                                        <select name="" id="" class="form-control" disabled="disabled">
                                                            <option value="">请选择</option>
                                                            <option value="">有抵押</option>
                                                            <option value="">无抵押</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon date ng-isolate-scope ng-not-empty ng-valid">买入日期</span>
                                                        <input class="form-control" placeholder="请选择日期" id="cardt1"
                                                               name="cardt1" value="" type="text" disabled="disabled">
                                                        <span class="input-group-addon"><i
                                                                class="fa fa-calendar"></i></span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">评估价格(元)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="" disabled="disabled">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">购房欠款余额(万)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="" disabled="disabled">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.tab-pane -->
                        </div>
                        <!-- /.tab-content -->
                    </div>
                </div>
                <!-- /.tab-pane -->
                <div ${param.tab eq 3?"class='tab-pane active'":"class='tab-pane'"} id="tab_3">
                    <div class="box-header with-border">
                        <h3 class="box-title">贷款管理</h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">贷款信息</label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">开票价(元)</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">评估价(元)</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">贷款本金(元)</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">金融服务费(元)</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">贷款总额(元)</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">首付款(元)</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">首付比例(%)</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">按揭模式</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">卡分期</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">按揭银行</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择按揭银行</option>
                                                <option value="">工行绍兴分行</option>
                                                <option value="">工行上海分行</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">按揭期限</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">12期</option>
                                                <option value="">24期</option>
                                                <option value="">36期</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">贷款利率(%)</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">放贷账号</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">车辆使用人</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">是否公正</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">是</option>
                                                <option value="">否</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">是否垫资</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">提车垫资</option>
                                                <option value="">不垫资</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">开票所在地</label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">所在省</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">1</option>
                                                <option value="">2</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">所在市</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">1</option>
                                                <option value="">2</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">上牌所在地</label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">所在省</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">1</option>
                                                <option value="">2</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">所在市</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">1</option>
                                                <option value="">2</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div ${param.tab eq 4?"class='tab-pane active'":"class='tab-pane'"} id="tab_4">
                    <div class="box-header with-border">
                        <h3 class="box-title">车辆信息</h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">车辆信息</label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">关联客户</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">原车主姓名</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">原车牌号</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">车架号</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">品牌型号</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">发动机号</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">预期价格(元)</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">新车指导价(元)</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">最终评估价(元)</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">现车牌号</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">登记证书编号</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">购车发票号</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">行驶里程(公里)</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">国产/进口</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">国产</option>
                                                <option value="">进口</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">车辆类型</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">新车</option>
                                                <option value="">二手车</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">使用性质</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">运营</option>
                                                <option value="">非运营</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">车辆状况</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">优秀</option>
                                                <option value="">良好</option>
                                                <option value="">一般</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">变速箱</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">自动</option>
                                                <option value="">手动</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">车辆颜色</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">白</option>
                                                <option value="">黑</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon date ng-isolate-scope ng-not-empty ng-valid">出厂日期</span>
                                            <input class="form-control" placeholder="请选择日期" id="cardt1" name="cardt1"
                                                   value="" type="text">
                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon date ng-isolate-scope ng-not-empty ng-valid">初次登记日期</span>
                                            <input class="form-control" placeholder="请选择日期" id="cardt1" name="cardt1"
                                                   value="" type="text">
                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">品牌车型</label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">品牌</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">1</option>
                                                <option value="">2</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">车系</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">1</option>
                                                <option value="">2</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">型号</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">1</option>
                                                <option value="">2</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">上牌地址</label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">所在省</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">1</option>
                                                <option value="">2</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">所在市</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">1</option>
                                                <option value="">2</option>
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
                                            <button type="button" class="btn btn-block btn-primary">查看车辆材料</button>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="input-group">
                                            <button type="button" class="btn btn-block btn-primary">一键下载车辆材料</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <c:if test="${param.tab eq 5}">
                    <div ${param.tab eq 5?"class='tab-pane active'":"class='tab-pane'"} id="tab_5">
                        <div class="box-header with-border">
                            <h3 class="box-title">征信材料</h3>

                        </div>
                        <div class="box-body">
                            <div class="form-group">
                                <label class="col-sm-1 control-label">主贷人材料</label>
                                <div class="col-sm-10">
                                    <div class="row inline-from">
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                     style="width: 100px;height: 100px;"
                                                     src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                                <a class="btn btn-primary btn-download"
                                                   style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                                   href="">↓</a>
                                                <a class="fileUpload_filename ng-binding"
                                                   style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <button type="button" class="btn btn-block btn-primary">补件历史</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-1 control-label">主贷人配偶材料</label>
                                <div class="col-sm-10">
                                    <div class="row inline-from">
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                     style="width: 100px;height: 100px;"
                                                     src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                                <a class="btn btn-primary btn-download"
                                                   style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                                   href="">↓</a>
                                                <a class="fileUpload_filename ng-binding"
                                                   style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                     style="width: 100px;height: 100px;"
                                                     src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                                <a class="btn btn-primary btn-download"
                                                   style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                                   href="">↓</a>
                                                <a class="fileUpload_filename ng-binding"
                                                   style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <button type="button" class="btn btn-block btn-primary">补件历史</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-1 control-label">共还人1材料</label>
                                <div class="col-sm-10">
                                    <div class="row inline-from">
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                     style="width: 100px;height: 100px;"
                                                     src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                                <a class="btn btn-primary btn-download"
                                                   style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                                   href="">↓</a>
                                                <a class="fileUpload_filename ng-binding"
                                                   style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                     style="width: 100px;height: 100px;"
                                                     src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                                <a class="btn btn-primary btn-download"
                                                   style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                                   href="">↓</a>
                                                <a class="fileUpload_filename ng-binding"
                                                   style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <button type="button" class="btn btn-block btn-primary">补件历史</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-1 control-label">共还人2材料</label>
                                <div class="col-sm-10">
                                    <div class="row inline-from">
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                     style="width: 100px;height: 100px;"
                                                     src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                                <a class="btn btn-primary btn-download"
                                                   style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                                   href="">↓</a>
                                                <a class="fileUpload_filename ng-binding"
                                                   style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                     style="width: 100px;height: 100px;"
                                                     src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                                <a class="btn btn-primary btn-download"
                                                   style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                                   href="">↓</a>
                                                <a class="fileUpload_filename ng-binding"
                                                   style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <button type="button" class="btn btn-block btn-primary">补件历史</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-header with-border">
                            <h3 class="box-title">征信通融材料</h3>
                        </div>
                        <div class="box-body">
                            <div class="form-group">
                                <label class="col-sm-1 control-label"></label>
                                <div class="col-sm-10">
                                    <div class="row inline-from">
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                     style="width: 100px;height: 100px;"
                                                     src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                                <a class="btn btn-primary btn-download"
                                                   style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                                   href="">↓</a>
                                                <a class="fileUpload_filename ng-binding"
                                                   style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                     style="width: 100px;height: 100px;"
                                                     src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                                <a class="btn btn-primary btn-download"
                                                   style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                                   href="">↓</a>
                                                <a class="fileUpload_filename ng-binding"
                                                   style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <button type="button" class="btn btn-block btn-primary">补件历史</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-header with-border">
                            <h3 class="box-title">汽车评估材料</h3>
                        </div>
                        <div class="box-body">
                            <div class="form-group">
                                <label class="col-sm-1 control-label"></label>
                                <div class="col-sm-10">
                                    <div class="row inline-from">
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                     style="width: 100px;height: 100px;"
                                                     src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                                <a class="btn btn-primary btn-download"
                                                   style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                                   href="">↓</a>
                                                <a class="fileUpload_filename ng-binding"
                                                   style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                     style="width: 100px;height: 100px;"
                                                     src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                                <a class="btn btn-primary btn-download"
                                                   style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                                   href="">↓</a>
                                                <a class="fileUpload_filename ng-binding"
                                                   style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <button type="button" class="btn btn-block btn-primary">补件历史</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-header with-border">
                            <h3 class="box-title">开卡申请材料</h3>
                        </div>
                        <div class="box-body">
                            <div class="form-group">
                                <label class="col-sm-1 control-label"></label>
                                <div class="col-sm-10">
                                    <div class="row inline-from">
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                     style="width: 100px;height: 100px;"
                                                     src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                                <a class="btn btn-primary btn-download"
                                                   style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                                   href="">↓</a>
                                                <a class="fileUpload_filename ng-binding"
                                                   style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                     style="width: 100px;height: 100px;"
                                                     src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                                <a class="btn btn-primary btn-download"
                                                   style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                                   href="">↓</a>
                                                <a class="fileUpload_filename ng-binding"
                                                   style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <button type="button" class="btn btn-block btn-primary">补件历史</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-header with-border">
                            <h3 class="box-title">开卡申请PDF材料</h3>
                        </div>
                        <div class="box-body">
                            <div class="form-group">
                                <label class="col-sm-1 control-label"></label>
                                <div class="col-sm-10">
                                    <div class="row inline-from">
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                     style="width: 100px;height: 100px;"
                                                     src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                                <a class="btn btn-primary btn-download"
                                                   style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                                   href="">↓</a>
                                                <a class="fileUpload_filename ng-binding"
                                                   style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                     style="width: 100px;height: 100px;"
                                                     src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                                <a class="btn btn-primary btn-download"
                                                   style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                                   href="">↓</a>
                                                <a class="fileUpload_filename ng-binding"
                                                   style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <button type="button" class="btn btn-block btn-primary">补件历史</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-header with-border">
                            <h3 class="box-title">视频材料材料</h3>
                        </div>
                        <div class="box-body">
                            <div class="form-group">
                                <label class="col-sm-1 control-label"></label>
                                <div class="col-sm-10">
                                    <div class="row inline-from">
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                     style="width: 100px;height: 100px;"
                                                     src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                                <a class="btn btn-primary btn-download"
                                                   style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                                   href="">↓</a>
                                                <a class="fileUpload_filename ng-binding"
                                                   style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                     style="width: 100px;height: 100px;"
                                                     src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                                <a class="btn btn-primary btn-download"
                                                   style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                                   href="">↓</a>
                                                <a class="fileUpload_filename ng-binding"
                                                   style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <button type="button" class="btn btn-block btn-primary">补件历史</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-header with-border">
                            <h3 class="box-title">合同材料</h3>
                        </div>
                        <div class="box-body">
                            <div class="form-group">
                                <label class="col-sm-1 control-label"></label>
                                <div class="col-sm-10">
                                    <div class="row inline-from">
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                     style="width: 100px;height: 100px;"
                                                     src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                                <a class="btn btn-primary btn-download"
                                                   style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                                   href="">↓</a>
                                                <a class="fileUpload_filename ng-binding"
                                                   style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                     style="width: 100px;height: 100px;"
                                                     src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                                <a class="btn btn-primary btn-download"
                                                   style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                                   href="">↓</a>
                                                <a class="fileUpload_filename ng-binding"
                                                   style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <button type="button" class="btn btn-block btn-primary">补件历史</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-header with-border">
                            <h3 class="box-title">证明材料</h3>
                        </div>
                        <div class="box-body">
                            <div class="form-group">
                                <label class="col-sm-1 control-label"></label>
                                <div class="col-sm-10">
                                    <div class="row inline-from">
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                     style="width: 100px;height: 100px;"
                                                     src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                                <a class="btn btn-primary btn-download"
                                                   style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                                   href="">↓</a>
                                                <a class="fileUpload_filename ng-binding"
                                                   style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                     style="width: 100px;height: 100px;"
                                                     src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                                <a class="btn btn-primary btn-download"
                                                   style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                                   href="">↓</a>
                                                <a class="fileUpload_filename ng-binding"
                                                   style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <button type="button" class="btn btn-block btn-primary">补件历史</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-header with-border">
                            <h3 class="box-title">其他材料</h3>
                        </div>
                        <div class="box-body">
                            <div class="form-group">
                                <label class="col-sm-1 control-label"></label>
                                <div class="col-sm-10">
                                    <div class="row inline-from">
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                     style="width: 100px;height: 100px;"
                                                     src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                                <a class="btn btn-primary btn-download"
                                                   style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                                   href="">↓</a>
                                                <a class="fileUpload_filename ng-binding"
                                                   style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                     style="width: 100px;height: 100px;"
                                                     src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                                <a class="btn btn-primary btn-download"
                                                   style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                                   href="">↓</a>
                                                <a class="fileUpload_filename ng-binding"
                                                   style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <button type="button" class="btn btn-block btn-primary">补件历史</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-header with-border">
                            <h3 class="box-title">补充材料</h3>
                        </div>
                        <div class="box-body">
                            <div class="form-group">
                                <label class="col-sm-1 control-label"></label>
                                <div class="col-sm-10">
                                    <div class="row inline-from">
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                     style="width: 100px;height: 100px;"
                                                     src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                                <a class="btn btn-primary btn-download"
                                                   style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                                   href="">↓</a>
                                                <a class="fileUpload_filename ng-binding"
                                                   style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                     style="width: 100px;height: 100px;"
                                                     src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                                <a class="btn btn-primary btn-download"
                                                   style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                                   href="">↓</a>
                                                <a class="fileUpload_filename ng-binding"
                                                   style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="input-group">
                                                <button type="button" class="btn btn-block btn-primary">补件历史</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
                <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
        </div>


    </div>
</div>
<script>
=======
<%@ page import="com.example.ddbx.tt.data.TtList" %>
<%@ page import="com.example.ddbx.tt.data.TtMap" %>
<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    TtMap infodb = (TtMap) request.getAttribute("infodb");
    TtMap minfo = (TtMap) request.getAttribute("minfo");
    long id_uplevel = 0;
    if (!Tools.myIsNull(infodb.get("id_uplevel"))) {
        id_uplevel = Long.parseLong(infodb.get("id_uplevel"));
    }
    String url = Tools.urlKill("sdo|id|type_id|tab") + "&sdo=form&id=";
    String type_id = (String) request.getAttribute("type_id");

    //获取下一任务节点name
    TtMap modals = (TtMap) request.getAttribute("modals");

    String rwcl_path = "/WEB-INF/jsp/manager/rwcl/";
    if (modals!=null&&!modals.equals("")){
        switch (modals.get("name")) {

            case "开始":
                rwcl_path = rwcl_path + "modal_son/begin.jsp";
                break;
            case "提交查询":
                rwcl_path = rwcl_path + "modal_son/submit.jsp";
                break;
            case "完成":
                rwcl_path = rwcl_path + "modal_son/end.jsp";
                break;
            default:
                rwcl_path = rwcl_path + type_id + "/" + infodb.get("later_status") + ".jsp";
                break;

        }
    } else {
        rwcl_path=rwcl_path+"modal_son/null.jsp";
    }
    TtList erp_stylelist = (TtList) request.getAttribute("erp_stylelist");
%>
<head>
    <script src="js/jQueryRotate.2.2.js" type="text/javascript"></script>
</head>

<div class="admin-content nav-tabs-custom box">
    <div class="box-header with-border">

        <input type="hidden" name="adminop_tag" value="0">

        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li ${param.tab eq 6?"class='active'":''}>
                    <a href="<%=url%><%=infodb.get("id")%>&type_id=${infodb.type_id}&tab=6">任务处理</a>
                </li>
                <li ${param.tab eq 0?"class='active'":''}>
                    <a href="<%=url%><%=infodb.get("id")%>&type_id=${infodb.type_id}&tab=0">处理过程</a>
                </li>
                <li ${param.tab eq 1?"class='active'":''}><a href="<%=url%><%=infodb.get("id")%>&type_id=${infodb.type_id}&tab=1">基础信息</a></li>
                <li ${param.tab eq 2?"class='active'":''}><a href="<%=url%><%=infodb.get("id")%>&type_id=${infodb.type_id}&tab=2">客户管理</a></li>
                <li ${param.tab eq 3?"class='active'":''}><a href="<%=url%><%=infodb.get("id")%>&type_id=${infodb.type_id}&tab=3">贷款管理</a></li>
                <li ${param.tab eq 4?"class='active'":''}><a href="<%=url%><%=infodb.get("id")%>&type_id=${infodb.type_id}&tab=4">车辆信息</a></li>
                <li ${param.tab eq 5?"class='active'":''}><a href="<%=url%><%=infodb.get("id")%>&type_id=${infodb.type_id}&tab=5">影音材料</a></li>
            </ul>
            <div class="tab-content">

                <div ${param.tab eq 6?"class='tab-pane active'":"class='tab-pane'"} id="tab_6">
                    <c:if test="${param.tab eq 6}">
                        <jsp:include page="<%=rwcl_path%>"></jsp:include>
                    </c:if>
                </div>

                <div ${param.tab eq 0?"class='tab-pane active'":"class='tab-pane'"} id="tab_0">
                    <div class="box-body">
                        <div style="border:1px solid #478FCA;   margin:5px; padding:20px;border-radius: 10px;">
                            <ul id="yw" class="nav nav-tabs">
                                <c:forEach items="${requestScope.clgc_list}" var="c" varStatus="status">
                                    <c:choose>
                                        <c:when test="${fn:contains(requestScope.erp_stylelist,c.id)}">
                                            <li ${c.id eq requestScope.type_id?"class='active'":'' }>
                                                <a ${c.id eq requestScope.type_id?"style='background-color: rgb(25, 53, 78); color: rgb(255, 255, 255);'":"style='background-color: rgb(51, 122, 183); color: rgb(255, 255, 255);'" }
                                                        id="${c.cn}"
                                                        href="<%=url%><%=infodb.get("id")%>&type_id=${c.id}&tab=0"
                                                        class="btn btn-block btn-info">
                                                        ${c.name}
                                                        <%--
                                                        rgb(25, 53, 78) 点击后
                                                        rgb(167, 167, 167) 无内容
                                                        style="background-color: rgb(51, 122, 183); color: rgb(255, 255, 255);"点击前

                                                        style="background-color:#3c8dbc;color: #ffffff;"
                                                        --%>
                                                </a>
                                            </li>

                                        </c:when>
                                        <c:otherwise>
                                            <li ${c.id eq requestScope.type_id?"class='active'":'' }>
                                                <a style="background-color: rgb(167, 167, 167); color: rgb(255, 255, 255);"
                                                   id="${c.cn}"
                                                   href="javascript:alert('暂无处理过程!!!');"
                                                   class="btn btn-block btn-info">
                                                        ${c.name}
                                                </a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${status.last}">
                                        </c:when>
                                        <c:otherwise>
                                            <li style="display:block;text-align:center; line-height:50px">
                                                <i class="fa fa-long-arrow-right"></i>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>

                            </ul>
                        </div>
                        <jsp:include page="/WEB-INF/jsp/manager/rwcl/rwcl.jsp"></jsp:include>
                    </div>
                </div>
                <div ${param.tab eq 1?"class='tab-pane active'":"class='tab-pane'"} id="tab_1">
                    <div class="box-header with-border">
                        <h3 class="box-title">基础信息</h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">基础信息</label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">姓名</span>
                                            <input type="text" value="${icbc.c_name}" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="c_name" name="c_name">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">身份证</span>
                                            <input type="text" value="${icbc.c_cardno}" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="c_cardno" name="c_cardno">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">电话</span>
                                            <input type="text" value="${icbc.c_tel}" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="c_tel" name="c_tel">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">性别</span>
                                            <select name="c_sex" id="c_sex" class="form-control">
                                                <option value="0">请选择性别</option>
                                                <option value="1" ${icbc.c_sex eq 1?"selected='selected'":''}>男</option>
                                                <option value="2" ${icbc.c_sex eq 2?"selected='selected'":''}>女</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">按揭银行</span>
                                            <select id="bank_id" name="bank_id" class="form-control">
                                                <option value="0">请选择按揭银行</option>
                                                <option value="1">工行绍兴分行</option>
                                                <option value="2">工行武林支行</option>
                                                <option value="3">工行义乌支行</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">贷款产品</span>
                                            <select name="loan_tpid" id="loan_tpid" class="form-control">
                                                <option value="0">请选择贷款产品</option>
                                                <option value="1">卡分期</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">业务等级</span>
                                            <select id="loan_level" name="loan_level" class="form-control">
                                                <option value="0">请选择业务等级</option>
                                                <option value="1">预期贷款额10万以下（含10万）</option>
                                                <option value="2">预期贷款额10万以上</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box-header with-border">
                        <h3 class="box-title">共还人信息</h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">配偶信息</label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">姓名</span>
                                            <input type="text" class="form-control" name="po_c_name" id="po_c_name"
                                                   value="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">身份证</span>
                                            <input type="text" class="form-control" name="po_c_cardno" id="po_c_cardno"
                                                   value="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">手机号</span>
                                            <input type="text" class="form-control" name="po_c_tel" id="po_c_tel"
                                                   value="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">共还人1信息</label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">姓名</span>
                                            <input type="text" class="form-control" name="c_name_gj1" id="c_name_gj1"
                                                   value="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">身份证</span>
                                            <input type="text" class="form-control" name="c_cardno_gj1"
                                                   id="c_cardno_gj1" value="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">手机号</span>
                                            <input type="text" class="form-control" name="c_tel_gj1" id="c_tel_gj1"
                                                   value="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">共还人2信息</label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">姓名</span>
                                            <input type="text" class="form-control" name="c_name_gj2" id="c_name_gj2"
                                                   value="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">身份证</span>
                                            <input type="text" class="form-control" name="c_cardno_gj2"
                                                   id="c_cardno_gj2" value="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">手机号</span>
                                            <input type="text" class="form-control" name="c_tel_gj2" id="c_tel_gj2"
                                                   value="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.tab-pane -->
                <div ${param.tab eq 2?"class='tab-pane active'":"class='tab-pane'"} id="tab_2"><!-- 客户管理 -->
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab_10" data-toggle="tab">主贷人信息</a></li>
                            <li><a href="#tab_11" data-toggle="tab">共还人信息</a></li>
                            <li><a href="#tab_12" data-toggle="tab">紧急联系人</a></li>
                            <li><a href="#tab_13" data-toggle="tab">收入信息</a></li>
                            <li><a href="#tab_14" data-toggle="tab">家庭信息</a></li>
                            <li><a href="#tab_15" data-toggle="tab">房产信息</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab_10">
                                <div class="box-header with-border">
                                    <h3 class="box-title">主贷人信息</h3>
                                </div>
                                <div class="box-body">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">主贷人信息</label>
                                        <div class="col-sm-10">
                                            <div class="row inline-from">
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">姓名</span>
                                                        <input type="text" class="form-control" name="c_name"
                                                               id="c_name" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">拼音</span>
                                                        <input type="text" class="form-control" name="c_name_py"
                                                               id="c_name_py" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">出生日期</span>
                                                        <input type="text" class="form-control" name="birthday"
                                                               id="birthday" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">性别</span>
                                                        <select name="" id="" class="form-control">
                                                            <option value="">请选择</option>
                                                            <option value="">大专</option>
                                                            <option value="">本科</option>
                                                            <option value="">研究生</option>
                                                            <option value="">博士</option>
                                                            <option value="">硕士</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">身份证号</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">业务员姓名</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">所属机构</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">手机号码</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">婚姻状况</span>
                                                        <select name="" id="" class="form-control">
                                                            <option value="">请选择</option>
                                                            <option value="">未婚</option>
                                                            <option value="">已婚</option>
                                                            <option value="">离异</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">有无子女</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">赌博记录</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">法院经济案</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">最高学历</span>
                                                        <select name="" id="" class="form-control">
                                                            <option value="">请选择</option>
                                                            <option value="">大专</option>
                                                            <option value="">本科</option>
                                                            <option value="">研究生</option>
                                                            <option value="">博士</option>
                                                            <option value="">硕士</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">邮编</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">居住状况</span>
                                                        <select name="" id="" class="form-control">
                                                            <option value="">请选择</option>
                                                            <option value="">租房</option>
                                                            <option value="">自有住房</option>
                                                            <option value="">其他</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">现住电话</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">单位电话</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">现住地址</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">工作单位</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">单位地址</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">单位性质</span>
                                                        <select name="" id="" class="form-control">
                                                            <option value="">请选择</option>
                                                            <option value="">国有</option>
                                                            <option value="">私有</option>
                                                            <option value="">民营</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">职业</span>
                                                        <select name="" id="" class="form-control">
                                                            <option value="">请选择</option>
                                                            <option value="">公务员</option>
                                                            <option value="">农民</option>
                                                            <option value="">工人</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">职务</span>
                                                        <select name="" id="" class="form-control">
                                                            <option value="">请选择</option>
                                                            <option value="">总经理</option>
                                                            <option value="">部门经理</option>
                                                            <option value="">职员</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">月收入(元)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">工作年限(年)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">文书送达地址</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
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
                                                        <button type="button" class="btn btn-block btn-primary">生成合同文件
                                                        </button>
                                                    </div>
                                                </div>

                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <button type="button" class="btn btn-block btn-primary">
                                                            生成Excel文件
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane" id="tab_11">
                                <div class="box-header with-border">
                                    <h3 class="box-title">共还人信息</h3>
                                </div>
                                <div class="box-body">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">共还人信息</label>
                                        <div class="col-sm-10">
                                            <div class="row inline-from">
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">姓名</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">关系</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">月收入(元)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">学历</span>
                                                        <select name="" id="" class="form-control">
                                                            <option value="">请选择</option>
                                                            <option value="">大专</option>
                                                            <option value="">本科</option>
                                                            <option value="">研究生</option>
                                                            <option value="">博士</option>
                                                            <option value="">硕士</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">现住地址</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">邮政编码</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">工作单位</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">单位地址</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">文书送达地址</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">主要从事或职务</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">联系人级别</span>
                                                        <select name="" id="" class="form-control">
                                                            <option value="">请选择</option>
                                                            <option value="">一级</option>
                                                            <option value="">二级</option>
                                                            <option value="">三级</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">联系人电话区号</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">手机号码</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">性别</span>
                                                        <select name="" id="" class="form-control">
                                                            <option value="">请选择</option>
                                                            <option value="">男</option>
                                                            <option value="">女</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">婚姻状况</span>
                                                        <select name="" id="" class="form-control">
                                                            <option value="">请选择</option>
                                                            <option value="">已婚</option>
                                                            <option value="">未婚</option>
                                                            <option value="">离异</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">身份证号</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane" id="tab_12">
                                <div class="box-header with-border">
                                    <h3 class="box-title">紧急联系人</h3>
                                </div>
                                <div class="box-body">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">亲属</label>
                                        <div class="col-sm-10">
                                            <div class="row inline-from">
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">姓名</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">电话</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">与主贷人关系</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label"></label>
                                        <div class="col-sm-10">
                                            <div class="row inline-from">
                                                <div class="col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">地址</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">其他</label>
                                        <div class="col-sm-10">
                                            <div class="row inline-from">
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">姓名</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">电话</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">与主贷人关系</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label"></label>
                                        <div class="col-sm-10">
                                            <div class="row inline-from">
                                                <div class="col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">地址</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane" id="tab_13">
                                <div class="box-header with-border">
                                    <h3 class="box-title">收入信息</h3>
                                </div>
                                <div class="box-body">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">收入信息</label>
                                        <div class="col-sm-10">
                                            <div class="row inline-from">
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">收入类型</span>
                                                        <select name="" id="" class="form-control">
                                                            <option value="">请选择收入</option>
                                                            <option value="">工资性收入</option>
                                                            <option value="">租赁型收入</option>
                                                            <option value="">经营型收入</option>
                                                            <option value="">其他收入</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">收入币种</span>
                                                        <select name="" id="" class="form-control">
                                                            <option value="">请选择</option>
                                                            <option value="">人民币</option>
                                                            <option value="">美元</option>
                                                            <option value="">欧元</option>
                                                            <option value="">其他</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">月收入(元)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">家庭月收入(元)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane" id="tab_14">
                                <div class="box-header with-border">
                                    <h3 class="box-title">家庭信息</h3>
                                </div>
                                <div class="box-body">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">家庭信息</label>
                                        <div class="col-sm-10">
                                            <div class="row inline-from">
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">家庭月收入(元)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">供养人数</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">人均月收入(元)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">月负债(万元)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">净资产(元)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">负债(元)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">净资产贷款比</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">年均存款(元)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">人均住房面积(平方)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">住房存款净值(万元)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">有价证券净值(万元)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">实物资产净值(万元)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">对外投资净值(万元)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">自建房净值(万元)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane" id="tab_15">
                                <div class="box-header with-border">
                                    <h3 class="box-title">房产信息</h3>
                                </div>
                                <div class="box-body">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">房产信息</label>
                                        <div class="col-sm-10">
                                            <div class="row inline-from">
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">房屋权属人</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="" disabled="disabled">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">关系</span>
                                                        <select name="" id="" class="form-control" disabled="disabled">
                                                            <option value="">请选择</option>
                                                            <option value="">父子</option>
                                                            <option value="">朋友</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">产权证号</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="" disabled="disabled">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">是否共有资产</span>
                                                        <select name="" id="" class="form-control" disabled="disabled">
                                                            <option value="">请选择</option>
                                                            <option value="">是</option>
                                                            <option value="">否</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">建购价格(元)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="" disabled="disabled">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">所占份额(%)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="" disabled="disabled">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">房屋性质</span>
                                                        <select name="" id="" class="form-control" disabled="disabled">
                                                            <option value="">请选择</option>
                                                            <option value=""></option>
                                                            <option value=""></option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">房屋面积(平方)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="" disabled="disabled">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">房屋地址</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="" disabled="disabled">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">房产抵押情况</span>
                                                        <select name="" id="" class="form-control" disabled="disabled">
                                                            <option value="">请选择</option>
                                                            <option value="">有抵押</option>
                                                            <option value="">无抵押</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon date ng-isolate-scope ng-not-empty ng-valid">买入日期</span>
                                                        <input class="form-control" placeholder="请选择日期" id="cardt1"
                                                               name="cardt1" value="" type="text" disabled="disabled">
                                                        <span class="input-group-addon"><i
                                                                class="fa fa-calendar"></i></span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">评估价格(元)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="" disabled="disabled">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <span class="input-group-addon">购房欠款余额(万)</span>
                                                        <input type="text" class="form-control" name="remark"
                                                               id="remark" value="" disabled="disabled">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.tab-pane -->
                        </div>
                        <!-- /.tab-content -->
                    </div>
                </div>
                <!-- /.tab-pane -->
                <div ${param.tab eq 3?"class='tab-pane active'":"class='tab-pane'"} id="tab_3">
                    <div class="box-header with-border">
                        <h3 class="box-title">贷款管理</h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">贷款信息</label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">开票价(元)</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">评估价(元)</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">贷款本金(元)</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">金融服务费(元)</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">贷款总额(元)</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">首付款(元)</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">首付比例(%)</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">按揭模式</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">卡分期</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">按揭银行</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择按揭银行</option>
                                                <option value="">工行绍兴分行</option>
                                                <option value="">工行上海分行</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">按揭期限</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">12期</option>
                                                <option value="">24期</option>
                                                <option value="">36期</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">贷款利率(%)</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">放贷账号</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">车辆使用人</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">是否公正</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">是</option>
                                                <option value="">否</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">是否垫资</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">提车垫资</option>
                                                <option value="">不垫资</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">开票所在地</label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">所在省</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">1</option>
                                                <option value="">2</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">所在市</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">1</option>
                                                <option value="">2</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">上牌所在地</label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">所在省</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">1</option>
                                                <option value="">2</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">所在市</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">1</option>
                                                <option value="">2</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div ${param.tab eq 4?"class='tab-pane active'":"class='tab-pane'"} id="tab_4">
                    <div class="box-header with-border">
                        <h3 class="box-title">车辆信息</h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">车辆信息</label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">关联客户</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">原车主姓名</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">原车牌号</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">车架号</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">品牌型号</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">发动机号</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">预期价格(元)</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">新车指导价(元)</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">最终评估价(元)</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">现车牌号</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">登记证书编号</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">购车发票号</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">行驶里程(公里)</span>
                                            <input type="text" class="form-control"
                                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                                   id="">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">国产/进口</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">国产</option>
                                                <option value="">进口</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">车辆类型</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">新车</option>
                                                <option value="">二手车</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">使用性质</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">运营</option>
                                                <option value="">非运营</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">车辆状况</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">优秀</option>
                                                <option value="">良好</option>
                                                <option value="">一般</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">变速箱</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">自动</option>
                                                <option value="">手动</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon">车辆颜色</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">白</option>
                                                <option value="">黑</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon date ng-isolate-scope ng-not-empty ng-valid">出厂日期</span>
                                            <input class="form-control" placeholder="请选择日期" id="cardt1" name="cardt1"
                                                   value="" type="text">
                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <span class="input-group-addon date ng-isolate-scope ng-not-empty ng-valid">初次登记日期</span>
                                            <input class="form-control" placeholder="请选择日期" id="cardt1" name="cardt1"
                                                   value="" type="text">
                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">品牌车型</label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">品牌</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">1</option>
                                                <option value="">2</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">车系</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">1</option>
                                                <option value="">2</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">型号</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">1</option>
                                                <option value="">2</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">上牌地址</label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">所在省</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">1</option>
                                                <option value="">2</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="input-group">
                                            <span class="input-group-addon">所在市</span>
                                            <select name="" id="" class="form-control">
                                                <option value="">请选择</option>
                                                <option value="">1</option>
                                                <option value="">2</option>
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
                                            <button type="button" class="btn btn-block btn-primary">查看车辆材料</button>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="input-group">
                                            <button type="button" class="btn btn-block btn-primary">一键下载车辆材料</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div ${param.tab eq 5?"class='tab-pane active'":"class='tab-pane'"} id="tab_5">
                    <div class="box-header with-border">
                        <h3 class="box-title">征信材料</h3>

                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">主贷人材料</label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-1">
                                        <div class="input-group">
                                            <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                 style="width: 100px;height: 100px;"
                                                 src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                            <a class="btn btn-primary btn-download"
                                               style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                               href="">↓</a>
                                            <a class="fileUpload_filename ng-binding"
                                               style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-1">
                                        <div class="input-group">
                                            <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                 style="width: 100px;height: 100px;"
                                                 src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                            <a class="btn btn-primary btn-download"
                                               style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                               href="">↓</a>
                                            <a class="fileUpload_filename ng-binding"
                                               style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <button type="button" class="btn btn-block btn-primary">补件历史</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">主贷人配偶材料</label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-1">
                                        <div class="input-group">
                                            <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                 style="width: 100px;height: 100px;"
                                                 src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                            <a class="btn btn-primary btn-download"
                                               style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                               href="">↓</a>
                                            <a class="fileUpload_filename ng-binding"
                                               style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-1">
                                        <div class="input-group">
                                            <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                 style="width: 100px;height: 100px;"
                                                 src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                            <a class="btn btn-primary btn-download"
                                               style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                               href="">↓</a>
                                            <a class="fileUpload_filename ng-binding"
                                               style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <button type="button" class="btn btn-block btn-primary">补件历史</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">共还人1材料</label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-1">
                                        <div class="input-group">
                                            <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                 style="width: 100px;height: 100px;"
                                                 src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                            <a class="btn btn-primary btn-download"
                                               style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                               href="">↓</a>
                                            <a class="fileUpload_filename ng-binding"
                                               style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-1">
                                        <div class="input-group">
                                            <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                 style="width: 100px;height: 100px;"
                                                 src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                            <a class="btn btn-primary btn-download"
                                               style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                               href="">↓</a>
                                            <a class="fileUpload_filename ng-binding"
                                               style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <button type="button" class="btn btn-block btn-primary">补件历史</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">共还人2材料</label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-1">
                                        <div class="input-group">
                                            <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                 style="width: 100px;height: 100px;"
                                                 src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                            <a class="btn btn-primary btn-download"
                                               style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                               href="">↓</a>
                                            <a class="fileUpload_filename ng-binding"
                                               style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-1">
                                        <div class="input-group">
                                            <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                 style="width: 100px;height: 100px;"
                                                 src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                            <a class="btn btn-primary btn-download"
                                               style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                               href="">↓</a>
                                            <a class="fileUpload_filename ng-binding"
                                               style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <button type="button" class="btn btn-block btn-primary">补件历史</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box-header with-border">
                        <h3 class="box-title">征信通融材料</h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label"></label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-1">
                                        <div class="input-group">
                                            <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                 style="width: 100px;height: 100px;"
                                                 src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                            <a class="btn btn-primary btn-download"
                                               style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                               href="">↓</a>
                                            <a class="fileUpload_filename ng-binding"
                                               style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-1">
                                        <div class="input-group">
                                            <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                 style="width: 100px;height: 100px;"
                                                 src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                            <a class="btn btn-primary btn-download"
                                               style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                               href="">↓</a>
                                            <a class="fileUpload_filename ng-binding"
                                               style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <button type="button" class="btn btn-block btn-primary">补件历史</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box-header with-border">
                        <h3 class="box-title">汽车评估材料</h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label"></label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-1">
                                        <div class="input-group">
                                            <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                 style="width: 100px;height: 100px;"
                                                 src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                            <a class="btn btn-primary btn-download"
                                               style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                               href="">↓</a>
                                            <a class="fileUpload_filename ng-binding"
                                               style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-1">
                                        <div class="input-group">
                                            <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                 style="width: 100px;height: 100px;"
                                                 src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                            <a class="btn btn-primary btn-download"
                                               style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                               href="">↓</a>
                                            <a class="fileUpload_filename ng-binding"
                                               style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <button type="button" class="btn btn-block btn-primary">补件历史</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box-header with-border">
                        <h3 class="box-title">开卡申请材料</h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label"></label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-1">
                                        <div class="input-group">
                                            <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                 style="width: 100px;height: 100px;"
                                                 src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                            <a class="btn btn-primary btn-download"
                                               style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                               href="">↓</a>
                                            <a class="fileUpload_filename ng-binding"
                                               style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-1">
                                        <div class="input-group">
                                            <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                 style="width: 100px;height: 100px;"
                                                 src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                            <a class="btn btn-primary btn-download"
                                               style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                               href="">↓</a>
                                            <a class="fileUpload_filename ng-binding"
                                               style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <button type="button" class="btn btn-block btn-primary">补件历史</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box-header with-border">
                        <h3 class="box-title">开卡申请PDF材料</h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label"></label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-1">
                                        <div class="input-group">
                                            <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                 style="width: 100px;height: 100px;"
                                                 src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                            <a class="btn btn-primary btn-download"
                                               style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                               href="">↓</a>
                                            <a class="fileUpload_filename ng-binding"
                                               style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-1">
                                        <div class="input-group">
                                            <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                 style="width: 100px;height: 100px;"
                                                 src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                            <a class="btn btn-primary btn-download"
                                               style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                               href="">↓</a>
                                            <a class="fileUpload_filename ng-binding"
                                               style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <button type="button" class="btn btn-block btn-primary">补件历史</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box-header with-border">
                        <h3 class="box-title">视频材料材料</h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label"></label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-1">
                                        <div class="input-group">
                                            <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                 style="width: 100px;height: 100px;"
                                                 src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                            <a class="btn btn-primary btn-download"
                                               style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                               href="">↓</a>
                                            <a class="fileUpload_filename ng-binding"
                                               style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-1">
                                        <div class="input-group">
                                            <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                 style="width: 100px;height: 100px;"
                                                 src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                            <a class="btn btn-primary btn-download"
                                               style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                               href="">↓</a>
                                            <a class="fileUpload_filename ng-binding"
                                               style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <button type="button" class="btn btn-block btn-primary">补件历史</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box-header with-border">
                        <h3 class="box-title">合同材料</h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label"></label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-1">
                                        <div class="input-group">
                                            <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                 style="width: 100px;height: 100px;"
                                                 src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                            <a class="btn btn-primary btn-download"
                                               style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                               href="">↓</a>
                                            <a class="fileUpload_filename ng-binding"
                                               style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-1">
                                        <div class="input-group">
                                            <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                 style="width: 100px;height: 100px;"
                                                 src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                            <a class="btn btn-primary btn-download"
                                               style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                               href="">↓</a>
                                            <a class="fileUpload_filename ng-binding"
                                               style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <button type="button" class="btn btn-block btn-primary">补件历史</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box-header with-border">
                        <h3 class="box-title">证明材料</h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label"></label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-1">
                                        <div class="input-group">
                                            <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                 style="width: 100px;height: 100px;"
                                                 src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                            <a class="btn btn-primary btn-download"
                                               style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                               href="">↓</a>
                                            <a class="fileUpload_filename ng-binding"
                                               style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-1">
                                        <div class="input-group">
                                            <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                 style="width: 100px;height: 100px;"
                                                 src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                            <a class="btn btn-primary btn-download"
                                               style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                               href="">↓</a>
                                            <a class="fileUpload_filename ng-binding"
                                               style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <button type="button" class="btn btn-block btn-primary">补件历史</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box-header with-border">
                        <h3 class="box-title">其他材料</h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label"></label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-1">
                                        <div class="input-group">
                                            <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                 style="width: 100px;height: 100px;"
                                                 src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                            <a class="btn btn-primary btn-download"
                                               style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                               href="">↓</a>
                                            <a class="fileUpload_filename ng-binding"
                                               style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-1">
                                        <div class="input-group">
                                            <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                 style="width: 100px;height: 100px;"
                                                 src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                            <a class="btn btn-primary btn-download"
                                               style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                               href="">↓</a>
                                            <a class="fileUpload_filename ng-binding"
                                               style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <button type="button" class="btn btn-block btn-primary">补件历史</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box-header with-border">
                        <h3 class="box-title">补充材料</h3>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label"></label>
                            <div class="col-sm-10">
                                <div class="row inline-from">
                                    <div class="col-sm-1">
                                        <div class="input-group">
                                            <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                 style="width: 100px;height: 100px;"
                                                 src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                            <a class="btn btn-primary btn-download"
                                               style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                               href="">↓</a>
                                            <a class="fileUpload_filename ng-binding"
                                               style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-1">
                                        <div class="input-group">
                                            <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                 style="width: 100px;height: 100px;"
                                                 src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                            <a class="btn btn-primary btn-download"
                                               style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                               href="">↓</a>
                                            <a class="fileUpload_filename ng-binding"
                                               style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group">
                                            <button type="button" class="btn btn-block btn-primary">补件历史</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
        </div>


    </div>
</div>
<script>
>>>>>>> 0518842038f8a84fc06c78d40aa2c0e041fcac24
</script>