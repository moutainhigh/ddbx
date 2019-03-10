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
                            <th class="text-center">
                                公司LOGO
                            </th>
                            <th class="text-center">
                                公司名称
                            </th>
                            <th class="text-center">
                                签约时名称
                            </th>
                            <th class="hidden-xs text-center">
                                最后更新时间
                            </th>
                            <th class="hidden-xs text-center">添加时间</th>
                            <th class="text-center">操作</th>
                        </tr>
                        </thead>
                        <tbody class="gallerys"><!--class为gallerys表示图片放大组件的起始范围。 -->
                        <c:forEach items="${list}" var="u" varStatus="num">
                            <tr role="row" class="odd">
                                <td class="hidden-xs text-center">
                                        ${u.id}
                                </td>
                                <td class="text-center">
                                    <div class="user-face-pic">
                                        <img class="media-object gallery-pic" onclick="$.openPhotoGallery(this)"
                                             src="${Tools.myIsNull(u.fs_logo)?"images/face.png":u.fs_logo}"
                                             style="width: 36px;height:36px;">
                                    </div>
                                </td>
                                <td class="hidden-xs text-center">
                                    <a href="<%=url%>${u.id}">
                                            ${u.name}
                                    </a>
                                </td>
                                <td class="text-center">
                                        ${u.name_qy}
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
                cn: 'fs'
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