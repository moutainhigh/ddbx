<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
<em>抵押情况记录：</em>
    <div class="big-conte" style="display: none;">
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
        <strong style="margin-left: 10px;"><i>处理信息：</i></strong><br>
        <!-- ngIf: taskAct.pageName!='cudp'||'_cudp'.indexOf(taskAct.pageName)<=-1 -->
        <!-- ngInclude: '/modules/'+taskAct.menuCode+'/'+taskAct.pageName+'.html' -->
        <div class="task_margin ng-scope" style="border: 1px solid #ccc; border-radius: 10px; background-color: #F7F7F7; padding-top: 10px;">
            <form name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope ng-valid-required ng-valid-pattern ng-valid-maxlength">
                <div class="form-group">
                    <label class="col-sm-2 control-label">抵押查验情况<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-3">
                        <input type="radio" value="1" ${result_map.examineCondition eq 1?"checked":''}  class="ng-pristine ng-untouched ng-valid ng-not-empty" id="" name="">通过
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" value="2" ${result_map.examineCondition eq 2?"checked":''}  class="ng-pristine ng-untouched ng-valid ng-not-empty" id="" name="">不通过
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">车牌号码<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-3">
                        <input id="" name="" value="${result_map.carNo}" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-required ng-valid-pattern ng-valid-maxlength" type="text" pattern="([京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}(([0-9]{5}[DF])|([DF]([A-HJ-NP-Z0-9])[0-9]{4})))|([京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-HJ-NP-Z0-9]{4}[A-HJ-NP-Z0-9挂学警港澳]{1})" maxlength="16" ng-model="task.plateNum" cg-required="" required="required" maxleng_base="8">
                    </div>
                    <!-- 		<div ng-if="rootData.taskDefKey!='loanOrder_plegeinfo_bank'"> -->
                    <!-- 			<label class="col-sm-2 control-label" ng-if="task.isNewCar==null||task.isNewCar==1">上牌日期</label> -->
                    <!-- 			<div class="col-sm-3" ng-if="task.isNewCar==1"> -->
                    <!-- 			<cg-datepicker ng-model="task.applyDate" cg-required></cg-datepicker> -->
                    <!-- 			</div> -->
                    <!-- 			<label class="col-sm-2 control-label" ng-if="task.isNewCar==0">过户日期</label> -->
                    <!-- 			<div class="col-sm-3" ng-if="task.isNewCar==0"> -->
                    <!-- 			<cg-datepicker ng-model="task.applyDate" cg-required></cg-datepicker> -->
                    <!-- 			</div> -->
                    <!-- 		</div> -->
                    <div>
                        <label class="col-sm-2 control-label">抵押完成日期<i class="pull-right text-red">*</i></label>
                        <div style="padding-left:15px;" class="input-group date form_datetime col-md-3" data-date="" data-date-format="yyyy-mm-dd" data-link-field="mortgageEndDate">
                            <input class="form-control" size="16" type="text" value="${fn:substring(result_map.mortgageEndDate,0,10)}" readonly>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                        </div>
                        <input type="hidden" id="" name="" value="" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">登记证书号<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-3">
                        <input id="" name="" value="${result_map.djzsh}" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text">
                    </div>
                    <label class="col-sm-2 control-label">抵押办理人员<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-3">
                        <input id="" name="" value="${result_map.mortgageDisposePeople}" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">上牌方式<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-3">
                       <input type="radio" value="私牌" ${result_map.topStyle eq '私牌'?"checked":''}  class="ng-pristine ng-untouched ng-valid ng-not-empty" id="" name="">私牌
                       &nbsp;&nbsp;&nbsp;&nbsp;
                       <input type="radio" value="公牌" ${result_map.topStyle eq '公牌'?"checked":''}  class="ng-pristine ng-untouched ng-valid ng-not-empty" id="" name="">公牌
                    </div>
                    <label class="col-sm-2 control-label">车辆类别<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-3 ng-scope">
                        <input type="radio" value="国产" ${result_map.carType eq '国产'?"checked":''}  class="ng-pristine ng-untouched ng-valid ng-not-empty" id="" name="">国产
                            &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" value="进口" ${result_map.carType eq '进口'?"checked":''}  class="ng-pristine ng-untouched ng-valid ng-not-empty" id="" name="">进口
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label" >其它说明</label>
                    <div class="col-sm-8" >
                        <textarea rows="3" id="result_msg" name="result_msg" class="form-control ng-pristine ng-untouched ng-valid ng-empty" type="text"><%=result_map.get("result_msg")%></textarea>
                    </div>
                </div>
            </form>
        </div>
    </div></li>
