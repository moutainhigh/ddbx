
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
    <em>3.结果反馈：</em>
    <div class="big-conte" style="display: block;">
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>开始时间：</strong>
            2018-12-05 16:08:56
        </div>
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>处理时间：</strong>
            2018-12-05 16:08:56
        </div>
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>处理人：</strong></div>
        <strong style="margin-left:10px;">
            <i>处理信息：</i></strong><br>
        <!-- ngIf: taskAct.pageName!='cudp'||'_cudp'.indexOf(taskAct.pageName)<=-1 -->
        <!-- ngInclude: '/modules/'+taskAct.menuCode+'/'+taskAct.pageName+'.html' -->
        <div class="task_margin ng-scope" style="border:1px solid #ccc; border-radius: 10px;background-color:#F7F7F7; padding-top:10px;">
            <form name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope">
                <!-- ngIf: notUseButton -->
                <div class="form-group">
                    <label class="col-sm-2 control-label">审核结果</label>
                    <div class="col-sm-8">
                        <input type="radio" value="1" onchange="showradio('2147',this.value)" id="2147" name="2147" class="ng-pristine ng-untouched ng-valid ng-not-empty">通过
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" value="3" checked="checked" onchange="showradio('2147',this.value)" id="2147" name="2147" class="ng-pristine ng-untouched ng-valid ng-not-empty">回退补件
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">备注</label>
                    <div class="col-sm-8">
<textarea class="form-control ng-pristine ng-valid ng-not-empty ng-touched" style="margin: 0px -5.34375px 0px 0px; height: 141px; width: 545px;">面签不通过
</textarea>
                    </div>
                </div>
                <!-- ngIf: !notUseButton -->
            </form>
        </div>
    </div>
</li>
