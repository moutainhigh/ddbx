<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@ page import="com.example.ddbx.tt.data.TtMap" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String result_value = request.getParameter("result_value");
    TtMap result_map = new TtMap();
    String admin_name = "";
    String s_time = "";
    if (result_value != null && !result_value.equals("")) {
        result_map = Tools.jsonDeCode_mp(result_value);
    }
    if (!Tools.myIsNull(request.getParameter("admin_name"))) {
        admin_name = request.getParameter("admin_name");
    }
    if (!Tools.myIsNull(request.getParameter("s_time"))) {
        s_time = request.getParameter("s_time");
    }
    String dt_edit = "";
    if (!Tools.myIsNull(request.getParameter("dt_edit"))) {
        dt_edit = request.getParameter("dt_edit");
    }
    request.setAttribute("result_map", result_map);
%>
<li class="text-primary"><em>查询结果：</em>
    <div class="big-conte" style="display: none;">
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>开始时间：</strong>
            <%=s_time%>
        </div>
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>处理时间：</strong>
            <%=dt_edit%>
        </div>
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>处理人：</strong><%=admin_name%>
        </div>
        <strong style="margin-left: 10px;"><i>处理信息：</i></strong><br>
        <div class="task_margin ng-scope"
             style="border: 1px solid #ccc; border-radius: 10px; background-color: #F7F7F7; padding-top: 10px;">
            <div class="form-group">
                <label class="col-sm-2 control-label">审核结果</label>
                <div class="col-sm-8">
                    <label class="radio-inline">
                        <input type="radio" value="1" name="" ${result_map.state_code eq 1?"checked":''}>通过
                    </label>
                    <label class="radio-inline">
                        <input type="radio" value="2" name="" ${result_map.state_code eq 2?"checked":''}>不通过
                    </label>
                    <label class="radio-inline">
                        <input type="radio" value="3" name="" ${result_map.state_code eq 3?"checked":''}>回退补件
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">备注</label>
                <div class="col-sm-8">
                    <textarea class="form-control" name="remark" id="remark"
                              style="margin: 0px -5.34375px 0px 0px; height: 141px; width: 545px;">${result_map.result_msg}</textarea>
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
                            <textarea id="" name="" class="form-control"
                                      style="margin: 0px -5.34375px 0px 0px; height: 141px; width: 545px;">${result_map.zdr_zx1_result}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">大数据报告</label>
                        <div class="col-sm-4">
                            <div class="row inline-from">
                                <div class="input-group">
                                    <input class="form-control" name="" id="" value="${result_map.zdr_dsj_code}"
                                           type="text">
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
                            <textarea id="" name="" class="form-control"
                                      style="margin: 0px -5.34375px 0px 0px; height: 141px; width: 545px;">${result_map.gjr1_zx1_result}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">大数据报告</label>
                        <div class="col-sm-4">
                            <div class="row inline-from">
                                <div class="input-group">
                                    <input class="form-control" name="" id="" value="${result_map.gjr1_dsj_code}"
                                           type="text">
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
                            <textarea id="" name="" class="form-control"
                                      style="margin: 0px -5.34375px 0px 0px; height: 141px; width: 545px;">${result_map.gjr2_zx1_result}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">大数据报告</label>
                        <div class="col-sm-4">
                            <div class="row inline-from">
                                <div class="input-group">
                                    <input class="form-control" name="" id="" value="${result_map.gjr2_dsj_code}"
                                           type="text">
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
                            <textarea id="" name="" class="form-control"
                                      style="margin: 0px -5.34375px 0px 0px; height: 141px; width: 545px;">${result_map.zdrpo_zx1_result}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">大数据报告</label>
                        <div class="col-sm-4">
                            <div class="row inline-from">
                                <div class="input-group">
                                    <input class="form-control" name="" id="" value="${result_map.zdrpo_dsj_code}"
                                           type="text">
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
