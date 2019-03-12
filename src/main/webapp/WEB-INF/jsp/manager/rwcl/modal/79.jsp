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
    <em>抵押材料至银行：</em>
    <div class="big-conte" style="display: block;">
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
        <div class="task_margin ng-scope" style="border:1px solid #ccc; border-radius: 10px;background-color:#F7F7F7; padding-top:10px;">
            <form name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope ng-valid-required">
                <!-- ngIf: (rootData.taskDefKey == 'loanOrder_postinfo_send' || (task.notarizeEndDate !=null))&&task.justRecord==true -->
                <div class="form-group">
                    <label class="col-sm-2 control-label">快递公司<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-3">
                        <input id="" name="" value="${result_map.courierCompany}" class="form-control ng-pristine ng-untouched ng-valid ng-empty">
                    </div>
                    <!-- ngIf: rootData.taskDefKey == 'loanOrder_postinfo_send'||($parent.taskAct.activityId=='loanOrder_postinfo_send'&&notUseButton) -->
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">快递单号<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-3">
                        <input id="" name="" value="${result_map.orderNo}" class="form-control ng-pristine ng-untouched ng-valid ng-empty">
                    </div>
                    <label class="col-sm-2 control-label">寄出日期<i class="pull-right text-red">*</i></label>
                    <div class="input-group date form_datetime col-md-3" data-date="" data-date-format="yyyy-mm-dd" data-link-field="sendDate">
                        <input class="form-control" size="16" type="text" value="${fn:substring(result_map.sendDate,0,10)}" readonly>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                    </div>
                    <input type="hidden" id="" name="" value="" /><br/>
                </div>
                <!--
                <div class="form-group">
                    <label class="col-sm-2 control-label">快递图片<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-3">
                        <input type="hidden" id="courierImage" name="courierImage" value="" >
                        <input style="display:none" onchange="javascript:setImagePreview();" type="file" value="" id="file" name="file" >
                        <label for="file">
                            <img  id="preview" style="display:block;width:42%;height:100px;border-radius:10px;"  class="img-thumbnail"  src="images/mgcaraddimg.jpg"/>
                        </label>
                    </div>
                </div>
                -->
                <!-- ngIf: rootData.taskDefKey!='loanOrder_postinfo_return' -->
                <div class="form-group">
                    <label class="col-sm-2 control-label">备注</label>
                    <div class="col-sm-8">
                        <textarea id="" name="" rows="3" class="form-control ng-pristine ng-untouched ng-valid ng-empty" type="text"><%=result_map.get("result_msg")%></textarea>
                    </div>
                </div>
</form>
</div>
</div>
</li>
