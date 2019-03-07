package com.example.ddbx.tt.erp;
import com.example.ddbx.tt.data.TtMap;
import com.example.ddbx.tt.tool.DbTools;
import com.example.ddbx.tt.tool.Tools;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;

/**
 * erp 相关操作
 */
@Controller
public class ErpResultsController {
    //客户贷款金额
    public static final int LOANMONEY = 50000;
    /**
     * 添加任务进度
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/manager/ajaxPostResults", method = RequestMethod.POST)
    @ResponseBody
    public TtMap ajaxPostResults(HttpServletRequest request) {
        TtMap post = Tools.getPostMap(request, true);// 过滤参数，过滤mysql的注入，url参数注入
        String result_value = Tools.jsonEncode(post);
        TtMap res = new TtMap();
        String msg = "编辑成功";
        long code = 200;
        TtMap minfo = Tools.minfo();//当前登录用户信息
        System.out.println("minfo：" + minfo);
        TtMap erp = new TtMap();//更新dd_icbc_erp表数据集合
        TtMap erp_result = new TtMap();//添加dd_icbc_erp_result表数据集合
        TtMap UserInfoICBC = Tools.recinfo("select * from dd_icbc where id="+Long.valueOf(post.get("icbc_id")));//用户ID信息
        TtMap getOneUserInfoErp = Tools.recinfo("select * from dd_icbc_erp where id="+Long.valueOf(post.get("id")));//获取该客户的erp模块信息
        switch (post.get("type_id")) {
            /**
             * 汽车贷款
             */
            case "70":
                //判断是否是回退补件
                if(post.get("result_code")!= null && !post.get("result_code").equals("")){
                    //回退补件
                    if(post.get("result_code").equals("3")){
                        erp.put("now_status", "33");
                        erp.put("later_status", "32");
                        erp_result.put("now_status","33");
                        erp_result.put("later_status","32");
                        erp_result.put("remark", "");
                        erp_result.put("result_code", post.get("result_code"));
                        erp_result.put("result_msg", post.get("result_msg"));
                        erp_result.put("result_value", result_value);
                    }else{ //非回退补件
                        switch (getOneUserInfoErp.get("later_status")) {
                            case "33": //专员审核结果
                                if(post.get("result_code").equals("1") || post.get("result_code").equals("2")){ //过件 || 过件附条件
                                    if (LOANMONEY >= 150000) {//贷款金额大于15万,推到上一级主管审核
                                        erp.put("now_status", "33");
                                        erp.put("later_status", "35");
                                        erp_result.put("now_status","33");
                                        erp_result.put("later_status","35");
                                        erp_result.put("remark", "");
                                        erp_result.put("result_code", post.get("result_code"));
                                        erp_result.put("result_msg", post.get("result_msg"));
                                        erp_result.put("result_value", result_value);
                                    }else if(LOANMONEY<150000){//否则审核员审核完毕
                                        erp.put("now_status", "33");
                                        erp.put("later_status", "40");
                                        erp_result.put("now_status","33");
                                        erp_result.put("later_status","40");
                                        erp_result.put("remark", "");
                                        erp_result.put("result_code", post.get("result_code"));
                                        erp_result.put("result_msg", post.get("result_msg"));
                                        erp_result.put("result_value", result_value);
                                    }
                                }
                                break;
                            case "35"://主管审核结果
                                if(post.get("result_code").equals("1") || post.get("result_code").equals("2")){ //过件 || 过件附条件
                                    if (LOANMONEY >= 300000) {//贷款金额大于30万,主管审核完推到上一级经理审核
                                        erp.put("now_status", "35");
                                        erp.put("later_status", "37");
                                        erp_result.put("now_status", "35");
                                        erp_result.put("later_status", "37");
                                        erp_result.put("remark", "");
                                        erp_result.put("result_code", post.get("result_code"));
                                        erp_result.put("result_msg", post.get("result_msg"));
                                        erp_result.put("result_value", result_value);
                                    }else if(LOANMONEY<300000){//否则主管审核完毕
                                        erp.put("now_status", "35");
                                        erp.put("later_status", "40");
                                        erp_result.put("now_status","35");
                                        erp_result.put("later_status","40");
                                        erp_result.put("remark", "");
                                        erp_result.put("result_code", post.get("result_code"));
                                        erp_result.put("result_msg", post.get("result_msg"));
                                        erp_result.put("result_value", result_value);
                                    }
                                }
                                break;
                            case "37"://经理审核结果
                                if(post.get("result_code").equals("1") || post.get("result_code").equals("2")){ //过件 || 过件附条件
                                    if (LOANMONEY >= 600000) {//贷款金额大于60万,经理审核完推到上一级总监审核
                                        erp.put("now_status", "37");
                                        erp.put("later_status", "39");
                                        erp_result.put("now_status", "37");
                                        erp_result.put("later_status", "39");
                                        erp_result.put("remark", "");
                                        erp_result.put("result_code", post.get("result_code"));
                                        erp_result.put("result_msg", post.get("result_msg"));
                                        erp_result.put("result_value", result_value);
                                    }else if(LOANMONEY<600000){//否则经理审核完毕
                                        erp.put("now_status", "37");
                                        erp.put("later_status", "40");
                                        erp_result.put("now_status","37");
                                        erp_result.put("later_status","40");
                                        erp_result.put("remark", "");
                                        erp_result.put("result_code", post.get("result_code"));
                                        erp_result.put("result_msg", post.get("result_msg"));
                                        erp_result.put("result_value", result_value);
                                    }
                                }
                                break;
                            case "39"://总监审核结果
                                if(post.get("result_code").equals("1") || post.get("result_code").equals("2")){ //过件 || 过件附条件
                                    //总监审核完毕
                                    erp.put("now_status", "39");
                                    erp.put("later_status", "40");
                                    erp_result.put("now_status","39");
                                    erp_result.put("later_status","40");
                                    erp_result.put("remark", "");
                                    erp_result.put("result_code", post.get("result_code"));
                                    erp_result.put("result_msg", post.get("result_msg"));
                                    erp_result.put("result_value", result_value);
                                }
                                break;
                        }
                    }
                }else{//审核状态为空值
                    code = 6911;
                    msg = "审核状态为空值";
                }
                break;
            /**
             * 银行贷款
             */
            case "98":
                switch (getOneUserInfoErp.get("later_status")) {
                    case "57":
                        erp.put("now_status", "57");
                        erp.put("later_status", "58");
                        erp_result.put("now_status","57");
                        erp_result.put("later_status","58");
                        erp_result.put("remark", "");
                        erp_result.put("result_code","0");
                        erp_result.put("result_msg", post.get("result_msg"));
                        erp_result.put("result_value", result_value);
                        break;
                }
                break;
            /**
             * 某某某某
             */
            case "72":
                break;
            /**
             * 某某某某
             */
            case "73":
                break;
            default:
                code = 119;
                msg = "非法审核";
                System.err.println("默认处理:不审核不操作");
        }
        ////公共start////
        //更新dd_icbc_erp表
        Tools.recEdit(erp,"dd_icbc_erp", Long.valueOf(post.get("id")));
        //添加dd_icbc_erp_result表数据
        erp_result.put("qryid", post.get("id"));
        erp_result.put("type_id", post.get("type_id"));
        erp_result.put("icbc_id", post.get("icbc_id"));
        erp_result.put("gems_id", minfo.get("id"));
        erp_result.put("gems_fs_id", minfo.get("fsid"));
        Tools.recAdd(erp_result, "dd_icbc_erp_result");
        ////公共end////
        //汽车贷款start 如果【总监审核过件或者过件附条件】 或者 【对应贷款金额审核过件完成的】 就添加汽车贷款 完成 状态数据
        if(erp.get("later_status")!=null && !erp.get("later_status").equals("")){
            if(erp.get("later_status").equals("40")){ //当完成的时候
                //更新dd_icbc_erp表
                TtMap bankLoanERPEnd = new TtMap();
                //                bankLoanERPEnd.put("now_status", "40");
                //                bankLoanERPEnd.put("later_status", "40");
                Tools.recEdit(bankLoanERPEnd,"dd_icbc_erp",Long.valueOf(post.get("id")));
                //dd_icbc_erp_result 添加
                TtMap bankLoanERPResultEnd = new TtMap();
                bankLoanERPResultEnd.put("qryid",post.get("id"));
                bankLoanERPResultEnd.put("now_status", "40");
                bankLoanERPResultEnd.put("later_status", "40");
                bankLoanERPResultEnd.put("remark","");
                bankLoanERPResultEnd.put("result_code","0");
                bankLoanERPResultEnd.put("result_msg", "");
                bankLoanERPResultEnd.put("result_value","");
                bankLoanERPResultEnd.put("type_id", post.get("type_id"));
                bankLoanERPResultEnd.put("icbc_id", post.get("icbc_id"));
                bankLoanERPResultEnd.put("gems_id", minfo.get("id"));
                bankLoanERPResultEnd.put("gems_fs_id", minfo.get("fsid"));
                Tools.recAdd(bankLoanERPResultEnd, "dd_icbc_erp_result");
                //addERPAndERP_result  start
                //dd_icbc_erp  add
                TtMap bankLoanERP = new TtMap();
                bankLoanERP.put("now_status", "56");
                bankLoanERP.put("later_status", "57");
                bankLoanERP.put("type_id", "98");
                bankLoanERP.put("icbc_id", post.get("icbc_id"));
                bankLoanERP.put("gems_id", minfo.get("id"));
                bankLoanERP.put("gems_fs_id", minfo.get("fsid"));
                bankLoanERP.put("c_name", UserInfoICBC.get("c_name"));
                bankLoanERP.put("c_tel", UserInfoICBC.get("c_tel"));
                bankLoanERP.put("c_cardno", UserInfoICBC.get("c_cardno"));
                bankLoanERP.put("c_carvin", "");
                bankLoanERP.put("c_carno", "");
                bankLoanERP.put("adminop_tag",minfo.get("id")); //当前操作人id
                //Tools.recAdd(bankLoanERP, "dd_icbc_erp");
                //dd_icbc_erp_result 添加
                TtMap bankLoanERPResult = new TtMap();
                bankLoanERPResult.put("now_status", "56");
                bankLoanERPResult.put("later_status", "57");
                bankLoanERPResult.put("remark","添加银行贷款");
                bankLoanERPResult.put("result_code","0");
                bankLoanERPResult.put("result_msg", "");
                bankLoanERPResult.put("result_value","");
                bankLoanERPResult.put("type_id", "98");
                bankLoanERPResult.put("icbc_id", post.get("icbc_id"));
                bankLoanERPResult.put("gems_id", minfo.get("id"));
                bankLoanERPResult.put("gems_fs_id", minfo.get("fsid"));
                //Tools.recAdd(bankLoanERPResult, "dd_icbc_erp_result");
                //addERPAndERP_result  end
                //过件，银行贷款亮起
                if(post.get("result_code").equals("1")){
                    //查询银行贷款板块是否添加   if_no_add
                    CarLoanTobankLoanERP(post, bankLoanERP, bankLoanERPResult);
                }
            }
        }
        //汽车贷款end
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        System.out.println("post:" + post);
        res.put("code",String.valueOf(code));
        res.put("msg", msg);
        return res;
    }
    //-----提取方法 start----------------------------------------------------------------------------------
    //银行贷款亮起
    private void CarLoanTobankLoanERP(TtMap post, TtMap bankLoanERP, TtMap bankLoanERPResult) {
        //查询银行贷款板块是否添加   if_no_add
        TtMap selectOnebankLoanERPErp = Tools.recinfo("select * from dd_icbc_erp where icbc_id=" + Long.valueOf(post.get("icbc_id")) + " and type_id=198");
        //        if (selectOnebankLoanERPErp == null || selectOnebankLoanERPErp.equals("")){
        Long getERPId = Tools.recAdd(bankLoanERP, "dd_icbc_erp");
        System.err.println(getERPId+"--9999999999999999999--"+selectOnebankLoanERPErp.equals(""));
        bankLoanERPResult.put("qryid",getERPId+"");
        Tools.recAdd(bankLoanERPResult, "dd_icbc_erp_result");
//        }
    }
    //通过icbc_id获取到主订单表信息
    public TtMap getInfoByIcbc_id(String icbc_id) {
        DbTools myDbTools = new DbTools();
        String sql = "select * from dd_icbc where id=" + icbc_id;
        TtMap ontCustomer = null;
        try {
            ontCustomer = myDbTools.recinfo(sql);
        } catch (Exception e) {
            Tools.logError(e.getMessage(), true, false);
        } finally {
            myDbTools.closeConn();
        }
        return ontCustomer;
    }
//-----提取方法 end----------------------------------------------------------------------------------
}