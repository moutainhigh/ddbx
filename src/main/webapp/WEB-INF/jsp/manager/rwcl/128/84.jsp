<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${fn:contains(sessionScope.strAgp,',147,')==true}">
<div class="text-primary">
    <em>业务信息修改申请：</em>
    <div class="big-conte" style="display: block;">
        <strong style="margin-left:10px;"><i>处理信息：</i></strong><br>
        <div class="task_margin ng-scope" style="border:1px solid #ccc; border-radius: 10px;background-color:#F7F7F7; padding-top:10px;">
            <form id="ywxxxgsh_96" name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope">
                <div class="form-group ng-scope">
                    <label class="col-sm-2 control-label">业务类型</label>
                    <div class="col-sm-8">
                        <select id="ywlx" name="ywlx" class="form-control">
                            <option value="0">***业务类型***</option>
                            <c:forEach items="${requestScope.ywlxlist}" var="y">
                                <option value="${y.name}">${y.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">修改内容备注</label>
                    <div class="col-sm-8">
                        <textarea  id="xgbz" name="xgbz" class="form-control" type="text"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">修改原因备注</label>
                    <div class="col-sm-8">
                        <textarea id="xgyy" name="xgyy" class="form-control" type="text"></textarea>
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
<script type="text/javascript">
    function erp() {
        var ywlx = $('#ywlx').val();
        var xgbz = $('#xgbz').val();
        var xgyy = $('#xgyy').val();
        var icbc_id = '${requestScope.infodb.icbc_id}';
        var type_id = '${requestScope.infodb.type_id}';
        var id = '${requestScope.infodb.id}';
  //alert(ywlx+"----"+type_id+"---"+id);
        if (!ywlx||ywlx==0) {
            alert("请选择业务类型!");
            return false;
        }
        if (!xgbz) {
            alert("修改内容不能为空!");
            return false;
        }
        $.ajax({
            type: "POST",      //data 传送数据类型。post 传递
            dataType: 'json',  // 返回数据的数据类型json
            url: "/manager/ajaxpost",  // 控制器方法
            data: {
                ywlx: ywlx,
                xgbz: xgbz,
                xgyy: xgyy,
                icbc_id: icbc_id,
                type_id: type_id,
                id: id,
                type: '6'//类型
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