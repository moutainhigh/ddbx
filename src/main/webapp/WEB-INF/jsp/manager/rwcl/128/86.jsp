<%--
  Created by IntelliJ IDEA.
  User: 86176
  Date: 2019/3/9
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="text-primary">
    <em>系统运维(专员):</em>
    <div class="big-conte_">
        <strong style="margin-left:10px;"><i>处理信息：</i></strong><br>
        <div class="task_margin ng-scope"
             style="border:1px solid #ccc; border-radius: 10px;background-color:#F7F7F7; padding-top:10px;">
            <form id="modalForm" name="modalForm" class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-2 control-label">审核结果</label>
                    <div class="col-sm-8">
                        <label class="radio-inline">
                            <input type="radio" value="1" name="state_code">通过
                        </label>
                        <label class="radio-inline">
                            <input type="radio" value="2" name="state_code">不通过
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">备注</label>
                    <div class="col-sm-8">
                        <textarea name="result_msg" id="result_msg" class="form-control" type="text"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">修改原因备注</label>
                    <div class="col-sm-8">
                        <textarea name="xgyy" id="xgyy" class="form-control" type="text"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <a onclick="erp()" class="btn btn-primary">提交</a>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    function erp() {
        var state_code = $('input[name="state_code"]:checked').val();
        var result_msg = $('#result_msg').val();
        var xgyy = $('#xgyy').val();
        var icbc_id = '${requestScope.infodb.icbc_id}';
        var type_id = '${requestScope.infodb.type_id}';
        var id = '${requestScope.infodb.id}';
        //alert(ywlx+"----"+type_id+"---"+id);
        if (!state_code) {
            alert("请选择业务类型!");
            return false;
        }
        $.ajax({
            type: "POST",      //data 传送数据类型。post 传递
            dataType: 'json',  // 返回数据的数据类型json
            url: "/manager/ajaxpost",  // 控制器方法
            data: {
                state_code: state_code,
                result_msg: result_msg,
                xgyy: xgyy,
                icbc_id: icbc_id,
                type_id: type_id,
                id: id,
                type: '7'//类型
            },  //传送的数据
            error: function () {
                alert("编辑失败...请稍后重试！");

            },
            success: function (data) {
                alert(data.msg);
                window.location.href = "/manager/index?cn=mytask&sdo=list&type=ddbx";
            }
        });

    }
</script>