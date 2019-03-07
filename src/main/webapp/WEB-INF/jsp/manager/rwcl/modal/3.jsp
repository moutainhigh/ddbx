<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
>>>>>>> 0518842038f8a84fc06c78d40aa2c0e041fcac24
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<li class="text-primary"><em>查询结果：</em>
    <div class="big-conte" style="display: none;">
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>开始时间：</strong>
            2019-02-20 16:58:39
        </div>
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>处理时间：</strong>
            2019-02-20 16:59:10
        </div>
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>处理人：</strong>秦扬
        </div>
        <strong style="margin-left: 10px;"><i>处理信息：</i></strong><br>
        <!-- ngIf: taskAct.pageName!='cudp'||'_cudp'.indexOf(taskAct.pageName)<=-1 -->
        <!-- ngInclude: '/modules/'+taskAct.menuCode+'/'+taskAct.pageName+'.html' -->
        <div class="task_margin ng-scope" style="border: 1px solid #ccc; border-radius: 10px; background-color: #F7F7F7; padding-top: 10px;">

            <!-- ngIf: notUseButton -->
            <div class="form-group ng-scope">
                <label class="col-sm-2 control-label">审核结果</label>
                <div class="col-sm-8">
                    <label class="radio-inline">
                        <input type="radio" value="1" name="state_code">通过
                    </label>
                    <label class="radio-inline">
                        <input type="radio" value="2" name="state_code">不通过
                    </label>
                    <label class="radio-inline">
                        <input type="radio" value="3" name="state_code">回退补件
                    </label>
                </div>
            </div>
            <!-- end ngIf: notUseButton -->
            <div class="form-group">
                <label class="col-sm-2 control-label">备注</label>
                <div class="col-sm-8">
                        <textarea class="form-control" name="remark" id="remark" style="margin: 0px -5.34375px 0px 0px; height: 141px; width: 545px;">
                        </textarea>
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
                            <textarea id="zdr_zx1_result" name="zdr_zx1_result" class="form-control" style="margin: 0px -5.34375px 0px 0px; height: 141px; width: 545px;"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">大数据报告</label>
                        <div class="col-sm-4">
                            <div class="row inline-from">
                                <div class="input-group">
                                    <input class="form-control" name="zdr_dsj_code" id="zdr_dsj_code" value="" type="text">
                                    <span class="input-group-addon">

                                            <a style="color: #72afd2;" href="javascript:">查看报告</a>
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
                            <textarea id="gjr1_zx1_result" name="gjr1_zx1_result" class="form-control" style="margin: 0px -5.34375px 0px 0px; height: 141px; width: 545px;"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">大数据报告</label>
                        <div class="col-sm-4">
                            <div class="row inline-from">
                                <div class="input-group">
                                    <input class="form-control" name="gjr1_dsj_code" id="gjr1_dsj_code" value="" type="text">
                                    <span class="input-group-addon">

                                            <a style="color: #72afd2;" href="javascript:">查看报告</a>
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
                            <textarea id="gjr2_zx1_result" name="gjr2_zx1_result" class="form-control" style="margin: 0px -5.34375px 0px 0px; height: 141px; width: 545px;"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">大数据报告</label>
                        <div class="col-sm-4">
                            <div class="row inline-from">
                                <div class="input-group">
                                    <input class="form-control" name="gjr2_dsj_code" id="gjr2_dsj_code" value="" type="text">
                                    <span class="input-group-addon">
                                            <a style="color: #72afd2;" href="javascript:">查看报告</a>
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
                            <textarea id="zdrpo_zx1_result" name="zdrpo_zx1_result" class="form-control" style="margin: 0px -5.34375px 0px 0px; height: 141px; width: 545px;"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">大数据报告</label>
                        <div class="col-sm-4">
                            <div class="row inline-from">
                                <div class="input-group">
                                    <input class="form-control" name="zdrpo_dsj_code" id="zdrpo_dsj_code" value="" type="text">
                                    <span class="input-group-addon">

                                            <a style="color: #72afd2;" href="javascript:">查看报告</a>
						                </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</li>
