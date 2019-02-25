
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
    <em>11.收款确认：</em>
    <div class="big-conte" style="display: block;">
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>开始时间：</strong>
            2019-02-20 17:08:26
        </div>
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>处理时间：</strong>
            2019-02-20 17:08:39
        </div>
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>处理人：</strong>秦扬</div>
        <strong style="margin-left:10px;">
            <i>处理信息：</i></strong><br>
        <!-- ngIf: taskAct.pageName!='cudp'||'_cudp'.indexOf(taskAct.pageName)<=-1 -->
        <!-- ngInclude: '/modules/'+taskAct.menuCode+'/'+taskAct.pageName+'.html' -->
        <div class="task_margin ng-scope" style="border:1px solid #ccc; border-radius: 10px;background-color:#F7F7F7; padding-top:10px;">
            <form name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope ng-valid-required">
                <div style="display:none;">
                    <textarea id="inObj_62_11">{"62_fkrq":"2019-02-22","62_sqrq":"2019-02-23","62_fkje":"100000"}</textarea>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">放款日期<i class="red">*</i></label>
                    <div class="col-sm-3">
                        <div class="input-group date ng-isolate-scope ng-not-empty ng-valid ng-valid-required">
                            <input id="62_fkrq_11" class="form-control" type="text"><span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        </div>
                    </div>
                    <label class="col-sm-2 control-label">放款金额<i class="red">*</i></label>
                    <div class="col-sm-3">
                        <input id="62_fkje_11" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-required" type="text">
                    </div>
                </div>
                <!-- <div class="form-group">
                    <label class="col-sm-2 control-label">垫资/划付金额</label>
                    <div class="col-sm-3">
                        <input class="form-control" type="text"	ng-model="task.payAmount" cg-required required/>
                    </div>
                    <label class="col-sm-2 control-label">差额</label>
                    <div class="col-sm-3">
                        <input class="form-control" type="text" ng-model="task.netting"  ng-value="(task.bankAmount-task.payAmount).toFixed(4)" disabled="true" />(计算方式:放贷额-垫资金额)
                    </div>
                </div> -->
                <div class="form-group">
                    <label class="col-sm-2 control-label">收款情况<span class="red">*</span></label>
                    <div class="col-sm-8">
                        <input type="radio" value="1" checked="checked" class="ng-pristine ng-untouched ng-valid ng-not-empty">到账确认，本单已完整  &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" value="3" class="ng-pristine ng-untouched ng-valid ng-not-empty">收款金额不符&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" value="2" class="ng-pristine ng-untouched ng-valid ng-not-empty">未收到款项
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">收款日期<i class="red">*</i></label>
                    <div class="col-sm-3">
                        <div class="input-group date ng-isolate-scope ng-not-empty ng-valid ng-valid-required">
                            <input id="62_sqrq_11" class="form-control" type="text"><span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        </div>
                    </div>
                    <!-- ngIf: task.creditsMoney -->
                    <!-- ngIf: task.creditsMoney -->
                </div>
                <!-- ngIf: task.recieveRet==0 -->
                <div class="form-group">
                    <label class="col-sm-2 control-label">其它说明</label>
                    <div class="col-sm-8">
                        <textarea rows="3" class="form-control ng-pristine ng-untouched ng-valid ng-empty" type="text"></textarea>
                    </div>
                </div>

                <!-- 根据action确定操作  -->
                <!-- ngIf: !notUseButton -->
                <script>
                    var index = 11;
                    // 62 处理 json ,并给相应的对象赋值
                    var objS_62index = JSON.parse($("#inObj_62_11").val()); //由JSON字符串转换为JSON对象
                    document.getElementById("62_fkrq_11").value = objS_62index['62_fkrq'];
                    document.getElementById("62_fkje_11").value = objS_62index['62_fkje'];
                    document.getElementById("62_sqrq_11").value = objS_62index['62_sqrq'];
                </script>
            </form>
        </div>
    </div>
</li>
