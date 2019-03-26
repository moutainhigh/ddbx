<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@ page import="com.example.ddbx.tt.tool.DataDic" %>
<%@ page import="com.example.ddbx.tt.data.TtMap" %><%--
  Created by IntelliJ IDEA.
  User: 86176
  Date: 2019/3/26
  Time: 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    TtMap icbc=(TtMap) request.getAttribute("icbc");
%>
<div ${param.tab eq 2?"class='tab-pane active'":"class='tab-pane'"} id="tab_2"><!-- 客户管理 -->
    <div class="nav-tabs-custom">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#tab_10" data-toggle="tab">主贷人信息</a></li>
            <li><a href="#tab_11" data-toggle="tab">共还人信息</a></li>
            <li><a href="#tab_12" data-toggle="tab">紧急联系人</a></li>
            <li><a href="#tab_13" data-toggle="tab">收入信息</a></li>
            <li><a href="#tab_14" data-toggle="tab">家庭信息</a></li>
            <li><a href="#tab_15" data-toggle="tab">房产信息</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="tab_10">
                <div class="box-header with-border">
                    <h3 class="box-title">主贷人信息</h3>
                </div>
                <div class="box-body">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">主贷人信息</label>
                        <div class="col-sm-10">
                            <div class="row inline-from">
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">姓名</span>
                                        <input type="text" class="form-control" name="c_name"
                                               id="c_name" value="${icbc.c_name}">
                                    </div>
                                </div>
                                <script>
                                    $(document).ready(function() {
                                        var name = $("#c_name").val();
                                        var py = getPinYinFirstCharacter(name, "", "");
                                        py = py.replace(/\ +/g, "").replace(/[\r\n]/g, "");
                                        document.getElementById("c_name_py").value = py;
                                    });
                                </script>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">拼音</span>
                                        <input disabled type="text" class="form-control" name="c_name_py"
                                               id="c_name_py" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">出生日期</span>
                                        <input disabled type="text" class="form-control" name="birthday"
                                               id="birthday" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">性别</span>
                                        <select name="" id="" class="form-control">
                                            <%=Tools.dicopt(DataDic.dicSex, icbc.get("c_sex"))%>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">身份证号</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="${icbc.c_cardno}">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">业务员姓名</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="${icbc.admin_name}">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">所属机构</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="${icbc.fs_name}">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">手机号码</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="${icbc.c_tel}">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">婚姻状况</span>
                                        <select name="" id="" class="form-control">
                                            <%=Tools.dicopt(DataDic.dic_hyzk,"0")%>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">有无子女</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="" disabled>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">赌博记录</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="" disabled>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">法院经济案</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="" disabled>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">最高学历</span>
                                        <select name="" id="" class="form-control">
                                            <%=Tools.dicopt(DataDic.dic_xl,"0")%>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">邮编</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="" disabled>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">居住状况</span>
                                        <select name="" id="" class="form-control">
                                            <%=Tools.dicopt(DataDic.dic_jzzk,"0")%>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">现住电话</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">单位电话</span>
                                        <input type="text" class="form-control" name="remark"
                                               id="" value="">
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="input-group">
                                        <span class="input-group-addon">现住地址</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="">
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="input-group">
                                        <span class="input-group-addon">工作单位</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="">
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="input-group">
                                        <span class="input-group-addon">单位地址</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="">
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="input-group">
                                        <span class="input-group-addon">单位性质</span>
                                        <select name="" id="" class="form-control">
                                            <option value="0">请选择</option>
                                            <option value="1">国有</option>
                                            <option value="2">私有</option>
                                            <option value="3">民营</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">职业</span>
                                        <select name="" id="" class="form-control">
                                            <option value="0">请选择</option>
                                            <option value="1">公务员</option>
                                            <option value="2">农民</option>
                                            <option value="3">工人</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">职务</span>
                                        <select name="" id="" class="form-control">
                                            <option value="0">请选择</option>
                                            <option value="1">总经理</option>
                                            <option value="2">部门经理</option>
                                            <option value="3">职员</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">月收入(元)</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">工作年限(年)</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="">
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="input-group">
                                        <span class="input-group-addon">文书送达地址</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"></label>
                        <div class="col-sm-10">
                            <div class="row inline-from">
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <button type="button" class="btn btn-block btn-primary">生成合同文件
                                        </button>
                                    </div>
                                </div>

                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <button type="button" class="btn btn-block btn-primary">
                                            生成Excel文件
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.tab-pane -->
            <div class="tab-pane" id="tab_11">
                <div class="box-header with-border">
                    <h3 class="box-title">共还人信息</h3>
                </div>
                <div class="box-body">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">共还人信息</label>
                        <div class="col-sm-10">
                            <div class="row inline-from">
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">姓名</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">关系</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">月收入(元)</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">学历</span>
                                        <select name="" id="" class="form-control">
                                            <option value="0">请选择</option>
                                            <option value="1">大专</option>
                                            <option value="2">本科</option>
                                            <option value="3">研究生</option>
                                            <option value="4">博士</option>
                                            <option value="5">硕士</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">现住地址</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">邮政编码</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">工作单位</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">单位地址</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">文书送达地址</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">主要从事或职务</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">联系人级别</span>
                                        <select name="" id="" class="form-control">
                                            <option value="0">请选择</option>
                                            <option value="1">一级</option>
                                            <option value="2">二级</option>
                                            <option value="3">三级</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">联系人电话区号</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">手机号码</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">性别</span>
                                        <select name="" id="" class="form-control">
                                            <option value="0">请选择</option>
                                            <option value="1">男</option>
                                            <option value="2">女</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">婚姻状况</span>
                                        <select name="" id="" class="form-control">
                                            <option value="0">请选择</option>
                                            <option value="1">已婚</option>
                                            <option value="2">未婚</option>
                                            <option value="3">离异</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">身份证号</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.tab-pane -->
            <div class="tab-pane" id="tab_12">
                <div class="box-header with-border">
                    <h3 class="box-title">紧急联系人</h3>
                </div>
                <div class="box-body">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">亲属</label>
                        <div class="col-sm-10">
                            <div class="row inline-from">
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">姓名</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">电话</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">与主贷人关系</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"></label>
                        <div class="col-sm-10">
                            <div class="row inline-from">
                                <div class="col-sm-12">
                                    <div class="input-group">
                                        <span class="input-group-addon">地址</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">其他</label>
                        <div class="col-sm-10">
                            <div class="row inline-from">
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">姓名</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">电话</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">与主贷人关系</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"></label>
                        <div class="col-sm-10">
                            <div class="row inline-from">
                                <div class="col-sm-12">
                                    <div class="input-group">
                                        <span class="input-group-addon">地址</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.tab-pane -->
            <div class="tab-pane" id="tab_13">
                <div class="box-header with-border">
                    <h3 class="box-title">收入信息</h3>
                </div>
                <div class="box-body">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">收入信息</label>
                        <div class="col-sm-10">
                            <div class="row inline-from">
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">收入类型</span>
                                        <select name="" id="" class="form-control">
                                            <option value="0">请选择收入</option>
                                            <option value="1">工资性收入</option>
                                            <option value="2">租赁型收入</option>
                                            <option value="3">经营型收入</option>
                                            <option value="4">其他收入</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">收入币种</span>
                                        <select name="" id="" class="form-control">
                                            <option value="0">请选择</option>
                                            <option value="1">人民币</option>
                                            <option value="2">美元</option>
                                            <option value="3">欧元</option>
                                            <option value="4">其他</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">月收入(元)</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">家庭月收入(元)</span>
                                        <input type="text" class="form-control" name=""
                                               id="" value="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.tab-pane -->
            <div class="tab-pane" id="tab_14">
                <div class="box-header with-border">
                    <h3 class="box-title">家庭信息</h3>
                </div>
                <div class="box-body">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">家庭信息</label>
                        <div class="col-sm-10">
                            <div class="row inline-from">
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">家庭月收入(元)</span>
                                        <input type="text" class="form-control" name="remark"
                                               id="remark" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">供养人数</span>
                                        <input type="text" class="form-control" name="remark"
                                               id="remark" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">人均月收入(元)</span>
                                        <input type="text" class="form-control" name="remark"
                                               id="remark" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">月负债(万元)</span>
                                        <input type="text" class="form-control" name="remark"
                                               id="remark" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">净资产(元)</span>
                                        <input type="text" class="form-control" name="remark"
                                               id="remark" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">负债(元)</span>
                                        <input type="text" class="form-control" name="remark"
                                               id="remark" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">净资产贷款比</span>
                                        <input type="text" class="form-control" name="remark"
                                               id="remark" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">年均存款(元)</span>
                                        <input type="text" class="form-control" name="remark"
                                               id="remark" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">人均住房面积(平方)</span>
                                        <input type="text" class="form-control" name="remark"
                                               id="remark" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">住房存款净值(万元)</span>
                                        <input type="text" class="form-control" name="remark"
                                               id="remark" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">有价证券净值(万元)</span>
                                        <input type="text" class="form-control" name="remark"
                                               id="remark" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">实物资产净值(万元)</span>
                                        <input type="text" class="form-control" name="remark"
                                               id="remark" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">对外投资净值(万元)</span>
                                        <input type="text" class="form-control" name="remark"
                                               id="remark" value="">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">自建房净值(万元)</span>
                                        <input type="text" class="form-control" name="remark"
                                               id="remark" value="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.tab-pane -->
            <div class="tab-pane" id="tab_15">
                <div class="box-header with-border">
                    <h3 class="box-title">房产信息</h3>
                </div>
                <div class="box-body">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">房产信息</label>
                        <div class="col-sm-10">
                            <div class="row inline-from">
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">房屋权属人</span>
                                        <input type="text" class="form-control" name="remark"
                                               id="remark" value="" disabled="disabled">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">关系</span>
                                        <select name="" id="" class="form-control" disabled="disabled">
                                            <option value="">请选择</option>
                                            <option value="">父子</option>
                                            <option value="">朋友</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">产权证号</span>
                                        <input type="text" class="form-control" name="remark"
                                               id="remark" value="" disabled="disabled">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">是否共有资产</span>
                                        <select name="" id="" class="form-control" disabled="disabled">
                                            <option value="">请选择</option>
                                            <option value="">是</option>
                                            <option value="">否</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">建购价格(元)</span>
                                        <input type="text" class="form-control" name="remark"
                                               id="remark" value="" disabled="disabled">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">所占份额(%)</span>
                                        <input type="text" class="form-control" name="remark"
                                               id="remark" value="" disabled="disabled">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">房屋性质</span>
                                        <select name="" id="" class="form-control" disabled="disabled">
                                            <option value="">请选择</option>
                                            <option value=""></option>
                                            <option value=""></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">房屋面积(平方)</span>
                                        <input type="text" class="form-control" name="remark"
                                               id="remark" value="" disabled="disabled">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">房屋地址</span>
                                        <input type="text" class="form-control" name="remark"
                                               id="remark" value="" disabled="disabled">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">房产抵押情况</span>
                                        <select name="" id="" class="form-control" disabled="disabled">
                                            <option value="">请选择</option>
                                            <option value="">有抵押</option>
                                            <option value="">无抵押</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon date ng-isolate-scope ng-not-empty ng-valid">买入日期</span>
                                        <input class="form-control" placeholder="请选择日期" id=""
                                               name="" value="" type="text" disabled="disabled">
                                        <span class="input-group-addon"><i
                                                class="fa fa-calendar"></i></span>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">评估价格(元)</span>
                                        <input type="text" class="form-control" name="remark"
                                               id="remark" value="" disabled="disabled">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <span class="input-group-addon">购房欠款余额(万)</span>
                                        <input type="text" class="form-control" name="remark"
                                               id="remark" value="" disabled="disabled">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.tab-pane -->
        </div>
        <!-- /.tab-content -->
    </div>
</div>
