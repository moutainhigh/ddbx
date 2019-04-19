package com.example.ddbx.tt.erp;

import com.example.ddbx.tt.data.TtMap;
import com.example.ddbx.tt.tool.DbTools;
import com.example.ddbx.tt.tool.Tools;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ErpdcglController {

    @PostMapping(value = "/manager/jrdcajaxpost")
    @ResponseBody
    public TtMap ajaxpost(HttpServletRequest request) {
        System.out.println("进入电催");
        TtMap post = Tools.getPostMap(request, true);// 过滤参数，过滤mysql的注入，url参数注入
        System.out.println("参数列表为:" + post);
        TtMap res = new TtMap();
        String msg = "编辑成功";
        TtMap minfo = Tools.minfo();//当前登录用户信息
        System.out.println("minfo：" + minfo);
        //dd_icbc更新
        TtMap icbc = new TtMap();
        if (post.get("icbc_id") != null && !post.get("icbc_id").equals("")) {
            Tools.recEdit(icbc, "dd_icbc", Long.valueOf(post.get("icbc_id")));
        } else {
            res.put("code", "201");
            res.put("msg", "系统错误，请返回重试！");
            return res;
        }
        switch (post.get("dctype_id")){

            case "1":
                DbTools dbTools = new DbTools();//客户逾期名单手动进入电催
                dbTools.recupdate("update loan_overdue_list set type_id=2,type_status=0 where icbc_id="+post.get("icbc_id"));

                String sql = "select * from loan_overdue_list where icbc_id = " + post.get("icbc_id");
                TtMap recinfo = Tools.recinfo(sql);     //查询loan_overdue_list信息

                TtMap map = new TtMap();
                map.put("qryid", recinfo.get("id"));
                map.put("mid_add", minfo.get("id"));
                map.put("mid_edit", minfo.get("id"));
                map.put("dt_add", LoanImportExcelController.Getnow());
                map.put("dt_edit", LoanImportExcelController.Getnow());
                map.put("type_id", "2");
                map.put("remark", "手动进入电催");
                map.put("result_msg", "手动点击,逾期客户进入电催");
                map.put("icbc_id", recinfo.get("icbc_id"));
                Tools.recAdd(map, "loan_overdue_list_result");
            break;
            case "2":                       //电催录入栏
                TtMap map1 = new TtMap();
                map1.put("qryid", post.get("lolId"));
                map1.put("mid_add", minfo.get("id"));
                map1.put("mid_edit", minfo.get("id"));
                map1.put("dt_add", LoanImportExcelController.Getnow());
                map1.put("dt_edit", LoanImportExcelController.Getnow());
                map1.put("type_id", post.get("type_id"));
                map1.put("remark", "用户提交电催录入栏");
                map1.put("result_msg", post.get("result_msg"));
                map1.put("icbc_id", post.get("icbc_id"));
                Tools.recAdd(map1, "loan_overdue_list_result");
            break;
            case "3":           //申请拖车||诉讼
                DbTools dbTools1 = new DbTools();
                dbTools1.recupdate("update loan_overdue_list set type_id=" + post.get("type_id") + ",type_status=" + post.get("type_status") + " where icbc_id=" + post.get("icbc_id"));

                TtMap map2 = new TtMap();
                map2.put("qryid", post.get("lolId"));
                map2.put("mid_add", minfo.get("id"));
                map2.put("mid_edit", minfo.get("id"));
                map2.put("dt_add", LoanImportExcelController.Getnow());
                map2.put("dt_edit", LoanImportExcelController.Getnow());
                map2.put("type_id", post.get("type_id"));
                map2.put("type_status", post.get("type_status"));
                map2.put("remark", post.get("result_msg"));
                map2.put("result_msg", post.get("result_msg"));
                map2.put("icbc_id", post.get("icbc_id"));
                Tools.recAdd(map2, "loan_overdue_list_result");
                break;
            case "4":           //拖车信息录入栏提交
                DbTools dbTools2 = new DbTools();
                TtMap map3 = new TtMap();
                map3.put("qryid", post.get("lolId"));
                map3.put("mid_add", minfo.get("id"));
                map3.put("mid_edit", minfo.get("id"));
                map3.put("dt_add", LoanImportExcelController.Getnow());
                map3.put("dt_edit", LoanImportExcelController.Getnow());
                map3.put("icbc_id", post.get("icbc_id"));
                if (post.get("tctype").equals("1")){        //拖车未受理信息录入提交
                    dbTools2.recupdate("update loan_overdue_list set type_status=32 where icbc_id=" + post.get("icbc_id"));

                    map3.put("type_id", post.get("type_id"));
                    map3.put("type_status", "32");
                    map3.put("remark", "拖车(未受理)信息录入栏提交");
                    map3.put("result_msg", post.get("result_msg"));
                    Tools.recAdd(map3, "loan_overdue_list_result");

                } else if(post.get("tctype").equals("2")){  //拖车已受理信息录入提交
                    String coolStatus = post.get("coolStatus");     //拖车结果  33:完成 34:失败
                    dbTools2.recupdate("update loan_overdue_list set type_id=7,type_status=71 where icbc_id=" + post.get("icbc_id"));

                    map3.put("type_id", "3");
                    map3.put("type_status", coolStatus);
                    map3.put("remark", "拖车(已受理)信息录入栏提交");
                    map3.put("result_msg", post.get("result_msg"));
                    Tools.recAdd(map3, "loan_overdue_list_result");

                    map3.put("type_id", "7");
                    map3.put("type_status", "71");
                    map3.put("remark", "拖车失败进入未核销");
                    map3.put("result_msg", "拖车失败进入未核销");
                    Tools.recAdd(map3, "loan_overdue_list_result");

                } else if(post.get("tctype").equals("3")) {  //拖车完成信息录入提交
                    String coolStatus = post.get("coolStatus");     //拖车结果  51:拍卖 63:强制结清
                    if (coolStatus.equals("51")){
                        dbTools2.recupdate("update loan_overdue_list set type_id=5,type_status=" + coolStatus + " where icbc_id=" + post.get("icbc_id"));
                        map3.put("type_id", "5");
                    } else {
                        dbTools2.recupdate("update loan_overdue_list set type_id=6,type_status=" + coolStatus + " where icbc_id=" + post.get("icbc_id"));
                        map3.put("type_id", "6");
                    }

                    map3.put("type_status", coolStatus);
                    map3.put("remark", "拖车(完成)信息录入栏提交");
                    map3.put("result_msg", post.get("result_msg"));
                    Tools.recAdd(map3, "loan_overdue_list_result");
                } else if(post.get("tctype").equals("4")) {  //拖车失败信息录入提交

                    map3.put("type_id", post.get("type_id"));
                    map3.put("type_status", "34");
                    map3.put("remark", "拖车(失败)信息录入栏提交");
                    map3.put("result_msg", post.get("result_msg"));
                    Tools.recAdd(map3, "loan_overdue_list_result");
                }

            break;
            default:

            break;
        }



        res.put("msg", msg);
        return res;
    }

}
