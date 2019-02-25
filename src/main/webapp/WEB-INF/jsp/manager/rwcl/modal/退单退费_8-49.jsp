
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
<li class="text-primary"><em>4.合作商收件确认：</em>
    <div class="big-conte" style="display: block;">
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>开始时间：</strong>
            2019-01-24 20:40:35
        </div>
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>处理时间：</strong>
            2019-01-24 20:40:35
        </div>
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>处理人：</strong>韩振杰</div>
        <strong style="margin-left: 10px;"><i>处理信息：</i></strong><br>
        <div class="task_margin ng-scope" style="border: 1px solid #ccc; border-radius: 10px; background-color: #F7F7F7; padding-top: 10px;">
            <form name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope">
                <div class="form-group">
                    <label class="col-sm-2 control-label">收件确认</label>
                    <div class="col-sm-3">
                        <input class="form-control" id="75_sjqr_4" name="75_sjqr_4">
                    </div>
                    <label class="col-sm-3 control-label">收件日期</label>
                    <div class="col-sm-3">
                        <div class="input-group date ng-isolate-scope ng-not-empty ng-valid">
                            <input id="75_ksrq_4" name="75_ksrq_4" class="form-control" type="text">
                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">材料复核结果</label>
                    <div class="col-sm-3">
                        <input class="form-control" id="75_clfh_4" name="75_clfh_4">
                    </div>
                    <!-- ngIf: rootData.taskDefKey=='postget'||taskAct.activityId=='postget' -->
                    <!-- ngIf: rootData.taskDefKey=='loanOrder_postget_asun'||rootData.taskDefKey=='loanOrder_postget_bank'||taskAct.activityId=='loanOrder_postget_asun'||taskAct.activityId=='loanOrder_postget_bank' -->
                </div>
                <!-- ngIf: (rootData.taskDefKey&&rootData.taskDefKey =='loanOrder_postget_asun')||(taskAct.activityId&&taskAct.activityId=='loanOrder_postget_asun') -->
                <!-- ngIf: (rootData.taskDefKey&&rootData.taskDefKey == 'loanOrder_postget_asun')||(taskAct.activityId&&taskAct.activityId=='loanOrder_postget_asun') -->
                <!-- ngIf: (rootData.taskDefKey&&rootData.taskDefKey == 'loanOrder_postget_asun')||(taskAct.activityId&&taskAct.activityId=='loanOrder_postget_asun') -->
                <!-- ngIf: (rootData.taskDefKey=='loanOrder_postget_bank'||rootData.taskDefKey=='loanOrder_postget_asun')&&!notUseButton -->
                <!-- ngIf: rootData.taskDefKey=='loanOrder_postget_org'||taskAct.activityId=='loanOrder_postget_org' -->
                <div class="ng-scope">
                    <!-- ngIf: !notUseButton -->
                    <div class="form-group">
                        <label class="col-sm-2 control-label">登记证书</label>
                    </div>
                    <div style="overflow: hidden; margin-left: 7%;">

                        <div id="img_75_4" style="float: left; left: 5px; margin-top: 20px" class="ng-scope"></div>

                    </div>
                </div>
                <!-- end ngIf: rootData.taskDefKey=='loanOrder_postget_org'||taskAct.activityId=='loanOrder_postget_org' -->
                <div style="margin-top: 5%" class="clear"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">备注</label>
                    <div class="col-sm-8">
                        <textarea rows="3" id="result_1_msg_4" name="result_1_msg_4" class="form-control ng-pristine ng-untouched ng-valid ng-empty" type="text">												</textarea>
                    </div>
                </div>
                <!-- ngIf: !notUseButton -->
                <script type="text/javascript">
                    $(document).ready(function(){
                        var dygd_75=document.getElementById("dygd_"+'75'+"_"+'4').value;
                        if(dygd_75!=null){
                            var dd = document.getElementById("img_75_"+'4');
                            var json = jQuery.parseJSON(dygd_75);
                            for ( var item in json) {
                                if (item.match('bcimg')) {
                                    $(dd).append("<div class='fileUpload_preview' style='margin-top:5px;'>"
                                        + "<li>"
                                        + "<img onclick='dygdModal_image(this)' id='"+item+"_"+4+"' name='"+item+"_"+4+"' class='fileUpload_preview fileUpload_preview-small fileUpload_preview-square' src='http://a.kcway.net/assess/"+json[item]+"'>"
                                        + "</li>"
                                        + "<div class='btn btn-primary btn-download'>↓</div>"
                                        + "<div id='close"+item+"' class='btn btn-danger btn-close'>x</div>"
                                        + "</div>");
                                } else {
                                    $("#" + item+"_"+'4').val(json[item]);
                                }
                            }
                        }
                    });
                </script>
            </form>
        </div>
    </div></li>
