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
        switch (post.get("type_id")) {
            /**
             * 汽车贷款
             */
            case "70":
                //获取该客户的erp模块信息
                TtMap getOneUserInfoErp = Tools.recinfo("select * from dd_icbc_erp where id="+Long.valueOf(post.get("id")));
                //判断是否是回退补件
                if(post.get("result_code")!= null && !post.get("result_code").equals("")){
                    //回退补件
                    if(post.get("result_code").equals("3")){
                        erp.put("now_status", "33");
                        erp.put("later_status", "32");
                        erp_result.put("now_status","33");
                        erp_result.put("later_status","32");
                    }else{ //非回退补件
                        //addERPAndERP_result  start
                        //dd_icbc_erp  add
                        TtMap bankLoanERP = new TtMap();
                        bankLoanERP.put("now_status", "56");
                        bankLoanERP.put("later_status", "57");
                        bankLoanERP.put("type_id", post.get("type_id"));
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
                        bankLoanERPResult.put("qryid",post.get("id"));
                        bankLoanERPResult.put("now_status", "56");
                        bankLoanERPResult.put("later_status", "57");
                        bankLoanERPResult.put("remark","");
                        bankLoanERPResult.put("result_code","");
                        bankLoanERPResult.put("result_msg", "");
                        bankLoanERPResult.put("result_value","");
                        bankLoanERPResult.put("type_id", post.get("type_id"));
                        bankLoanERPResult.put("icbc_id", post.get("icbc_id"));
                        bankLoanERPResult.put("gems_id", minfo.get("id"));
                        bankLoanERPResult.put("gems_fs_id", minfo.get("fsid"));
                        //Tools.recAdd(bankLoanERPResult, "dd_icbc_erp_result");
                        //addERPAndERP_result  end
                        //客户贷款金额
                        final int LOANMONEY = 100000;
                        switch (getOneUserInfoErp.get("later_status")) {
                            case "33": //专员审核结果
                                if(post.get("result_code").equals("1") || post.get("result_code").equals("2")){ //过件 || 过件附条件
                                    if (LOANMONEY >= 150000) {//贷款金额大于15万,推到上一级主管审核
                                        erp.put("now_status", "34");
                                        erp.put("later_status", "35");
                                        erp_result.put("now_status","34");
                                        erp_result.put("later_status","35");
                                    }else if(LOANMONEY<150000){//否则审核员审核完毕
                                        erp.put("now_status", "40");
                                        erp.put("later_status", "40");
                                        erp_result.put("now_status","40");
                                        erp_result.put("later_status","40");
                                        if(post.get("result_code").equals("1")){
                                            //过件，银行贷款亮起
                                            //查询银行贷款板块是否添加   if_no_add
                                            CarLoanTobankLoanERP(post, bankLoanERP, bankLoanERPResult);
                                        }
                                    }
                                }
                                break;
                            case "35"://主管审核结果
                                if(post.get("result_code").equals("1") || post.get("result_code").equals("2")){ //过件 || 过件附条件
                                    if (LOANMONEY >= 300000) {//贷款金额大于30万,主管审核完推到上一级经理审核
                                        erp.put("now_status", "36");
                                        erp.put("later_status", "37");
                                        erp_result.put("now_status", "36");
                                        erp_result.put("later_status", "37");
                                    }else if(LOANMONEY<300000){//否则主管审核完毕
                                        erp.put("now_status", "40");
                                        erp.put("later_status", "40");
                                        erp_result.put("now_status","40");
                                        erp_result.put("later_status","40");
                                        if(post.get("result_code").equals("1")){
                                            //过件，银行贷款亮起
                                            //查询银行贷款板块是否添加   if_no_add
                                            CarLoanTobankLoanERP(post, bankLoanERP, bankLoanERPResult);
                                        }
                                    }
                                }
                                break;
                            case "37"://经理审核结果
                                if(post.get("result_code").equals("1") || post.get("result_code").equals("2")){ //过件 || 过件附条件
                                    if (LOANMONEY >= 600000) {//贷款金额大于60万,经理审核完推到上一级总监审核
                                        erp.put("now_status", "38");
                                        erp.put("later_status", "39");
                                        erp_result.put("now_status", "38");
                                        erp_result.put("later_status", "39");
                                    }else if(LOANMONEY<600000){//否则经理审核完毕
                                        erp.put("now_status", "40");
                                        erp.put("later_status", "40");
                                        erp_result.put("now_status","40");
                                        erp_result.put("later_status","40");
                                        if(post.get("result_code").equals("1")){
                                            //过件，银行贷款亮起
                                            CarLoanTobankLoanERP(post, bankLoanERP, bankLoanERPResult);
                                        }
                                    }
                                }
                                break;
                            case "39"://总监审核结果
                                if(post.get("result_code").equals("1") || post.get("result_code").equals("2")){ //过件 || 过件附条件
                                    //总监审核完毕
                                    erp.put("now_status", "40");
                                    erp.put("later_status", "40");
                                    erp_result.put("now_status","40");
                                    erp_result.put("later_status","40");
                                    if(post.get("result_code").equals("1")){
                                        //过件，银行贷款亮起
                                        //查询银行贷款板块是否添加   if_no_add
                                        CarLoanTobankLoanERP(post, bankLoanERP, bankLoanERPResult);
                                    }
                                }
                                break;
                        }
                    }
                }else{//审核状态为空值
                    code = 6911;
                    msg = "审核状态为空值";
                }
                break;
            case "71":
                break;
            case "72":
                break;
            case "73":
                break;
            default:
                code = 119;
                msg = "非法审核";
                System.err.println("默认处理:不审核不操作");
        }
        //更新dd_icbc_erp表
        Tools.recEdit(erp,"dd_icbc_erp", Long.valueOf(post.get("id")));
        //添加dd_icbc_erp_result表数据
        erp_result.put("qryid", post.get("id"));
        erp_result.put("remark", "");
        erp_result.put("result_code", post.get("result_code"));
        erp_result.put("result_msg", post.get("result_msg"));
        erp_result.put("result_value", result_value);
        erp_result.put("type_id", post.get("type_id"));
        erp_result.put("icbc_id", post.get("icbc_id"));
        erp_result.put("gems_id", minfo.get("id"));
        erp_result.put("gems_fs_id", minfo.get("fsid"));
        Tools.recAdd(erp_result, "dd_icbc_erp_result");
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
        TtMap selectOnebankLoanERPErp = Tools.recinfo("select * from dd_icbc_erp where id=" + Long.valueOf(post.get("id")) + " and type_id=98");
        if (selectOnebankLoanERPErp == null || selectOnebankLoanERPErp.equals("")){
            Tools.recAdd(bankLoanERP, "dd_icbc_erp");
            Tools.recAdd(bankLoanERPResult, "dd_icbc_erp_result");
        }
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
