<%@ page import="com.example.ddbx.tt.data.TtList" %>
<%@ page import="com.example.ddbx.tt.data.TtMap" %>
<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@ page import="com.example.ddbx.tt.utils.StringUtils" %><%--
  Created by IntelliJ IDEA.
  User: 86176
  Date: 2019/3/26
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  TtMap infodb=(TtMap) request.getAttribute("infodb");
%>
    <div ${param.tab eq 5?"class='tab-pane active'":"class='tab-pane'"} id="tab_5">
        <div class="box-header with-border">
            <h3 class="box-title">征信材料</h3>
        </div>
        <div class="box-body">
            <div class="form-group">
                <label class="col-sm-1 control-label">主贷人材料</label>
                <div class="col-sm-10">
                    <div class="gallerys row inline-from ">
                        <%
                            TtList zx_list = (TtList) request.getAttribute("zx_list");
                            if (zx_list != null && zx_list.size() > 0) {
                                if (zx_list.get(zx_list.size() - 1).get("result_value") != null && !zx_list.get(zx_list.size() - 1).get("result_value").equals("")) {
                                    TtMap ttMap = Tools.jsonDeCode_mpob(StringUtils.replaceBlank(zx_list.get(zx_list.size() - 1).get("result_value")));
                                    if (ttMap.get("imgstep1_1ss") != null && !ttMap.get("imgstep1_1ss").equals("")) {
                                        String imgstep1_1ss = ttMap.get("imgstep1_1ss");
                                        System.out.println("imgstep1_1ss:" + ttMap.get("imgstep1_1ss"));
                                        String[] ssImgs1 = {};
                                        ssImgs1 = imgstep1_1ss.split(",");

                                        for (int i = 0; i < ssImgs1.length; i++) {
                        %>
                        <div class=" col-sm-2">
                            <div style="position: relative;width: 100px;height:140px;display: inline-block;text-align: center;margin: auto;"
                                 id="div_imgurl<%=i%>">
                                <%
                                    if (ssImgs1[i] != null && !ssImgs1[i].equals("")) {
                                %>
                                <img id="imgurl_view<%=i%>" name="imgurl_view<%=i%>"
                                     src="<%=ssImgs1[i]%>" class="imgclass gallery-pic"
                                     style="width: 100%;height:100px;border-radius:10px;">
                                <img id="imgurl_view<%=i%>s" name="imgurl_view<%=i%>s"
                                     style="float:center;width:12px;height:12px;text-align:center;display:none;"
                                     src="iframe/dist/img/loading/loading-spinner-grey.gif">
                                <%
                                } else {
                                %>
                                <img id="imgurl_view<%=i%>" name="imgurl_view<%=i%>"
                                     src="images/mgcaraddimg.jpg" class="imgclass gallery-pic"
                                     style="width: 100%;height:100px;border-radius:10px;">
                                <img id="imgurl_view<%=i%>s" name="imgurl_view<%=i%>s"
                                     style="float:center;width:12px;height:12px;text-align:center;display:none;"
                                     src="iframe/dist/img/loading/loading-spinner-grey.gif">
                                <%}%>
                                    <%--<input type="hidden" id="imgurl1" name="imgurl1" value="images/mgcaraddimg.jpg" style="font-size: 16px;">
                                <input type="file" id="upload_imgurl1" runat="server" name="upload_immm" accept="image/*" style="position: absolute; left: 0px; top: 0px; height: 100%; width: 100%; background: transparent; border: 0px; margin: 0px; padding: 0px; opacity: 0; font-size: 16px;" class="uploadfileclass">--%>
                                <div style="padding-top:20px;"><a
                                        onclick="$.openPhotoGallery($('#imgurl_view<%=i%>'));"
                                        style="font-size: 16px;">查看大图</a></div>
                            </div>
                        </div>
                        <%
                                        }
                                    }
                                }
                            }
                        %>
                        <div class="col-sm-2">
                            <div class="input-group">
                                <button type="button" onclick="show_bjls('zx_zdr')"
                                        class="btn btn-block btn-primary">补件历史
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 control-label">主贷人配偶材料</label>
                <div class="col-sm-10">
                    <div class="gallerys row inline-from">
                        <%
                            if (zx_list != null && zx_list.size() > 0) {
                                if (zx_list.get(zx_list.size() - 1).get("result_value") != null && !zx_list.get(zx_list.size() - 1).get("result_value").equals("")) {
                                    TtMap ttMap = Tools.jsonDeCode_mpob(StringUtils.replaceBlank(zx_list.get(zx_list.size() - 1).get("result_value")));
                                    if (ttMap.get("imgstep1_2ss") != null && !ttMap.get("imgstep1_2ss").equals("")) {

                                        String imgstep1_2ss = ttMap.get("imgstep1_2ss");
                                        String[] ssImgs2 = {};
                                        ssImgs2 = imgstep1_2ss.split(",");
                                        for (int i = 0; i < ssImgs2.length; i++) {
                        %>
                        <div class="col-sm-2">
                            <div style="position: relative;width: 100px;height:140px;display: inline-block;text-align: center;margin: auto;"
                                 id="div_imgurl<%=i%>1">
                                <%
                                    if (ssImgs2[i] != null && !ssImgs2[i].equals("")) {
                                %>
                                <img id="imgurl_view<%=i%>1" name="imgurl_view<%=i%>1"
                                     src="<%=ssImgs2[i]%>" class="imgclass gallery-pic"
                                     style="width: 100%;height:100px;border-radius:10px;">
                                <img id="imgurl_view<%=i%>s1" name="imgurl_view<%=i%>s1"
                                     style="float:center;width:12px;height:12px;text-align:center;display:none;"
                                     src="iframe/dist/img/loading/loading-spinner-grey.gif">
                                <%
                                } else {
                                %>
                                <img id="imgurl_view<%=i%>1" name="imgurl_view<%=i%>1"
                                     src="images/mgcaraddimg.jpg" class="imgclass gallery-pic"
                                     style="width: 100%;height:100px;border-radius:10px;">
                                <img id="imgurl_view<%=i%>s1" name="imgurl_view<%=i%>s1"
                                     style="float:center;width:12px;height:12px;text-align:center;display:none;"
                                     src="iframe/dist/img/loading/loading-spinner-grey.gif">
                                <%}%>
                                    <%--<input type="hidden" id="imgurl1" name="imgurl1" value="images/mgcaraddimg.jpg" style="font-size: 16px;">
                                <input type="file" id="upload_imgurl1" runat="server" name="upload_immm" accept="image/*" style="position: absolute; left: 0px; top: 0px; height: 100%; width: 100%; background: transparent; border: 0px; margin: 0px; padding: 0px; opacity: 0; font-size: 16px;" class="uploadfileclass">--%>
                                <div style="padding-top:20px;"><a
                                        onclick="$.openPhotoGallery($('#imgurl_view<%=i%>1'));"
                                        style="font-size: 16px;">查看大图</a></div>
                            </div>
                        </div>
                        <%
                                        }
                                    }
                                }
                            }
                        %>
                        <div class="col-sm-2">
                            <div class="input-group">
                                <button type="button" onclick="show_bjls('zx_po')"
                                        class="btn btn-block btn-primary">补件历史
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 control-label">共还人1材料</label>
                <div class="col-sm-10">
                    <div class="gallerys row inline-from">
                        <%
                            if (zx_list != null && zx_list.size() > 0) {
                                if (zx_list.get(zx_list.size() - 1).get("result_value") != null && !zx_list.get(zx_list.size() - 1).get("result_value").equals("")) {
                                    TtMap ttMap = Tools.jsonDeCode_mpob(StringUtils.replaceBlank(zx_list.get(zx_list.size() - 1).get("result_value")));
                                    if (ttMap.get("imgstep1_3ss") != null && !ttMap.get("imgstep1_3ss").equals("")) {
                                        String imgstep1_3ss = ttMap.get("imgstep1_3ss");
                                        String[] ssImgs3 = {};
                                        ssImgs3 = imgstep1_3ss.split(",");
                                        for (int i = 0; i < ssImgs3.length; i++) {
                        %>
                        <div class="col-sm-2">
                            <div style="position: relative;width: 100px;height:140px;display: inline-block;text-align: center;margin: auto;"
                                 id="div_imgurl<%=i%>2">
                                <%
                                    if (ssImgs3[i] != null && !ssImgs3[i].equals("")) {
                                %>
                                <img id="imgurl_view<%=i%>2" name="imgurl_view<%=i%>2"
                                     src="<%=ssImgs3[i]%>" class="imgclass gallery-pic"
                                     style="width: 100%;height:100px;border-radius:10px;">
                                <img id="imgurl_view<%=i%>s2" name="imgurl_view<%=i%>s2"
                                     style="float:center;width:12px;height:12px;text-align:center;display:none;"
                                     src="iframe/dist/img/loading/loading-spinner-grey.gif">
                                <%
                                } else {
                                %>
                                <img id="imgurl_view<%=i%>2" name="imgurl_view<%=i%>2"
                                     src="images/mgcaraddimg.jpg" class="imgclass gallery-pic"
                                     style="width: 100%;height:100px;border-radius:10px;">
                                <img id="imgurl_view<%=i%>s2" name="imgurl_view<%=i%>s2"
                                     style="float:center;width:12px;height:12px;text-align:center;display:none;"
                                     src="iframe/dist/img/loading/loading-spinner-grey.gif">
                                <%}%>
                                    <%--<input type="hidden" id="imgurl1" name="imgurl1" value="images/mgcaraddimg.jpg" style="font-size: 16px;">
                                <input type="file" id="upload_imgurl1" runat="server" name="upload_immm" accept="image/*" style="position: absolute; left: 0px; top: 0px; height: 100%; width: 100%; background: transparent; border: 0px; margin: 0px; padding: 0px; opacity: 0; font-size: 16px;" class="uploadfileclass">--%>
                                <div style="padding-top:20px;"><a
                                        onclick="$.openPhotoGallery($('#imgurl_view<%=i%>2'));"
                                        style="font-size: 16px;">查看大图</a></div>
                            </div>
                        </div>
                        <%
                                        }
                                    }
                                }
                            }
                        %>
                        <div class="col-sm-2">
                            <div class="input-group">
                                <button type="button" onclick="show_bjls('zx_gh1')"
                                        class="btn btn-block btn-primary">补件历史
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 control-label">共还人2材料</label>
                <div class="col-sm-10">
                    <div class="gallerys row inline-from">
                        <%
                            if (zx_list != null && zx_list.size() > 0) {
                                if (zx_list.get(zx_list.size() - 1).get("result_value") != null && !zx_list.get(zx_list.size() - 1).get("result_value").equals("")) {
                                    TtMap ttMap = Tools.jsonDeCode_mpob(StringUtils.replaceBlank(zx_list.get(zx_list.size() - 1).get("result_value")));
                                    if (ttMap.get("imgstep1_4ss") != null && !ttMap.get("imgstep1_4ss").equals("")) {
                                        String imgstep1_4ss = ttMap.get("imgstep1_4ss");
                                        String[] ssImgs4 = {};
                                        ssImgs4 = imgstep1_4ss.split(",");
                                        for (int i = 0; i < ssImgs4.length; i++) {
                        %>
                        <div class="col-sm-2">
                            <div style="position: relative;width: 100px;height:140px;display: inline-block;text-align: center;margin: auto;"
                                 id="div_imgurl<%=i%>3">
                                <%
                                    if (ssImgs4[i] != null && !ssImgs4[i].equals("")) {
                                %>
                                <img id="imgurl_view<%=i%>3" name="imgurl_view<%=i%>3"
                                     src="<%=ssImgs4[i]%>" class="imgclass gallery-pic"
                                     style="width: 100%;height:100px;border-radius:10px;">
                                <img id="imgurl_view<%=i%>s3" name="imgurl_view<%=i%>s3"
                                     style="float:center;width:12px;height:12px;text-align:center;display:none;"
                                     src="iframe/dist/img/loading/loading-spinner-grey.gif">
                                <%
                                } else {
                                %>
                                <img id="imgurl_view<%=i%>3" name="imgurl_view<%=i%>3"
                                     src="images/mgcaraddimg.jpg" class="imgclass gallery-pic"
                                     style="width: 100%;height:100px;border-radius:10px;">
                                <img id="imgurl_view<%=i%>s3" name="imgurl_view<%=i%>s3"
                                     style="float:center;width:12px;height:12px;text-align:center;display:none;"
                                     src="iframe/dist/img/loading/loading-spinner-grey.gif">
                                <%}%>
                                    <%--<input type="hidden" id="imgurl1" name="imgurl1" value="images/mgcaraddimg.jpg" style="font-size: 16px;">
                                <input type="file" id="upload_imgurl1" runat="server" name="upload_immm" accept="image/*" style="position: absolute; left: 0px; top: 0px; height: 100%; width: 100%; background: transparent; border: 0px; margin: 0px; padding: 0px; opacity: 0; font-size: 16px;" class="uploadfileclass">--%>
                                <div style="padding-top:20px;"><a
                                        onclick="$.openPhotoGallery($('#imgurl_view<%=i%>3'));"
                                        style="font-size: 16px;">查看大图</a></div>
                            </div>
                        </div>
                        <%
                                        }
                                    }
                                }
                            }
                        %>
                        <div class="col-sm-2">
                            <div class="input-group">
                                <button type="button" onclick="show_bjls('zx_gh2')"
                                        class="btn btn-block btn-primary">补件历史
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="box-header with-border">
            <h3 class="box-title">征信通融材料</h3>
        </div>
        <div class="box-body">
            <div class="form-group">
                <label class="col-sm-1 control-label"></label>
                <div class="col-sm-10">
                    <div class="gallerys row inline-from">
                        <%
                            TtList tr_list = (TtList) request.getAttribute("tr_list");
                            if (tr_list.size() > 0) {
                                if (tr_list.get(tr_list.size() - 1).get("result_value") != null && !tr_list.get(tr_list.size() - 1).get("result_value").equals("")) {
                                    TtMap trMap = Tools.jsonDeCode_mpob(StringUtils.replaceBlank(tr_list.get(tr_list.size() - 1).get("result_value")));
                                    if (trMap.get("imgstep1_5ss") != null && !trMap.get("imgstep1_5ss").equals("")) {
                                        String imgstep1_5ss = trMap.get("imgstep1_5ss");
                                        String[] ssImgs5 = {};
                                        ssImgs5 = imgstep1_5ss.split(",");
                                        for (int i = 0; i < ssImgs5.length; i++) {
                        %>
                        <div class="col-sm-2">
                            <div style="position: relative;width: 100px;height:140px;display: inline-block;text-align: center;margin: auto;"
                                 id="div_imgurl<%=i%>4">
                                <%
                                    if (ssImgs5[i] != null && !ssImgs5[i].equals("")) {
                                %>
                                <img id="imgurl_view<%=i%>4" name="imgurl_view<%=i%>4"
                                     src="<%=ssImgs5[i]%>" class="imgclass gallery-pic"
                                     style="width: 100%;height:100px;border-radius:10px;">
                                <img id="imgurl_view<%=i%>s4" name="imgurl_view<%=i%>s4"
                                     style="float:center;width:12px;height:12px;text-align:center;display:none;"
                                     src="iframe/dist/img/loading/loading-spinner-grey.gif">
                                <%
                                } else {
                                %>
                                <img id="imgurl_view<%=i%>4" name="imgurl_view<%=i%>4"
                                     src="images/mgcaraddimg.jpg" class="imgclass gallery-pic"
                                     style="width: 100%;height:100px;border-radius:10px;">
                                <img id="imgurl_view<%=i%>s4" name="imgurl_view<%=i%>s4"
                                     style="float:center;width:12px;height:12px;text-align:center;display:none;"
                                     src="iframe/dist/img/loading/loading-spinner-grey.gif">
                                <%}%>
                                    <%--<input type="hidden" id="imgurl1" name="imgurl1" value="images/mgcaraddimg.jpg" style="font-size: 16px;">
                                <input type="file" id="upload_imgurl1" runat="server" name="upload_immm" accept="image/*" style="position: absolute; left: 0px; top: 0px; height: 100%; width: 100%; background: transparent; border: 0px; margin: 0px; padding: 0px; opacity: 0; font-size: 16px;" class="uploadfileclass">--%>
                                <div style="padding-top:20px;"><a
                                        onclick="$.openPhotoGallery($('#imgurl_view<%=i%>4'));"
                                        style="font-size: 16px;">查看大图</a></div>
                            </div>
                        </div>
                        <%
                                        }
                                    }
                                }
                            }
                        %>
                        <div class="col-sm-2">
                            <div class="input-group">
                                <button type="button" onclick="show_bjls('zxtr')"
                                        class="btn btn-block btn-primary">补件历史
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="box-header with-border">
            <h3 class="box-title">汽车评估材料</h3>
        </div>
        <div class="box-body">
            <div class="form-group">
                <label class="col-sm-1 control-label">评估材料信息</label>
                <div class="col-sm-10">
                    <div class="gallerys row inline-from">
                        <%
                            TtMap qc_Map = (TtMap) request.getAttribute("qc_Map");
                            if (qc_Map.size() > 0) {
                                if (qc_Map.get("imgstep9_1ss") != null && !qc_Map.get("imgstep9_1ss").equals("")) {
                                    String imgstep9_1ss = qc_Map.get("imgstep9_1ss");
                                    String[] ssImgs5 = {};
                                    ssImgs5 = imgstep9_1ss.split(",");
                                    for (int i = 0; i < ssImgs5.length; i++) {
                        %>
                        <div class="col-sm-2">
                            <div style="position: relative;width: 100px;height:140px;display: inline-block;text-align: center;margin: auto;"
                                 id="div_imgurl<%=i%>5">
                                <%
                                    if (ssImgs5[i] != null && !ssImgs5[i].equals("")) {
                                %>
                                <img id="imgurl_view<%=i%>5" name="imgurl_view<%=i%>5"
                                     src="<%=ssImgs5[i]%>" class="imgclass gallery-pic"
                                     style="width: 100%;height:100px;border-radius:10px;">
                                <img id="imgurl_view<%=i%>s5" name="imgurl_view<%=i%>s5"
                                     style="float:center;width:12px;height:12px;text-align:center;display:none;"
                                     src="iframe/dist/img/loading/loading-spinner-grey.gif">
                                <%
                                } else {
                                %>
                                <img id="imgurl_view<%=i%>5" name="imgurl_view<%=i%>5"
                                     src="images/mgcaraddimg.jpg" class="imgclass gallery-pic"
                                     style="width: 100%;height:100px;border-radius:10px;">
                                <img id="imgurl_view<%=i%>s5" name="imgurl_view<%=i%>s5"
                                     style="float:center;width:12px;height:12px;text-align:center;display:none;"
                                     src="iframe/dist/img/loading/loading-spinner-grey.gif">
                                <%}%>
                                    <%--<input type="hidden" id="imgurl1" name="imgurl1" value="images/mgcaraddimg.jpg" style="font-size: 16px;">
                                <input type="file" id="upload_imgurl1" runat="server" name="upload_immm" accept="image/*" style="position: absolute; left: 0px; top: 0px; height: 100%; width: 100%; background: transparent; border: 0px; margin: 0px; padding: 0px; opacity: 0; font-size: 16px;" class="uploadfileclass">--%>
                                <div style="padding-top:20px;"><a
                                        onclick="$.openPhotoGallery($('#imgurl_view<%=i%>5'));"
                                        style="font-size: 16px;">查看大图</a></div>
                            </div>
                        </div>
                        <%
                                    }
                                }
                            }
                        %>
                        <div class="col-sm-2">
                            <div class="input-group">
                                <button type="button" onclick="show_bjls('qcpg_cl')"
                                        class="btn btn-block btn-primary">补件历史
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-1 control-label">车辆评估车辆照片</label>
                <div class="col-sm-10">
                    <div class="gallerys row inline-from">
                        <%
                            if (qc_Map.size() > 0) {
                                if (qc_Map.get("imgstep9_2ss") != null && !qc_Map.get("imgstep9_2ss").equals("")) {
                                    String imgstep9_2ss = qc_Map.get("imgstep9_2ss");
                                    System.out.println("车辆评估车辆照片:" + imgstep9_2ss);
                                    String[] ssImgs5 = {};
                                    ssImgs5 = imgstep9_2ss.split(",");

                                    for (int i = 0; i < ssImgs5.length; i++) {
                        %>
                        <div class="col-sm-2">
                            <div style="position: relative;width: 100px;height:140px;display: inline-block;text-align: center;margin: auto;"
                                 id="div_imgurl<%=i%>6">
                                <%
                                    if (ssImgs5[i] != null && !ssImgs5[i].equals("")) {
                                %>
                                <img id="imgurl_view<%=i%>6" name="imgurl_view<%=i%>6"
                                     src="<%=ssImgs5[i]%>" class="imgclass gallery-pic"
                                     style="width: 100%;height:100px;border-radius:10px;">
                                <img id="imgurl_view<%=i%>s6" name="imgurl_view<%=i%>s6"
                                     style="float:center;width:12px;height:12px;text-align:center;display:none;"
                                     src="iframe/dist/img/loading/loading-spinner-grey.gif">
                                <%
                                } else {
                                %>
                                <img id="imgurl_view<%=i%>6" name="imgurl_view<%=i%>6"
                                     src="images/mgcaraddimg.jpg" class="imgclass gallery-pic"
                                     style="width: 100%;height:100px;border-radius:10px;">
                                <img id="imgurl_view<%=i%>s6" name="imgurl_view<%=i%>s6"
                                     style="float:center;width:12px;height:12px;text-align:center;display:none;"
                                     src="iframe/dist/img/loading/loading-spinner-grey.gif">
                                <%}%>
                                    <%--<input type="hidden" id="imgurl1" name="imgurl1" value="images/mgcaraddimg.jpg" style="font-size: 16px;">
                                <input type="file" id="upload_imgurl1" runat="server" name="upload_immm" accept="image/*" style="position: absolute; left: 0px; top: 0px; height: 100%; width: 100%; background: transparent; border: 0px; margin: 0px; padding: 0px; opacity: 0; font-size: 16px;" class="uploadfileclass">--%>
                                <div style="padding-top:20px;"><a
                                        onclick="$.openPhotoGallery($('#imgurl_view<%=i%>6'));"
                                        style="font-size: 16px;">查看大图</a></div>
                            </div>
                        </div>
                        <%
                                    }
                                }
                            }
                        %>
                        <div class="col-sm-2">
                            <div class="input-group">
                                <button type="button" onclick="show_bjls('qcpg_zp')"
                                        class="btn btn-block btn-primary">补件历史
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="box-header with-border">
            <h3 class="box-title">开卡申请材料</h3>
        </div>
        <div class="box-body">
            <div class="form-group">
                <label class="col-sm-1 control-label"></label>
                <div class="col-sm-10">
                    <div class="gallerys row inline-from">
                        <%
                            TtMap kkmap = (TtMap) request.getAttribute("kkMap");
                            System.out.println("kkmap:" + kkmap);
                            String imgs = "";
                            for (int i = 1; i <= 9; i++) {
                                imgs = imgs + kkmap.get("imgstep3_" + i) + ",";
                            }
                            imgs = imgs + kkmap.get("imgstep3_1s");
                            System.out.println("kk:" + imgs);
                            String[] imgss = imgs.split(",");
                            if (imgss.length > 0) {
                                for (int l = 0; l < imgss.length; l++) {
                        %>
                        <div class="col-sm-2">
                            <div style="position: relative;width: 100px;height:140px;display: inline-block;text-align: center;margin: auto;"
                                 id="div_imgurl<%=l%>k">
                                <%
                                    if (imgss[l] != null && !imgss[l].equals("")) {
                                %>
                                <img id="imgurl_view<%=l%>k" name="imgurl_view<%=l%>k"
                                     src="<%=imgss[l]%>" class="imgclass gallery-pic"
                                     style="width: 100%;height:100px;border-radius:10px;">
                                <img id="imgurl_view<%=l%>sk" name="imgurl_view<%=l%>sk"
                                     style="float:center;width:12px;height:12px;text-align:center;display:none;"
                                     src="iframe/dist/img/loading/loading-spinner-grey.gif">
                                <%
                                } else {
                                %>
                                <img id="imgurl_view<%=l%>k" name="imgurl_view<%=l%>k"
                                     src="images/mgcaraddimg.jpg" class="imgclass gallery-pic"
                                     style="width: 100%;height:100px;border-radius:10px;">
                                <img id="imgurl_view<%=l%>sk" name="imgurl_view<%=l%>sk"
                                     style="float:center;width:12px;height:12px;text-align:center;display:none;"
                                     src="iframe/dist/img/loading/loading-spinner-grey.gif">
                                <%}%>
                                    <%--<input type="hidden" id="imgurl1" name="imgurl1" value="images/mgcaraddimg.jpg" style="font-size: 16px;">
                                <input type="file" id="upload_imgurl1" runat="server" name="upload_immm" accept="image/*" style="position: absolute; left: 0px; top: 0px; height: 100%; width: 100%; background: transparent; border: 0px; margin: 0px; padding: 0px; opacity: 0; font-size: 16px;" class="uploadfileclass">--%>
                                <div style="padding-top:20px;"><a
                                        onclick="$.openPhotoGallery($('#imgurl_view<%=l%>k'));"
                                        style="font-size: 16px;">查看大图</a></div>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                        <div class="col-sm-2">
                            <div class="input-group">
                                <button type="button" onclick="show_bjls('kasq')"
                                        class="btn btn-block btn-primary">补件历史
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            <%--                        <div class="box-header with-border">
                                        <h3 class="box-title">开卡申请PDF材料</h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label"></label>
                                            <div class="col-sm-10">
                                                <div class="row inline-from">
                                                    <div class="col-sm-2">
                                                        <div class="input-group">
                                                            <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                                 style="width: 100px;height: 100px;"
                                                                 src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                                            <a class="btn btn-primary btn-download"
                                                               style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                                               href="">↓</a>
                                                            <a class="fileUpload_filename ng-binding"
                                                               style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <div class="input-group">
                                                            <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                                 style="width: 100px;height: 100px;"
                                                                 src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                                            <a class="btn btn-primary btn-download"
                                                               style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                                               href="">↓</a>
                                                            <a class="fileUpload_filename ng-binding"
                                                               style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <div class="input-group">
                                                            <button type="button" onclick="show_bjls('kasqpdf')"
                                                                    class="btn btn-block btn-primary">补件历史
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>--%>
            <%--                        <div class="box-header with-border">
                                        <h3 class="box-title">视频材料材料</h3>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label"></label>
                                            <div class="col-sm-10">
                                                <div class="row inline-from">
                                                    <div class="col-sm-2">
                                                        <div class="input-group">
                                                            <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                                 style="width: 100px;height: 100px;"
                                                                 src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                                            <a class="btn btn-primary btn-download"
                                                               style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                                               href="">↓</a>
                                                            <a class="fileUpload_filename ng-binding"
                                                               style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <div class="input-group">
                                                            <img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"
                                                                 style="width: 100px;height: 100px;"
                                                                 src="http://a.kcway.net/assess/upload/2019/01/24/9458df766d3255a345e928bb84920355.jpg">
                                                            <a class="btn btn-primary btn-download"
                                                               style="width:30px;height:30px;position:absolute;top:35px;left:35px;"
                                                               href="">↓</a>
                                                            <a class="fileUpload_filename ng-binding"
                                                               style="position:absolute;top:100px;left:15px;font-size:12px;">2019-01-24</a>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <div class="input-group">
                                                            <button type="button" onclick="show_bjls('spmq')"
                                                                    class="btn btn-block btn-primary">补件历史
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>--%>
        <div class="box-header with-border">
            <h3 class="box-title">证明材料</h3>
        </div>
        <div class="box-body">
            <div class="form-group">
                <label class="col-sm-1 control-label"></label>
                <div class="col-sm-10">
                    <div class="gallerys row inline-from">
                        <%
                            TtMap
                                    dk_Map
                                    =
                                    (
                                            TtMap
                                            )
                                            request
                                                    .
                                                            getAttribute
                                                                    (
                                                                            "dk_Map"
                                                                    );
                            if
                            (
                                    dk_Map
                                            .
                                                    size
                                                            (
                                                            )
                                            >
                                            0
                            ) {
                                if
                                (
                                        dk_Map
                                                .
                                                        get
                                                                (
                                                                        "imgstep9_1ss"
                                                                )
                                                !=
                                                null
                                                &&
                                                !
                                                        dk_Map
                                                                .
                                                                        get
                                                                                (
                                                                                        "imgstep9_1ss"
                                                                                )
                                                                .
                                                                        equals
                                                                                (
                                                                                        ""
                                                                                )
                                ) {
                                    String
                                            imgstep9_1ss
                                            =
                                            dk_Map
                                                    .
                                                            get
                                                                    (
                                                                            "imgstep9_1ss"
                                                                    );
                                    String
                                            [
                                            ]
                                            ssImgs5
                                            =
                                            {
                                            };
                                    ssImgs5
                                            =
                                            imgstep9_1ss
                                                    .
                                                            split
                                                                    (
                                                                            ","
                                                                    )
                                    ;
                                    for
                                    (
                                            int
                                            i
                                            =
                                            0
                                            ;
                                            i
                                                    <
                                                    ssImgs5
                                                            .
                                                            length
                                            ;
                                            i
                                                    ++
                                    ) {
                        %>
                        <div class="col-sm-2">
                            <div style="position: relative;width: 100px;height:140px;display: inline-block;text-align: center;margin: auto;"
                                 id="div_imgurl<%=i%>7">
                                <%
                                    if
                                    (
                                            ssImgs5
                                                    [
                                                    i
                                                    ]
                                                    !=
                                                    null
                                                    &&
                                                    !
                                                            ssImgs5
                                                                    [
                                                                    i
                                                                    ]
                                                                    .
                                                                            equals
                                                                                    (
                                                                                            ""
                                                                                    )
                                    ) {
                                %>
                                <img id="imgurl_view<%=i%>7" name="imgurl_view<%=i%>7"
                                     src="<%=ssImgs5[i]%>" class="imgclass gallery-pic"
                                     style="width: 100%;height:100px;border-radius:10px;">
                                <img id="imgurl_view<%=i%>s7" name="imgurl_view<%=i%>s7"
                                     style="float:center;width:12px;height:12px;text-align:center;display:none;"
                                     src="iframe/dist/img/loading/loading-spinner-grey.gif">
                                <%
                                } else {
                                %>
                                <img id="imgurl_view<%=i%>7" name="imgurl_view<%=i%>7"
                                     src="images/mgcaraddimg.jpg" class="imgclass gallery-pic"
                                     style="width: 100%;height:100px;border-radius:10px;">
                                <img id="imgurl_view<%=i%>s7" name="imgurl_view<%=i%>s7"
                                     style="float:center;width:12px;height:12px;text-align:center;display:none;"
                                     src="iframe/dist/img/loading/loading-spinner-grey.gif">
                                <%}%>
                                    <%--<input type="hidden" id="imgurl1" name="imgurl1" value="images/mgcaraddimg.jpg" style="font-size: 16px;">
                                <input type="file" id="upload_imgurl1" runat="server" name="upload_immm" accept="image/*" style="position: absolute; left: 0px; top: 0px; height: 100%; width: 100%; background: transparent; border: 0px; margin: 0px; padding: 0px; opacity: 0; font-size: 16px;" class="uploadfileclass">--%>
                                <div style="padding-top:20px;"><a
                                        onclick="$.openPhotoGallery($('#imgurl_view<%=i%>7'));"
                                        style="font-size: 16px;">查看大图</a></div>
                            </div>
                        </div>
                        <%
                                    }
                                }
                            }
                        %>
                        <div class="col-sm-2">
                            <div class="input-group">
                                <button type="button" onclick="show_bjls('zmcl')"
                                        class="btn btn-block btn-primary">补件历史
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="box-header with-border">
            <h3 class="box-title">合同材料</h3>
        </div>
        <div class="box-body">
            <div class="form-group">
                <label class="col-sm-1 control-label"></label>
                <div class="col-sm-10">
                    <div class="gallerys row inline-from">
                        <%
                            if
                            (
                                    dk_Map
                                            .
                                                    size
                                                            (
                                                            )
                                            >
                                            0
                            ) {
                                if
                                (
                                        dk_Map
                                                .
                                                        get
                                                                (
                                                                        "imgstep9_2ss"
                                                                )
                                                !=
                                                null
                                                &&
                                                !
                                                        dk_Map
                                                                .
                                                                        get
                                                                                (
                                                                                        "imgstep9_2ss"
                                                                                )
                                                                .
                                                                        equals
                                                                                (
                                                                                        ""
                                                                                )
                                ) {
                                    String
                                            imgstep9_2ss
                                            =
                                            dk_Map
                                                    .
                                                            get
                                                                    (
                                                                            "imgstep9_2ss"
                                                                    );
                                    String
                                            [
                                            ]
                                            ssImgs5
                                            =
                                            {
                                            };
                                    ssImgs5
                                            =
                                            imgstep9_2ss
                                                    .
                                                            split
                                                                    (
                                                                            ","
                                                                    )
                                    ;
                                    for
                                    (
                                            int
                                            i
                                            =
                                            0
                                            ;
                                            i
                                                    <
                                                    ssImgs5
                                                            .
                                                            length
                                            ;
                                            i
                                                    ++
                                    ) {
                        %>
                        <div class="col-sm-2">
                            <div style="position: relative;width: 100px;height:140px;display: inline-block;text-align: center;margin: auto;"
                                 id="div_imgurl<%=i%>8">
                                <%
                                    if
                                    (
                                            ssImgs5
                                                    [
                                                    i
                                                    ]
                                                    !=
                                                    null
                                                    &&
                                                    !
                                                            ssImgs5
                                                                    [
                                                                    i
                                                                    ]
                                                                    .
                                                                            equals
                                                                                    (
                                                                                            ""
                                                                                    )
                                    ) {
                                %>
                                <img id="imgurl_view<%=i%>8" name="imgurl_view<%=i%>8"
                                     src="<%=ssImgs5[i]%>" class="imgclass gallery-pic"
                                     style="width: 100%;height:100px;border-radius:10px;">
                                <img id="imgurl_view<%=i%>s8" name="imgurl_view<%=i%>s8"
                                     style="float:center;width:12px;height:12px;text-align:center;display:none;"
                                     src="iframe/dist/img/loading/loading-spinner-grey.gif">
                                <%
                                } else {
                                %>
                                <img id="imgurl_view<%=i%>8" name="imgurl_view<%=i%>8"
                                     src="images/mgcaraddimg.jpg" class="imgclass gallery-pic"
                                     style="width: 100%;height:100px;border-radius:10px;">
                                <img id="imgurl_view<%=i%>s8" name="imgurl_view<%=i%>s8"
                                     style="float:center;width:12px;height:12px;text-align:center;display:none;"
                                     src="iframe/dist/img/loading/loading-spinner-grey.gif">
                                <%}%>
                                    <%--<input type="hidden" id="imgurl1" name="imgurl1" value="images/mgcaraddimg.jpg" style="font-size: 16px;">
                                <input type="file" id="upload_imgurl1" runat="server" name="upload_immm" accept="image/*" style="position: absolute; left: 0px; top: 0px; height: 100%; width: 100%; background: transparent; border: 0px; margin: 0px; padding: 0px; opacity: 0; font-size: 16px;" class="uploadfileclass">--%>
                                <div style="padding-top:20px;"><a
                                        onclick="$.openPhotoGallery($('#imgurl_view<%=i%>8'));"
                                        style="font-size: 16px;">查看大图</a></div>
                            </div>
                        </div>
                        <%
                                    }
                                }
                            }
                        %>
                        <div class="col-sm-2">
                            <div class="input-group">
                                <button type="button" onclick="show_bjls('htcl')"
                                        class="btn btn-block btn-primary">补件历史
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="box-header with-border">
            <h3 class="box-title">其他材料</h3>
        </div>
        <div class="box-body">
            <div class="form-group">
                <label class="col-sm-1 control-label"></label>
                <div class="col-sm-10">
                    <div class="gallerys row inline-from">
                        <%
                            if
                            (
                                    dk_Map
                                            .
                                                    size
                                                            (
                                                            )
                                            >
                                            0
                            ) {
                                if
                                (
                                        dk_Map
                                                .
                                                        get
                                                                (
                                                                        "imgstep9_3ss"
                                                                )
                                                !=
                                                null
                                                &&
                                                !
                                                        dk_Map
                                                                .
                                                                        get
                                                                                (
                                                                                        "imgstep9_3ss"
                                                                                )
                                                                .
                                                                        equals
                                                                                (
                                                                                        ""
                                                                                )
                                ) {
                                    String
                                            imgstep9_3ss
                                            =
                                            dk_Map
                                                    .
                                                            get
                                                                    (
                                                                            "imgstep9_3ss"
                                                                    );
                                    String
                                            [
                                            ]
                                            ssImgs5
                                            =
                                            {
                                            };
                                    ssImgs5
                                            =
                                            imgstep9_3ss
                                                    .
                                                            split
                                                                    (
                                                                            ","
                                                                    )
                                    ;
                                    for
                                    (
                                            int
                                            i
                                            =
                                            0
                                            ;
                                            i
                                                    <
                                                    ssImgs5
                                                            .
                                                            length
                                            ;
                                            i
                                                    ++
                                    ) {
                        %>
                        <div class="col-sm-2">
                            <div style="position: relative;width: 100px;height:140px;display: inline-block;text-align: center;margin: auto;"
                                 id="div_imgurl<%=i%>9">
                                <%
                                    if
                                    (
                                            ssImgs5
                                                    [
                                                    i
                                                    ]
                                                    !=
                                                    null
                                                    &&
                                                    !
                                                            ssImgs5
                                                                    [
                                                                    i
                                                                    ]
                                                                    .
                                                                            equals
                                                                                    (
                                                                                            ""
                                                                                    )
                                    ) {
                                %>
                                <img id="imgurl_view<%=i%>9" name="imgurl_view<%=i%>9"
                                     src="<%=ssImgs5[i]%>" class="imgclass gallery-pic"
                                     style="width: 100%;height:100px;border-radius:10px;">
                                <img id="imgurl_view<%=i%>s9" name="imgurl_view<%=i%>s9"
                                     style="float:center;width:12px;height:12px;text-align:center;display:none;"
                                     src="iframe/dist/img/loading/loading-spinner-grey.gif">
                                <%
                                } else {
                                %>
                                <img id="imgurl_view<%=i%>9" name="imgurl_view<%=i%>9"
                                     src="images/mgcaraddimg.jpg" class="imgclass gallery-pic"
                                     style="width: 100%;height:100px;border-radius:10px;">
                                <img id="imgurl_view<%=i%>s9" name="imgurl_view<%=i%>s9"
                                     style="float:center;width:12px;height:12px;text-align:center;display:none;"
                                     src="iframe/dist/img/loading/loading-spinner-grey.gif">
                                <%}%>
                                    <%--<input type="hidden" id="imgurl1" name="imgurl1" value="images/mgcaraddimg.jpg" style="font-size: 16px;">
                                <input type="file" id="upload_imgurl1" runat="server" name="upload_immm" accept="image/*" style="position: absolute; left: 0px; top: 0px; height: 100%; width: 100%; background: transparent; border: 0px; margin: 0px; padding: 0px; opacity: 0; font-size: 16px;" class="uploadfileclass">--%>
                                <div style="padding-top:20px;"><a
                                        onclick="$.openPhotoGallery($('#imgurl_view<%=i%>9'));"
                                        style="font-size: 16px;">查看大图</a></div>
                            </div>
                        </div>
                        <%
                                    }
                                }
                            }
                        %>
                        <div class="col-sm-2">
                            <div class="input-group">
                                <button type="button" onclick="show_bjls('qtcl')"
                                        class="btn btn-block btn-primary">补件历史
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="box-header with-border">
            <h3 class="box-title">补充材料</h3>
        </div>
        <div class="box-body">
            <div class="form-group">
                <label class="col-sm-1 control-label"></label>
                <div class="col-sm-10">
                    <div class="gallerys row inline-from">
                        <%
                            if
                            (
                                    dk_Map
                                            .
                                                    size
                                                            (
                                                            )
                                            >
                                            0
                            ) {
                                if
                                (
                                        dk_Map
                                                .
                                                        get
                                                                (
                                                                        "imgstep9_4ss"
                                                                )
                                                !=
                                                null
                                                &&
                                                !
                                                        dk_Map
                                                                .
                                                                        get
                                                                                (
                                                                                        "imgstep9_4ss"
                                                                                )
                                                                .
                                                                        equals
                                                                                (
                                                                                        ""
                                                                                )
                                ) {
                                    String
                                            imgstep9_4ss
                                            =
                                            dk_Map
                                                    .
                                                            get
                                                                    (
                                                                            "imgstep9_4ss"
                                                                    );
                                    String
                                            [
                                            ]
                                            ssImgs5
                                            =
                                            {
                                            };
                                    ssImgs5
                                            =
                                            imgstep9_4ss
                                                    .
                                                            split
                                                                    (
                                                                            ","
                                                                    )
                                    ;
                                    for
                                    (
                                            int
                                            i
                                            =
                                            0
                                            ;
                                            i
                                                    <
                                                    ssImgs5
                                                            .
                                                            length
                                            ;
                                            i
                                                    ++
                                    ) {
                        %>
                        <div class="col-sm-2">
                            <div style="position: relative;width: 100px;height:140px;display: inline-block;text-align: center;margin: auto;"
                                 id="div_imgurl<%=i%>10">
                                <%
                                    if
                                    (
                                            ssImgs5
                                                    [
                                                    i
                                                    ]
                                                    !=
                                                    null
                                                    &&
                                                    !
                                                            ssImgs5
                                                                    [
                                                                    i
                                                                    ]
                                                                    .
                                                                            equals
                                                                                    (
                                                                                            ""
                                                                                    )
                                    ) {
                                %>
                                <img id="imgurl_view<%=i%>10" name="imgurl_view<%=i%>10"
                                     src="<%=ssImgs5[i]%>" class="imgclass gallery-pic"
                                     style="width: 100%;height:100px;border-radius:10px;">
                                <img id="imgurl_view<%=i%>s10" name="imgurl_view<%=i%>s10"
                                     style="float:center;width:12px;height:12px;text-align:center;display:none;"
                                     src="iframe/dist/img/loading/loading-spinner-grey.gif">
                                <%
                                } else {
                                %>
                                <img id="imgurl_view<%=i%>10" name="imgurl_view<%=i%>10"
                                     src="images/mgcaraddimg.jpg" class="imgclass gallery-pic"
                                     style="width: 100%;height:100px;border-radius:10px;">
                                <img id="imgurl_view<%=i%>s10" name="imgurl_view<%=i%>s10"
                                     style="float:center;width:12px;height:12px;text-align:center;display:none;"
                                     src="iframe/dist/img/loading/loading-spinner-grey.gif">
                                <%}%>
                                    <%--<input type="hidden" id="imgurl1" name="imgurl1" value="images/mgcaraddimg.jpg" style="font-size: 16px;">
                                <input type="file" id="upload_imgurl1" runat="server" name="upload_immm" accept="image/*" style="position: absolute; left: 0px; top: 0px; height: 100%; width: 100%; background: transparent; border: 0px; margin: 0px; padding: 0px; opacity: 0; font-size: 16px;" class="uploadfileclass">--%>
                                <div style="padding-top:20px;"><a
                                        onclick="$.openPhotoGallery($('#imgurl_view<%=i%>10'));"
                                        style="font-size: 16px;">查看大图</a></div>
                            </div>
                        </div>
                        <%
                                    }
                                }
                            }
                        %>
                        <div class="col-sm-2">
                            <div class="input-group">
                                <button type="button" onclick="show_bjls('bccl')"
                                        class="btn btn-block btn-primary">补件历史
                                </button>
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
                <%--                        <table style="table-layout: fixed;word-wrap:break-word;" class="table table-bordered table-hover" id="table">
                                            <tbody>
                                            &lt;%&ndash;<tr>&ndash;%&gt;
                                            &lt;%&ndash;<td width="100px">1</td>&ndash;%&gt;
                                            &lt;%&ndash;<td>&ndash;%&gt;
                                            &lt;%&ndash;<div class="col-sm-2">&ndash;%&gt;
                                            &lt;%&ndash;<div class="input-group">&ndash;%&gt;
                                            &lt;%&ndash;<img id="" name="" onclick="yyclimage(this)" class="img-thumbnail"&ndash;%&gt;
                                            &lt;%&ndash;style="width: 100px;height: 100px;"&ndash;%&gt;
                                            &lt;%&ndash;src="">&ndash;%&gt;
                                            &lt;%&ndash;<a class="btn btn-primary btn-download"&ndash;%&gt;
                                            &lt;%&ndash;style="width:30px;height:30px;position:absolute;top:35px;left:35px;"&ndash;%&gt;
                                            &lt;%&ndash;href="">↓</a>&ndash;%&gt;
                                            &lt;%&ndash;<a class="fileUpload_filename ng-binding"&ndash;%&gt;
                                            &lt;%&ndash;style="position:absolute;top:100px;left:15px;font-size:12px;">1111</a>&ndash;%&gt;
                                            &lt;%&ndash;</div>&ndash;%&gt;
                                            &lt;%&ndash;</div>&ndash;%&gt;
                                            &lt;%&ndash;</td>&ndash;%&gt;
                                            &lt;%&ndash;</tr>&ndash;%&gt;
                                            </tbody>
                                        </table>--%>
            </div>
            <div class="modal-footer">
                <button type="button" id="closet" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
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


</script>
