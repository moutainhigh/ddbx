
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
<li class="text-primary">
    <em>3.公司收件确认：</em>
    <div class="big-conte" style="display: block;">
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>开始时间：</strong>
            2019-02-20 17:02:57
        </div>
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>处理时间：</strong>
            2019-02-20 17:03:08
        </div>
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>处理人：</strong>秦扬</div>
        <strong style="margin-left:10px;"><i>处理信息：</i></strong><br>
        <!-- ngIf: taskAct.pageName!='cudp'||'_cudp'.indexOf(taskAct.pageName)<=-1 -->
        <!-- ngInclude: '/modules/'+taskAct.menuCode+'/'+taskAct.pageName+'.html' -->
        <div class="task_margin ng-scope" style="border:1px solid #ccc; border-radius: 10px;background-color:#F7F7F7; padding-top:10px;">
            <form name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope">
                <div style="display:none;">
                    <textarea id="inObj_58_3">{"58_date":"2019-02-21","58_msg":"已收到"}</textarea>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">收件确认</label>
                    <div class="col-sm-3">
                        <input id="58_msg_3" type="radio" value="1" class="ng-pristine ng-untouched ng-valid ng-not-empty" checked="checked">已收到
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input id="58_msg_3_1" type="radio" value="2" class="ng-pristine ng-untouched ng-valid ng-not-empty">未收到
                    </div>
                    <label class="col-sm-2 control-label">收件日期</label>
                    <div class="col-sm-3">
                        <div class="input-group date ng-isolate-scope ng-empty ng-valid">
                            <input id="58_date_3" class="form-control selectData" type="text">
                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">材料复核结果</label>
                    <div class="col-sm-3">
                        <input id="result_1_code_1" type="radio" value="1" checked="checked" class="ng-pristine ng-untouched ng-valid ng-not-empty">通过
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input id="result_1_code_2" type="radio" value="2" class="ng-pristine ng-untouched ng-valid ng-not-empty">不通过
                    </div>
                    <!-- ngIf: rootData.taskDefKey=='postget'||taskAct.activityId=='postget' -->
                    <!-- ngIf: rootData.taskDefKey=='loanOrder_postget_asun'||rootData.taskDefKey=='loanOrder_postget_bank'||taskAct.activityId=='loanOrder_postget_asun'||taskAct.activityId=='loanOrder_postget_bank' -->
                </div>
                <!-- ngIf: (rootData.taskDefKey&&rootData.taskDefKey =='loanOrder_postget_asun')||(taskAct.activityId&&taskAct.activityId=='loanOrder_postget_asun') -->
                <!-- ngIf: (rootData.taskDefKey&&rootData.taskDefKey == 'loanOrder_postget_asun')||(taskAct.activityId&&taskAct.activityId=='loanOrder_postget_asun') -->
                <!-- ngIf: (rootData.taskDefKey&&rootData.taskDefKey == 'loanOrder_postget_asun')||(taskAct.activityId&&taskAct.activityId=='loanOrder_postget_asun') -->
                <!-- ngIf: (rootData.taskDefKey=='loanOrder_postget_bank'||rootData.taskDefKey=='loanOrder_postget_asun')&&!notUseButton -->
                <!-- ngIf: rootData.taskDefKey=='loanOrder_postget_org'||taskAct.activityId=='loanOrder_postget_org' -->
                <div style="margin-top: 5%" class="clear"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">备注</label>
                    <div class="col-sm-8">
                        <textarea name="result_1_msg" rows="3" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text" ng-model="task.remarks"></textarea>
                    </div>
                </div>
                <!-- ngIf: !notUseButton -->
                <script>
                    // 58 处理 json ,并给相应的对象赋值
                    var index = 3;
                    var objS_58index = JSON.parse($("#inObj_58_3").val()); //由JSON字符串转换为JSON对象
                    if(objS_58index['58_msg'] == "已收到"){
                        $("#58_msg_3").attr("checked","checked");
                    }else if(objS_58index['58_msg'] == "未收到"){
                        $("#58_msg_3_1").attr("checked","checked");
                    }else{
                        var a = 1;
                    }
                    document.getElementById("58_date_3").value = objS_58index['58_date'];
                </script>
            </form>
        </div>
    </div>
</li>
