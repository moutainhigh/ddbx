<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="text-primary">
    <em>合作商收件确认：</em>
    <div class="big-conte" style="display: block;">
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>开始时间：</strong>
        </div>
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>处理时间：</strong>
        </div>
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>处理人：</strong></div>
        <strong style="margin-left:10px;"><i>处理信息：</i></strong><br>
        <!-- ngIf: taskAct.pageName!='cudp'||'_cudp'.indexOf(taskAct.pageName)<=-1 -->
        <!-- ngInclude: '/modules/'+taskAct.menuCode+'/'+taskAct.pageName+'.html' -->
        <div class="task_margin ng-scope" style="border:1px solid #ccc; border-radius: 10px;background-color:#F7F7F7; padding-top:10px;">
            <form name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope">
                <div class="form-group">
                    <label class="col-sm-2 control-label">收件确认<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-3">
                        <input id="receiptConfirm" name="receiptConfirm" type="radio" value="已收到"  class="ng-pristine ng-untouched ng-valid ng-not-empty" >已收到
                            &nbsp;&nbsp;&nbsp;&nbsp;
                        <input id="receiptConfirm" name="receiptConfirm" type="radio" value="未收到"  class="ng-pristine ng-untouched ng-valid ng-not-empty" name="yhdksh_58_msg">未收到
                    </div>
                    <label class="col-sm-2 control-label">收件日期<i class="pull-right text-red">*</i></label>
                    <div class="input-group date form_datetime col-md-3" data-date="" data-date-format="yyyy-mm-dd" data-link-field="receiptDate">
                        <input class="form-control" size="16" type="text" value="" readonly>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                    </div>
                    <input type="hidden" id="receiptDate" name="receiptDate" value="" />
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">材料复核结果<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-3">
                        <input id="materialResult" name="materialResult" type="radio" value="1" class="ng-pristine ng-untouched ng-valid ng-not-empty">通过
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input id="materialResult" name="materialResult" type="radio" value="2" class="ng-pristine ng-untouched ng-valid ng-not-empty">不通过
                    </div>
                    <!-- ngIf: rootData.taskDefKey=='postget'||taskAct.activityId=='postget' -->
                    <!-- ngIf: rootData.taskDefKey=='loanOrder_postget_asun'||rootData.taskDefKey=='loanOrder_postget_bank'||taskAct.activityId=='loanOrder_postget_asun'||taskAct.activityId=='loanOrder_postget_bank' -->
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">备注</label>
                    <div class="col-sm-8">
                        <textarea id="result_msg" name="result_msg" rows="3" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text" ng-model="task.remarks"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                        <a onclick="erp()" class="btn btn-primary">提交</a>
                </div>
<script>
$('.form_datetime').datetimepicker({
    weekStart: 0, //一周从哪一天开始
    minView: "month",//设置只显示到月份
    todayBtn:  1, //
    autoclose: 1, //当选择一个日期之后是否立即关闭此日期时间选择器。
    todayHighlight: 1, //当天日期高亮
    startView: 2, //0 or 'hour' 为小时视图，1 or 'day' 为天视图，2 or 'month' 为月视图（为默认值），3 or 'year'  为年视图，4 or 'decade' 为十年视图
    forceParse: 0, //当选择器关闭的时候，是否强制解析输入框中的值。
    showMeridian: 1
});

    function erp(){
        var receiptConfirm= $('input[name="receiptConfirm"]:checked').val(); //收件确认
        var receiptDate= $('#receiptDate').val(); //收件日期
        var materialResult= $('input[name="materialResult"]:checked').val(); //材料复核结果
        var result_msg= $('#result_msg').val();
        var icbc_id= '${requestScope.infodb.icbc_id}';
        var type_id= '${requestScope.infodb.type_id}';
        var id= '${requestScope.infodb.id}';
        //alert(icbc_id+"----"+type_id+"---"+id+"---");
        if(!receiptConfirm){
            alert("收件确认不能为空!");
            return false;
        }else if(!receiptDate){
            alert("收件日期不能为空!");
            return false;
        }else if(!materialResult){
            alert("材料复核结果不能为空!");
            return false;
        }
        $.ajax({
            type: "POST",      //data 传送数据类型。post 传递
            dataType: 'json',  // 返回数据的数据类型json
            url: "${pageContext.request.contextPath}/manager/ajaxPostResults",  // 控制器方法
            data: {
                receiptConfirm:receiptConfirm,
                receiptDate:receiptDate,
                materialResult:materialResult,
                result_msg:result_msg,
                icbc_id:icbc_id,
                type_id:type_id,
                id:id
            },  //传送的数据
            error: function () {
                alert("编辑失败...请稍后重试！");
            },
            success: function (data) {
                alert(data.msg);
                window.location.href='${pageContext.request.contextPath}/manager/index?cn=mytask&sdo=list&type=ddbx';
            }
        });
    }
</script>
            </form>
        </div>
    </div>
</div>
