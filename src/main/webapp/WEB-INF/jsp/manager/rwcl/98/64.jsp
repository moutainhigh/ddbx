<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${fn:contains(sessionScope.strAgp,',107,')==true}">
<div class="text-primary">
    <em>机构补充材料</em>
    <div class="big-conte_">
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
        <div class="task_margin ng-scope"  style="border:1px solid #ccc; border-radius: 10px;background-color:#F7F7F7; padding-top:10px;">
            <form id="yhdksh_63" name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope">
                <div class="form-group">
                    <label class="col-sm-2 control-label">补充材料结果</label>
                    <div class="col-sm-8">
                        <input name="result_code" id="result_code" class="ng-pristine ng-untouched ng-valid ng-not-empty" type="radio" value="1">已补充
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input name="result_code" id="result_code" class="ng-pristine ng-untouched ng-valid ng-not-empty" type="radio" value="2">未补充
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">其它说明</label>
                    <div class="col-sm-8">
                        <textarea name="result_msg" id="result_msg" rows="3" class="form-control ng-pristine ng-untouched ng-valid ng-empty" type="text"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <a onclick="erp()" class="btn btn-primary">提交</a>
                </div>
<script>
function erp(){
    var result_code= $('input[name="result_code"]:checked').val(); //检查结果
    var result_msg= $('#result_msg').val();
    var icbc_id= '${requestScope.infodb.icbc_id}';
    var type_id= '${requestScope.infodb.type_id}';
    var id= '${requestScope.infodb.id}';
    //alert(icbc_id+"----"+type_id+"---"+id+"---");
    if(!result_code){
        alert("补充材料结果不能为空!");
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