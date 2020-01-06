<%--
 * @Description: file content
 * @Author: tt
 * @Date: 2018-11-30 16:44:58
 * @LastEditTime: 2019-01-13 20:32:55
 * @LastEditors: tt
 **/
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<body class="am-with-fixed-header">
<form id="myform" action="xxxx提交保存数据的url"
      class="uniform" method="post" enctype="multipart/form-data">
    <% String
            upFile = "../upfile.inc.jsp";
        String[] ssImgs = { //设置已有值
                // "/upload/2019/01/11/9a747d32c6807b3b16e352539a47b946.jpg","/upload/2019/01/11/5711c668544730bbef922176ffa26c23.jpg","/upload/2019/01/11/c5475cb485f6e60f373a3ae753c2aefc.jpg",
                //"/upload/2019/01/11/e4ca4881b66691388a9ede3aa4b4b26d.jpg","/upload/2019/01/11/dbcacf426335dd9c0d3c1159ece72d31.jpg","/upload/2019/01/11/c45f826bb2a7272cb63dd18b48a054db.jpg",
                //"/upload/2019/01/11/9a747d32c6807b3b16e352539a47b946.jpg","/upload/2019/01/11/c5475cb485f6e60f373a3ae753c2aefc.jpg"
        };
        String sImgs = "";
        if (ssImgs.length > 0) {
            for (int i = 0; i < ssImgs.length; i++) {
                sImgs = sImgs + ssImgs[i] + "|";
            }
        }
    %>
    <%--
        img_MarginImgSrc外层背景
        img_MarginImgClass为外层背景CSS
        img_Total 图片总数
        img_NamePre 生成的input/img等组件的id和name。
        img_DefaultImgSrc 无图时显示的默认的图图
        l1div_Style 外层div的style
        img_Style 上传效果图片img的img的style
        img_FileStyle input type=file的style
        img_SmallWidth，img_SmallHeight 生成缩略图的宽和高
        sImgs 已有图片列表，按顺序一一对应
     --%>
    <jsp:include page="<%=upFile%>">
        <jsp:param name="img_MarginImgSrc" value=""/>
        <jsp:param name="img_MarginImgClass" value=""/>
        <jsp:param name="img_Total" value="8"/>
        <jsp:param name="img_NamePre" value="imgurl"/>
        <jsp:param name="img_DefaultImgSrc" value="images/mgcaraddimg.jpg"/>
        <jsp:param name="l1div_Style"
                   value="width: 100px;height:140px;display: inline-block;text-align: center;margin: auto;"/>
        <jsp:param name="img_Style" value="width: 100%;height:100px;border-radius:10px;"/>
        <jsp:param name="img_FileStyle"
                   value="position: absolute;left: 0;top: 0;height: 100%;width: 100%;background: transparent;border: 0;margin: 0;padding: 0;filter: alpha(opacity=0);-moz-opacity: 0;-khtml-opacity: 0;opacity: 0;"/>
        <jsp:param name="img_Class" value="imgclass"/>
        <jsp:param name="img_FileClass" value="uploadfileclass"/>
        <jsp:param name="img_SmallWidth" value="100"/>
        <jsp:param name="img_SmallHeight" value="100"/>
        <jsp:param name="sImgs" value="<%=sImgs%>"/>
    </jsp:include>
</form>

