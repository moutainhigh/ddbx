<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="text-primary"><em>公证记录：</em>
    <div class="big-conte" style="display: block;">
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>开始时间：</strong>
        </div>
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>处理时间：</strong>
        </div>
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>处理人：</strong></div>
        <strong style="margin-left: 10px;"><i>处理信息：</i></strong><br>
        <div class="task_margin ng-scope" style="border: 1px solid #ccc; border-radius: 10px; background-color: #F7F7F7; padding-top: 10px;">
            <form name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope ng-valid-required">
                <div class="form-group">
                    <label class="col-sm-2 control-label">开始日期<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-10">
                        <div class="input-group date form_datetime col-md-3" data-date="" data-date-format="yyyy-mm-dd" data-link-field="startDate">
                            <input class="form-control" size="16" type="text" value="" readonly>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                        </div>
                        <input type="hidden" id="startDate" name="startDate" value="" /><br/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">备注</label>
                    <div class="col-sm-8">
                        <textarea rows="3" id="result_msg" name="result_msg" class="form-control" type="text"></textarea>
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
    var startDate= $('#startDate').val(); //开始日期
    var result_msg= $('#result_msg').val();
    var icbc_id= '${requestScope.infodb.icbc_id}';
    var type_id= '${requestScope.infodb.type_id}';
    var id= '${requestScope.infodb.id}';
    //alert(icbc_id+"----"+type_id+"---"+id+"---");
    if(!startDate){
       alert("开始日期不能为空!");
       return false;
    }
    $.ajax({
       type: "POST",      //data 传送数据类型。post 传递
       dataType: 'json',  // 返回数据的数据类型json
       url: "${pageContext.request.contextPath}/manager/ajaxPostResults",  // 控制器方法
       data: {
           startDate:startDate,
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
