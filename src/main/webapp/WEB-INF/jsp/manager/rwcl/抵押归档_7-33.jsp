
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="" class="tab-content">
    <style>
        .flex-box{
            display: flex;
            flex-direction: column;
        }
        .flex-box div[class^='flex-row']{
            width: 100%;
        }
        .flex-box .flex-row{
            height: 35px;
        }
        .flex-row-rhcen{
            display: flex;
            justify-content: flex-end;
            align-items: center;
        }
        em{
            cursor: pointer;
        }
        .flex-row-rhcen em{
            padding: 0 5px;
        }
        .flex-rowcen{
            flex: 1;
        }
        .text-primary em{
            display: block;
            font-size: 15px;
            line-height: 25px;
        }
        .text-primary .big-conte{
            background-color:#f7f7f7;
            height:auto!important;
            height:100px;
            display:none;
            min-height:100px;
            padding: 15px 0;
            margin: 15px 0;
            border-radius:10px;
        }
        .big-conte-row span{
            text-align: right;
            padding-right: 15px;
            line-height: 34px;
            width: 25%;
            float: left;

        }
        .big-conte-row input{
            float: left;
            width: 20%;
        }
        .big-conte-row{
            margin: 20px;
            height: 34px;
        }
    </style>
</div>
<li class="text-primary"><em>3.抵押材料寄送至合作商：</em>
    <div class="big-conte" style="display: block;">
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>开始时间：</strong>
            2019-01-24 20:40:24
        </div>
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>处理时间：</strong>
            2019-01-24 20:40:24
        </div>
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>处理人：</strong>韩振杰</div>
        <strong style="margin-left: 10px;"><i>处理信息：</i></strong><br>
        <div class="task_margin ng-scope" style="border: 1px solid #ccc; border-radius: 10px; background-color: #F7F7F7; padding-top: 10px;">
            <form name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope ng-valid-required">
                <!-- 	<div class="form-group" ng-if="notUseButton && task.postRet != null">
<label class="col-sm-2 control-label">收件确认</label>
<div class="col-sm-6">
<input type="radio" value="1" ng-model="task.postRet" disabled="true">已收到
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" value="0" ng-model="task.postRet" disabled="true">未收到
</div>
</div> -->
                <!-- ngIf: (rootData.taskDefKey == 'loanOrder_postinfo_send' || (task.notarizeEndDate !=null))&&task.justRecord==true -->
                <div class="form-group">
                    <label class="col-sm-2 control-label">快递公司</label>
                    <div class="col-sm-3">
                        <input id="74_kdgs_3" name="74_kdgs_3" class="form-control ng-pristine ng-untouched ng-valid ng-empty">
                    </div>
                    <!-- ngIf: rootData.taskDefKey == 'loanOrder_postinfo_send'||($parent.taskAct.activityId=='loanOrder_postinfo_send'&&notUseButton) -->
                    <div ng-if="rootData.taskDefKey == 'loanOrder_postinfo_send'||($parent.taskAct.activityId=='loanOrder_postinfo_send'&amp;&amp;notUseButton)" class="ng-scope">
                        <label class="col-sm-2 control-label">合同编码</label>
                        <div class="col-sm-3">
                            <input id="74_htbm_3" name="74_htbm_3" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" value="FQ-QC-12020212-201">
                        </div>
                    </div>
                    <!-- end ngIf: rootData.taskDefKey == 'loanOrder_postinfo_send'||($parent.taskAct.activityId=='loanOrder_postinfo_send'&&notUseButton) -->
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">快递单号</label>
                    <div class="col-sm-3">
                        <input id="74_kddh_3" name="74_kddh_3" class="form-control ng-pristine ng-untouched ng-valid ng-empty">
                    </div>
                    <label class="col-sm-2 control-label">寄出日期<i class="red">*</i></label>
                    <div class="col-sm-3">
                        <div class="input-group date ng-isolate-scope ng-not-empty ng-valid ng-valid-required">
                            <input id="74_jcrq_3" name="74_jcrq_3" class="form-control" type="text"><span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        </div>
                    </div>
                </div>
                <!-- 									ngIf: !notUseButton
                                                    <br>
                                                    <div style="overflow: hidden; margin-left: 7%">
                                                        ngRepeat: img in task.filepathlist
                                                    </div>
                                                    ngIf: rootData.taskDefKey!='loanOrder_postinfo_return'
                                                    <div style="overflow: hidden; margin-left: 7%" class="ng-scope">
                                                        ngRepeat: img in task.filepathlist
                                                    </div>
                                                    end ngIf: rootData.taskDefKey!='loanOrder_postinfo_return'
                                                    <div class="clear" style="margin-top: 10%"></div>
                                                    <div class="form-group ng-hide">
                                                        <label class="col-sm-2 control-label">车牌号码</label>
                                                        <div class="col-sm-3">
                                                            <input id="bz" name="bz"
                                                                class="form-control ng-pristine ng-untouched ng-valid ng-empty"
                                                                type="text">
                                                        </div>
                                                    </div> -->
                <div class="form-group">
                    <label class="col-sm-2 control-label">备注</label>
                    <div class="col-sm-8">
                        <textarea rows="3" id="bz" name="bz" class="form-control ng-pristine ng-untouched ng-valid ng-empty" type="text"></textarea>
                    </div>
                </div>
                <!-- ngIf: !notUseButton -->
                <script type="text/javascript">
                    $(document).ready(function(){
                        var dygd_74=document.getElementById("dygd_"+'74'+"_"+'3').value;
                        if(dygd_74!=null){
                            var json = jQuery.parseJSON(dygd_74);
                            for ( var item in json) {
                                $("#"+item+"_3").val(json[item]);
                            }
                        }
                    });

                </script>
            </form>
        </div>
    </div></li>
