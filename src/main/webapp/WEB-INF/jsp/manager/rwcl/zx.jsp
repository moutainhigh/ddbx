<%@ page import="com.example.ddbx.tt.tool.DbTools" %>
<%@ page import="com.example.ddbx.tt.data.TtList" %>
<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@ page import="com.example.ddbx.tt.data.TtMap" %>
<%@ page import="com.example.ddbx.tt.table.BASE64Encoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="" class="tab-content">
    <style>
        .flex-box {
            display: flex;
            flex-direction: column;
        }

        .flex-box div[class^='flex-row'] {
            width: 100%;
        }

        .flex-box .flex-row {
            height: 35px;
        }

        .flex-row-rhcen {
            display: flex;
            justify-content: flex-end;
            align-items: center;
        }

        em {
            cursor: pointer;
        }

        .flex-row-rhcen em {
            padding: 0 5px;
        }

        .flex-rowcen {
            flex: 1;
        }

        .text-primary em {
            display: block;
            font-size: 15px;
            line-height: 25px;
        }

        .text-primary .big-conte {
            background-color: #f7f7f7;
            height: auto !important;
            height: 100px;
            display: none;
            min-height: 100px;
            padding: 15px 0;
            margin: 15px 0;
            border-radius: 10px;
        }

        .big-conte-row span {
            text-align: right;
            padding-right: 15px;
            line-height: 34px;
            width: 25%;
            float: left;
        }

        .big-conte-row input {
            float: left;
            width: 20%;
        }

        .big-conte-row {
            margin: 20px;
            height: 34px;
        }
    </style>
<%
    long recs = 0;
    DbTools myDbTools=new DbTools();
    String sql="select * from sys_config_son order by number";
    TtList clgc_list = null;
    try {
        clgc_list = myDbTools.reclist(sql);
        recs = Long.parseLong(myDbTools.recexec_getvalue("SELECT FOUND_ROWS() as rno;", "rno"));
    }catch (Exception e) {
        Tools.logError(e.getMessage(), true, false);
    }finally {
        myDbTools.closeConn();
    }

