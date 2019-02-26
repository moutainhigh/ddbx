
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
<li class="text-primary"><em>5.抵押情况记录：</em>
    <div class="big-conte" style="display: block;">
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>开始时间：</strong>
            2019-01-24 20:40:52
        </div>
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>处理时间：</strong>
            2019-01-24 20:40:52
        </div>
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>处理人：</strong>韩振杰</div>
        <strong style="margin-left: 10px;"><i>处理信息：</i></strong><br>
        <!-- ngIf: taskAct.pageName!='cudp'||'_cudp'.indexOf(taskAct.pageName)<=-1 -->
        <!-- ngInclude: '/modules/'+taskAct.menuCode+'/'+taskAct.pageName+'.html' -->
        <div class="task_margin ng-scope" style="border: 1px solid #ccc; border-radius: 10px; background-color: #F7F7F7; padding-top: 10px;">
            <form name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope ng-valid-required ng-valid-pattern ng-valid-maxlength">
                <div class="form-group">
                    <label class="col-sm-2 control-label">车牌号码<i class="red">*</i></label>
                    <div class="col-sm-3">
                        <input id="76_cphm_5" name="76_cphm_5" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-required ng-valid-pattern ng-valid-maxlength" type="text" pattern="([京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}(([0-9]{5}[DF])|([DF]([A-HJ-NP-Z0-9])[0-9]{4})))|([京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-HJ-NP-Z0-9]{4}[A-HJ-NP-Z0-9挂学警港澳]{1})" maxlength="16" ng-model="task.plateNum" cg-required="" required="required" maxleng_base="8">
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
                        <label class="col-sm-2 control-label">抵押完成日期<i class="red">*</i></label>
                        <div class="col-sm-3">
                            <div class="input-group date ng-isolate-scope ng-not-empty ng-valid ng-valid-required">
                                <input id="76_dywcrq_5" name="76_dywcrq_5" class="form-control" type="text"><span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">登记证书号<i class="red">*</i></label>
                    <div class="col-sm-3">
                        <input id="76_djzsh_5" name="76_djzsh_5" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text">
                    </div>
                    <label class="col-sm-2 control-label">抵押办理人员<i class="red">*</i></label>
                    <div class="col-sm-3">
                        <input id="76_dyblry_5" name="76_dyblry_5" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">上牌方式</label>
                    <div class="col-sm-3">
                        <input id="76_spfs_5" name="76_spfs_5" value="" class="form-control">
                    </div>
                    <label class="col-sm-2 control-label">车辆类别</label>
                    <!-- ngIf: rootData.editFlag!='1' && rootData.editFlag!='-1' -->
                    <div class="col-sm-3 ng-scope">
                        <input id="76_cplb_5" name="76_cplb_5" value="" class="form-control">
                    </div>
                    <!-- end ngIf: rootData.editFlag!='1' && rootData.editFlag!='-1' -->
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">查验情况</label>
                    <div class="col-sm-3">
                        <input id="76_cyqk_5" name="76_cyqk_5" value="" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" style="margin-top: 57px;">其它说明</label>
                    <div class="col-sm-8" style="margin-top: 40px;">
                        <textarea rows="3" id="result_1_msg_5" name="result_1_msg_5" class="form-control ng-pristine ng-untouched ng-valid ng-empty" type="text"></textarea>
                    </div>
                </div>
                <!-- ngIf: !notUseButton -->
                <script type="text/javascript">
                    $(document).ready(function(){
                        var dygd_76=document.getElementById("dygd_"+'76'+"_"+'5').value;
                        if(dygd_76!=null){
                            var json = jQuery.parseJSON(dygd_76);
                            for ( var item in json) {
                                $("#" + item+"_"+'5').val(json[item]);
                            }
                        }
                    });

                </script>
            </form>
        </div>
    </div></li>
