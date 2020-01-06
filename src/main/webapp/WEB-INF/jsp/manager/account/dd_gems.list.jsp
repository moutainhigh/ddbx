<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="box">
    <div class="box-header">
        <h3 class="box-title">
            用户列表
        </h3>
    </div>
    <%
        String url = Tools.urlKill("sdo|id") + "&sdo=form&id=";
    %>
    <!-- /.box-header -->
    <div class="box-body">
        <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
            <div class="row">
                <div class="col-sm-6"></div>
                <div class="col-sm-6"></div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <table id="example2" class="table table-bordered table-hover dataTable" role="grid"
                           aria-describedby="example2_info">
                        <thead>
                        <tr role="row">
                            <th class="hidden-xs text-center">
                                <!-- hidden-xs为手机模式时自动隐藏， text-center为居中-->
                                编号
                            </th>
                            <th class="hidden-xs text-center">
                                用户姓名
                            </th>
                            <th class="text-center">
                                所属公司
                            </th>
                            <th class="text-center">
                                用户类型
                            </th>
                            <th class="hidden-xs text-center">
                                最后更新时间
                            </th>
                            <th class="hidden-xs text-center">添加时间</th>
                            <th class="text-center">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="u" varStatus="num">
                            <tr role="row" class="odd">
                                <td class="hidden-xs text-center">
                                        ${u.id}
                                </td>
                                <td class="hidden-xs text-center">
                                        ${u.name}
                                </td>
                                <td class="text-center">

                                </td>
                                <td class="text-center">
                                        ${u.user_type}
                                </td>
                                <td class="hidden-xs text-center">
                                        ${fn:replace(u.dt_edit, ".0", "")}
                                </td>
                                <td class="hidden-xs text-center">${fn:replace(u.dt_add, ".0", "")}</td>
                                <td class="text-center">
                                    <div class="table-button">
                                        <a href="<%=url%>${u.id}" class="btn btn-default">
                                            <i class="fa fa-pencil"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
</script>
</body>

</html>