%>
    <div class="modal-body flex-box" style="height: auto;">
        <div class="flex-row flex-row-rhcen">
            <em onclick="funUnfold()" class="text-muted">全部展开</em>
            <em onclick="funClose()" class="text-muted">全部收起</em>
        </div>
        <div class="flex-rowcen">
            <ol>
                <%
                    for (TtMap ttMap:clgc_list){ %>
                <li class="text-primary"><em><%=ttMap.get("name")%>：</em>
                    <div class="big-conte" style="display: none;">
                        <div style="float: left; margin-left: 20px; width: 300px;" class="ng-binding">
                            <strong>开始时间：</strong>
                            2019-01-24 21:59:30
                        </div>
                        <div style="float: left; margin-left: 20px; width: 300px;" class="ng-binding">
                            <strong>处理时间：</strong>
                            2019-01-24 21:59:30
                        </div>
                        <div style="float: left; margin-left: 20px; width: 300px;" class="ng-binding">
                            <strong>处理人：</strong>
                        </div>
                        <strong style="margin-left: 10px;">
                            <i>处理信息：</i>
                        </strong>
                        <br>
                        <div>
                            <form name="" class="form-horizontal">
                                <%=
                            new String(BASE64Encoder.decode(ttMap.get("pagehtml")))
                            %>

                            </form>
                        </div>
                    </div>
                </li>
                    <%
                    }
                    %>
                <li class="text-primary"><em>提交查询：</em>
                    <div class="big-conte" style="display: none;">
                        <div style="float: left; margin-left: 20px; width: 300px;" class="ng-binding">
                            <strong>开始时间：</strong>
                            2019-01-24 21:59:30
                        </div>
                        <div style="float: left; margin-left: 20px; width: 300px;" class="ng-binding">
                            <strong>处理时间：</strong>
                            2019-01-24 21:59:30
                        </div>
                        <div style="float: left; margin-left: 20px; width: 300px;" class="ng-binding">
                            <strong>处理人：</strong>韩振杰
                        </div>
                        <strong style="margin-left: 10px;"><i>处理信息：</i></strong><br>
                        <div class="task_margin ng-scope">
                            &nbsp;&nbsp;&nbsp;<a>信息较多，如有需要请查看明细</a>
                        </div>
                    </div>
                </li>
                <li class="text-primary"><em>查询结果：</em>
                    <div class="big-conte" style="display: none;">
                        <div style="float: left; margin-left: 20px; width: 300px;" class="ng-binding">
                            <strong>开始时间：</strong>
                            2019-01-24 21:59:30
                        </div>
                        <div style="float: left; margin-left: 20px; width: 300px;" class="ng-binding">
                            <strong>处理时间：</strong>
                            2019-01-24 22:00:14
                        </div>
                        <div style="float: left; margin-left: 20px; width: 300px;" class="ng-binding">
                            <strong>处理人：</strong>韩振杰
                        </div>
                        <strong style="margin-left: 10px;"><i>处理信息：</i></strong><br>
                        <div class="task_margin ng-scope"
                             style="border: 1px solid #ccc; border-radius: 10px; background-color: #F7F7F7; padding-top: 10px;">
                            <form name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope">
                                <div class="form-group ng-scope">
                                    <label class="col-sm-2 control-label">审核结果</label>
                                    <div class="col-sm-8">
                                        <input type="radio" value="1" onchange="showradio('3256',this.value)" id="3256"
                                               name="3256">通过
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" value="2" onchange="showradio('3256',this.value)" id="3256"
                                               name="3256">不通过
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" value="3" onchange="showradio('3256',this.value)" id="3256"
                                               name="3256">回退补件
                                    </div>
                                </div>
                                <!-- end ngIf: notUseButton -->
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">备注</label>
                                    <div class="col-sm-8">
                                        <textarea class="form-control ng-pristine ng-valid ng-not-empty ng-touched"
                                                  style="margin: 0px -5.34375px 0px 0px; height: 141px; width: 545px;"></textarea>
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
                                                <textarea id="zx_result_3" name="zx_result_3"
                                                          class="form-control ng-pristine ng-valid ng-not-empty ng-touched"
                                                          style="margin: 0px -5.34375px 0px 0px; height: 141px; width: 545px;"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">大数据报告</label>
                                            <div class="col-sm-4">
                                                <div class="row inline-from">
                                                    <div class="input-group">
                                                        <input class="form-control" name="dsj_report_id"
                                                               id="dsj_report_id" value="" type="text">
                                                        <span class="input-group-addon">
						                                <a style="color: #72afd2;"
                                                           href="javascript:dsj_bg1('dsj_report_id');">查看报告</a>
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
                                                <textarea id="gjr_zx_result1_3" name="gjr_zx_result1_3"
                                                          class="form-control ng-pristine ng-valid ng-not-empty ng-touched"
                                                          style="margin: 0px -5.34375px 0px 0px; height: 141px; width: 545px;"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">大数据报告</label>
                                            <div class="col-sm-4">
                                                <div class="row inline-from">
                                                    <div class="input-group">
                                                        <input class="form-control" name="gjr_dsj_report_id1"
                                                               id="gjr_dsj_report_id1" value="" type="text">

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
                                                <textarea id="gjr_zx_result2_3" name="gjr_zx_result2_3"
                                                          class="form-control ng-pristine ng-valid ng-not-empty ng-touched"
                                                          style="margin: 0px -5.34375px 0px 0px; height: 141px; width: 545px;"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">大数据报告</label>
                                            <div class="col-sm-4">
                                                <div class="row inline-from">
                                                    <div class="input-group">
                                                        <input class="form-control" name="gjr_dsj_report_id2"
                                                               id="gjr_dsj_report_id2" value="" type="text">

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
                                                <textarea id="po_zx_result_3" name="po_zx_result_3"
                                                          class="form-control ng-pristine ng-valid ng-not-empty ng-touched"
                                                          style="margin: 0px -5.34375px 0px 0px; height: 141px; width: 545px;"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">大数据报告</label>
                                            <div class="col-sm-4">
                                                <div class="row inline-from">
                                                    <div class="input-group">
                                                        <input class="form-control" name="po_dsj_report_id"
                                                               id="po_dsj_report_id" value="" type="text">
                                                        <span class="input-group-addon">

						</span>
                                                        <span class="input-group-addon">
						<a style="color: #72afd2;" href="javascript:dsj_bg1('po_dsj_report_id');">查看报告</a>
						</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </li>
                <li class="text-primary">
                    <em>完成：</em>
                    <div class="big-conte" style="display: none;">
                        <div style="float: left; margin-left: 20px; width: 300px;">
                            <strong>完成时间：</strong>
                            2019-01-24 22:00:14
                        </div>
                    </div>
                </li>


            </ol>
        </div>
        <script>
            function showradio(id, value) {
                switch (value) {
                    case "1":
                        $("#2").removeAttr("checked");
                        $("#3").removeAttr("checked");
                        break;
                    case "2":
                        $("#3").removeAttr("checked");
                        $("#1").removeAttr("checked");
                        break;
                    case "3":
                        $("#1").removeAttr("checked");
                        $("#2").removeAttr("checked");
                        break;
                    default:
                        break;
                }
            };

            $(".text-primary em").click(function () {
                $(this).next(".big-conte").slideToggle();
            })

            //全部展开
            function funUnfold() {
                $(".big-conte").slideDown();
            }

            //全部关闭
            function funClose() {
                $(".big-conte").slideUp();
            }
        </script>
        <div class="flex-row flex-row-rhcen">
            <em onclick="funUnfold()" class="text-muted">全部展开</em> <em onclick="funClose()" class="text-muted">全部收起</em>
        </div>
    </div>
</div>