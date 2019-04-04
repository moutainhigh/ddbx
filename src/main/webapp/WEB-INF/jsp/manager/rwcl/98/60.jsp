<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${fn:contains(sessionScope.strAgp,',103,')==true}">
<div class="text-primary">
    <em>银行审批结果：</em>
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
            <form name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope" cg-disabled="detail">
                <div class="form-group">
                    <label class="col-sm-2 control-label">审批结果<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-8">
                        <input type="radio" value="1" class="ng-pristine ng-untouched ng-valid ng-not-empty" id="result_code" name="result_code">通过&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" value="2" class="ng-pristine ng-untouched ng-valid ng-not-empty" id="result_code" name="result_code">不通过&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" value="3" class="ng-pristine ng-untouched ng-valid ng-not-empty" id="result_code" name="result_code">附条件&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" value="4" class="ng-pristine ng-untouched ng-valid ng-not-empty" id="result_code" name="result_code">先抵押后放贷
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">审批意见</label>
                    <div class="col-sm-8">
                        <textarea id="result_msg" name="result_msg" rows="3" class="form-control ng-pristine ng-untouched ng-valid ng-empty" type="text"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                        <a onclick="erpa()" class="btn btn-primary">提交</a>
                </div>
<script>
    function erpa(){
        var result_code= $('input[name="result_code"]:checked').val(); //审批结果
        var result_msg= $('#result_msg').val();
        var icbc_id= '${requestScope.infodb.icbc_id}';
        var type_id= '${requestScope.infodb.type_id}';
        var id= '${requestScope.infodb.id}';
        //alert(icbc_id+"----"+type_id+"---"+id+"---"+result_code);
        if(!result_code){
            alert("审批结果不能为空!");
            return false;
        }
        $.ajax({
            type: "POST",      //data 传送数据类型。post 传递
            dataType: 'json',  // 返回数据的数据类型json
            url: "${pageContext.request.contextPath}/manager/ajaxPostResults",  // 控制器方法
            data: {
                result_code:result_code,
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