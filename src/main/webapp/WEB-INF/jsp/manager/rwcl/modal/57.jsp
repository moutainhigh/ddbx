<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="text-primary">
    <em>合作商寄送材料：</em>
    <div class="big-conte" style="display: block;">
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>开始时间：</strong>
            2019-02-20 17:01:06
        </div>
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>处理时间：</strong>
            2019-02-20 17:02:57
        </div>
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>处理人：</strong>秦扬</div>
        <strong style="margin-left:10px;"><i>处理信息：</i></strong><br>
        <div class="task_margin ng-scope" style="border:1px solid #ccc; border-radius: 10px;background-color:#F7F7F7; padding-top:10px;">
            <form name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope ng-valid-required">
                <!-- 	<div class="form-group" ng-if="notUseButton && task.postRet != null">
                        <label class="col-sm-2 control-label">收件确认</label>
                        <div class="col-sm-6">
                            <input type="radio" value="1" ng-model="task.postRet" disabled="true">已收到
                                &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" value="0" ng-model="task.postRet" disabled="true">未收到
                        </div>
                    </div> -->
                <!-- ngIf: (rootData.taskDefKey == 'loanOrder_postinfo_send' || (task.notarizeEndDate !=null))&&task.justRecord==true -->
                <div class="form-group">
                    <label class="col-sm-2 control-label">快递公司</label>
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
                    <label class="col-sm-2 control-label">寄出日期</label>
                    <div class="col-sm-3">
                        <div class="input-group date ng-isolate-scope ng-not-empty ng-valid ng-valid-required">
                            <input id="sendDate" name="sendDate" class="form-control" type="text">
                            <span class="input-group-addon">
  				<i class="fa fa-calendar"></i>
  				</span>
                        </div>
                    </div>
                </div>
                <!-- ngIf: !notUseButton -->
                <br>
                <!-- <div style="overflow: hidden;margin-left: 7%">
                     ngRepeat: img in task.filepathlist<div  style="float:left;left:5px;margin-top: 20px" class="ng-scope">
                         <div class="fileUpload_preview" style="margin-top:5px;">
                             <li>
                                 <img onclick="alert('ylimage');" id="bcimg1" class="fileUpload_preview fileUpload_preview-small fileUpload_preview-square"  src="images/user1-128x128.jpg">
                             </li>
                             <div class="btn btn-success btn-resize ng-hide">⇔</div>
                             <div class="btn btn-danger btn-close ng-hide">x</div>
                            <div class="btn btn-primary btn-download">↓</div>
                            <div class="fileUpload_filename ng-binding">3282.jpg</div>
                        </div>
                        <div style="margin-top:5px;position: absolute;" class="ng-binding">2018-07-18</div>
                    </div>end ngRepeat: img in task.filepathlist
                </div> -->
                <div class="form-group">
                    <label class="col-sm-2 control-label">快递图片</label>
                    <div class="col-sm-3">
<li> <!-- ylimage(this) -->
    <img onclick="aayyclimage(this)" id="bcimg1_2" class="fileUpload_preview fileUpload_preview-small fileUpload_preview-square" src="images/user3-128x128.jpg">
</li>
<div class="btn btn-success btn-resize ng-hide">⇔</div>
<div class="btn btn-danger btn-close ng-hide">x</div>
<!-- <div class="btn btn-primary btn-download">↓</div> -->
<!-- <div class="fileUpload_filename ng-binding" style="margin-left:30px;">点击放大</div> -->
</div>
</div>
<!-- ngIf: rootData.taskDefKey!='loanOrder_postinfo_return' -->
<div class="form-group">
    <label class="col-sm-2 control-label">备注</label>
    <div class="col-sm-8">
        <textarea id="result_msg" name="result_msg" rows="3" class="form-control ng-pristine ng-untouched ng-valid ng-empty" type="text"></textarea>
    </div>
</div>
</div>
<script>
    // 57 处理 json ,并给相应的对象赋值
    var index = 2;
    var objS_57index = JSON.parse($("#inObj_57_2").val()); //由JSON字符串转换为JSON对象
    document.getElementById("kdgs_2").value = objS_57index['kdgs'];
    document.getElementById("kddh_2").value = objS_57index.kddh;
    document.getElementById("jcrq_2").value = objS_57index.jcrq;
    //alert("图片："+objS_57index.bcimg1);
    if(objS_57index.bcimg1!=null&&objS_57index.bcimg1!=''){
        //document.getElementById("bcimg1_2").src = "http://a.kcway.net/"+objS_57index.bcimg1;
    }else{
        //document.getElementById("bcimg1_2").style.display="none";
    }

    function aayyclimage(obj){
        //alert(obj);
        if(obj!=0){
            var $img = $(obj),
                imgUrl = $img[0].src;
        }
        /* alert($img[0].src); */
        var activeIndex=0;
        var imgs = [];
        $(".fileUpload_preview").each(function(i,elem){
            //alert(elem.src);
            if(obj!=0){
                if(elem.src == imgUrl){
                    activeIndex=i;
                }
            }
            imgs.push({
                url: elem.src,
                imgHeight :'820',
                imgWidth : '900'
            });
        });
        localStorage["photoGalleryImgs"] = JSON.stringify(imgs); //因为此字符串可能是base64字符，appgo无法传
        localStorage["photoGalleryActiveIndex"] = activeIndex;
        //给iframe加上src路径
        $("#aayyclModal_iframe").attr("src","/jquery-photo-gallery/gallerys.jsp");
        //显示模态框  只有在选择编辑的行   然后根据回调函数成功后才会显示模态框
        $('#aayyclModal').modal({ show: true, backdrop: 'static' });
    }
</script>
<div class="modal fade" id="aayyclModal" tabindex="-1" role="dialog" aria-labelledby="aayyclModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" align="center" id="aayyclModalLabel">图片预览</h4>
            </div>
            <div class="modal-body" style="height:750px;">
                <iframe id="aayyclModal_iframe" width="100%" height="100%" frameborder="0"></iframe>
                (左右键控制上一张,下一张)
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
</form>
</div>
</div>
</div>
