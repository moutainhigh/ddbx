<%@ page import="com.example.ddbx.tt.data.TtMap" %>
<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@ page import="com.example.ddbx.tt.tool.DataDic" %>
<%--
  Created by IntelliJ IDEA.
  User: 86176
  Date: 2019/3/26
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    TtMap infodb=(TtMap) request.getAttribute("infodb");
    TtMap dkglMap = (TtMap) request.getAttribute("dkgl");
%>
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
                                   id="" value="${dkgl.kp_price} ">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">评估价(元)</span>
                            <input type="text" class="form-control"
                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                   id="" value="${dkgl.pg_price} ">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">贷款本金(元)</span>
                            <input type="text" class="form-control"
                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                   id="" value="${dkgl.dk_price} ">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">金融服务费(元)</span>
                            <input type="text" class="form-control"
                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                   id="" value="${dkgl.jrfw_price} ">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">贷款总额(元)</span>
                            <input type="text" class="form-control"
                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                   id="" value="${dkgl.dk_total_price}">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">首付款(元)</span>
                            <input type="text" class="form-control"
                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                   id="" value="${dkgl.sfje}">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">首付比例(%)</span>
                            <input type="text" class="form-control"
                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                   id="" value="${dkgl.sfje}">
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
                                <%=Tools.dicopt(DataDic.dic_aj_date, dkglMap.get("aj_date"))%>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">贷款利率(%)</span>
                            <input type="text" class="form-control"
                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                   id="" value="${dkgl.dk_lv}">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">放贷账号</span>
                            <input type="text" class="form-control"
                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                   id="" value="${dkgl.dk_lv}">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">车辆使用人</span>
                            <input type="text" class="form-control"
                                   onblur="this.value=this.value.toUpperCase();this.value=this.value.trim();"
                                   id="" value="${dkgl.old_owner}">
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
                                <%=Tools.dicopt(DataDic.dic_dz_type, dkglMap.get("dz_type"))%>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
            String sh = Tools.dicopt("comm_states", 0);//省
        %>
        <div class="form-group">
            <label class="col-sm-2 control-label">开票所在地</label>
            <div class="col-sm-10">
                <div class="row inline-from">
                    <div class="col-sm-4">
                        <div class="input-group">
                            <span class="input-group-addon">所在省</span>
                            <select name="local_states" id="local_states" class="form-control">
                                <option value="0">请选择</option>
                                <%=sh%>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="input-group">
                            <span class="input-group-addon">所在市</span>
                            <select name="local_citys" id="local_citys" class="form-control">
                                <option value="0">请选择</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            objacl('#local_states', '#local_citys', '/ttAjax?do=opt&cn=comm_citys&id=0&state_id=', '${infodb.local_states}', '${infodb.local_citys}');
        </script>
        <div class="form-group">
            <label class="col-sm-2 control-label">上牌所在地</label>
            <div class="col-sm-10">
                <div class="row inline-from">
                    <div class="col-sm-4">
                        <div class="input-group">
                            <span class="input-group-addon">所在省</span>
                            <select name="local_states1" id="local_states1" class="form-control">
                                <option value="0">请选择</option>
                                <%=sh%>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="input-group">
                            <span class="input-group-addon">所在市</span>
                            <select name="local_citys1" id="local_citys1" class="form-control">
                                <option value="0">请选择</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            objacl('#local_states1', '#local_citys1', '/ttAjax?do=opt&cn=comm_citys&id=0&state_id=', '${infodb.local_states}', '${infodb.local_citys}');
        </script>
    </div>
</div>
