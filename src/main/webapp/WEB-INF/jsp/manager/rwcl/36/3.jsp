
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${fn:contains(sessionScope.strAgp,',40,')==true}">
<div class="text-primary">
    <em>查询结果：</em>
    <div class="big-conte" style="display: block;">
        <strong style="margin-left: 10px;"><i>处理信息：</i></strong><br>
        <div class="task_margin ng-scope"
             style="border: 1px solid #ccc; border-radius: 10px; background-color: #F7F7F7; padding-top: 10px;">
            <form id="erp_form" class="form-horizontal">
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
                        <textarea class="form-control" name="remark" id="remark"
                                  style="margin: 0px -5.34375px 0px 0px; height: 141px; width: 545px;">

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
                                <textarea id="zdr_zx1_result" name="zdr_zx1_result"
                                          class="form-control"
                                          style="margin: 0px -5.34375px 0px 0px; height: 141px; width: 545px;"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">大数据报告</label>
                            <div class="col-sm-4">
                                <div class="row inline-from">
                                    <div class="input-group">
                                        <input class="form-control" name="zdr_dsj_code" id="zdr_dsj_code" value=""
                                               type="text">
                                        <span class="input-group-addon">
                                            <a style="color: #72afd2;" href="javascript:">获取编码</a>
						                </span>
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
                                <textarea id="gjr1_zx1_result" name="gjr1_zx1_result"
                                          class="form-control"
                                          style="margin: 0px -5.34375px 0px 0px; height: 141px; width: 545px;"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">大数据报告</label>
                            <div class="col-sm-4">
                                <div class="row inline-from">
                                    <div class="input-group">
                                        <input class="form-control" name="gjr1_dsj_code" id="gjr1_dsj_code"
                                               value="" type="text">
                                        <span class="input-group-addon">
                                            <a style="color: #72afd2;" href="javascript:">获取编码</a>
						                </span>
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
                                <textarea id="gjr2_zx1_result" name="gjr2_zx1_result"
                                          class="form-control"
                                          style="margin: 0px -5.34375px 0px 0px; height: 141px; width: 545px;"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">大数据报告</label>
                            <div class="col-sm-4">
                                <div class="row inline-from">
                                    <div class="input-group">
                                        <input class="form-control" name="gjr2_dsj_code" id="gjr2_dsj_code"
                                               value="" type="text">
                                        <span class="input-group-addon">
                                            <a style="color: #72afd2;" href="javascript:">获取编码</a>
						                </span>
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
                                <textarea id="zdrpo_zx1_result" name="zdrpo_zx1_result"
                                          class="form-control"
                                          style="margin: 0px -5.34375px 0px 0px; height: 141px; width: 545px;"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">大数据报告</label>
                            <div class="col-sm-4">
                                <div class="row inline-from">
                                    <div class="input-group">
                                        <input class="form-control" name="zdrpo_dsj_code" id="zdrpo_dsj_code"
                                               value="" type="text">
                                        <span class="input-group-addon">
                                            <a style="color: #72afd2;" href="javascript:">获取编码</a>
						                </span>
                                        <span class="input-group-addon">

                                            <a style="color: #72afd2;" href="javascript:">查看报告</a>
						                </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <a onclick="erp()" class="btn btn-primary">提交</a>
                </div>
            </form>
        </div>
    </div>
</div>
</c:if>
<script>
    function erp() {
        var state_code= $('input[name="state_code"]:checked').val();
        var remark= $('#remark').val();
        var zdr_zx1_result= $('#zdr_zx1_result').val();
        var zdr_dsj_code= $('#zdr_dsj_code').val();
        var gjr1_zx1_result= $('#gjr1_zx1_result').val();
        var gjr1_dsj_code= $('#gjr1_dsj_code').val();
        var gjr2_zx1_result= $('#gjr2_zx1_result').val();
        var gjr2_dsj_code= $('#gjr2_dsj_code').val();
        var zdrpo_zx1_result= $('#zdrpo_zx1_result').val();
        var zdrpo_dsj_code= $('#zdrpo_dsj_code').val();
        var icbc_id= '${requestScope.infodb.icbc_id}';
        var type_id= '${requestScope.infodb.type_id}';
        var id= '${requestScope.infodb.id}';
        //alert(icbc_id+"----"+type_id+"---"+id);
        if(!state_code){
            alert("审核结果不能为空!");
            return false;
        }
        $.ajax({
            type: "POST",      //data 传送数据类型。post 传递
            dataType: 'json',  // 返回数据的数据类型json
            url: "/manager/ajaxpost",  // 控制器方法
            data: {
                state_code : state_code,
                remark:remark,
                zdr_zx1_result:zdr_zx1_result,
                zdr_dsj_code:zdr_dsj_code,
                gjr1_zx1_result:gjr1_zx1_result,
                gjr1_dsj_code:gjr1_dsj_code,
                gjr2_zx1_result:gjr2_zx1_result,
                gjr2_dsj_code:gjr2_dsj_code,
                zdrpo_zx1_result:zdrpo_zx1_result,
                zdrpo_dsj_code:zdrpo_dsj_code,
                icbc_id:icbc_id,
                type_id:type_id,
                id:id,
                type:'1'//类型
            },  //传送的数据
            error: function () {
                alert("编辑失败...请稍后重试！");

            },
            success: function (data) {
                alert(data.msg);
                window.location.href="/manager/index?cn=mytask&sdo=list&type=ddbx";
            }
        });

    }
</script>