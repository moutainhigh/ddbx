<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${fn:contains(sessionScope.strAgp,',121,')==true}">
<div class="text-primary"><em>抵押情况记录：</em>
    <div class="big-conte" style="display: block;">
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>开始时间：</strong>
        </div>
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>处理时间：</strong>
        </div>
        <div style="float: left; margin-left: 20px; width: 260px;" class="ng-binding">
            <strong>处理人：</strong></div>
        <strong style="margin-left: 10px;"><i>处理信息：</i></strong><br>
        <!-- ngIf: taskAct.pageName!='cudp'||'_cudp'.indexOf(taskAct.pageName)<=-1 -->
        <!-- ngInclude: '/modules/'+taskAct.menuCode+'/'+taskAct.pageName+'.html' -->
        <div class="task_margin ng-scope" style="border: 1px solid #ccc; border-radius: 10px; background-color: #F7F7F7; padding-top: 10px;">
            <form name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope ng-valid-required ng-valid-pattern ng-valid-maxlength">
                <div class="form-group">
                    <label class="col-sm-2 control-label">抵押查验情况<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-3">
                        <input type="radio" value="1"  class="ng-pristine ng-untouched ng-valid ng-not-empty" id="examineCondition" name="examineCondition">通过
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" value="2" class="ng-pristine ng-untouched ng-valid ng-not-empty" id="examineCondition" name="examineCondition">不通过
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">车牌号码<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-3">
                        <input id="carNo" name="carNo" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-required ng-valid-pattern ng-valid-maxlength" type="text" pattern="([京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}(([0-9]{5}[DF])|([DF]([A-HJ-NP-Z0-9])[0-9]{4})))|([京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-HJ-NP-Z0-9]{4}[A-HJ-NP-Z0-9挂学警港澳]{1})" maxlength="16" ng-model="task.plateNum" cg-required="" required="required" maxleng_base="8">
                    </div>
                    <!-- 		<div ng-if="rootData.taskDefKey!='loanOrder_plegeinfo_bank'"> -->
                    <!-- 			<label class="col-sm-2 control-label" ng-if="task.isNewCar==null||task.isNewCar==1">上牌日期</label> -->
                    <!-- 			<div class="col-sm-3" ng-if="task.isNewCar==1"> -->
                    <!-- 			<cg-datepicker ng-model="task.applyDate" cg-required></cg-datepicker> -->
                    <!-- 			</div> -->
                    <!-- 			<label class="col-sm-2 control-label" ng-if="task.isNewCar==0">过户日期</label> -->
                    <!-- 			<div class="col-sm-3" ng-if="task.isNewCar==0"> -->
                    <!-- 			<cg-datepicker ng-model="task.applyDate" cg-required></cg-datepicker> -->
                    <!-- 			</div> -->
                    <!-- 		</div> -->
                    <div>
                        <label class="col-sm-2 control-label">抵押完成日期<i class="pull-right text-red">*</i></label>
                        <div style="padding-left:15px;" class="input-group date form_datetime col-md-3" data-date="" data-date-format="yyyy-mm-dd" data-link-field="mortgageEndDate">
                            <input class="form-control" size="16" type="text" value="" readonly>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                        </div>
                        <input type="hidden" id="mortgageEndDate" name="mortgageEndDate" value="" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">登记证书号<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-3">
                        <input id="djzsh" name="djzsh" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text">
                    </div>
                    <label class="col-sm-2 control-label">抵押办理人员<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-3">
                        <input id="mortgageDisposePeople" name="mortgageDisposePeople" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">上牌方式<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-3">
                       <input type="radio" value="私牌"  class="ng-pristine ng-untouched ng-valid ng-not-empty" id="topStyle" name="topStyle">私牌
                       &nbsp;&nbsp;&nbsp;&nbsp;
                       <input type="radio" value="公牌"  class="ng-pristine ng-untouched ng-valid ng-not-empty" id="topStyle" name="topStyle">公牌
                    </div>
                    <label class="col-sm-2 control-label">车辆类别<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-3 ng-scope">
                        <input type="radio" value="国产"  class="ng-pristine ng-untouched ng-valid ng-not-empty" id="carType" name="carType">国产
                            &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" value="进口"  class="ng-pristine ng-untouched ng-valid ng-not-empty" id="carType" name="carType">进口
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label" >其它说明</label>
                    <div class="col-sm-8" >
                        <textarea rows="3" id="result_msg" name="result_msg" class="form-control ng-pristine ng-untouched ng-valid ng-empty" type="text"></textarea>
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
                    todayHighlight: 1, //当天日期高亮
                    startView: 2, //0 or 'hour' 为小时视图，1 or 'day' 为天视图，2 or 'month' 为月视图（为默认值），3 or 'year'  为年视图，4 or 'decade' 为十年视图
                    forceParse: 0, //当选择器关闭的时候，是否强制解析输入框中的值。
                    showMeridian: 1
                });

                function erp(){
                        var carNo= $('#carNo').val(); //车牌号码
                        var mortgageEndDate= $('#mortgageEndDate').val(); //抵押完成日期
                        var djzsh= $('#djzsh').val(); //登记证书号
                        var mortgageDisposePeople= $('#mortgageDisposePeople').val(); //抵押办理人员
                        var topStyle= $('input[name="topStyle"]:checked').val(); //上牌方式
                        var carType= $('input[name="carType"]:checked').val(); //车辆类别
                        var examineCondition= $('input[name="examineCondition"]:checked').val(); //查验情况
                        var result_msg= $('#result_msg').val();
                        var icbc_id= '${requestScope.infodb.icbc_id}';
                        var type_id= '${requestScope.infodb.type_id}';
                        var id= '${requestScope.infodb.id}';
                        //alert(icbc_id+"----"+type_id+"---"+id+"---");
                        if(!examineCondition){
                            alert("抵押查验情况不能为空!");
                            return false;
                        }else if(!carNo){
                            alert("车牌号码不能为空!");
                            return false;
                        }else if(!mortgageEndDate){
                            alert("抵押完成日期不能为空!");
                            return false;
                        }else if(!djzsh){
                            alert("登记证书号不能为空!");
                            return false;
                        }else if(!mortgageDisposePeople){
                            alert("抵押办理人员不能为空!");
                            return false;
                        }else if(!topStyle){
                            alert("上牌方式不能为空!");
                            return false;
                        }else if(!carType){
                            alert("车辆类别不能为空!");
                            return false;
                        }
                        $.ajax({
                            type: "POST",      //data 传送数据类型。post 传递
                            dataType: 'json',  // 返回数据的数据类型json
                            url: "${pageContext.request.contextPath}/manager/ajaxPostResults",  // 控制器方法
                            data: {
                                carNo:carNo,
                                mortgageEndDate:mortgageEndDate,
                                djzsh:djzsh,
                                mortgageDisposePeople:mortgageDisposePeople,
                                topStyle:topStyle,
                                carType:carType,
                                examineCondition:examineCondition,
                                result_msg:result_msg,
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
                </script>
            </form>
        </div>
    </div></div>
</c:if>