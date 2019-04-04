<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: 86176
  Date: 2019/3/19
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:if test="${fn:contains(sessionScope.strAgp,',60,')==true}">
<div class="text-primary"><em>身份核查结果：</em>
    <div class="big-conte" style="display: block;">
        <strong style="margin-left: 10px;"><i>处理信息：</i></strong><br>
        <div class="task_margin"
             style="border: 1px solid #ccc; border-radius: 10px; background-color: #F7F7F7; padding-top: 10px;">
            <form name="modalForm" class="form-horizontal">
                <div class="form-group ng-scope" ng-if="notUseButton">
                    <label class="col-sm-2 control-label">审核结果</label>
                    <div class="col-sm-8">
                        <label class="radio-inline">
                            <input type="radio" value="1" name="result_code">通过
                        </label>
                        <label class="radio-inline">
                            <input type="radio" value="2" name="result_code">不通过
                        </label>
                        <label class="radio-inline">
                            <input type="radio" value="3" name="result_code">回退补件
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">意见说明</label>
                    <div class="col-sm-8">
                        <textarea rows="3" class="form-control" id="result_msg" name="result_msg"
                                  type="text"></textarea>
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
        var result_code= $('input[name="result_code"]:checked').val();
        var result_msg= $('#result_msg').val();
        var icbc_id= '${requestScope.infodb.icbc_id}';
        var type_id= '${requestScope.infodb.type_id}';
        var id= '${requestScope.infodb.id}';
        //alert(icbc_id+"----"+type_id+"---"+id);
        if(!result_code){
            alert("审核结果不能为空!");
            return false;
        }
        $.ajax({
            type: "POST",      //data 传送数据类型。post 传递
            dataType: 'json',  // 返回数据的数据类型json
            url: "/manager/ajaxpost",  // 控制器方法
            data: {
                result_code : result_code,
                result_msg:result_msg,
                icbc_id:icbc_id,
                type_id:type_id,
                id:id,
                type:'8'//类型
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