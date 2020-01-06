<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="Tools" uri="/tld/manager" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="box">
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
                            <th class="text-center"><!-- hidden-xs为手机模式时自动隐藏， text-center为居中-->
                                订单编号
                            </th>
                            <th class="text-center">
                                客户姓名
                            </th>
                            <th class="text-center">
                                订单状态
                            </th>
                            <th class="text-center">
                                来源:公司-姓名
                            </th>
                            <th class="hidden-xs text-center">
                                提交/更新时间
                            </th>
                            <th class="text-center">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="u" varStatus="num">
                            <tr role="row" class="odd">
                                <td class="text-center">
                                        ${u.order_code}
                                </td>
                                <td class="text-center">
                                        ${u.c_name}
                                </td>
                                <td class="text-center">
									<span class="label label-success">
									 <c:choose>
                                         <c:when test="${u.qcpg_status eq 0}">草稿箱</c:when>
                                         <c:when test="${u.qcpg_status eq 1}">审核中</c:when>
                                         <c:when test="${u.qcpg_status eq 2}">通过</c:when>
                                         <c:when test="${u.qcpg_status eq 3}">不通过</c:when>
                                         <c:when test="${u.qcpg_status eq 4}">回退补件</c:when>
                                     </c:choose>
									</span>
                                </td>
                                <td class="text-center">
                                        ${u.fs_name}-${u.admin_name}
                                </td>
                                <td class="hidden-xs text-center">
                                        ${u.dt_add}<br>${u.dt_edit}
                                </td>
                                <td class="text-center">
                                    <div class="table-button">
                                        <a href="<%=url%>${u.id}" class="btn btn-default">
                                            <i class="fa fa-pencil"></i>
                                        </a>
                                        <a onclick="del('<%=url%>','${u.id}')" class="btn btn-default">
                                            <i class="fa fa-trash"></i>
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
    //删除操作
    function del(url, id) {
        url = url.replace('&id=', '').replace("form", "list");
        //alert(url);
        //定义变量sendData
        var sendData = {
            id: id,
            cn: 'sys_modal'
        };
        $.ajax({
            url: '/manager/todel',
            type: 'post',
            dataType: 'json',
            async: true,//异步请求
            cache: false,
            data: sendData,//使用变量sendData
            //执行成功的回调函数
            success: function (data) {
                if (data.code) {
                    alert("删除成功！");
                    window.location.href = url;
                } else {
                    alert("删除失败！");
                }
            },
            //执行失败或错误的回调函数
            error: function (data) {
                alert("删除失败！");
            }
        });
    }
</script>
</body>
</html>