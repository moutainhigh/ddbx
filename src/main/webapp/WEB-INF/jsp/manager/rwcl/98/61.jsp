<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="text-primary">
    <em>银行放款结果：</em>
    <div class="big-conte" style="display: block;">
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
        <div class="task_margin ng-scope" style="border:1px solid #ccc; border-radius: 10px;background-color:#F7F7F7; padding-top:10px;">
            <form name="modalForm" class="form-horizontal ng-pristine ng-valid ng-scope ng-valid-required">
                <div class="form-group">
                        <label class="col-sm-2 control-label">放款结果<i class="pull-right text-red">*</i></label>
                        <div class="col-sm-3">
                            <input type="radio" value="1" name="result_code" id="result_code"  class="ng-pristine ng-untouched ng-valid ng-not-empty">成功
                                &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" value="2" name="result_code" id="result_code"  class="ng-pristine ng-untouched ng-valid ng-not-empty">失败
                        </div>
                        <label class="col-sm-2 control-label">放款日期<i class="pull-right text-red">*</i></label>
                        <div style="padding-left:15px;" class="input-group date form_datetime col-md-3" data-date="" data-date-format="yyyy-mm-dd" data-link-field="lendingDate">
                            <input class="form-control" size="16" type="text" value="" readonly>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                        </div>
                        <input type="hidden" id="lendingDate" name="lendingDate" value="" />
                </div>
                <!-- ngIf: task.auditRet==null ||task.auditRet == 1 -->
                <div class="ng-scope">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">支行<i class="pull-right text-red">*</i></label>
                        <div class="col-sm-3">
                            <input id="yhdksh_61_zh" name="yhdksh_61_zh" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-required" type="text"  >
                        </div>
                        <label class="col-sm-2 control-label">分期数<i class="pull-right text-red">*</i></label>
                        <div class="col-sm-3">
                            <div class="input-group date ng-isolate-scope ng-not-empty ng-valid ng-valid-required" >
                                <input name="yhdksh_61_fq" id="yhdksh_61_fq" value="${pd.aj_date}" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text"  ><span class="input-group-addon">期</span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">卡号<i class="pull-right text-red">*</i></label>
                        <div class="col-sm-3">
                            <div class="input-group date ng-isolate-scope ng-not-empty ng-valid" >
                            <input id="yhdksh_61_kh" name="yhdksh_61_kh" class="form-control" type="text"><span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        </div>
                    </div>
                    <label class="col-sm-2 control-label">放款金额<i class="pull-right text-red">*</i></label>
                    <div class="col-sm-3">
                        <div class="input-group date ng-isolate-scope ng-not-empty ng-valid ng-valid-required" >
                            <input onkeyup="show_two(this.value)" name="yhdksh_61_je" id="yhdksh_61_je" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty ng-valid-required" type="text" ><span class="input-group-addon">元</span>
                        </div>
                    </div>
                </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" title="首月还款=月还+100">首月还款<i class="pull-right text-red">*</i></label>
                        <div class="col-sm-3">
                            <div class="input-group date ng-isolate-scope ng-not-empty ng-valid ng-valid-required" >
                                <input name="yhdksh_61_syhk" id="yhdksh_61_syhk" placeholder="填写金额后自动填充(首月还款=月还+100)" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text"  ><span class="input-group-addon">元</span>
                            </div>
                        </div>
                        <label class="col-sm-2 control-label" title="月还=金额/分期数(四入五入)">月还<i class="pull-right text-red">*</i></label>
                        <div class="col-sm-3">
                            <div class="input-group date ng-isolate-scope ng-not-empty ng-valid ng-valid-required" >
                                <input name="yhdksh_61_yh" id="yhdksh_61_yh" placeholder="填写金额后自动填充(月还=金额/分期数)" class="form-control ng-pristine ng-untouched ng-valid ng-not-empty" type="text"  ><span class="input-group-addon">元</span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">首月还款日期<i class="pull-right text-red">*</i></label>
                        <div style="padding-left:15px;" class="input-group date form_datetime col-md-3" data-date="" data-date-format="yyyy-mm-dd" data-link-field="firstMonthPayDate">
                            <input class="form-control" size="16" type="text" value="" readonly>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                        </div>
                        <input type="hidden" id="firstMonthPayDate" name="firstMonthPayDate" value="" />
                    </div>
                <!-- ngIf: task.creditsMoney -->
                <!-- 		<div class="form-group">		 -->
                <!-- 			<label class="col-sm-2 control-label">打款至：</label> -->
                <!-- 			<div  class="col-sm-8"> -->
                <!-- 				<input type="radio" value="1000" ng-model="task.orgId" ng-checked="task.orgId==null || task.orgId==1000">资产公司  &nbsp;&nbsp;&nbsp;&nbsp; -->
                <!-- 		        <input type="radio" value="1228" ng-model="task.orgId">网络公司 -->
                <!-- 	       	</div> -->
                <!-- 		</div> -->
                <!-- 	<div class="form-group">
                        <label class="col-sm-2 control-label">垫资金额</label>
                        <div class="col-sm-3">
                            <input class="form-control" type="text"	ng-model="task.payAmount" cg-required required/>
                        </div>
                        <label class="col-sm-2 control-label">差额</label>
                        <div class="col-sm-3">
                            <input class="form-control" type="text" ng-model="task.netting"  ng-value="task.bankAmount-task.payAmount" disabled="true" />(计算方式:放贷额-垫资金额)
                        </div>
                    </div> -->
            </div><!-- end ngIf: task.auditRet==null ||task.auditRet == 1 -->
                <div class="form-group">
                    <label class="col-sm-2 control-label">备注</label>
                    <div class="col-sm-8">
                        <textarea name="result_msg" id="result_msg" rows="3" class="form-control ng-pristine ng-untouched ng-valid ng-empty" type="text"></textarea>
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

    function show_two(je){
        /* var s = 22.127456 + "";
        var str = s.substring(0,s.indexOf(".") + 3);
        alert(str); */
        //分期数  开卡时候
        var fqs = document.getElementById("yhdksh_61_fq").value;
        if(fqs==""){
            alert("请先输入分期数,然后再输入金额!");
        }else{
            //计算月还
            var yhdksh_61_yh = 0; // 月还
            var get_yh = je/fqs;
            var yh_two = get_yh.toFixed(2);
            var yh_four = get_yh.toFixed(4);
            var yh_four_getThree = yh_four.indexOf('.');
            var getStrThree = yh_four.substr(yh_four_getThree+3,1);
            if(getStrThree>0 && getStrThree<5){
                //document.getElementById("yhdksh_61_yh").value=Number(yh_two)+Number(0.01)+"--月还(je/fqs)--"+get_yh;
                yhdksh_61_yh = Number(yh_two)+Number(0.01);
            }else{
                //document.getElementById("yhdksh_61_yh").value=Number(yh_two)+"-没有加0.01-月还(je/fqs)--"+get_yh;
                yhdksh_61_yh = Number(yh_two);
            }
            document.getElementById("yhdksh_61_yh").value= yhdksh_61_yh;
            //计算首月还款  yhdksh_61_syhk = 月还+100
            var max_yh = $("#yhdksh_61_yh").val(); // 月还
            var yhdksh_61_syhk = Number(max_yh)+Number(100);  // 首月还款
            document.getElementById("yhdksh_61_syhk").value=yhdksh_61_syhk;
        }

        /*
        //计算首月还款  yhdksh_61_syhk = 月还整数+100+月还小数点后两位*期数
        var max_yh = $("#yhdksh_61_yh").val(); // 月还
        var dianXh = max_yh.indexOf('.');
        var zs = max_yh.substr(0,dianXh); // 月还整数部分
        var xs = max_yh.substr(dianXh,dianXh+2); // 月还小数点后两位
        xs = xs*fqs; // 月还小数点后两位*期数
        var yhdksh_61_syhk = Number(zs)+Number(100)+Number(xs);  // 首月还款
        //document.getElementById("yhdksh_61_syhk").value=yhdksh_61_syhk+"--整数:"+zs+"--小数:"+xs;
        */
    }

    function erp(){
        var result_code= $('input[name="result_code"]:checked').val(); //银行放款结果
        var lendingDate= $('#lendingDate').val(); //放款日期
        var yhdksh_61_zh= $('#yhdksh_61_zh').val(); //支行
        var yhdksh_61_fq= $('#yhdksh_61_fq').val(); //分期数
        var yhdksh_61_kh= $('#yhdksh_61_kh').val(); //卡号
        var yhdksh_61_je= $('#yhdksh_61_je').val(); //放款金额
        var yhdksh_61_syhk= $('#yhdksh_61_syhk').val(); //首月还款金额
        var yhdksh_61_yh= $('#yhdksh_61_yh').val(); //月还
        var firstMonthPayDate= $('#firstMonthPayDate').val(); //首月还款日期
        var result_msg= $('#result_msg').val();
        var icbc_id= '${requestScope.infodb.icbc_id}';
        var type_id= '${requestScope.infodb.type_id}';
        var id= '${requestScope.infodb.id}';
        //alert(icbc_id+"----"+type_id+"---"+id+"---");
        if(!result_code){
            alert("银行放款结果不能为空!");
            return false;
        }else if(!lendingDate){
            alert("放款日期不能为空!");
            return false;
        }else if(!yhdksh_61_zh){
            alert("支行不能为空!");
            return false;
        }else if(!yhdksh_61_fq){
            alert("分期数不能为空!");
            return false;
        }else if(!yhdksh_61_kh){
            alert("卡号不能为空!");
            return false;
        }else if(!yhdksh_61_je){
            alert("放款金额不能为空!");
            return false;
        }else if(!yhdksh_61_syhk){
            alert("首月还款金额不能为空!");
            return false;
        }else if(!yhdksh_61_yh){
            alert("月还不能为空!");
            return false;
        }else if(!firstMonthPayDate){
            alert("首月还款日期不能为空!");
            return false;
        }
        $.ajax({
            type: "POST",      //data 传送数据类型。post 传递
            dataType: 'json',  // 返回数据的数据类型json
            url: "${pageContext.request.contextPath}/manager/ajaxPostResults",  // 控制器方法
            data: {
                result_code:result_code,
                lendingDate:lendingDate,
                yhdksh_61_zh:yhdksh_61_zh,
                yhdksh_61_fq:yhdksh_61_fq,
                yhdksh_61_kh:yhdksh_61_kh,
                yhdksh_61_je:yhdksh_61_je,
                yhdksh_61_syhk:yhdksh_61_syhk,
                yhdksh_61_yh:yhdksh_61_yh,
                firstMonthPayDate:firstMonthPayDate,
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
    </div>
</div>

