<%@ page import="com.example.ddbx.tt.tool.Tools" %><%--
  Created by IntelliJ IDEA.
  User: 86176
  Date: 2019/3/5
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

