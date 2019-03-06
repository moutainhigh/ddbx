<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<li class="text-primary"><em>经理审核结果：</em>
    <div class="big-conte" style="display: none;">
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>开始时间：</strong>
        </div>
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>处理时间：</strong>
        </div>
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>处理人：</strong>
        </div>
        <strong style="margin-left: 10px;"><i>处理信息：</i></strong><br>
        <div class="task_margin ng-scope" style="border: 1px solid #ccc; border-radius: 10px; background-color: #F7F7F7; padding-top: 10px;">
            <form name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope" cg-disabled="detail">
                <!-- ngIf: notUseButton -->
                <div class="form-group ng-scope" ng-if="notUseButton">
                    <label class="col-sm-2 control-label">审核结果</label>
                    <div class="col-sm-6">
                        <input type="radio" value="1" ng-model="task.checkRet" id="" name="result_code" class="ng-pristine ng-untouched ng-valid ng-not-empty">过件&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" value="2" ng-model="task.checkRet" id="" name="result_code" class="ng-pristine ng-untouched ng-valid ng-not-empty">过件附条件&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" value="3" ng-model="task.checkRet" id="" name="result_code" class="ng-pristine ng-untouched ng-valid ng-not-empty">回退补件
                    </div>
                </div>
                <!-- end ngIf: notUseButton -->
                <div class="form-group">
                    <label class="col-sm-2 control-label">意见说明</label>
                    <div class="col-sm-8">
                        <textarea rows="3" id="result_msg" name="result_msg" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text" ng-model="task.checkComment"></textarea>
                    </div>
                </div>
            </form>
        </div>
    </div></li>
