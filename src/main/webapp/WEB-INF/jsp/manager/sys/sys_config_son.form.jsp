<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.ddbx.tt.data.TtMap" %>
<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    TtMap infodb = (TtMap) request.getAttribute("infodb");
    TtMap minfo = (TtMap) request.getAttribute("minfo");
    long id_uplevel = 0;
    if (!Tools.myIsNull(infodb.get("id_uplevel"))) {
        id_uplevel = Long.parseLong(infodb.get("id_uplevel"));
    }
%>
<div class="admin-content nav-tabs-custom box">
    <div class="box-header with-border">
        <div class="box-header with-border">
            <h3 class="box-title">编辑模块</h3>
        </div>
        <div class="box-body" id="tab-content">
            <div class="form-group">
                <label class="col-sm-2 control-label">模块相关设置</label>
                <div class="col-sm-10">
                    <div class="row inline-from">
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">完整名称</span>
                                <input type="text" class="form-control" id="name" name="name" placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">所属业务板块</span>
                                <select id="c_id" name="c_id" class="form-control">
                                    <option value="0">请选择</option>
                                    <c:forEach var="c" items="${requestScope.clgc_list}">
                                        <option value="${c.id}">${c.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">菜单显示</span>
                                <select id="showtag" name="showtag" class="form-control">
                                    <option value="">请选择</option>
                                    <option value="1">显示</option>
                                    <option value="0">隐藏</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">菜单设置</label>
                <div class="col-sm-10">
                    <div class="row inline-from">
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">cn</span>
                                <input type="text" class="form-control" id="cn" name="cn" placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">type</span>
                                <input type="text" class="form-control" id="type" name="type" placeholder="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">sdo</span>
                                <input type="text" class="form-control" id="sdo" name="sdo" placeholder="">
                            </div>
                        </div>
                        <%if (Tools.isSuperAdmin(minfo)) {%>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">urlotherstr</span>
                                <input type="text" class="form-control" id="urlotherstr" name="urlotherstr"
                                       placeholder="">
                                </select>
                            </div>
                        </div>
                        <%}%>
                        <div class="col-sm-4">
                            <div class="input-group">
                                <span class="input-group-addon">排序</span>
                                <input type="number" class="form-control" id="number" name="number" placeholder=""
                                       step="1">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">处理信息内文本/表单（HTML）</label>
                <div class="col-sm-10">
				<textarea id="pagehtml" name="pagehtml" style="width: 100%; height: 200px" class="form-control">

				</textarea>
                </div>
            </div>
        </div>
    </div>
</div>