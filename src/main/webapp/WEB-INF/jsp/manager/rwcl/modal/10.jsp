<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@ page import="com.example.ddbx.tt.data.TtMap" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    System.out.println(result_map+"**********");
    request.setAttribute("result_map", result_map);
%>
<li class="text-primary">
    <em>提交评估：</em>
    <div class="big-conte" style="display: none;">
        <div style="float: left; margin-left: 20px; width: 300px;">
            <strong>开始时间：</strong>
            <%=s_time%>
        </div>
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>处理时间：</strong>
            <%=dt_edit%>
        </div>
        <div style="float: left; margin-left: 20px; width: 260px;">
            <strong>处理人：</strong><%=admin_name%>
        </div>
        <strong style="margin-left:10px;"><i>处理信息：</i></strong><br>
        <div class="task_margin ng-scope">
            <a href="#clxx" data-toggle="tab">相关信息请查看对应页签</a>
        </div>
    </div>
</li>
