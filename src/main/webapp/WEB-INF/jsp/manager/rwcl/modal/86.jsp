<%@ page import="com.example.ddbx.tt.data.TtMap" %>
<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    //System.out.println("result_map:" + result_map);
    request.setAttribute("result_map", result_map);
    //获取业务类型板块信息
    //request.setAttribute("ywlxlist", Tools.reclist("SELECT * FROM sys_modal where type='rwcl' and id_uplevel=0"));
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<li class="text-primary">
    <em>系统运维(专员):</em>
    <div class="big-conte" style="display: none;">
        <div style="float:left;margin-left:20px;width:260px;">
            <strong>开始时间：</strong><%=s_time%>
        </div>
        <div style="float:left;margin-left:20px;width:260px;">
            <strong>处理时间：</strong><%=dt_edit%>
        </div>
        <div style="float:left;margin-left:20px;width:260px;">
            <strong>处理人：</strong><%=admin_name%>
        </div>
        <strong style="margin-left:10px;"><i>处理信息：</i></strong><br>
        <div class="task_margin ng-scope"
             style="border:1px solid #ccc; border-radius: 10px;background-color:#F7F7F7; padding-top:10px;">
            <form id="modalForm" name="modalForm" class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-2 control-label">审核结果</label>
                    <div class="col-sm-8">
                        <label class="radio-inline">
                            <input type="radio" value="1" name=""  ${result_map.state_code eq 1?"checked":''} />通过
                        </label>
                        <label class="radio-inline">
                            <input type="radio" value="2" name=""  ${result_map.state_code eq 2?"checked":''} />不通过
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">备注</label>
                    <div class="col-sm-8">
                        <textarea name="" class="form-control"
                                  type="text">${result_map.result_msg}</textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">修改原因备注</label>
                    <div class="col-sm-8">
                        <textarea name="xgyy" id="xgyy" class="form-control" type="text">${result_map.xgyy}</textarea>
                    </div>
                </div>
            </form>
        </div>
    </div>
</li>
