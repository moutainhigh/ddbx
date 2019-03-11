<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.example.ddbx.tt.data.TtMap" %>
<%@ page import="com.example.ddbx.tt.tool.Tools" %>
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
<li class="text-primary">
    <em>机构补充材料</em>
    <div class="big-conte" style="display: none;">
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>开始时间：</strong>
            <%=s_time%>
        </div>
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>处理时间：</strong>
            <%=dt_edit%>
        </div>
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>处理人：</strong><%=admin_name%>
        </div>
        <strong style="margin-left:10px;">
            <i>处理信息：</i></strong><br>
        <!-- ngIf: taskAct.pageName!='cudp'||'_cudp'.indexOf(taskAct.pageName)<=-1 -->
        <!-- ngInclude: '/modules/'+taskAct.menuCode+'/'+taskAct.pageName+'.html' -->
        <div class="task_margin ng-scope"  style="border:1px solid #ccc; border-radius: 10px;background-color:#F7F7F7; padding-top:10px;">
            <form id="yhdksh_63" name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope">
                <div class="form-group">
                    <label class="col-sm-2 control-label">补充材料结果</label>
                    <div class="col-sm-8">
                        <input name="" id="" ${result_map.result_code eq 1?"checked":''} class="ng-pristine ng-untouched ng-valid ng-not-empty" type="radio" value="1">已补充
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input name="" id="" ${result_map.result_code eq 2?"checked":''} class="ng-pristine ng-untouched ng-valid ng-not-empty" type="radio" value="2">未补充
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">其它说明</label>
                    <div class="col-sm-8">
                        <textarea name="result_msg" id="result_msg" rows="3" class="form-control ng-pristine ng-untouched ng-valid ng-empty" type="text"><%=result_map.get("result_msg")%></textarea>
                    </div>
                </div>
            </form>
        </div>
    </div>
</li>
