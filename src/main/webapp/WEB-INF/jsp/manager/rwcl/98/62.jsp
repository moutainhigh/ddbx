<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${fn:contains(sessionScope.strAgp,',105,')==true}">
<div class="text-primary">
    <em>收款确认：</em>
    <div class="big-conte" style="display: block;">
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>开始时间：</strong>
        </div>
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>处理时间：</strong>
        </div>
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>处理人：</strong></div>
        <strong style="margin-left:10px;">
            <i>处理信息：</i></strong><br>
        <!-- ngIf: taskAct.pageName!='cudp'||'_cudp'.indexOf(taskAct.pageName)<=-1 -->
        <!-- ngInclude: '/modules/'+taskAct.menuCode+'/'+taskAct.pageName+'.html' -->
        <div class="task_margin ng-scope" style="border:1px solid #ccc; border-radius: 10px;background-color:#F7F7F7; padding-top:10px;">
            <form name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope ng-valid-required">
                 <div class="form-group">
                    <label class="col-sm-2 control-label">放款日期<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-3">
                        <input readonly = "readonly" value="${fn:substring(erp_result_value.lendingDate,0,10)}" id="fkDate_result" name="fkDate_result" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-required" type="text">
                    </div>
                    <label class="col-sm-2 control-label">放款金额<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-3">
                        <input readonly = "readonly" value="${erp_result_value.yhdksh_61_je}" id="fkje_result" name="fkje_result" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-required" type="text">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">收款情况<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-8">
                        <input id="result_code" name="result_code" type="radio" value="1" class="ng-pristine ng-untouched ng-valid ng-not-empty">到账确认，本单已完整  &nbsp;&nbsp;&nbsp;&nbsp;
                        <input id="result_code" name="result_code" type="radio" value="3" class="ng-pristine ng-untouched ng-valid ng-not-empty">收款金额不符&nbsp;&nbsp;&nbsp;&nbsp;
                        <input id="result_code" name="result_code" type="radio" value="2" class="ng-pristine ng-untouched ng-valid ng-not-empty">未收到款项
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">收款日期<i class="pull-right text-red">*</i></label>
                    <div style="padding-left:15px;" class="input-group date form_datetime col-md-3" data-date="" data-date-format="yyyy-mm-dd" data-link-field="getMoneyDate">
                        <input class="form-control" size="16" type="text" value="" readonly>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                    </div>
                    <input type="hidden" id="getMoneyDate" name="getMoneyDate" value="" />
                    <!-- ngIf: task.creditsMoney -->
                    <!-- ngIf: task.creditsMoney -->
                </div>
                <!-- ngIf: task.recieveRet==0 -->
                <div class="form-group">
                    <label class="col-sm-2 control-label">其它说明<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-8">
                        <textarea id="result_msg" name="result_msg" rows="3" class="form-control ng-pristine ng-untouched ng-valid ng-empty" type="text"></textarea>
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
    var result_code= $('input[name="result_code"]:checked').val(); //收款情况
    var getMoneyDate= $('#getMoneyDate').val(); //收款日期
    var fkDate_result= $('#fkDate_result').val();
    var fkje_result= $('#fkje_result').val();
    var result_msg= $('#result_msg').val();
    var icbc_id= '${requestScope.infodb.icbc_id}';
    var type_id= '${requestScope.infodb.type_id}';
    var id= '${requestScope.infodb.id}';
    //alert(icbc_id+"----"+type_id+"---"+id+"---");
    if(!result_code){
        alert("收款情况不能为空!");
        return false;
    }else if(!getMoneyDate){
        alert("收款日期不能为空!");
        return false;
    }
    $.ajax({
        type: "POST",      //data 传送数据类型。post 传递
        dataType: 'json',  // 返回数据的数据类型json
        url: "${pageContext.request.contextPath}/manager/ajaxPostResults",  // 控制器方法
        data: {
            result_code:result_code,
            getMoneyDate:getMoneyDate,
            fkDate_result:fkDate_result,
            fkje_result:fkje_result,
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
</c:if>