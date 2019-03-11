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

    <em>银行放款结果：</em>
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
                        <label class="col-sm-2 control-label">放款结果<i class="pull-right text-red">*</i></label>
                        <div class="col-sm-3">
                            <input type="radio" value="1" ${result_map.result_code eq 1?"checked":''} name="" id=""  class="ng-pristine ng-untouched ng-valid ng-not-empty">成功
                                &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" value="2" ${result_map.result_code eq 2?"checked":''} name="" id=""  class="ng-pristine ng-untouched ng-valid ng-not-empty">失败
                        </div>
                        <label class="col-sm-2 control-label">放款日期<i class="pull-right text-red">*</i></label>
                        <div style="padding-left:15px;" class="input-group date form_datetime col-md-3" data-date="" data-date-format="yyyy-mm-dd" data-link-field="lendingDate">
                            <input class="form-control" size="16" type="text" value="${fn:substring(result_map.lendingDate,0,10)}" readonly>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                        </div>
                        <input type="hidden" id="lendingDate" name="lendingDate" value="" />
                </div>
                <!-- ngIf: task.auditRet==null ||task.auditRet == 1 -->
                <div class="ng-scope">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">支行<i class="pull-right text-red">*</i></label>
                        <div class="col-sm-3">
                            <input id="yhdksh_61_zh" name="yhdksh_61_zh" value="${result_map.yhdksh_61_zh}" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-required" type="text"  >
                        </div>
                        <label class="col-sm-2 control-label">分期数<i class="pull-right text-red">*</i></label>
                        <div class="col-sm-3">
                            <div class="input-group date ng-isolate-scope ng-not-empty ng-valid ng-valid-required" >
                                <input name="yhdksh_61_fq" id="yhdksh_61_fq" value="${result_map.yhdksh_61_fq}" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text"  ><span class="input-group-addon">期</span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">卡号<i class="pull-right text-red">*</i></label>
                        <div class="col-sm-3">
                            <div class="input-group date ng-isolate-scope ng-not-empty ng-valid" >
                            <input id="yhdksh_61_kh" name="yhdksh_61_kh" value="${result_map.yhdksh_61_kh}"  class="form-control" type="text"><span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        </div>
                    </div>
                    <label class="col-sm-2 control-label">放款金额<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-3">
                        <div class="input-group date ng-isolate-scope ng-not-empty ng-valid ng-valid-required" >
                            <input name="yhdksh_61_je" value="${result_map.yhdksh_61_je}" id="yhdksh_61_je" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-required" type="text" ><span class="input-group-addon">元</span>
                        </div>
                    </div>
                </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" title="首月还款=月还+100">首月还款<i class="pull-right text-red">*</i></label>
                        <div class="col-sm-3">
                            <div class="input-group date ng-isolate-scope ng-not-empty ng-valid ng-valid-required" >
                                <input name="yhdksh_61_syhk" id="yhdksh_61_syhk" value="${result_map.yhdksh_61_syhk}" placeholder="" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text"  ><span class="input-group-addon">元</span>
                            </div>
                        </div>
                        <label class="col-sm-2 control-label" title="月还=金额/分期数(四入五入)">月还<i class="pull-right text-red">*</i></label>
                        <div class="col-sm-3">
                            <div class="input-group date ng-isolate-scope ng-not-empty ng-valid ng-valid-required" >
                                <input name="yhdksh_61_yh" id="yhdksh_61_yh" value="${result_map.yhdksh_61_yh}" placeholder="" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text"  ><span class="input-group-addon">元</span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">首月还款日期<i class="pull-right text-red">*</i></label>
                        <div style="padding-left:15px;" class="input-group date form_datetime col-md-3" data-date="" data-date-format="yyyy-mm-dd" data-link-field="firstMonthPayDate">
                            <input class="form-control" size="16" type="text" value="${fn:substring(result_map.firstMonthPayDate,0,10)}" readonly>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                        </div>
                        <input type="hidden" id="firstMonthPayDate" name="firstMonthPayDate" value="" />
                    </div>
                <!-- ngIf: task.creditsMoney -->
                <!-- 		<div class="form-group">		 -->
                <!-- 			<label class="col-sm-2 control-label">打款至：</label> -->
                <!-- 			<div  class="col-sm-8"> -->
                <!-- 				<input type="radio" value="1000" ng-model="task.orgId" ng-checked="task.orgId==null || task.orgId==1000">资产公司  &nbsp;&nbsp;&nbsp;&nbsp; -->
                <!-- 		        <input type="radio" value="1228" ng-model="task.orgId">网络公司 -->
                <!-- 	       	</div> -->
                <!-- 		</div> -->
                <!-- 	<div class="form-group">
                        <label class="col-sm-2 control-label">垫资金额</label>
                        <div class="col-sm-3">
                            <input class="form-control" type="text"	ng-model="task.payAmount" cg-required required/>
                        </div>
                        <label class="col-sm-2 control-label">差额</label>
                        <div class="col-sm-3">
                            <input class="form-control" type="text" ng-model="task.netting"  ng-value="task.bankAmount-task.payAmount" disabled="true" />(计算方式:放贷额-垫资金额)
                        </div>
                    </div> -->
            </div><!-- end ngIf: task.auditRet==null ||task.auditRet == 1 -->
                <div class="form-group">
                    <label class="col-sm-2 control-label">备注</label>
                    <div class="col-sm-8">
                        <textarea name="result_msg" id="result_msg" rows="3" class="form-control ng-pristine ng-untouched ng-valid ng-empty" type="text"><%=result_map.get("result_msg")%></textarea>
                    </div>
                </div>
            </form>
        </div>
    </div>
</li>

