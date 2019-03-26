<%@ page import="com.example.ddbx.tt.data.TtMap" %>
<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@ page import="com.example.ddbx.tt.tool.DataDic" %><%--
  Created by IntelliJ IDEA.
  User: 86176
  Date: 2019/3/26
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    TtMap infodb=(TtMap) request.getAttribute("infodb");
%>
<div ${param.tab eq 4?"class='tab-pane active'":"class='tab-pane'"} id="tab_4">
    <%
        TtMap cars = (TtMap) request.getAttribute("cars");
    %>
    <div class="box-header with-border">
        <h3 class="box-title">车辆信息</h3>
    </div>
    <div class="box-body">
        <div class="form-group">
            <label class="col-sm-2 control-label">车辆信息</label>
            <div class="col-sm-10">
                <div class="row inline-from">
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">关联客户</span>
                            <input type="text" class="form-control" value="${icbc.c_name}">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">原车主姓名</span>
                            <input type="text" class="form-control" value="${cars.old_owner}">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">原车牌号</span>
                            <input type="text" class="form-control" value="${cars.carno}">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">车架号</span>
                            <input type="text" class="form-control" value="${cars.car_vin}">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">品牌型号</span>
                            <input type="text" class="form-control" value="${cars.ppxh}">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">发动机号</span>
                            <input type="text" class="form-control" value="${cars.motorcode}">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">预期价格(元)</span>
                            <input type="text" class="form-control" value="${cars.expect_price}">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">新车指导价(元)</span>
                            <input type="text" class="form-control" value="${cars.dealer_price}">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">最终评估价(元)</span>
                            <input type="text" class="form-control" value="${cars.pg_price}">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">现车牌号</span>
                            <input type="text" class="form-control" value="" disabled>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">登记证书编号</span>
                            <input type="text" class="form-control" value="" disabled>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">购车发票号</span>
                            <input type="text" class="form-control" value="" disabled>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">行驶里程(公里)</span>
                            <input type="text" class="form-control" value="${cars.car_km}">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">国产/进口</span>
                            <select class="form-control">
                                <%=Tools.dicopt(DataDic.dic_cars_source, cars.get("source_id"))%>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">车辆类型</span>
                            <select class="form-control">
                                <%=Tools.dicopt(DataDic.dic_cars_type, cars.get("car_type"))%>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">使用性质</span>
                            <select class="form-control">
                                <%=Tools.dicopt(DataDic.dic_cars_property, cars.get("property_id"))%>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">车辆状况</span>
                            <select class="form-control">
                                <%=Tools.dicopt(DataDic.dic_car_status, cars.get("car_status"))%>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">自动/手动</span>
                            <select class="form-control">
                                <%=Tools.dicopt(DataDic.dic_car_gear_box, cars.get("gear_box_id"))%>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">车辆颜色</span>
                            <select class="form-control">
                                <%=Tools.dicopt(DataDic.dic_car_color, cars.get("car_color_id"))%>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">出厂日期</span>
                            <input type="text" id="cardt1" name="cardt1" class="form-control"
                                   value="${cars.cardt1}">
                            <span class="input-group-addon"><i
                                    class="fa fa-calendar"></i></span>
                        </div>
                    </div>

                    <div class="col-sm-3">
                        <div class="input-group">
                            <span class="input-group-addon">初次登记日期</span>
                            <input type="text" id="cardt2" name="cardt2" class="form-control"
                                   value="${cars.cardt2}">
                            <span class="input-group-addon"><i
                                    class="fa fa-calendar"></i></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%

            int brid = 0;
            if (cars.get("brid") != null && !cars.get("brid").equals("")) {
                brid = Integer.parseInt(cars.get("brid"));
            }

            String sp = Tools.dicopt("car_brand_v2", brid);//品牌
        %>
        <div class="form-group">
            <label class="col-sm-2 control-label">品牌车型</label>
            <div class="col-sm-10">
                <div class="row inline-from">
                    <div class="col-sm-4">
                        <div class="input-group">
                            <span class="input-group-addon">品牌</span>
                            <select name="car_brand_v2_id" id="car_brand_v2_id" class="form-control">
                                <option value="0">请选择</option>
                                <%=sp%>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="input-group">
                            <span class="input-group-addon">车系</span>
                            <select name="car_series_v2_id" id="car_series_v2_id" class="form-control">
                                <option value="0">请选择</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="input-group">
                            <span class="input-group-addon">型号</span>
                            <select name="car_model_v2_id" id="car_model_v2_id" class="form-control">
                                <option value="0">请选择</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            objacl('#car_brand_v2_id', '#car_series_v2_id', '/ttAjax?do=opt&cn=car_series_v2&id=0&brand_id=', '${cars.brid}', '${cars.seid}');
            objacl('#car_series_v2_id', '#car_model_v2_id', '/ttAjax?do=opt&cn=car_model_v2&id=0&series_id=', '${infodb.seid}', '${infodb.carid}');
        </script>
        <%
            String sh = Tools.dicopt("comm_states", 0);//省
        %>
        <div class="form-group">
            <label class="col-sm-2 control-label">上牌地址</label>
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
            objacl('#local_states', '#local_citys', '/ttAjax?do=opt&cn=comm_citys&id=0&state_id=', '${cars.local_states}', '${cars.local_citys}');
        </script>
        <div class="form-group">
            <label class="col-sm-2 control-label"></label>
            <div class="col-sm-10">
                <div class="row inline-from">
                    <div class="col-sm-4">
                        <div class="input-group">
                            <button onclick="show_bjls('qcpg_zp')" type="button" class="btn btn-block btn-primary">查看车辆材料</button>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="input-group">
                            <button type="button" class="btn btn-block btn-primary">一键下载车辆材料</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade in" id="addModal_tdtf" tabindex="-1" role="dialog" aria-labelledby="imgs_yyclLabel"
     aria-hidden="false">
    <div class="modal-dialog modal-lg" style="width: 900px;height: 800px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" align="center" id="aayyclModalLabel">补件历史</h4>
            </div>
            <div id="modal_add" class="modal-body modal-open"
                 style="height:100%;border:1px solid #ccc;background-color:#F7F7F7;border-radius: 10px;margin:30px;">
            </div>
            <div class="modal-footer">
                <button type="button" id="closet" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<script>
    function show_bjls(cl_type) {

        var icbc_id = <%= infodb.get("icbc_id")%>;

        $.ajax({
            type: "POST",      //data 传送数据类型。post 传递
            dataType: 'json',  // 返回数据的数据类型json
            url: "/manager/bjlspost",  // 控制器方法
            data: {
                icbc_id: icbc_id,
                cl_type: cl_type
            },//使用变量sendData
            //执行成功的回调函数
            success: function (data) {

                $("#modal_add").empty();   //清空table中的数据

                var arr = data.zxlist;      //获取到erp_result表中记录的list
                var data1 = "";
                for (var i = 0; i < data.zxlist.length; i++) {      //循环获取到的list
                    var result_value = arr[i].result_value;
                    //alert(result_value)
                    //取出list中每条数据的result_value值
                    var result_value_json = eval('(' + result_value + ')');  //转为json
                    var imgstep1_1ss;
                    if (cl_type == 'zx_zdr') {   //主贷人材料
                        imgstep1_1ss = result_value_json.imgstep1_1ss;       //根据点击不同的补件历史取出图片信息
                    }
                    if (cl_type == 'zx_po') {    //主贷人配偶材料
                        imgstep1_1ss = result_value_json.imgstep1_2ss;
                    }
                    if (cl_type == 'zx_gh1') {  //共还人1材料
                        imgstep1_1ss = result_value_json.imgstep1_3ss;
                    }
                    if (cl_type == 'zx_gh2') {  //共还人2材料
                        imgstep1_1ss = result_value_json.imgstep1_4ss;
                    }
                    if (cl_type == 'zxtr') {     //征信通融材料
                        imgstep1_1ss = result_value_json.imgstep1_5ss;
                    }
                    if (cl_type == 'qcpg_cl' || cl_type == 'zmcl') {  //汽车评估材料 或者 汽车贷款的证明材料
                        imgstep1_1ss = result_value_json.imgstep9_1ss;
                    }
                    if (cl_type == 'qcpg_zp' || cl_type == 'htcl') {  //汽车评估车辆照片材料 或者 汽车贷款的合同材料
                        imgstep1_1ss = result_value_json.imgstep9_2ss;
                    }
                    if (cl_type == 'qtcl') {
                        imgstep1_1ss = result_value_json.imgstep9_3ss;   //汽车贷款的其他材料
                    }
                    if (cl_type == 'bccl') {
                        imgstep1_1ss = result_value_json.imgstep9_4ss;    //汽车贷款的补充材料
                    }
                    if (cl_type == 'kasq') {
                        imgstep1_1ss = result_value_json.imgstep3_1 + "," +
                            result_value_json.imgstep3_2 + "," +
                            result_value_json.imgstep3_3 + "," +
                            result_value_json.imgstep3_4 + "," +
                            result_value_json.imgstep3_5 + "," +
                            result_value_json.imgstep3_6 + "," +
                            result_value_json.imgstep3_7 + "," +
                            result_value_json.imgstep3_8 + "," +
                            result_value_json.imgstep3_9 + "," +
                            result_value_json.imgstep3_1s;
                        //开卡申请材料
                        //alert(imgstep1_1ss);
                    }
                    var imgstep1_1ssarr = imgstep1_1ss.split(",");

                    //由于征信的图片拼接的字符串最后有一个逗号, 所以长度要减一
                    if (cl_type == 'zx_zdr' || cl_type == 'zx_po' || cl_type == 'zx_gh1' || cl_type == 'zx_gh2') {
                        imgstep1_1ssarr.length = imgstep1_1ssarr.length - 1;
                    }

                    for (var j = 0; j < imgstep1_1ssarr.length; j++) {       //根据图片存放的数组长度循环把图片放入td里面
                        console.log(imgstep1_1ssarr[j]);
                        if (imgstep1_1ssarr[j] != null && imgstep1_1ssarr[j] != '') {
                            data1 = data1 + "<div class='col-sm-2'>" +
                                "<div style='position: relative;width: 100px;height:140px;display: inline-block;text-align: center;margin: auto;'" +
                                "id='div_imgurl" + j + cl_type + "'>" +
                                "<img id='imgurl_view" + j + cl_type + "' name='imgurl_view" + j + cl_type + "'" +
                                "src='" + imgstep1_1ssarr[j] + "' class='imgclass gallery-pic'" +
                                "style='width: 100%;height:100px;border-radius:10px;'>" +
                                "<img id='imgurl_view" + j + cl_type + "s' name='imgurl_view" + j + cl_type + "s7'" +
                                "style='float:center;width:12px;height:12px;text-align:center;display:none;'" +
                                "src='iframe/dist/img/loading/loading-spinner-grey.gif'>  " +
                                "<div style='padding-top:20px;'>" +
                                "<a onclick=\"$.openPhotoGallery($('#imgurl_view" + j + cl_type + "'));\" style=\"font-size: 14px;\">查看大图</a>" +
                                "</div>" +
                                "</div>" +
                                "</div>";
                        }
                    }
                    var n = i + 1;
                    $("#modal_add").append(
                        "    <div class=\"form-group\">\n" +
                        "        <label class=\"col-sm-2\">第" + n + "次进件<br>时间:" + arr[i].dt_add + "</label>\n" +
                        "        <div class=\"col-sm-10\">\n" +
                        "            <div class=\"gallerys row inline-from\">" + data1 + "</div>\n" +
                        "        </div>\n" +
                        "    </div>");
                    data1 = "";     //添加td后清空
                }
            },
            //执行失败或错误的回调函数
            error: function (data) {
                alert("失败！");
            }
        });
        $('#addModal_tdtf').modal({show: true});
    }

    //执行一个laydate实例
    laydate.render({
        elem: '#cardt1' //指定元素
    });
    //执行一个laydate实例
    laydate.render({
        elem: '#cardt2' //指定元素
    });
</script>