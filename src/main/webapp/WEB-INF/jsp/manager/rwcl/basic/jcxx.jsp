
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div ${param.tab eq 1?"class='tab-pane active'":"class='tab-pane'"} id="tab_1">
    <div class="box-header with-border">
        <h3 class="box-title">基础信息</h3>
    </div>
    <div class="box-body">
        <div class="form-group">
            <label class="col-sm-2 control-label">基础信息</label>
            <div class="col-sm-10">
                <div class="row inline-from">
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">姓名</span>
                            <input type="text" value="${jcxx.c_name}" class="form-control"
                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                   id="c_name_1" name="c_name_1">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">身份证</span>
                            <input type="text" value="${jcxx.c_cardno}" class="form-control"
                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                   id="c_cardno_1" name="c_cardno_1">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">电话</span>
                            <input type="text" value="${jcxx.c_tel}" class="form-control"
                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                   id="c_tel_1" name="c_tel_1">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">性别</span>
                            <select name="c_sex_1" id="c_sex_1" class="form-control">
                                <option value="0">请选择性别</option>
                                <option value="1" ${jcxx.c_sex eq 1?"selected='selected'":''}>男</option>
                                <option value="2" ${jcxx.c_sex eq 2?"selected='selected'":''}>女</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">按揭银行</span>
                            <select id="bank_id_1" name="bank_id_1" class="form-control">
                                <option value="0">请选择按揭银行</option>
                                <option value="1" ${jcxx.bank_id eq 1?"selected='selected'":''}>工行绍兴分行
                                </option>
                                <option value="2" ${jcxx.bank_id eq 2?"selected='selected'":''}>工行武林支行
                                </option>
                                <option value="3" ${jcxx.bank_id eq 3?"selected='selected'":''}>工行义乌支行
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">贷款产品</span>
                            <select name="loan_tpid_1" id="loan_tpid_1" class="form-control">
                                <option value="0">请选择贷款产品</option>
                                <option value="1" ${jcxx.loan_tpid eq 1?"selected='selected'":''}>卡分期
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">业务等级</span>
                            <select id="loan_level" name="loan_level" class="form-control">
                                <option value="0">请选择业务等级</option>
                                <option value="1" ${jcxx.loan_level eq 1?"selected='selected'":''}>
                                    预期贷款额10万以下（含10万）
                                </option>
                                <option value="2" ${jcxx.loan_level eq 2?"selected='selected'":''}>
                                    预期贷款额10万以上
                                </option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="box-header with-border">
        <h3 class="box-title">共还人信息</h3>
    </div>
    <div class="box-body">
        <div class="form-group">
            <label class="col-sm-2 control-label">配偶信息</label>
            <div class="col-sm-10">
                <div class="row inline-from">
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">姓名</span>
                            <input type="text" class="form-control" name="po_c_name" id="po_c_name"
                                   value="${jcxx.po_c_name}">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">身份证</span>
                            <input type="text" class="form-control" name="po_c_cardno" id="po_c_cardno"
                                   value="${jcxx.po_c_cardno}">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">手机号</span>
                            <input type="text" class="form-control" name="po_c_tel" id="po_c_tel"
                                   value="${jcxx.po_c_tel}">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">共还人1信息</label>
            <div class="col-sm-10">
                <div class="row inline-from">
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">姓名</span>
                            <input type="text" class="form-control" name="c_name_gj1" id="c_name_gj1"
                                   value="${jcxx.c_name_gj1}">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">身份证</span>
                            <input type="text" class="form-control" name="c_cardno_gj1"
                                   id="c_cardno_gj1" value="${jcxx.c_cardno_gj1}">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">手机号</span>
                            <input type="text" class="form-control" name="c_tel_gj1" id="c_tel_gj1"
                                   value="${jcxx.c_tel_gj1}">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">共还人2信息</label>
            <div class="col-sm-10">
                <div class="row inline-from">
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">姓名</span>
                            <input type="text" class="form-control" name="c_name_gj2" id="c_name_gj2"
                                   value="${jcxx.c_name_gj2}">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">身份证</span>
                            <input type="text" class="form-control" name="c_cardno_gj2"
                                   id="c_cardno_gj2" value="${jcxx.c_cardno_gj2}">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">手机号</span>
                            <input type="text" class="form-control" name="c_tel_gj2" id="c_tel_gj2"
                                   value="${jcxx.c_tel_gj2}">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
