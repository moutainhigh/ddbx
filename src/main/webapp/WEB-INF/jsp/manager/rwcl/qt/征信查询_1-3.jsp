
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
<li class="text-primary"><em>3.查询结果：</em>
    <div class="big-conte" style="display: block;">
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>开始时间：</strong>
            2019-02-20 16:58:39
        </div>
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>处理时间：</strong>
            2019-02-20 16:59:10
        </div>
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>处理人：</strong>秦扬</div>
        <strong style="margin-left: 10px;"><i>处理信息：</i></strong><br>
        <!-- ngIf: taskAct.pageName!='cudp'||'_cudp'.indexOf(taskAct.pageName)<=-1 -->
        <!-- ngInclude: '/modules/'+taskAct.menuCode+'/'+taskAct.pageName+'.html' -->
        <div class="task_margin ng-scope" style="border: 1px solid #ccc; border-radius: 10px; background-color: #F7F7F7; padding-top: 10px;">
            <form name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope">
                <!-- ngIf: notUseButton -->
                <div class="form-group ng-scope">
                    <label class="col-sm-2 control-label">审核结果</label>
                    <div class="col-sm-8">
                        <input type="radio" value="1" checked="checked" onchange="showradio('3399',this.value)" id="3399" name="3399" class="ng-pristine ng-untouched ng-valid ng-not-empty">通过
                        &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" value="2" onchange="showradio('3399',this.value)" id="3399" name="3399" class="ng-pristine ng-untouched ng-valid ng-not-empty">不通过
                        &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" value="3" onchange="showradio('3399',this.value)" id="3399" name="3399" class="ng-pristine ng-untouched ng-valid ng-not-empty">回退补件
                    </div>
                </div>
                <!-- end ngIf: notUseButton -->
                <div class="form-group">
                    <label class="col-sm-2 control-label">备注</label>
                    <div class="col-sm-8">
                        <textarea class="form-control ng-pristine ng-valid ng-not-empty ng-touched" style="margin: 0px -5.34375px 0px 0px; height: 141px; width: 545px;"></textarea>
                    </div>
                </div>

                <div style="margin-left: 200px;">
                    <ul id="zxtap" class="nav nav-tabs" style="border-bottom:0px;">
                        <li class="active">
                            <a href="#zdr" data-toggle="tab" aria-expanded="false">主贷人</a>
                        </li>
                        <li>
                            <a href="#ghr1" data-toggle="tab" aria-expanded="true">共还人1</a>
                        </li>
                        <li>
                            <a href="#ghr2" data-toggle="tab" aria-expanded="true">共还人2</a>
                        </li>
                        <li>
                            <a href="#zdrpo" data-toggle="tab" aria-expanded="true">主贷人配偶 </a>
                        </li>
                    </ul>
                </div>
                <div id="zxtapContent" class="tab-content">
                    <div id="zdr" class="tab-pane fade active in">
                        <!-- end ngIf: notUseButton -->
                        <div id="zdr_hai" class="form-group" style="margin-top: 20px;">
                            <label class="col-sm-2 control-label">征信报告</label>
                            <div class="col-sm-8">
                                <textarea id="zx_result_3" name="zx_result_3" class="form-control ng-pristine ng-valid ng-not-empty ng-touched" style="margin: 0px -5.34375px 0px 0px; height: 141px; width: 545px;"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">大数据报告</label>
                            <div class="col-sm-4">
                                <div class="row inline-from">
                                    <div class="input-group">
                                        <input class="form-control" name="dsj_report_id" id="dsj_report_id" value="" type="text">

                                        <span class="input-group-addon">
						<a style="color: #72afd2;" href="javascript:dsj_bg1('dsj_report_id');">查看报告</a>
						</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="ghr1" class="tab-pane fade">

                        <!-- end ngIf: notUseButton -->
                        <div id="ghr1_hai" class="form-group" style="margin-top: 20px;">
                            <label class="col-sm-2 control-label">征信报告</label>
                            <div class="col-sm-8">
                                <textarea id="gjr_zx_result1_3" name="gjr_zx_result1_3" class="form-control ng-pristine ng-valid ng-not-empty ng-touched" style="margin: 0px -5.34375px 0px 0px; height: 141px; width: 545px;"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">大数据报告</label>
                            <div class="col-sm-4">
                                <div class="row inline-from">
                                    <div class="input-group">
                                        <input class="form-control" name="gjr_dsj_report_id1" id="gjr_dsj_report_id1" value="" type="text">

                                        <span class="input-group-addon">
						<a style="color: #72afd2;" href="javascript:dsj_bg1('gjr_dsj_report_id1');">查看报告</a>
						</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="ghr2" class="tab-pane fade">
                        <!-- end ngIf: notUseButton -->
                        <div id="ghr2_hai" class="form-group" style="margin-top: 20px;">
                            <label class="col-sm-2 control-label">征信报告</label>
                            <div class="col-sm-8">
                                <textarea id="gjr_zx_result2_3" name="gjr_zx_result2_3" class="form-control ng-pristine ng-valid ng-not-empty ng-touched" style="margin: 0px -5.34375px 0px 0px; height: 141px; width: 545px;"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">大数据报告</label>
                            <div class="col-sm-4">
                                <div class="row inline-from">
                                    <div class="input-group">
                                        <input class="form-control" name="gjr_dsj_report_id2" id="gjr_dsj_report_id2" value="" type="text">

                                        <span class="input-group-addon">
						<a style="color: #72afd2;" href="javascript:dsj_bg1('gjr_dsj_report_id2');">查看报告</a>
						</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="zdrpo" class="tab-pane fade">
                        <!-- end ngIf: notUseButton -->
                        <div id="zdrpo_hai" class="form-group" style="margin-top: 20px;">
                            <label class="col-sm-2 control-label">征信报告</label>
                            <div class="col-sm-8">
                                <textarea id="po_zx_result_3" name="po_zx_result_3" class="form-control ng-pristine ng-valid ng-not-empty ng-touched" style="margin: 0px -5.34375px 0px 0px; height: 141px; width: 545px;"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">大数据报告</label>
                            <div class="col-sm-4">
                                <div class="row inline-from">
                                    <div class="input-group">
                                        <input class="form-control" name="po_dsj_report_id" id="po_dsj_report_id" value="" type="text">

                                        <span class="input-group-addon">
						<a style="color: #72afd2;" href="javascript:dsj_bg1('po_dsj_report_id');">查看报告</a>
						</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <script type="text/javascript">
                    $(document).ready(function(){
                        var zx_3=document.getElementById("zx_"+'3'+"_"+'3').value;
                        if(zx_3!=null&&zx_3!=''){
                            var json = jQuery
                                .parseJSON(zx_3);
                            for ( var item in json) {
                                $("#" + item+"_3").val(json[item]);
                            }
                        }
                    });
                    function dsj_bg1(report_id) {
                        var dsj_code=document.getElementById(report_id).value;
                        if(dsj_code!=null&&dsj_code!=""){
                            var frameSrc="/dsj_result_jsp.do?report_id="+dsj_code;
                            //给iframe加上src路径
                            $("#NoPermissioniframe1").attr("src", frameSrc);
                            //显示模态框  只有在选择编辑的行   然后根据回调函数成功后才会显示模态框
                            $('#dsj1Modal').modal({ show: true, backdrop: 'static' });
                        }else{
                            alert("大数据编码不能为空!");
                        }


                    }
                </script>


            </form>
        </div>
    </div></li>
