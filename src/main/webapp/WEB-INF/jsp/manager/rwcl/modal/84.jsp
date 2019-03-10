<%@ page import="com.example.ddbx.tt.data.TtMap" %>
<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    System.out.println("result_map:"+result_map);
    request.setAttribute("result_map", result_map);
    //获取业务类型板块信息
    //request.setAttribute("ywlxlist", Tools.reclist("SELECT * FROM sys_modal where type='rwcl' and id_uplevel=0"));
%>
<li class="text-primary">
    <em>业务信息修改申请：</em>
    <div class="big-conte" style="display: none;">
        <div style="float:left;margin-left:20px;width:260px;">
            <strong>开始时间：</strong><%=s_time%>
        </div>
        <div style="float:left;margin-left:20px;width:260px;">
            <strong>处理时间：</strong><%=dt_edit%>
        </div>
        <div style="float:left;margin-left:20px;width:260px;">
            <strong>处理人：</strong><%=admin_name%></div>
        <strong style="margin-left:10px;"><i>处理信息：</i></strong><br>
        <div class="task_margin" style="border:1px solid #ccc; border-radius: 10px;background-color:#F7F7F7; padding-top:10px;">
            <form id="ywxxxgsh_96" name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope">
                <div class="form-group ng-scope">
                    <label class="col-sm-2 control-label">业务类型</label>
                    <div class="col-sm-8">
                        <select id="" name="" class="form-control">
                            <option value="0">***业务类型***</option>
                            <c:forEach items="${requestScope.ywlxlist}" var="y">
                                <option value="${y.name}" ${y.name eq result_map.ywlx?"selected='selected'":''}>${y.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">修改内容备注</label>
                    <div class="col-sm-8">
                        <textarea  id="" name="" class="form-control" type="text">${result_map.xgbz}</textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">修改原因备注</label>
                    <div class="col-sm-8">
                        <textarea id="" name="" class="form-control" type="text">${result_map.xgyy}</textarea>
                    </div>
                </div>
            </form>
        </div>
    </div>
</li>