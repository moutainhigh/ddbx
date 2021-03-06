<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${fn:contains(sessionScope.strAgp,',114,')==true}">
<div class="text-primary">
    <em>行政入库:</em>
    <div class="big-conte_">
        <strong style="margin-left:10px;"><i>处理信息：</i></strong><br>
        <!-- ngIf: taskAct.pageName!='cudp'||'_cudp'.indexOf(taskAct.pageName)<=-1 -->
        <!-- ngInclude: '/modules/'+taskAct.menuCode+'/'+taskAct.pageName+'.html' -->
        <div class="task_margin ng-scope"  style="border:1px solid #ccc; border-radius: 10px;background-color:#F7F7F7; padding-top:10px;">
            <form id="gsgdsh_67"  name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope" >
                <!-- ngIf: notUseButton && task.complete!=null -->
                <input type="hidden" name="adminid" value="${sessionScope.pd.id}">
                <input type="hidden" name="type_id" value="${requestScope.type_id}">
                <input type="hidden" name="icbc_id" value="${pd.icbc_id}">
                <div class="form-group ng-scope" >
                    <label class="col-sm-2 control-label">材料审核<span class="red">*</span></label>
                    <div class="col-sm-3">
                        <input type="radio" value="1"  class="ng-pristine ng-untouched ng-valid ng-not-empty" name="result_1_code">通过  &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" value="2"  class="ng-pristine ng-untouched ng-valid ng-not-empty" name="result_1_code">不通过
                    </div>
                </div><!-- end ngIf: notUseButton && task.complete!=null -->
                <div class="form-group">
                    <label class="col-sm-2 control-label">客户姓名</label>
                    <div class="col-sm-3">
                        <input  class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text" value="${infodb.c_name}">
                    </div>
                    <span class="ng-hide">
                    <label class="col-sm-2 control-label">编号</label><!--AX年份000001  -->
                    <div class="col-sm-3">
                        <input  class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text" value="${icbc.order_code}">
                    </div>
                    </span>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">备注</label>
                    <div class="col-sm-8">
                        <textarea name="result_1_msg" id="result_1_msg" rows="3" class="form-control ng-pristine ng-untouched ng-valid ng-empty" type="text"></textarea>
                        <!-- <input class="form-control ng-pristine ng-untouched ng-valid ng-empty" type="text"  > -->
                    </div>
                </div>
                <!-- ngIf: rootData.orgType=='ASUN'&&rootData.taskDefKey=='loanOrder_paperFiling_page' -->

                <!-- ngIf: !notUseButton -->
                <div class="modal-footer">
                    <a onclick="erp_gsgdsh_70()"  class="btn btn-primary" >提交</a>
                </div>
            </form>
            <script type="text/javascript">
                function erp_gsgdsh_70(){

                    var result_1_code= $('input[name="result_1_code"]:checked').val();
                    var result_1_msg= $('#result_1_msg').val();
                    var icbc_id= '${requestScope.infodb.icbc_id}';
                    var type_id= '${requestScope.infodb.type_id}';
                    var id= '${requestScope.infodb.id}';

                    if (!result_1_code){
                        alert("行政入库审核结果不能为空");
                        return false;
                    }

                    $.ajax({
                        type: "POST",      //data 传送数据类型。post 传递
                        dataType: 'json',  // 返回数据的数据类型json
                        url: "/manager/gsgd70ajaxpost",  // 控制器方法
                        data: {
                            result_1_code : result_1_code,
                            result_1_msg : result_1_msg,
                            icbc_id:icbc_id,
                            type_id:type_id,
                            id:id
                        },  //传送的数据
                        error: function () {
                            alert("编辑失败...请稍后重试！");
                        },
                        success:function(data){
                            alert("提交成功!");
                            window.location.href="/manager/index?cn=mytask&sdo=list&type=ddbx";
                        }
                    });

                }
            </script>
        </div>
    </div>
</div>
</c:if>