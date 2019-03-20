<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="text-primary"><em>反馈开卡结果：</em>
    <div class="big-conte" style="display: block;">
        <strong style="margin-left: 10px;"><i>处理信息：</i></strong><br>
        <div style="border: 1px solid #ccc; border-radius: 10px; background-color: #F7F7F7; padding-top: 10px;">
            <form name="modalForm" class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-2 control-label">开卡结果</label>
                    <div class="col-sm-8">
                        <label class="radio-inline">
                            <input type="radio" value="1" name="result_code">开卡成功
                        </label>
                        <label class="radio-inline">
                            <input type="radio" value="2" name="result_code">开卡失败
                        </label>
                        <label class="radio-inline">
                            <input type="radio" value="3" name="result_code">回退补件
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">开卡日期</label>
                    <div class="col-sm-6">
                        <div  class="input-group date form_datetime col-md-5" data-date=""
                             data-date-format="yyyy-mm-dd" data-link-field="dt_add">
                            <input class="form-control" id="kk_date" name="kk_date"
                                   size="16" type="text"
                                   value=""
                                   readonly=""
                                   style="font-size: 16px;"><span
                                class="input-group-addon" style="font-size: 16px;"><span
                                class="glyphicon glyphicon-remove" style="font-size: 16px;"></span></span><span
                                class="input-group-addon" style="font-size: 16px;"><span class="glyphicon glyphicon-th"
                                                                                         style="font-size: 16px;"></span></span>
                        </div>
                    </div>

                </div>
                <div class="form-group">
                <label class="col-sm-2 control-label">卡号</label>
                <div class="col-sm-3">
                    <input value="" id="kk_kh" name="kk_kh"
                           class="form-control" type="text">
                </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">备注</label>
                    <div class="col-sm-8">
                        <textarea rows="3" id="result_msg" name="result_msg" class="form-control"
                                  type="text"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <a onclick="erp()" class="btn btn-primary">提交</a>
                </div>
            </form>
        </div>
    </div>
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
</script>
<script>
    function erp() {
        var result_code= $('input[name="result_code"]:checked').val();
        var kk_date=$('#kk_date').val();
        var kk_kh=$('#kk_kh').val();
        var result_msg= $('#result_msg').val();
        var icbc_id= '${requestScope.infodb.icbc_id}';
        var type_id= '${requestScope.infodb.type_id}';
        var id= '${requestScope.infodb.id}';
        //alert(icbc_id+"----"+type_id+"---"+id);
        if(!result_code){
            alert("请选择开卡结果!");
            return false;
        }
        if(result_code==1){
        if(!kk_date){
            alert("开卡日期不能为空!");
            return false;
        }
        if(!kk_kh){
            alert("请输入卡号!");
            return false;
        }
        }

        $.ajax({
            type: "POST",      //data 传送数据类型。post 传递
            dataType: 'json',  // 返回数据的数据类型json
            url: "/manager/ajaxpost",  // 控制器方法
            data: {
                kk_kh : kk_kh,
                kk_date:kk_date,
                result_code : result_code,
                result_msg:result_msg,
                icbc_id:icbc_id,
                type_id:type_id,
                id:id,
                type:'9'//类型
            },  //传送的数据
            error: function () {
                alert("编辑失败...请稍后重试！");

            },
            success: function (data) {
                alert(data.msg);
                window.location.href="/manager/index?cn=mytask&sdo=list&type=ddbx";
            }
        });

    }
</script>