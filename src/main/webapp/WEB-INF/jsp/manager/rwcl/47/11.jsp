
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="text-primary">
    <em>评估价审核：</em>

    <div class="big-conte" style="display: block;">
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>开始时间：</strong>
            2018-12-18 10:46:36
        </div>
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>处理时间：</strong>
            2018-12-18 10:47:02
        </div>
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>处理人：</strong>韩振杰</div>
        <strong style="margin-left:10px;"><i>处理信息：</i></strong><br>
        <!-- ngIf: taskAct.pageName!='cudp'||'_cudp'.indexOf(taskAct.pageName)<=-1 -->
        <!-- ngInclude: '/modules/'+taskAct.menuCode+'/'+taskAct.pageName+'.html' -->
        <div class="task_margin ng-scope" style="border:1px solid #ccc; border-radius: 10px;background-color:#F7F7F7; padding-top:10px;">
            <form name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope ng-valid-required">

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

                <div class="form-group">
                    <!-- ngIf: currentUser.orgType!='HAFU' -->
                    <span class="ng-scope">
                                <label class="col-sm-2 control-label">新车指导价</label>
                                <div class="col-sm-3">
                                    <div class="input-group date ng-isolate-scope ng-not-empty ng-valid ng-valid-required">
                                        <input class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text" name="price_new" value=""><span class="input-group-addon">元</span>
                                    </div>
                                </div>
                            </span><!-- end ngIf: currentUser.orgType!='HAFU' -->
                    <label class="col-sm-2 control-label">期望评估价</label>
                    <div class="col-sm-3">
                        <div class="input-group date ng-isolate-scope ng-not-empty ng-valid ng-valid-required">
                            <input class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text" name="icbc_pricecs" value=""><span class="input-group-addon">元</span>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <!-- ngIf: currentUser.orgType!='HAFU' -->
                    <span ng-if="currentUser.orgType!='HAFU'" class="ng-scope">
                        <label class="col-sm-2 control-label">建议评估价</label>
                            <div class="col-sm-3">
                                <div class="input-group date ng-isolate-scope ng-not-empty ng-valid ng-valid-required">
                                    <input class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text" name="suggest_price" value=""><span class="input-group-addon">元</span>
                                </div>
                            </div>
                        </span>
                    <!-- end ngIf: currentUser.orgType!='HAFU' -->
                    <label class="col-sm-2 control-label">最终评估价<i class="red">*</i></label>
                    <div class="col-sm-3">
                        <div class="input-group date ng-isolate-scope ng-not-empty ng-valid ng-valid-required">
                            <input class="form-control ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-required" type="text" id="price_result" name="price_result" value=""><span class="input-group-addon">元</span>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">备注</label>
                    <div class="col-sm-8">
                        <input class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text" name="remark" value="">
                    </div>
                </div>

                <div class="modal-footer">
                    <a onclick="erp()" class="btn btn-primary">提交</a>
                </div>
                <!-- ngIf: !notUseButton -->

            </form>
        </div>
    </div>
</div>
<script>
    function erp() {
        var state_code= $('input[name="state_code"]:checked').val();
        var price_new= $('#price_new').val();
        var icbc_pricecs= $('#icbc_pricecs').val();
        var suggest_price= $('#suggest_price').val();
        var price_result= $('#price_result').val();
        var remark= $('#remark').val();
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
            url: "/manager/qcpgajaxpost",  // 控制器方法
            data: {
                state_code : state_code,
                price_new : price_new,
                icbc_pricecs : icbc_pricecs,
                suggest_price : suggest_price,
                price_result : price_result,
                remark:remark,
                icbc_id:icbc_id,
                type_id:type_id,
                id:id
            },  //传送的数据
            error: function () {
                alert("编辑失败...请稍后重试！");
            },
            success: function (data) {
                alert(data.msg);
            }
        });

    }
</script>

