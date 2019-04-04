<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${fn:contains(sessionScope.strAgp,',66,')==true}">
    <div class="text-primary">
        <em>结果反馈</em>
        <div class="big-conte_" style="display:block;">
            <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
                <strong>开始时间：</strong>
            </div>
            <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
                <strong>处理时间：</strong>
            </div>
            <div style="float:left;margin-left:20px;width:260px;" class="ng-binding">
                <strong>处理人：</strong></div>
            <strong style="margin-left:10px;">
                <i>处理信息：</i></strong><br>
            <!-- ngIf: taskAct.pageName!='cudp'||'_cudp'.indexOf(taskAct.pageName)<=-1 -->
            <!-- ngInclude: '/modules/'+taskAct.menuCode+'/'+taskAct.pageName+'.html' -->
            <div class="task_margin ng-scope"  style="border:1px solid #ccc; border-radius: 10px;background-color:#F7F7F7; padding-top:10px;">
                <form id="mq_Form" name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope" >
                    <input type="hidden" name="adminid" value="${sessionScope.pd.id}">
                    <input type="hidden" name="type_id" value="${requestScope.type_id}">
                    <input type="hidden" name="icbc_id" value="${requestScope.icbc_id}">
                    <input type="hidden" name="mq_id" value="${pd.mqid}">
                    <!-- ngIf: notUseButton -->
                    <div class="form-group" >
                        <label class="col-sm-2 control-label">审核结果<i class="red">*</i></label>
                        <div class="col-sm-8">
                            <input type="radio" value="1"  onchange="showradio('mq_status',this.value)" id="mq_status" name="mq_status"  class="ng-pristine ng-untouched ng-valid ng-not-empty">通过
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" value="3"  onchange="showradio('mq_status',this.value)" id="mq_status" name="mq_status"  class="ng-pristine ng-untouched ng-valid ng-not-empty">回退补件
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-8">
                            <textarea id="mq_remark" name="mq_remark" rows="3" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text"></textarea>
                        </div>
                    </div>
                    <!-- ngIf: !notUseButton -->
                    <div class="modal-footer">
                        <a onclick="location.href='${pageContext.request.contextPath}/erp/wdrw_list.do?type=wdrw&dn=${requestScope.dn }&qn=list&cn=${requestScope.cn }&yw_id=${requestScope.yw_id }'" class="btn btn-warning" >取消</a>
                        <a onclick="erp_mqsh()" class="btn btn-primary" >提交</a>
                    </div>
                </form>
                <script type="text/javascript">
                    function erp_mqsh(){
                        var mq_status=$('input:radio[name="mq_status"]:checked').val();
                        var icbc_id= '${requestScope.infodb.icbc_id}';
                        var type_id= '${requestScope.infodb.type_id}';
                        var mq_remark= $('#mq_remark').val();
                        var id= '${requestScope.infodb.id}';
                        if(mq_status==null){
                            alert("请选择审核结果!");
                        }else{
                            //var form = new FormData(document.getElementById("mq_Form"));
                            $.ajax({
                                url:"/manager/spmqajaxpost",
                                type:"post",
                                dataType: 'json',  // 返回数据的数据类型json
                                data:{
                                    mq_remark:mq_remark,
                                    mq_status:mq_status,
                                    icbc_id:icbc_id,
                                    type_id:type_id,
                                    id:id
                                },
                                success:function(data){
                                    alert(data.msg);
                                    window.location.href="/manager/index?cn=mytask&sdo=list&type=ddbx";
                                },
                                error:function(e){
                                    alert("错误！！");
                                }
                            });
                        }
                    }
                </script>
            </div>
        </div>
    </div>
</c:if>
