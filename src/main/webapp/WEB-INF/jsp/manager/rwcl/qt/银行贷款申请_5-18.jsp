
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="" class="tab-content">
    <style>
        .flex-box{
            display: flex;
            flex-direction: column;
        }
        .flex-box div[class^='flex-row']{
            width: 100%;
        }
        .flex-box .flex-row{
            height: 35px;
        }
        .flex-row-rhcen{
            display: flex;
            justify-content: flex-end;
            align-items: center;
        }
        em{
            cursor: pointer;
        }
        .flex-row-rhcen em{
            padding: 0 5px;
        }
        .flex-rowcen{
            flex: 1;
        }
        .text-primary em{
            display: block;
            font-size: 15px;
            line-height: 25px;
        }
        .text-primary .big-conte{
            background-color:#f7f7f7;
            height:auto!important;
            height:100px;
            display:none;
            min-height:100px;
            padding: 15px 0;
            margin: 15px 0;
            border-radius:10px;
        }
        .big-conte-row span{
            text-align: right;
            padding-right: 15px;
            line-height: 34px;
            width: 25%;
            float: left;

        }
        .big-conte-row input{
            float: left;
            width: 20%;
        }
        .big-conte-row{
            margin: 20px;
            height: 34px;
        }
    </style>
</div>
<li class="text-primary">
    <em>2.合作商寄送材料：</em>
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
                <div style="display:none;">
                    <textarea id="inObj_57_2">{"kdgs":"阿萨德","jcrq":"2019-02-20","bcimg1":"upload/2019/02/20/dfb55e6a4731370918c16c5bf17c93bc.jpg","kddh":"566556"}</textarea>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">快递公司</label>
                    <div class="col-sm-3">
                        <input id="kdgs_2" class="form-control ng-pristine ng-untouched ng-valid ng-empty">
                    </div>
                    <!-- ngIf: rootData.taskDefKey == 'loanOrder_postinfo_send'||($parent.taskAct.activityId=='loanOrder_postinfo_send'&&notUseButton) -->
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">快递单号</label>
                    <div class="col-sm-3">
                        <input id="kddh_2" class="form-control ng-pristine ng-untouched ng-valid ng-empty">
                    </div>
                    <label class="col-sm-2 control-label">寄出日期<i class="red">*</i></label>
                    <div class="col-sm-3">
                        <div class="input-group date ng-isolate-scope ng-not-empty ng-valid ng-valid-required">
                            <input id="jcrq_2" class="form-control" type="text">
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
                                 <img onclick="alert('ylimage');" id="bcimg1" class="fileUpload_preview fileUpload_preview-small fileUpload_preview-square"  src="http://115.236.182.101:8083/Customer/0~50000/C000292957/20180611A0000061/POST_BILL/1531895808445.jpg">
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
    <img onclick="aayyclimage(this)" id="bcimg1_2" class="fileUpload_preview fileUpload_preview-small fileUpload_preview-square" src="http://a.kcway.net/upload/2019/02/20/dfb55e6a4731370918c16c5bf17c93bc.jpg">
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
        <textarea id="result_1_msg" rows="3" class="form-control ng-pristine ng-untouched ng-valid ng-empty" type="text"></textarea>
    </div>
</div>
<!-- ngIf: !notUseButton -->
<script>
    // 57 处理 json ,并给相应的对象赋值
    var index = 2;
    var objS_57index = JSON.parse($("#inObj_57_2").val()); //由JSON字符串转换为JSON对象
    document.getElementById("kdgs_2").value = objS_57index['kdgs'];
    document.getElementById("kddh_2").value = objS_57index.kddh;
    document.getElementById("jcrq_2").value = objS_57index.jcrq;
    //alert("图片："+objS_57index.bcimg1);
    if(objS_57index.bcimg1!=null&&objS_57index.bcimg1!=''){
        document.getElementById("bcimg1_2").src = "http://a.kcway.net/"+objS_57index.bcimg1;
    }else{
        document.getElementById("bcimg1_2").style.display="none";
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
</li>
