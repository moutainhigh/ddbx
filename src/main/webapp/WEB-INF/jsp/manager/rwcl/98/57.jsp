<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${fn:contains(sessionScope.strAgp,',100,')==true}">
<div class="text-primary">
    <em>合作商寄送材料：</em>
    <div class="big-conte" style="display: block;">
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>开始时间：</strong>
        </div>
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>处理时间：</strong>
        </div>
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>处理人：</strong></div>
        <strong style="margin-left:10px;"><i>处理信息：</i></strong><br>
        <div class="task_margin ng-scope" style="border:1px solid #ccc; border-radius: 10px;background-color:#F7F7F7; padding-top:10px;">
            <form name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope ng-valid-required">
                <!-- ngIf: (rootData.taskDefKey == 'loanOrder_postinfo_send' || (task.notarizeEndDate !=null))&&task.justRecord==true -->
                <div class="form-group">
                    <label class="col-sm-2 control-label">快递公司<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-3">
                        <input id="courierCompany" name="courierCompany" class="form-control ng-pristine ng-untouched ng-valid ng-empty">
                    </div>
                    <!-- ngIf: rootData.taskDefKey == 'loanOrder_postinfo_send'||($parent.taskAct.activityId=='loanOrder_postinfo_send'&&notUseButton) -->
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">快递单号<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-3">
                        <input id="orderNo" name="orderNo" class="form-control ng-pristine ng-untouched ng-valid ng-empty">
                    </div>
                    <label class="col-sm-2 control-label">寄出日期<i class="pull-right text-red">*</i></label>
                    <div class="input-group date form_datetime col-md-3" data-date="" data-date-format="yyyy-mm-dd" data-link-field="sendDate">
                        <input class="form-control" size="16" type="text" value="" readonly>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                    </div>
                    <input type="hidden" id="sendDate" name="sendDate" value="" /><br/>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">快递图片<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-10">
                        <div style="position: relative;width: 100px;height:100px;display: inline-block;text-align: center;margin: auto;" id="div_avatarurl">
                          <img id="avatarurl_view" name="avatarurl_view" src="images/mgcaraddimg.jpg" class="imgclass" style="width: 100%;height:100px;border-radius:10px;">
                          <input type="hidden" id="avatarurl" name="avatarurl" value="images/mgcaraddimg.jpg">
                          <input type="file" id="upload_avatarurl" runat="server" name="upload_immm" accept="" style="position: absolute;left: 0;top: 0;height: 100%;width: 100%;background: transparent;border: 0;margin: 0;padding: 0;filter: alpha(opacity=0);-moz-opacity: 0;-khtml-opacity: 0;opacity: 0;" class="uploadfileclass">
                          <script>
                            $('#upload_avatarurl').fileUpload({//压缩图片为jpg后再上传
                              "url": "/ttAjaxPost?do=fileup&smallwidth=100&smallheight=100&shuitext=快加认证",//smallwidth缩略图宽,smallheight缩略图高，shuitext水印文字
                              "success": function (res) {
                                eval("var data=" + res);
                                var msg = data.msg;
                                $('#upload_avatarurl').attr('filename', '');
                                $('#upload_avatarurl').val('');
                                if (data.url) {
                                  var avatarurl = data.url;
                                  var smallavatarurl = data.small ? data.small : data.url;
                                  if (msg) {
                                    alert(msg);
                                    //$("#aiclf45_1").attr("class", "am-icon-warning am-text-warning");
                                  } else {
                                    //avatarurl = "assess/"+avatarurl;
                                    $('#avatarurl').val(avatarurl);
                                    $('#avatarurl_view').attr('src', smallavatarurl);
                                    $('#avatarurl_view').parents('div.hide:first').removeClass('hide');
                                    //$("#aiclf45_1").attr("class", "am-icon-check am-text-success");
                                  }
                                }else{
                                  if (msg) {
                                    alert(msg);
                                  }
                                }
                                if (typeof (cloaseuplayer) == 'function') {
                                  cloaseuplayer("#div_avatarurl");
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
                            $('#upload_avatarurl').on('change', function () {
                              //$("#aiclf45_1").attr("class", "am-icon-refresh am-icon-spin");
                              if (typeof (beforeup) == 'function') {
                                beforeup("#div_avatarurl");
                              }
                            });
                          </script>
                        </div>
                    </div>
                </div>
<!-- ngIf: rootData.taskDefKey!='loanOrder_postinfo_return' -->
<div class="form-group">
    <label class="col-sm-2 control-label">备注</label>
    <div class="col-sm-8">
        <textarea id="result_msg" name="result_msg" rows="3" class="form-control ng-pristine ng-untouched ng-valid ng-empty" type="text"></textarea>
    </div>
</div>
<div class="modal-footer">
    <a onclick="erp()" class="btn btn-primary">提交</a>
</div>
<script>
$('.form_datetime').datetimepicker({
        weekStart: 0, //一周从哪一天开始
        minView: "month",//设置只显示到月份
        todayBtn:  1, //
        autoclose: 1, //当选择一个日期之后是否立即关闭此日期时间选择器。
        todayHighlight: 0, //当天日期高亮
        startView: 2, //0 or 'hour' 为小时视图，1 or 'day' 为天视图，2 or 'month' 为月视图（为默认值），3 or 'year'  为年视图，4 or 'decade' 为十年视图
        forceParse: 0, //当选择器关闭的时候，是否强制解析输入框中的值。
        showMeridian: 1
    });
</script>
<script>
    function erp(){
        var courierCompany= $('#courierCompany').val();
        var orderNo= $('#orderNo').val();
        var sendDate= $('#sendDate').val();
        var result_msg= $('#result_msg').val();
        var courierImage = $('#avatarurl').val();
        var icbc_id= '${requestScope.infodb.icbc_id}';
        var type_id= '${requestScope.infodb.type_id}';
        var id= '${requestScope.infodb.id}';
        //alert(icbc_id+"----"+type_id+"---"+id+"---");
        //alert(courierImage);
        if(!orderNo){
            alert("快递单号不能为空!");
            return false;
        }else if(!courierCompany){
            alert("快递公司不能为空!");
            return false;
        }else if(!sendDate){
            alert("寄出日期不能为空!");
            return false;
        }else if(!courierImage){
            alert("快递图片不能为空!");
            return false;
        }
        $.ajax({
            type: "POST",      //data 传送数据类型。post 传递
            dataType: 'json',  // 返回数据的数据类型json
            url: "${pageContext.request.contextPath}/manager/ajaxPostResults",  // 控制器方法
            data: {
                courierCompany:courierCompany,
                orderNo:orderNo,
                sendDate:sendDate,
                result_msg:result_msg,
                courierImage:courierImage,
                icbc_id:icbc_id,
                type_id:type_id,
                id:id
            },  //传送的数据
            error: function () {
                alert("编辑失败...请稍后重试！");
            },
            success: function (data) {
                alert(data.msg);
                window.location.href='${pageContext.request.contextPath}/manager/index?cn=mytask&sdo=list&type=ddbx';
            }
        });
    }
    //上传图片
    function setImagePreview(avalue) {
        var docObj = document.getElementById("file");
        var imgObjPreview = document.getElementById("preview");
        if(docObj.files && docObj.files[0])
        {
            //火狐下，直接设img属性
            imgObjPreview.style.display = 'block';
            imgObjPreview.style.width = '100px';
            imgObjPreview.style.height = '100px';
            //imgObjPreview.src = docObj.files[0].getAsDataURL();
            //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
            imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
        }
        else
        {
            //IE下，使用滤镜
            docObj.select();
            var imgSrc = document.selection.createRange().text;
            var localImagId = document.getElementById("localImag"); //必须设置初始大小
            localImagId.style.width = "100px";
            localImagId.style.height = "100px"; //图片异常的捕捉，防止用户修改后缀来伪造图片
            try {
                localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
            } catch(e) {
                alert("您上传的图片格式不正确，请重新选择!");
                return false;
            }
            imgObjPreview.style.display = 'none';
            document.selection.empty();
        }
        //file_up();
        document.getElementById("courierImage").value=document.getElementById("file").files[0];
        return true;
    }

    function file_up(){
        var formData = new FormData();
        formData.append("file", document.getElementById("file").files[0]);
        $.ajax({
            url: "${pageContext.request.contextPath}/manager/file_up_util.do",
            type: "POST",
            data: formData,
            /**
             *必须false才会自动加上正确的Content-Type
             */
            contentType: false,
            /**
             * 必须false才会避开jQuery对 formdata 的默认处理
             * XMLHttpRequest会对 formdata 进行正确的处理
             */
            processData: false,
            success: function (data) {
                alert("上传成功！");
                document.getElementById("courierImage").value=data;
            },
            error: function () {
                alert("上传失败！");
            }
        });
    }
</script>
</form>
</div>
</div>
</div>
</c:if>
