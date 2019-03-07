<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@ page import="com.example.ddbx.tt.data.TtMap" %><%--
  Created by IntelliJ IDEA.
  User: 86176
  Date: 2019/3/5
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="text-primary"><em>征信员银行意见：</em>
    <div class="big-conte" style="display: block;">
        <strong style="margin-left: 10px;"><i>处理信息：</i></strong><br>
        <div class="task_margin ng-scope">
            <form name="modalForm" class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-2 control-label">征信员银行意见：</label>
                    <div class="col-sm-8">
                        <textarea rows="3" id="zxyyhyj" name="zxyyhyj" class="form-control"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">申请通融原因：</label>
                    <div class="col-sm-8">
                        <textarea rows="3" id="tr_msg" name="tr_msg" class="form-control">${erp_result_value.tr_msg}</textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">通融资料:</label>
                    <div class="col-sm-10">
                        <div class="row inline-from">
                            <input id="imgstep1_5ss" name="imgstep1_5ss" value="${erp_result_value.imgstep1_5ss}"  type="hidden" />
                            <%
                                TtMap result_value=(TtMap) request.getAttribute("erp_result_value");
                                String[] ssImgs1_1 = { //设置已有值
                                        !Tools.myIsNull(result_value.get("imgstep1_5ss")) ? result_value.get("imgstep1_5ss") : ""
                                };
                                ssImgs1_1 = ssImgs1_1[0].split(",");
                                for (int i = 0; i < ssImgs1_1.length; i++) {

                                    if (ssImgs1_1[i] != null && !ssImgs1_1[i].equals("")) {
                                        %>
                            <div style="position: relative;width: 100px;height:140px;display: inline-block;text-align: center;margin: auto;" id="div_imgstep1_5ss<%=i+1%>">
                                <a href="<%=ssImgs1_1[i]%>" target="_blank">
                                <img id="imgstep1_5ss_view<%=i+1%>" name="imgstep1_5ss_view<%=i+1%>" src="<%=ssImgs1_1[i]%>" class="imgclass" style="width: 100%;height:100px;border-radius:10px;">
                                </a>
                            </div>


                            <%
                                    }
                                }
                            %>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <a onclick="erp()" class="btn btn-primary">提交</a>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    function erp() {
        var tr_msg= $('#tr_msg').val();
        var imgstep1_5ss='${erp_result_value.imgstep1_5ss}';
        var zxyyhyj= $('#zxyyhyj').val();
        var icbc_id= '${requestScope.infodb.icbc_id}';
        var type_id= '${requestScope.infodb.type_id}';
        var id= '${requestScope.infodb.id}';
        tr_msg = tr_msg.replace(/\ +/g,"").replace(/[\r\n]/g,"");
        imgstep1_5ss=imgstep1_5ss.replace(/\,/g,"-");
        //alert(imgstep1_5ss+"----"+tr_msg+"---"+id);
        if(!zxyyhyj){
            alert("征信员银行意见不能为空!");
            return false;
        }
        $.ajax({
            type: "POST",      //data 传送数据类型。post 传递
            dataType: 'json',  // 返回数据的数据类型json
            url: "/manager/ajaxpost",  // 控制器方法
            data: {
                zxyyhyj : zxyyhyj,
                tr_msg : tr_msg,
                imgstep1_5ss : imgstep1_5ss,
                icbc_id:icbc_id,
                type_id:type_id,
                id:id,
                type:'2'
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