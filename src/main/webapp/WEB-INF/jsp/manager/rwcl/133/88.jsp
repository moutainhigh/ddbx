<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${fn:contains(sessionScope.strAgp,',142,')==true}">
<div class="text-primary">
    <em>退单退费申请：</em>
    <div class="big-conte" style="display: block;">
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>开始时间：</strong>2018-12-14 17:13:59
        </div>
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>处理时间：</strong>2018-12-14 17:13:59
        </div>
        <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
            <strong>处理人：</strong>运营部权限</div>
        <strong style="margin-left:10px;"><i>处理信息：</i></strong><br>
        <div class="task_margin ng-scope" style="border:1px solid #ccc; border-radius: 10px;background-color:#F7F7F7; padding-top:10px;">
            <form id="tdtfsh_97" name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope">
                <div style="display:none;">
                    <textarea id="inObj_97_2">{}</textarea>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">客户姓名</label>
                    <div class="col-sm-3">
                        <input value="测试一下" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text">
                    </div>
                    <label class="col-sm-2 control-label">业务编号</label>
                    <div class="col-sm-3">
                        <input value="ICBCKCD0000713" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">退单退费材料</label>
                </div>
                <div style="overflow: hidden; margin-left: 7%;">
                    <div id="img_97_2" style="float: left; left: 5px; margin-top: 20px" class="ng-scope"></div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">退单退费说明</label>
                    <div class="col-sm-8">
                        <textarea name="result_1_msg" rows="3" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text"></textarea>
                    </div>
                </div>
                <!-- ngIf: !notUseButton -->
                <script>
                    // 97 处理 json ,并给相应的对象赋值
                    $(document).ready(function(){
                        var index = 2;
                        var objS_97index = JSON.parse($("#inObj_97_2").val()); //由JSON字符串转换为JSON对象
                        if(objS_97index!=null){
                            var dd = document.getElementById("img_97_"+'2');
                            var json = jQuery.parseJSON($("#inObj_97_2").val());
                            for(var item in json) {
                                if (item.match('bcimg')) {
                                    $(dd).append("<div class='fileUpload_preview' style='margin-top:5px;'>"
                                        + "<li>"
                                        + "<img onclick='tdtfaayyclimage(this)' id='"+item+"_"+2+"' name='"+item+"_"+2+"' class='fileUpload_preview fileUpload_preview-small fileUpload_preview-square' src='http://a.kcway.net/assess/"+json[item]+"'>"
                                        + "</li>"
                                        /* + "<div class='btn btn-primary btn-download'>↓</div>" */
                                        /* + "<div id='close"+item+"' class='btn btn-danger btn-close'>x</div>" */
                                        + "</div>");
                                } else {
                                    $("#" + item+"_"+'2').val(json[item]);
                                }
                            }
                        }
                    });
                    //end


                    function tdtfaayyclimage(obj){
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
                        $("#tdtfaayyclModal_iframe").attr("src","/jquery-photo-gallery/gallerys.jsp");
                        //显示模态框  只有在选择编辑的行   然后根据回调函数成功后才会显示模态框
                        $('#tdtfaayyclModal').modal({ show: true, backdrop: 'static' });
                    }
                </script>
                <div class="modal fade" id="tdtfaayyclModal" tabindex="-1" role="dialog" aria-labelledby="tdtfaayyclModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h4 class="modal-title" align="center" id="tdtfaayyclModalLabel">图片预览</h4>
                            </div>
                            <div class="modal-body" style="height:750px;">
                                <iframe id="tdtfaayyclModal_iframe" width="100%" height="100%" frameborder="0"></iframe>
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
</c:if>