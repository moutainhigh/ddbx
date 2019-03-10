<%--
  Created by IntelliJ IDEA.
  User: 86176
  Date: 2019/3/9
  Time: 11:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="text-primary">
    <em>业务管理部审核</em>
    <div class="big-conte_">
        <strong style="margin-left:10px;"><i>处理信息:</i></strong><br>
        <div class="task_margin ng-scope"
             style="border:1px solid #ccc; border-radius: 10px;background-color:#F7F7F7; padding-top:10px;">
            <form id="modalForm" name="modalForm" class="form-horizontal">
                <div class="form-group ng-scope">
                    <label class="col-sm-2 control-label">审核结果:</label>
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
                    <label class="col-sm-2 control-label">备注:</label>
                    <div class="col-sm-8">
                        <textarea id="result_msg" name="result_msg" class="form-control" type="text"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">修改原因备注</label>
                    <div class="col-sm-8">
                        <textarea name="xgyy" id="xgyy" class="form-control" type="text"></textarea>
                    </div>
                </div>
                <%--                <div class="form-group">
                                    <label class="col-sm-2 control-label">相关材料:</label>
                                </div>--%>
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
        var xgyy = $('#xgyy').val();
        var result_msg = $('#result_msg').val();
        var icbc_id = '${requestScope.infodb.icbc_id}';
        var type_id = '${requestScope.infodb.type_id}';
        var id = '${requestScope.infodb.id}';
//alert(icbc_id+"----"+type_id+"---"+id);
        if (!state_code) {
            alert("审核结果不能为空!");
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
                type: '5'//类型
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