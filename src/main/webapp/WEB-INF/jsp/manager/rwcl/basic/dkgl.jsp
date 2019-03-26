<%--
  Created by IntelliJ IDEA.
  User: 86176
  Date: 2019/3/26
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div ${param.tab eq 3?"class='tab-pane active'":"class='tab-pane'"} id="tab_3">
    <div class="box-header with-border">
        <h3 class="box-title">贷款管理</h3>
    </div>
    <div class="box-body">
        <div class="form-group">
            <label class="col-sm-2 control-label">贷款信息</label>
            <div class="col-sm-10">
                <div class="row inline-from">
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">开票价(元)</span>
                            <input type="text" class="form-control"
                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                   id="">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">评估价(元)</span>
                            <input type="text" class="form-control"
                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                   id="">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">贷款本金(元)</span>
                            <input type="text" class="form-control"
                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                   id="">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">金融服务费(元)</span>
                            <input type="text" class="form-control"
                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                   id="">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">贷款总额(元)</span>
                            <input type="text" class="form-control"
                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                   id="">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">首付款(元)</span>
                            <input type="text" class="form-control"
                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                   id="">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">首付比例(%)</span>
                            <input type="text" class="form-control"
                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                   id="">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">按揭模式</span>
                            <select name="" id="" class="form-control">
                                <option value="">请选择</option>
                                <option value="">卡分期</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">按揭银行</span>
                            <select name="" id="" class="form-control">
                                <option value="">请选择按揭银行</option>
                                <option value="">工行绍兴分行</option>
                                <option value="">工行上海分行</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">按揭期限</span>
                            <select name="" id="" class="form-control">
                                <option value="">请选择</option>
                                <option value="">12期</option>
                                <option value="">24期</option>
                                <option value="">36期</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">贷款利率(%)</span>
                            <input type="text" class="form-control"
                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                   id="">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">放贷账号</span>
                            <input type="text" class="form-control"
                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                   id="">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">车辆使用人</span>
                            <input type="text" class="form-control"
                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                   id="">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">是否公正</span>
                            <select name="" id="" class="form-control">
                                <option value="">请选择</option>
                                <option value="">是</option>
                                <option value="">否</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">是否垫资</span>
                            <select name="" id="" class="form-control">
                                <option value="">请选择</option>
                                <option value="">提车垫资</option>
                                <option value="">不垫资</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">开票所在地</label>
            <div class="col-sm-10">
                <div class="row inline-from">
                    <div class="col-sm-4">
                        <div class="input-group">
                            <span class="input-group-addon">所在省</span>
                            <select name="" id="" class="form-control">
                                <option value="">请选择</option>
                                <option value="">1</option>
                                <option value="">2</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="input-group">
                            <span class="input-group-addon">所在市</span>
                            <select name="" id="" class="form-control">
                                <option value="">请选择</option>
                                <option value="">1</option>
                                <option value="">2</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">上牌所在地</label>
            <div class="col-sm-10">
                <div class="row inline-from">
                    <div class="col-sm-4">
                        <div class="input-group">
                            <span class="input-group-addon">所在省</span>
                            <select name="" id="" class="form-control">
                                <option value="">请选择</option>
                                <option value="">1</option>
                                <option value="">2</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="input-group">
                            <span class="input-group-addon">所在市</span>
                            <select name="" id="" class="form-control">
                                <option value="">请选择</option>
                                <option value="">1</option>
                                <option value="">2</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
