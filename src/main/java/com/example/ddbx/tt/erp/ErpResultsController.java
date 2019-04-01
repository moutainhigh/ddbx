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
    public static final int LOANMONEY = 1000000;
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
                    DbTools dbTools = new DbTools(); //添加订单状态使用
                    if(post.get("result_code").equals("3")){
                        //添加订单状态 start
                        dbTools.recupdate("update dd_icbc_status set car_loan_status=4 where icbc_id="+post.get("icbc_id"));
                        //添加订单状态 end
                        erp.put("now_status", getOneUserInfoErp.get("later_status"));
                        erp.put("later_status", "32");
                        erp_result.put("now_status",getOneUserInfoErp.get("later_status"));
                        erp_result.put("later_status","32");
                        erp_result.put("remark", "");
                        erp_result.put("result_code", post.get("result_code"));
                        erp_result.put("result_msg", post.get("result_msg"));
                        erp_result.put("result_value", result_value);
                    }else{ //非回退补件
                        //添加订单状态 start
                        if(post.get("result_code").equals("1")){  //过件
                            dbTools.recupdate("update dd_icbc_status set car_loan_status=2 where icbc_id="+post.get("icbc_id"));
                        }else if(post.get("result_code").equals("2")){ //过件附条件
                            dbTools.recupdate("update dd_icbc_status set car_loan_status=3 where icbc_id="+post.get("icbc_id"));
                        }
                        //添加订单状态 end
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
                                        erp.put("now_status", "40");
                                        erp.put("later_status", "40");
                                        erp_result.put("now_status","40");
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
                                    erp.put("now_status", "40");
                                    erp.put("later_status", "40");
                                    erp_result.put("now_status","40");
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
                    case "58": //公司收件确认
                        //if 已收到 & 1通过  进入下一个环节
                        if(post.get("receiptConfirm").equals("已收到") && post.get("materialResult").equals("1")){
                            erp.put("now_status", "58");
                            erp.put("later_status", "59");
                            erp_result.put("now_status","58");
                            erp_result.put("later_status","59");
                        }else{
                            erp.put("now_status", "58");
                            erp.put("later_status", "57");
                            erp_result.put("now_status","58");
                            erp_result.put("later_status","57");
                        }
                        erp_result.put("remark", "");
                        erp_result.put("result_code",post.get("materialResult"));
                        erp_result.put("result_msg", post.get("result_msg"));
                        erp_result.put("result_value", result_value);
                        //当收件确认为"已收到"时,公司归档亮起
                        if(post.get("receiptConfirm").equals("已收到")){
                            TtMap ttMap= Tools.recinfo("select * from dd_icbc_erp where type_id=109 and icbc_id=" + Long.valueOf(post.get("icbc_id")));
                            if(ttMap.get("id")==null || ttMap.get("id").equals("")) {
                                //dd_icbc_erp  add
                                TtMap bankLoanERP = new TtMap();
                                bankLoanERP.put("now_status", "66");
                                bankLoanERP.put("later_status", "67");
                                bankLoanERP.put("type_id", "109");
                                bankLoanERP.put("icbc_id", post.get("icbc_id"));
                                bankLoanERP.put("gems_id", minfo.get("id"));
                                bankLoanERP.put("gems_fs_id", minfo.get("fsid"));
                                bankLoanERP.put("c_name", UserInfoICBC.get("c_name"));
                                bankLoanERP.put("c_tel", UserInfoICBC.get("c_tel"));
                                bankLoanERP.put("c_cardno", UserInfoICBC.get("c_cardno"));
                                bankLoanERP.put("c_carvin", "");
                                bankLoanERP.put("c_carno", "");
                                bankLoanERP.put("adminop_tag", minfo.get("id")); //当前操作人id
                                Long bankLoanERP_Id = Tools.recAdd(bankLoanERP, "dd_icbc_erp");
                                //dd_icbc_erp_result 添加
                                TtMap bankLoanERPResult = new TtMap();
                                bankLoanERPResult.put("qryid",bankLoanERP_Id+"");
                                bankLoanERPResult.put("now_status", "66");
                                bankLoanERPResult.put("later_status", "67");
                                bankLoanERPResult.put("remark", "公司归档亮起");
                                bankLoanERPResult.put("result_code", "0");
                                bankLoanERPResult.put("result_msg", "");
                                bankLoanERPResult.put("result_value", "");
                                bankLoanERPResult.put("type_id", "109");
                                bankLoanERPResult.put("icbc_id", post.get("icbc_id"));
                                bankLoanERPResult.put("gems_id", minfo.get("id"));
                                bankLoanERPResult.put("gems_fs_id", minfo.get("fsid"));
                                Tools.recAdd(bankLoanERPResult, "dd_icbc_erp_result");
                            }
                        }
                        break;
                    case "59": //银行收件确认
                        //if 已收到 & 1通过  进入下一个环节
                        if(post.get("receiptConfirm").equals("已收到") && post.get("materialResult").equals("1")){
                            erp.put("now_status", "59");
                            erp.put("later_status", "60");
                            erp_result.put("now_status","59");
                            erp_result.put("later_status","60");
                        }else{
                            erp.put("now_status", "59");
                            erp.put("later_status", "58");
                            erp_result.put("now_status","59");
                            erp_result.put("later_status","58");
                        }
                        erp_result.put("remark", "");
                        erp_result.put("result_code",post.get("materialResult"));
                        erp_result.put("result_msg", post.get("result_msg"));
                        erp_result.put("result_value", result_value);
                        //当收件确认为"已收到"时,抵押归档亮起
                        if(post.get("receiptConfirm").equals("已收到")){
                            TtMap ttMap= Tools.recinfo("select * from dd_icbc_erp where type_id=116 and icbc_id=" + Long.valueOf(post.get("icbc_id")));
                            if(ttMap.get("id")==null || ttMap.get("id").equals("")){
                                //dd_icbc_erp  add
                                TtMap bankLoanERP = new TtMap();
                                bankLoanERP.put("now_status", "72");
                                bankLoanERP.put("later_status", "73");
                                bankLoanERP.put("type_id", "116");
                                bankLoanERP.put("icbc_id", post.get("icbc_id"));
                                bankLoanERP.put("gems_id", minfo.get("id"));
                                bankLoanERP.put("gems_fs_id", minfo.get("fsid"));
                                bankLoanERP.put("c_name", UserInfoICBC.get("c_name"));
                                bankLoanERP.put("c_tel", UserInfoICBC.get("c_tel"));
                                bankLoanERP.put("c_cardno", UserInfoICBC.get("c_cardno"));
                                bankLoanERP.put("c_carvin", "");
                                bankLoanERP.put("c_carno", "");
                                bankLoanERP.put("adminop_tag",minfo.get("id")); //当前操作人id
                                Long bankLoanERP_Id = Tools.recAdd(bankLoanERP, "dd_icbc_erp");
                                //dd_icbc_erp_result 添加
                                TtMap bankLoanERPResult = new TtMap();
                                bankLoanERPResult.put("qryid",bankLoanERP_Id+"");
                                bankLoanERPResult.put("now_status", "72");
                                bankLoanERPResult.put("later_status", "73");
                                bankLoanERPResult.put("remark","抵押归档亮起");
                                bankLoanERPResult.put("result_code","0");
                                bankLoanERPResult.put("result_msg", "");
                                bankLoanERPResult.put("result_value","");
                                bankLoanERPResult.put("type_id", "116");
                                bankLoanERPResult.put("icbc_id", post.get("icbc_id"));
                                bankLoanERPResult.put("gems_id", minfo.get("id"));
                                bankLoanERPResult.put("gems_fs_id", minfo.get("fsid"));
                                Tools.recAdd(bankLoanERPResult, "dd_icbc_erp_result");
                            }
                        }
                        break;
                    case "60": //银行审批结果
                        //1、通过：往银行放款结果（放款结果中点击“失败”返回上一级）
                        //2、不通过：结束
                        //3、附条件：跳到“补充材料确认”-“材料不完整，需要机构补充”-“补充材料”提交-“补充材料确认”-“完整”-跳回第一步寄送材料
                        //4、先抵押后放贷：选择这个界面暂时不往下级走，等“抵押归档”模块完成开启“银行放款结果”
                        if (post.get("result_code").equals("1")) {
                            erp.put("now_status", "60");
                            erp.put("later_status", "61");
                            erp_result.put("now_status","60");
                            erp_result.put("later_status","61");
                        }else if(post.get("result_code").equals("2")){
                            erp.put("now_status", "60");
                            erp.put("later_status", "65");
                            erp_result.put("now_status","60");
                            erp_result.put("later_status","65");
                        }else if(post.get("result_code").equals("3")){
                            erp.put("now_status", "60");
                            erp.put("later_status", "63");
                            erp_result.put("now_status","60");
                            erp_result.put("later_status","63");
                        }else if(post.get("result_code").equals("4")){
                            //银行审批结果 先抵押后放贷：选择这个界面暂时不往下级走，等“抵押归档”模块完成开启“银行放款结果”
                            //得到  抵押归档完成-小状态
                            TtMap ttMap= Tools.recinfo("select * from dd_icbc_erp_result where type_id=116 and now_status=82 and icbc_id=" + Long.valueOf(post.get("icbc_id")));
                            if(ttMap.get("id")!=null){
                                // “抵押归档”模块完成 , 开启“银行放款结果”
                                erp.put("now_status", "60");
                                erp.put("later_status", "61");
                                erp_result.put("now_status","60");
                                erp_result.put("later_status","61");
                            }else{
                                // “抵押归档”模块 未完成 ,暂时不往下级走
                                erp.put("now_status", "60");
                                erp.put("later_status", "60");
                                erp_result.put("now_status","60");
                                erp_result.put("later_status","60");
                            }
                        }
                        erp_result.put("remark", "");
                        erp_result.put("result_code",post.get("result_code"));
                        erp_result.put("result_msg", post.get("result_msg"));
                        erp_result.put("result_value", result_value);
                        break;
                    case "61": //银行放款结果
                        if(post.get("result_code").equals("1")){ //放款成功  进入下一个状态 收款确认
                            erp.put("now_status", "61");
                            erp.put("later_status", "62");
                            erp_result.put("now_status","61");
                            erp_result.put("later_status","62");
                            /**
                             * 生成客户还款计划
                             * 期数 金额 月还款额 月还日期
                             */

                        }else if(post.get("result_code").equals("2")){ //放款失败 进入上一个状态 银行审批结果
                            erp.put("now_status", "61");
                            erp.put("later_status", "60");
                            erp_result.put("now_status","61");
                            erp_result.put("later_status","60");
                        }
                        erp_result.put("remark", "");
                        erp_result.put("result_code",post.get("result_code"));
                        erp_result.put("result_msg", post.get("result_msg"));
                        erp_result.put("result_value", result_value);
                        //在icbc主表中添加字段
                        TtMap icbcTableUpdate = new TtMap();
                        icbcTableUpdate.put("lending_result",post.get("result_code")); //放款结果
                        icbcTableUpdate.put("lending_money",post.get("yhdksh_61_je")); //放款金额
                        icbcTableUpdate.put("lending_date",post.get("lendingDate")); //放款时间
                        icbcTableUpdate.put("first_month_date",post.get("firstMonthPayDate"));//首月还款日期
                        icbcTableUpdate.put("first_month_money",post.get("yhdksh_61_syhk"));//首月还款金额
                        icbcTableUpdate.put("each_month_money",post.get("yhdksh_61_yh"));//月还
                        icbcTableUpdate.put("lending_bank",post.get("yhdksh_61_zh"));//放款支行
                        icbcTableUpdate.put("adminop_tag",minfo.get("id")); //当前操作人
                        Tools.recEdit(icbcTableUpdate,"dd_icbc", Long.valueOf(post.get("icbc_id")));
                        break;
                    case "62": //收款确认
                        if(post.get("result_code").equals("1")){ // 到账确认，本单已完整  进入下一个状态 完成
                            erp.put("now_status", "62");
                            erp.put("later_status", "65");
                            erp_result.put("now_status","62");
                            erp_result.put("later_status","65");
                            TtMap icbcUpdatePledge = new TtMap();
                            icbcUpdatePledge.put("pledge_result","2"); //抵押归档未完成
                            Tools.recEdit(icbcUpdatePledge,"dd_icbc", Long.valueOf(post.get("icbc_id")));
                        }else if(post.get("result_code").equals("2") || post.get("result_code").equals("3")){ //收款金额不符and未收到款项 进入上一个状态 银行放款结果
                            erp.put("now_status", "62");
                            erp.put("later_status", "61");
                            erp_result.put("now_status","62");
                            erp_result.put("later_status","61");
                        }
                        erp_result.put("remark", "");
                        erp_result.put("result_code",post.get("result_code"));
                        erp_result.put("result_msg", post.get("result_msg"));
                        erp_result.put("result_value", result_value);
                        break;
                    case "63": //补充材料确认
                        if(post.get("result_code").equals("1")){ // 完整  进入下一个状态 完成
                            erp.put("now_status", "63");
                            erp.put("later_status", "65");
                            erp_result.put("now_status","63");
                            erp_result.put("later_status","65");
                        }else if(post.get("result_code").equals("2")){ //材料不完整，需要机构补充
                            erp.put("now_status", "63");
                            erp.put("later_status", "64");
                            erp_result.put("now_status","63");
                            erp_result.put("later_status","64");
                        }
                        erp_result.put("remark", "");
                        erp_result.put("result_code",post.get("result_code"));
                        erp_result.put("result_msg", post.get("result_msg"));
                        erp_result.put("result_value", result_value);
                        break;
                    case "64": //机构补充材料
                        if(post.get("result_code").equals("1")) { // 已补充  进入下一个状态 完成
                            erp.put("now_status", "64");
                            erp.put("later_status", "63");
                            erp_result.put("now_status","64");
                            erp_result.put("later_status","63");
                        }else if(post.get("result_code").equals("2")){ // 未补充   还停留在补充材料阶段
                            erp.put("now_status", "64");
                            erp.put("later_status", "64");
                            erp_result.put("now_status","64");
                            erp_result.put("later_status","64");
                        }
                        erp_result.put("remark", "");
                        erp_result.put("result_code",post.get("result_code"));
                        erp_result.put("result_msg", post.get("result_msg"));
                        erp_result.put("result_value", result_value);
                        break;
                    case "65": //完成就是完成  没有操作
                        erp.put("now_status", "65");
                        erp.put("later_status", "65");
                        erp_result.put("now_status","65");
                        erp_result.put("later_status","65");
                        erp_result.put("remark", "");
                        erp_result.put("result_code",post.get("result_code"));
                        erp_result.put("result_msg", post.get("result_msg"));
                        erp_result.put("result_value", result_value);
                        break;
                }
                break;
            /**
             * 抵押归档
             */
            case "116":
                switch (getOneUserInfoErp.get("later_status")) {
                    case "73"://公证记录
                        erp.put("now_status", "73");
                        erp.put("later_status", "74");
                        erp_result.put("now_status","73");
                        erp_result.put("later_status","74");
                        erp_result.put("remark", "公证记录");
                        erp_result.put("result_code","0");
                        erp_result.put("result_msg", post.get("result_msg"));
                        erp_result.put("result_value", result_value);
                        break;
                    case "74"://抵押材料寄送至合作商
                        erp.put("now_status", "74");
                        erp.put("later_status", "75");
                        erp_result.put("now_status","74");
                        erp_result.put("later_status","75");
                        erp_result.put("remark", "");
                        erp_result.put("result_code","0");
                        erp_result.put("result_msg", post.get("result_msg"));
                        erp_result.put("result_value", result_value);
                        break;
                    case "75"://合作商收件确认
                        if(post.get("receiptConfirm").equals("已收到") && post.get("materialResult").equals("1")){
                            erp.put("now_status", "75");
                            erp.put("later_status", "76");
                            erp_result.put("now_status","75");
                            erp_result.put("later_status","76");
                        }else{
                            erp.put("now_status", "75");
                            erp.put("later_status", "74");
                            erp_result.put("now_status","57");
                            erp_result.put("later_status","74");
                        }
                        erp_result.put("remark", "");
                        erp_result.put("result_code",post.get("materialResult"));
                        erp_result.put("result_msg", post.get("result_msg"));
                        erp_result.put("result_value", result_value);
                        break;
                    case "76"://抵押情况记录
                        if(post.get("examineCondition").equals("1")){ // 抵押 抵押查验情况 通过  进入下一步 抵押材料寄回
                            erp.put("now_status", "76");
                            erp.put("later_status", "77");
                            erp_result.put("now_status","76");
                            erp_result.put("later_status","77");
                        }else if(post.get("examineCondition").equals("2")){ // 抵押 抵押查验情况 不通过  进入上一步 合作商收件确认
                            erp.put("now_status", "76");
                            erp.put("later_status", "75");
                            erp_result.put("now_status","76");
                            erp_result.put("later_status","75");
                        }
                        erp_result.put("remark", "");
                        erp_result.put("result_code",post.get("examineCondition"));
                        erp_result.put("result_msg", post.get("result_msg"));
                        erp_result.put("result_value", result_value);
                        break;
                    case "77"://抵押材料寄回
                        erp.put("now_status", "77");
                        erp.put("later_status", "78");
                        erp_result.put("now_status","77");
                        erp_result.put("later_status","78");
                        erp_result.put("remark", "");
                        erp_result.put("result_code",post.get("examineCondition"));
                        erp_result.put("result_msg", post.get("result_msg"));
                        erp_result.put("result_value", result_value);
                        break;
                    case "78"://审核收件确认
                        if(post.get("receiptConfirm").equals("已收到") && post.get("materialResult").equals("1")){
                            erp.put("now_status", "78");
                            erp.put("later_status", "79");
                            erp_result.put("now_status","78");
                            erp_result.put("later_status","79");
                        }else{
                            erp.put("now_status", "78");
                            erp.put("later_status", "77");
                            erp_result.put("now_status","78");
                            erp_result.put("later_status","77");
                        }
                        erp_result.put("remark", "");
                        erp_result.put("result_code",post.get("materialResult"));
                        erp_result.put("result_msg", post.get("result_msg"));
                        erp_result.put("result_value", result_value);
                        break;
                    case "79"://抵押材料至银行
                        erp.put("now_status", "79");
                        erp.put("later_status", "80");
                        erp_result.put("now_status","79");
                        erp_result.put("later_status","80");
                        erp_result.put("remark", "");
                        erp_result.put("result_code",post.get("examineCondition"));
                        erp_result.put("result_msg", post.get("result_msg"));
                        erp_result.put("result_value", result_value);
                        break;
                    case "80"://银行收件确认
                        if(post.get("receiptConfirm").equals("已收到") && post.get("materialResult").equals("1")){
                            erp.put("now_status", "80");
                            erp.put("later_status", "81");
                            erp_result.put("now_status","80");
                            erp_result.put("later_status","81");
                        }else{
                            erp.put("now_status", "80");
                            erp.put("later_status", "79");
                            erp_result.put("now_status","80");
                            erp_result.put("later_status","79");
                        }
                        erp_result.put("remark", "");
                        erp_result.put("result_code",post.get("materialResult"));
                        erp_result.put("result_msg", post.get("result_msg"));
                        erp_result.put("result_value", result_value);
                        break;
                    case "81"://录入银行查验情况
                        if(post.get("examineCondition").equals("1")){ // 抵押 抵押查验情况 通过  进入下一步 抵押材料寄回
                            erp.put("now_status", "81");
                            erp.put("later_status", "82");
                            erp_result.put("now_status","81");
                            erp_result.put("later_status","82");
                            //update erp set later_status:60改61 where icbc_id and type_id 98
                            //98银行审批结果 : 先抵押后放贷：选择这个界面暂时不往下级走，等“抵押归档”模块完成开启“银行放款结果”
                            boolean falg = Tools.recexec("update dd_icbc_erp set later_status='61' where later_status='60' and type_id='98' and icbc_id="+post.get("icbc_id"));
                            System.err.println(falg+"--先抵押后放贷2222222222");
                        }else if(post.get("examineCondition").equals("2")){ // 抵押 抵押查验情况 不通过  进入上一步 合作商收件确认
                            erp.put("now_status", "81");
                            erp.put("later_status", "80");
                            erp_result.put("now_status","81");
                            erp_result.put("later_status","80");
                        }
                        erp_result.put("remark", "");
                        erp_result.put("result_code",post.get("examineCondition"));
                        erp_result.put("result_msg", post.get("result_msg"));
                        erp_result.put("result_value", result_value);
                        break;
                }
                break;
            /**
             * 某某某某
             */
            case "777":
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
        //添加完成状态
        //汽车贷款start 如果【总监审核过件或者过件附条件】 或者 【对应贷款金额审核过件完成的】 就添加汽车贷款 完成 状态数据
        if(erp.get("later_status")!=null && !erp.get("later_status").equals("")){
            if(erp.get("later_status").equals("40")){ //当完成的时候
                //更新dd_icbc_erp表
                TtMap bankLoanERPEnd = new TtMap();
                //                bankLoanERPEnd.put("now_status", "40");
                //                bankLoanERPEnd.put("later_status", "40");
                Tools.recEdit(bankLoanERPEnd,"dd_icbc_erp",Long.valueOf(post.get("id")));
                //result添加完成状态
                addEnd(post, minfo,"40","40");
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
            //添加 银行贷款 完成 状态
            if(erp.get("later_status").equals("65")){
                addEnd(post,minfo,"65","65");
            }
            //添加 抵押归档 完成 状态
            if(erp.get("later_status").equals("82")){
                addEnd(post,minfo,"82","82");
                //在icbc主表中添加字段
                TtMap icbcTableUpdate = new TtMap();
                icbcTableUpdate.put("pledge_result","1"); //抵押归档完成
                Tools.recEdit(icbcTableUpdate,"dd_icbc", Long.valueOf(post.get("icbc_id")));
            }
        }
        //汽车贷款end
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        System.out.println("post:" + post);
        res.put("code",String.valueOf(code));
        res.put("msg", msg);
        return res;
    }
    //result 添加完成状态
    private void addEnd(TtMap post, TtMap minfo,String now_status,String later_status) {
        //dd_icbc_erp_result 添加
        TtMap bankLoanERPResultEnd = new TtMap();
        bankLoanERPResultEnd.put("qryid",post.get("id"));
        bankLoanERPResultEnd.put("now_status", now_status);
        bankLoanERPResultEnd.put("later_status", later_status);
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
    }

    //-----提取方法 start----------------------------------------------------------------------------------
    //银行贷款亮起
    private void CarLoanTobankLoanERP(TtMap post, TtMap bankLoanERP, TtMap bankLoanERPResult) {
        //查询银行贷款板块是否添加   if_no_add
        TtMap selectOnebankLoanERPErp = Tools.recinfo("select * from dd_icbc_erp where icbc_id=" + Long.valueOf(post.get("icbc_id")) + " and type_id=198");
        //        if (selectOnebankLoanERPErp == null || selectOnebankLoanERPErp.equals("")){
        Long getERPId = Tools.recAdd(bankLoanERP, "dd_icbc_erp");
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