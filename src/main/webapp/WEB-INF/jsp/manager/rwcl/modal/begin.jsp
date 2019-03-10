
<%@ page import="com.example.ddbx.tt.tool.Tools" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String dt_edit = "";
    if (!Tools.myIsNull(request.getParameter("dt_edit"))) {
        dt_edit = request.getParameter("dt_edit");
    }
    String admin_name = "";
    if (!Tools.myIsNull(request.getParameter("admin_name"))) {
        admin_name = request.getParameter("admin_name");
    }
%>

<li class="text-primary"><em>开始：</em>
    <div class="big-conte" style="display: none;">
        <div style="float: left; margin-left: 20px; width: 300px;">
            <strong>开始时间：</strong>
            <%=dt_edit%>
        </div>
        <div style="float: left; margin-left: 20px; width: 260px;">
            <strong>处理人：</strong><%=admin_name%>
        </div>
    </div>
</li>
