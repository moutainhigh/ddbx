<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@ page import="com.example.ddbx.tt.data.TtMap" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="box">
    <%
        String url = Tools.urlKill("sdo|id") + "&sdo=form&id=";
        TtMap minfo = (TtMap) request.getAttribute("minfo");
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
                            <th class="text-center" style="width:120px;">
                                姓名
                            </th>
                            <th class="hidden-xs text-center">
                                <!-- hidden-xs为手机模式时自动隐藏， text-center为居中-->
                                编号
                            </th>
                            <th class="hidden-xs text-center">
                                用户名
                            </th>
                            <th class="hidden-xs text-center">
                                所属公司
                            </th>
                            <th class="hidden-xs text-center">
                                最后更新时间
                            </th>
                            <th class="hidden-xs text-center">显示</th>
                            <th class="text-center">操作</th>
                        </tr>
                        </thead>
                        <tbody class="gallerys">
                        <c:forEach items="${list}" var="u" varStatus="num">
                            <tr role="row" class="odd">
                                <td class="user-table-info text-center">
                                    <div class="media">
                                        <div class="media-left hidden-xs">
                                            <div class="user-face-pic">
                                                <img class="media-object gallery-pic" onclick="$.openPhotoGallery(this)"
                                                     src="${Tools.myIsNull(u.avatarurl)?"images/face.png":u.avatarurl}"
                                                     style="width: 36px;height:36px;">
                                            </div>
                                        </div>
                                        <div class="media-body media-middle">
                                            <h5 class="media-heading">
                                                <a href="<%=url%>${u.id}">${u.name}</a>
                                            </h5>
                                            <p></p>
                                        </div>
                                    </div>
                                </td>
                                <td class="hidden-xs text-center">
                                        ${u.id}
                                </td>
                                <td class="hidden-xs text-center">
                                        ${u.username}
                                </td>
                                <td class="hidden-xs text-center">
                                        ${u.fsname}
                                </td>
                                <td class="hidden-xs text-center">
                                        ${fn:replace(u.dt_edit, ".0", "")}
                                </td>
                                <td class="hidden-xs text-center"><%
                                    String cn = request.getParameter("cn");
                                %>
                                    <select id="showtag_${u.id}"
                                            onchange="ajax_edit(${u.id},'showtag',this.value,'<%=cn%>');"
                                            class="form-control">
                                            ${u.choice}
                                    </select>
                                </td>
                                <td class="text-center">
                                    <div class="table-button">
                                        <a href="<%=url%>${u.id}" class="btn btn-default">
                                            <i class="fa fa-pencil"></i>
                                        </a>
                                        <a onclick="del('<%=url%>','${u.id}')"
                                           class="btn btn-default">
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
        if (window.confirm('你确定要删除吗？')) {
            url = url.replace('&id=', '').replace("form", "list");
            //alert(url);
            //定义变量sendData
            var sendData = {
                id: id,
                cn: 'admin'
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
    }
</script>