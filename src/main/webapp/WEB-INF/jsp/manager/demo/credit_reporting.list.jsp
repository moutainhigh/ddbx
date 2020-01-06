<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@ taglib prefix="Tools" uri="/tld/manager" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="box">
    <div class="box-header">
        <h3 class="box-title">
            征信
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
                            <th class="hidden-xs text-center"><!-- hidden-xs为手机模式时自动隐藏， text-center为居中-->
                                订单编号
                            </th>
                            <th class="text-center">
                                添加时间
                            </th>
                            <th class="text-center">
                                客户姓名
                            </th>
                            <th class="text-center">
                                银行征信状态
                            </th>
                            <th class="text-center">
                                操作
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="u" varStatus="num">
                            <tr role="row" class="odd">
                                <td class="hidden-xs text-center">
                                    订单编号
                                </td>
                                <td class="hidden-xs text-center">
                                        <%-- <select id="test" name="test">dicopt的演示
                                            ${Tools.dicopt("comm_states",u.state_id)}
                                        </select>
                                        --%>
                                        <%-- undic的演示 --%>
                                    添加时间
                                </td>
                                <td class="text-center">
                                    客户姓名
                                </td>
                                <td class="text-center">
                                    银行征信状态
                                </td>
                                <td class="text-center">
                                    <a href="">
                                        <i class="fa fa-search-plus"></i>
                                    </a>
                                    <a href="">
                                        <i class="fa fa-hand-paper-o"></i>
                                    </a>
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