<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 86176
  Date: 2019/3/9
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="text-primary">
    <em>业务属性值修改申请</em>
    <div class="big-conte_">
        <div class="task_margin ng-scope"
             style="border:1px solid #ccc; border-radius: 10px;background-color:#F7F7F7; padding-top:10px;">
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
                        <textarea id="xgbz" name="xgbz" class="form-control" type="text"></textarea>
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
            <script type="text/javascript">
                function erp() {
                    // var form = new FormData(document.getElementById("ywxxxgsh_96"));
                    // $.ajax({
                    //     url:"/erp/erp_ywxxxgsh_96.do",
                    //     type:"post",
                    //     data:form,
                    //     processData:false,
                    //     contentType:false,
                    //     success:function(data){
                    //         alert("提交成功!");
                    //         //location.reload();
                    //         window.location.href='';
                    //     },
                    //     error:function(e){
                    //         alert("错误！！");
                    //     }
                    // });
                    var ywlx = $('#ywlx').val();
                    var xgbz = $('#xgbz').val();
                    var xgyy = $('#xgyy').val();
                    var icbc_id = '${param.icbc_id}';
                    var type_id = '${param.type_id}';
                    //alert(icbc_id+"----"+type_id+"---"+id);
                    if (!ywlx) {
                        alert("业务类型不能为空!");
                        return false;
                    }
                    if (!xgbz) {
                        alert("修改备注不能为空!");
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
                            type: '4'//类型
                        },  //传送的数据
                        success: function (data) {
                            alert(data.msg);
                            window.location.href = "";
                        },
                        error: function () {
                            alert("编辑失败...请稍后重试！");

                        }
                    });

                }
            </script>
        </div>
    </div>
</div>


