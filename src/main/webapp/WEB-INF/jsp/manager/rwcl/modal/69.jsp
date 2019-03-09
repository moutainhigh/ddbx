<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@ page import="com.example.ddbx.tt.data.TtMap" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String result_value = request.getParameter("result_value");
    TtMap result_map = new TtMap();
    String admin_name = "";
    String s_time = "";
    if (result_value != null && !result_value.equals("")) {
        result_map = Tools.jsonDeCode_mp(result_value);
    }
    if (!Tools.myIsNull(request.getParameter("admin_name"))) {
        admin_name = request.getParameter("admin_name");
    }
    if (!Tools.myIsNull(request.getParameter("s_time"))) {
        s_time = request.getParameter("s_time");
    }
    String dt_edit = "";
    if (!Tools.myIsNull(request.getParameter("dt_edit"))) {
        dt_edit = request.getParameter("dt_edit");
    }
    System.out.println(result_map+"**********");
    request.setAttribute("result_map", result_map);
%>
<li class="text-primary">
    <em>审核员补资料:</em>
    <div class="big-conte_" >
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>开始时间：</strong>
            <%=s_time%>
        </div>
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>处理时间：</strong>
            <%=dt_edit%>
        </div>
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>处理人：</strong><%=admin_name%>
        </div>
        <strong style="margin-left:10px;"><i>处理信息：</i></strong><br>
        <!-- ngIf: taskAct.pageName!='cudp'||'_cudp'.indexOf(taskAct.pageName)<=-1 -->
        <!-- ngInclude: '/modules/'+taskAct.menuCode+'/'+taskAct.pageName+'.html' -->
        <div class="task_margin ng-scope"  style="border:1px solid #ccc; border-radius: 10px;background-color:#F7F7F7; padding-top:10px;">
            <form id="gsgdsh_69" name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope" >
                <input type="hidden" name="adminid" value="${sessionScope.pd.id}">
                <input type="hidden" name="type_id" value="${requestScope.type_id}">
                <input type="hidden" name="icbc_id" value="${pd.icbc_id}">
                <div class="form-group">
                    <label class="col-sm-2 control-label">客户姓名</label>
                    <div class="col-sm-3">
                        <input  class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text" value="${infodb.c_name}">
                    </div>
                    <span class="ng-hide">
                    <label class="col-sm-2 control-label">编号</label><!--AX年份000001  -->
                    <div class="col-sm-3">
                        <input  class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text" value="${infodb.order_code}">
                    </div>
                    </span>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">备注</label>
                    <div class="col-sm-8">
                        <textarea name="result_1_msg" rows="3" class="form-control ng-pristine ng-untouched ng-valid ng-empty" type="text">
                            ${result_map.result_1_msg}
                        </textarea>
                        <!-- <input class="form-control ng-pristine ng-untouched ng-valid ng-empty" type="text" > -->
                    </div>
                </div>
                <!-- ngIf: !notUseButton -->
            </form>

        </div>
    </div>
</li>
