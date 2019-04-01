<%@ page import="com.example.ddbx.tt.data.TtList" %>
<%@ page import="com.example.ddbx.tt.data.TtMap" %>
<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@ page import="com.example.ddbx.tt.utils.StringUtils" %>
<%@ page import="com.example.ddbx.tt.tool.DataDic" %>
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
    if (modals != null && !modals.equals("")) {
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
        rwcl_path = rwcl_path + "modal_son/null.jsp";
    }

    TtList erp_stylelist = (TtList) request.getAttribute("erp_stylelist");

    TtList jdlist = (TtList) request.getAttribute("jdlist");

    TtList clgc_list = (TtList) request.getAttribute("clgc_list");
%>
<head>
    <script src="js/jQueryRotate.2.2.js" type="text/javascript"></script>
</head>

<div class="admin-content nav-tabs-custom box">
    <div class="box-header with-border">

        <input type="hidden" name="adminop_tag" value="0">

        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <c:if test="${param.cn eq 'mytask'}">
                    <li ${param.tab eq 6?"class='active'":''}>
                        <a href="<%=url%><%=infodb.get("id")%>&type_id=${infodb.type_id}&tab=6">任务处理</a>
                    </li>
                </c:if>
                <li ${param.tab eq 0?"class='active'":''}>
                    <a href="<%=url%><%=infodb.get("id")%>&type_id=${infodb.type_id}&tab=0">处理过程</a>
                </li>
                <li ${param.tab eq 1?"class='active'":''}><a
                        href="<%=url%><%=infodb.get("id")%>&type_id=${infodb.type_id}&tab=1">基础信息</a></li>
                <li ${param.tab eq 2?"class='active'":''}><a
                        href="<%=url%><%=infodb.get("id")%>&type_id=${infodb.type_id}&tab=2">客户管理</a></li>
                <li ${param.tab eq 3?"class='active'":''}><a
                        href="<%=url%><%=infodb.get("id")%>&type_id=${infodb.type_id}&tab=3">贷款管理</a></li>
                <li ${param.tab eq 4?"class='active'":''}><a
                        href="<%=url%><%=infodb.get("id")%>&type_id=${infodb.type_id}&tab=4">车辆信息</a></li>
                <li ${param.tab eq 5?"class='active'":''}>
                    <a href="<%=url%><%=infodb.get("id")%>&type_id=${infodb.type_id}&tab=5">影音材料</a>
                </li>
            </ul>
            <div class="tab-content">
                <c:if test="${param.cn eq 'mytask'}">
                    <div ${param.tab eq 6?"class='tab-pane active'":"class='tab-pane'"} id="tab_6">
                        <c:if test="${param.tab eq 6}">
                            <jsp:include page="<%=rwcl_path%>"></jsp:include>
                        </c:if>
                    </div>
                </c:if>
                <div ${param.tab eq 0?"class='tab-pane active'":"class='tab-pane'"} id="tab_0">
                    <div class="box-body">
                        <div style="border:1px solid #478FCA;   margin:5px; padding:20px;border-radius: 10px;">
                            <ul id="yw" class="nav nav-tabs">
                                <c:forEach items="${requestScope.clgc_list}" var="c" varStatus="status">
                                    <c:set var="flag" value="true"></c:set>
                                    <c:choose>
                                        <c:when test="${fn:contains(requestScope.erp_stylelist,c.id)}">
                                            <li ${c.id eq requestScope.type_id?"class='active'":'' }>
                                                <c:forEach items="${requestScope.jdlist}" var="e">

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
                <script>
                    <%
                    url=Tools.urlKill("cn|type|sdo|tab|type_id|id");
                    %>
                    //需要手动添加板块配置
                    function adderp(cn, type_id) {
                        switch (cn) {
                            case "ywxxxg":
                                if (window.confirm('你确定要添加吗？')) {
                                    //alert('<%=url%>&cn=ywxxxg&type=rwcl&sdo=float&type_id='+type_id);
                                    $("#erpmodal").modal({remote: '<%=url%>&cn=ywxxxg&type=rwcl&sdo=float&type_id=' + type_id});
                                }
                                break;
                            default:
                                alert("暂无处理过程!!!");
                                break;
                        }
                    }
                </script>
                <!--弹窗框体开始-->
                <div class="modal fade" id="erpmodal" role="dialog" data-backdrop="static">
                    <div class="modal-dialog" role="document" style="width: 800px;">
                        <div id="mycontent" class="modal-content">
                            <!--将在这里载入链接页面-->
                        </div>
                    </div>
                </div>
                <c:choose>
                    <c:when test="${param.tab eq 1}">
                        <jsp:include page="/WEB-INF/jsp/manager/rwcl/basic/jcxx.jsp"></jsp:include>
                    </c:when>
                    <c:when test="${param.tab eq 2}">
                        <jsp:include page="/WEB-INF/jsp/manager/rwcl/basic/khgl.jsp"></jsp:include>
                    </c:when>
                    <c:when test="${param.tab eq 3}">
                        <jsp:include page="/WEB-INF/jsp/manager/rwcl/basic/dkgl.jsp"></jsp:include>
                    </c:when>
                    <c:when test="${param.tab eq 4}">
                        <jsp:include page="/WEB-INF/jsp/manager/rwcl/basic/clgl.jsp"></jsp:include>
                    </c:when>
                    <c:when test="${param.tab eq 5}">
                        <jsp:include page="/WEB-INF/jsp/manager/rwcl/basic/yycl.jsp"></jsp:include>
                    </c:when>
                    <c:otherwise>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <%--

            </div>
        </div>--%>
