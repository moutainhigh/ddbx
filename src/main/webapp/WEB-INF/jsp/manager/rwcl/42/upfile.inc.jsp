<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 演示循环上传文件框，是手机样式的 -->
<%
  int ntotal = Integer.valueOf(request.getParameter("img_Total"));
  String sImgs = request.getParameter("sImgs");
  String[] ssImgs = sImgs.split("\\|");//获取已有图片
  int ii = 0 ;
  String sFile;
  String sFileDef = request.getParameter("img_DefaultImgSrc");
%>
<%if(ntotal<=1){
  sFile = ii >ssImgs.length-1?sFileDef:ssImgs[ii] ;
  if (Tools.myIsNull(sFile)){
    sFile=sFileDef;
  }
  ii++;
%>
<div style="position: relative;${param.l1div_Style}" id="div_${param.img_NamePre}${i}">
  　<c:if test="${param.img_MarginImgSrc != null &&  param.img_MarginImgSrc !=''}">
  <img src="${param.img_MarginImgSrc}" alt="" class="${param.img_MarginImgClass}">
</c:if>
  <img id="${param.img_NamePre}_view" name="${param.img_NamePre}_view" src="<%=sFile%>" class="${param.img_Class}" style="${param.img_Style}">
  <%--这个用来展示上传后的缩略图用--%>
  <input type="hidden" id="${param.img_NamePre}" name="${param.img_NamePre}" value="<%=sFile%>">
  <%--这个用来保存上传后的图片url值--%>
  <%--图片上传演示--%>
  <input type="file" id="upload_${param.img_NamePre}" runat="server" name="upload_immm" accept="${param.img_Accept}" style="${param.img_FileStyle}" class="${param.img_FileClass}">
  <script>
    $('#upload_${param.img_NamePre}').fileUpload({//压缩图片为jpg后再上传
      "url": "/ttAjaxPost?do=fileup&smallwidth=${param.img_SmallWidth}&smallheight=${param.img_SmallHeight}&shuitext=快加认证",//smallwidth缩略图宽,smallheight缩略图高，shuitext水印文字
      "success": function (res) {
        eval("var data=" + res);
        var msg = data.msg;
        $('#upload_${param.img_NamePre}').attr('filename', '');
        $('#upload_${param.img_NamePre}').val('');
        if (data.url) {
          var ${param.img_NamePre} = data.url;
          var small${param.img_NamePre} = data.small ? data.small : data.url;
          if (msg) {
            alert(msg);
            //$("#aiclf45_1").attr("class", "am-icon-warning am-text-warning");
          } else {
            //${param.img_NamePre} = "assess/"+${param.img_NamePre};
            $('#${param.img_NamePre}').val(${param.img_NamePre});
            $('#${param.img_NamePre}_view').attr('src', small${param.img_NamePre});
            $('#${param.img_NamePre}_view').parents('div.hide:first').removeClass('hide');
            //$("#aiclf45_1").attr("class", "am-icon-check am-text-success");
          }
        }else{
          if (msg) {
            alert(msg);
          }
        }
        if (typeof (cloaseuplayer) == 'function') {
          cloaseuplayer("#div_${param.img_NamePre}");
        }
      },
      "fail":function(res){
        eval("var data=" + res);
        var msg = data.msg;
        if (msg) {
          alert(msg);
        }
      }
    });
    $('#upload_${param.img_NamePre}').on('change', function () {
      //$("#aiclf45_1").attr("class", "am-icon-refresh am-icon-spin");
      if (typeof (beforeup) == 'function') {
        beforeup("#div_${param.img_NamePre}");
      }
    });
  </script>
</div>
<%}else{%>
<c:forEach var="i" begin="1" end="<%=ntotal%>" step="1">
  <%
    sFile = ii >ssImgs.length-1?sFileDef:ssImgs[ii] ;
    if (Tools.myIsNull(sFile)){
      sFile=sFileDef;
    }
    ii++;
  %>
  <div style="position: relative;${param.l1div_Style}" id="div_${param.img_NamePre}${i}">
    　<c:if test="${param.img_MarginImgSrc != null &&  param.img_MarginImgSrc !=''}">
    <img src="${param.img_MarginImgSrc}" alt="" class="${param.img_MarginImgClass}">
  </c:if>
    <img id="${param.img_NamePre}_view${i}" name="${param.img_NamePre}_view${i}" src="<%=sFile%>" class="${param.img_Class}" style="${param.img_Style}">
      <%--这个用来展示上传后的缩略图用--%>
    <input type="hidden" id="${param.img_NamePre}${i}" name="${param.img_NamePre}${i}" value="<%=sFile%>">
      <%--这个用来保存上传后的图片url值--%>
      <%--图片上传演示--%>
    <input type="file" id="upload_${param.img_NamePre}${i}" runat="server" name="upload_immm" accept="image/*" style="${param.img_FileStyle}" class="${param.img_FileClass}">
    <script>
      $('#upload_${param.img_NamePre}${i}').fileUpload({//压缩图片为jpg后再上传
        "url": "/ttAjaxPost?do=fileup&smallwidth=${param.img_SmallWidth}&smallheight=${param.img_SmallHeight}&shuitext=快加认证",//smallwidth缩略图宽,smallheight缩略图高，shuitext水印文字
        "success": function (res) {
          eval("var data=" + res);
          var msg = data.msg;
          $('#upload_${param.img_NamePre}${i}').attr('filename', '');
          $('#upload_${param.img_NamePre}${i}').val('');
          if (data.url) {
            var ${param.img_NamePre} = data.url;
            var small${param.img_NamePre} = data.small ? data.small : data.url;
            if (msg) {
              alert(msg);
              //$("#aiclf45_1").attr("class", "am-icon-warning am-text-warning");
            } else {
              //${param.img_NamePre} = "assess/"+${param.img_NamePre};
              $('#${param.img_NamePre}${i}').val(${param.img_NamePre});
              $('#${param.img_NamePre}_view${i}').attr('src', small${param.img_NamePre});
              $('#${param.img_NamePre}_view${i}').parents('div.hide:first').removeClass('hide');
              //$("#aiclf45_1${i}").attr("class", "am-icon-check am-text-success");
            }
          }else{
            if (msg) {
              alert(msg);
            }
          }
          if (typeof (cloaseuplayer) == 'function') {
            cloaseuplayer("#div_${param.img_NamePre}${i}");
          }
        },
        "fail":function(res){
          eval("var data=" + res);
          var msg = data.msg;
          if (msg) {
            alert(msg);
          }
        }
      });
      $('#upload_${param.img_NamePre}${i}').on('change', function () {
        //$("#aiclf45_1${i}").attr("class", "am-icon-refresh am-icon-spin");
        if (typeof (beforeup) == 'function') {
          beforeup("#div_${param.img_NamePre}${i}");
        }
      });
    </script>
  </div>
</c:forEach>
<%}%>
<script>
  function beforeup(eid){
    App.setbasePath("iframe/");
    App.setGlobalImgPath("dist/img/");
    App.blockUI({
      target : '.content',
      boxed  : true,
      message: '正在上传......'      //,
      //animate: true
    });
  }
  function cloaseuplayer(eid){
    App.unblockUI('.content');//解锁界面
  }
</script>