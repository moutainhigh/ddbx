<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.example.ddbx.tt.data.TtMap" %>
<%@ page import="com.example.ddbx.tt.tool.Tools" %>
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
    request.setAttribute("result_map", result_map);
%>
<li class="text-primary">
    <em>收款确认：</em>
    <div class="big-conte" style="display: none;">
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>开始时间：</strong>
            <%=s_time%>
        </div>
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>处理时间：</strong>
            <%=dt_edit%>
        </div>
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>处理人：</strong><%=admin_name%>
        </div>
        <strong style="margin-left:10px;">
            <i>处理信息：</i></strong><br>
        <!-- ngIf: taskAct.pageName!='cudp'||'_cudp'.indexOf(taskAct.pageName)<=-1 -->
        <!-- ngInclude: '/modules/'+taskAct.menuCode+'/'+taskAct.pageName+'.html' -->
        <div class="task_margin ng-scope" style="border:1px solid #ccc; border-radius: 10px;background-color:#F7F7F7; padding-top:10px;">
            <form name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope ng-valid-required">
                 <div class="form-group">
                    <label class="col-sm-2 control-label">放款日期<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-3">
                        <input disabled="disable" value="${fn:substring(result_map.fkDate_result,0,10)}" id="fkDate_result" name="fkDate_result" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-required" type="text">
                    </div>
                    <label class="col-sm-2 control-label">放款金额<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-3">
                        <input disabled="disable" value="${result_map.fkje_result}" id="fkje_result" name="fkje_result" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-required" type="text">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">收款情况<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-8">
                        <input id="" name="" type="radio" ${result_map.result_code eq 1?"checked":''} value="1" class="ng-pristine ng-untouched ng-valid ng-not-empty">到账确认，本单已完整  &nbsp;&nbsp;&nbsp;&nbsp;
                        <input id="" name="" type="radio" ${result_map.result_code eq 3?"checked":''} value="3" class="ng-pristine ng-untouched ng-valid ng-not-empty">收款金额不符&nbsp;&nbsp;&nbsp;&nbsp;
                        <input id="" name="" type="radio" ${result_map.result_code eq 2?"checked":''} value="2" class="ng-pristine ng-untouched ng-valid ng-not-empty">未收到款项
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">收款日期<i class="pull-right text-red">*</i></label>
                    <div style="padding-left:15px;" class="input-group date form_datetime col-md-3" data-date="" data-date-format="yyyy-mm-dd" data-link-field="getMoneyDate">
                        <input class="form-control" size="16" type="text" value="${fn:substring(result_map.getMoneyDate,0,10)}" readonly>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                    </div>
                    <input type="hidden" id="getMoneyDate" name="getMoneyDate" value="" />
                    <!-- ngIf: task.creditsMoney -->
                    <!-- ngIf: task.creditsMoney -->
                </div>
                <!-- ngIf: task.recieveRet==0 -->
                <div class="form-group">
                    <label class="col-sm-2 control-label">其它说明<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-8">
                        <textarea id="result_msg" name="result_msg" rows="3" class="form-control ng-pristine ng-untouched ng-valid ng-empty" type="text"><%=result_map.get("result_msg")%></textarea>
                    </div>
                </div>
            </form>
        </div>
    </div>
</li>
