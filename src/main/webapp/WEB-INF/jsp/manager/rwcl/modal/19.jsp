<%@ page import="com.example.ddbx.tt.data.TtMap" %>
<%@ page import="com.example.ddbx.tt.tool.Tools" %><%--
  Created by IntelliJ IDEA.
  User: 86176
  Date: 2019/3/19
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String result_value = request.getParameter("result_value");
    TtMap result_map = new TtMap();
    String admin_name = "";
    String s_time = "";
    if (result_value != null && !result_value.equals("")) {
        result_map = Tools.jsonDeCode_mp(result_value);
    }
    if (!Tools.myIsNull(request.getParameter("admin_name"))) {
        admin_name = request.getParameter("admin_name");
    }
    if (!Tools.myIsNull(request.getParameter("s_time"))) {
        s_time = request.getParameter("s_time");
    }
    String dt_edit = "";
    if (!Tools.myIsNull(request.getParameter("dt_edit"))) {
        dt_edit = request.getParameter("dt_edit");
    }
    request.setAttribute("result_map", result_map);
%>
<li class="text-primary"><em>身份核查结果：</em>
    <div class="big-conte" style="display: none;">
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>开始时间：</strong>
            <%=s_time%>
        </div>
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>处理时间：</strong>
            <%=dt_edit%>
        </div>
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>处理人：</strong><%=admin_name%>
        </div>
        <strong style="margin-left: 10px;"><i>处理信息：</i></strong><br>
        <div class="task_margin ng-scope"
             style="border: 1px solid #ccc; border-radius: 10px; background-color: #F7F7F7; padding-top: 10px;">
            <form name="modalForm" class="form-horizontal">
                <!-- ngIf: notUseButton -->
                <div class="form-group">
                    <label class="col-sm-2 control-label">审核结果</label>
                    <div class="col-sm-8">
                        <label class="radio-inline">
                            <input type="radio" value="1" ${result_map.result_code eq 1?"checked":''}  name="result_code">通过
                        </label>
                        <label class="radio-inline">
                            <input type="radio" value="2" ${result_map.result_code eq 2?"checked":''} name="result_code">不通过
                        </label>
                        <label class="radio-inline">
                            <input type="radio" value="3" ${result_map.result_code eq 3?"checked":''} name="result_code">回退补件
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">意见说明</label>
                    <div class="col-sm-8">
                        <textarea rows="3" class="form-control"
                                  type="text">${result_map.result_msg}</textarea>
                    </div>
                </div>
            </form>
        </div>
    </div>
</li>
