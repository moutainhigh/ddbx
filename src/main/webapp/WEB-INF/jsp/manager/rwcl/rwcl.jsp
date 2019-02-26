<%@ page import="com.example.ddbx.tt.tool.DbTools" %>
<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@ page import="com.example.ddbx.tt.data.TtList" %>
<%@ page import="com.example.ddbx.tt.data.TtMap" %><%--
  Created by IntelliJ IDEA.
  User: 86176
  Date: 2019/2/25
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .flex-box {
        display: flex;
        flex-direction: column;
    }

    .flex-box div[class^='flex-row'] {
        width: 100%;
    }

    .flex-box .flex-row {
        height: 35px;
    }

    .flex-row-rhcen {
        display: flex;
        justify-content: flex-end;
        align-items: center;
    }

    em {
        cursor: pointer;
    }

    .flex-row-rhcen em {
        padding: 0 5px;
    }

    .flex-rowcen {
        flex: 1;
    }

    .text-primary em {
        display: block;
        font-size: 15px;
        line-height: 25px;
    }

    .text-primary .big-conte {
        background-color: #f7f7f7;
        height: auto !important;
        height: 100px;
        display: none;
        min-height: 100px;
        padding: 15px 0;
        margin: 15px 0;
        border-radius: 10px;
    }

    .big-conte-row span {
        text-align: right;
        padding-right: 15px;
        line-height: 34px;
        width: 25%;
        float: left;
    }

    .big-conte-row input {
        float: left;
        width: 20%;
    }

    .big-conte-row {
        margin: 20px;
        height: 34px;
    }
</style>
<%
    TtMap infodb = (TtMap) request.getAttribute("infodb");
    TtMap minfo = (TtMap) request.getAttribute("minfo");

    DbTools dbTools=new DbTools();
    String sql="select \n" +
            "e.*,\n" +
            "(select \n" +
            "s2.name as now_name\n" +
            "from \n" +
            "(select id,name,sort from sys_modal where type='rwcl' and id_uplevel=0 order by sort) s1\n" +
            "LEFT JOIN sys_modal s2 ON s2.id_uplevel=s1.id\n" +
            "where s1.id=e.type_id and s2.sort=e.now_status) as now_name\n" +
            "from dd_icbc_erp_result e where qryid="+infodb.get("id")+" and order_id="+infodb.get("order_id");
    TtList list=new TtList();
    try {
        list=dbTools.reclist(sql);
    }catch (Exception e) {
        Tools.logError(e.getMessage(), true, false);
    }finally {
        dbTools.closeConn();
    }

    String erp_msg="/WEB-INF/jsp/manager/rwcl/";
%>

<div class="tab-content">
    <div class="tab-pane active" id="zx">
        <div class="box-body">
                <div class="modal-body flex-box" style="height: auto;">
                    <div class="flex-row flex-row-rhcen">
                        <em onclick="funUnfold()" class="text-muted">全部展开</em>
                        <em onclick="funClose()" class="text-muted">全部收起</em>
                    </div>
                    <div class="flex-rowcen">
                        <ol>
                        <%
                        for(TtMap ttMap : list){
                            System.out.println(ttMap.get("now_name")+"------"+ttMap.get("now_status"));
                            if(ttMap.get("type_id")!=null
                                    &&!ttMap.get("type_id").equals("")
                            &&ttMap.get("now_status")!=null
                                    &&!ttMap.get("now_status").equals("")
                            ){
                             //   System.out.println("***********88"+erp_msg+ttMap.get("type_id")+"/"+ttMap.get("now_status")+".jsp");
                            switch (ttMap.get("now_name")){
                                case "开始":
                                    erp_msg=erp_msg+"modal/begin.jsp";
                                    break;
                                case "提交查询":
                                    erp_msg=erp_msg+"modal/submit.jsp";
                                    break;
                                case "完成":
                                    erp_msg=erp_msg+"modal/end.jsp";
                                    break;
                                default :
                                    erp_msg=erp_msg+ttMap.get("type_id")+"/"+ttMap.get("now_status")+".jsp";
                            }
                        %>
                        <jsp:include page="<%=erp_msg%>"></jsp:include>
                        <%
                            }
                                erp_msg="/WEB-INF/jsp/manager/rwcl/";
                        }
                        %>
                        </ol>
                    </div>

                    <div class="flex-row flex-row-rhcen">
                        <em onclick="funUnfold()" class="text-muted">全部展开</em>
                        <em onclick="funClose()" class="text-muted">全部收起</em>
                    </div>
                </div>
        </div>
    </div>
</div>
<script>
    function showradio(id,value) {
        switch(value){
            case "1":
                $("#"+id+"2").removeAttr("checked");
                $("#"+id+"3").removeAttr("checked");
                break;
            case "2":
                $("#"+id+"3").removeAttr("checked");
                $("#"+id+"1").removeAttr("checked");
                break;
            case "3":
                $("#"+id+"1").removeAttr("checked");
                $("#"+id+"2").removeAttr("checked");
                break;
            default:
                break;
        }
    };




    $(".text-primary em").click(function(){
        $(this).next(".big-conte").slideToggle();
    })
    //全部展开
    function funUnfold(){
        $(".big-conte").slideDown();
    }
    //全部关闭
    function funClose(){
        $(".big-conte").slideUp();
    }
</script>