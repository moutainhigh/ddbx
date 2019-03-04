
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
<li class="text-primary"><em>7.审核收件确认：</em>
    <div class="big-conte" style="display: block;">
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>开始时间：</strong>
            2019-01-24 20:41:21
        </div>
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>处理时间：</strong>
            2019-01-24 20:41:21
        </div>
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>处理人：</strong>韩振杰</div>
        <strong style="margin-left: 10px;"><i>处理信息：</i></strong><br>
        <!-- ngIf: taskAct.pageName!='cudp'||'_cudp'.indexOf(taskAct.pageName)<=-1 -->
        <!-- ngInclude: '/modules/'+taskAct.menuCode+'/'+taskAct.pageName+'.html' -->
        <div class="task_margin ng-scope" style="border: 1px solid #ccc; border-radius: 10px; background-color: #F7F7F7; padding-top: 10px;">
            <form name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope ng-valid-required">
                <div class="form-group">
                    <label class="col-sm-2 control-label">收件确认</label>
                    <div class="col-sm-3">
                        <input id="78_sjqr_7" name="78_sjqr_7" class="form-control">
                    </div>
                    <label class="col-sm-2 control-label">收件日期</label>
                    <div class="col-sm-3">
                        <div class="input-group date ng-isolate-scope ng-empty ng-valid">
                            <input id="78_ksrq_7" name="78_ksrq_7" class="form-control" type="text"><span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">材料复核结果</label>
                    <div class="col-sm-3">
                        <input id="78_clfh_7" name="78_clfh_7" class="form-control">
                    </div>
                    <!-- ngIf: rootData.taskDefKey=='postget'||taskAct.activityId=='postget' -->
                    <!-- ngIf: rootData.taskDefKey=='loanOrder_postget_asun'||rootData.taskDefKey=='loanOrder_postget_bank'||taskAct.activityId=='loanOrder_postget_asun'||taskAct.activityId=='loanOrder_postget_bank' -->
                    <span class="ng-scope"> <label class="col-sm-2 control-label">车牌号码</label>
											<div class="col-sm-3">
												<input id="78_cphm_7" name="78_cphm_7" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text">
											</div>
										</span>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">备注</label>
                    <div class="col-sm-8">
                        <textarea rows="3" id="result_1_msg_7" name="result_1_msg_7" class="form-control ng-pristine ng-untouched ng-valid ng-empty" type="text"></textarea>
                    </div>
                </div>
                <!-- ngIf: !notUseButton -->
                <script type="text/javascript">
                    $(document).ready(function(){
                        var dygd_78=document.getElementById("dygd_"+'78'+"_"+'7').value;
                        if(dygd_78!=null){
                            var json = jQuery.parseJSON(dygd_78);
                            for ( var item in json) {
                                $("#" + item+"_"+'7').val(json[item]);
                            }
                        }
                    });

                </script>
            </form>
        </div>
    </div></li>
