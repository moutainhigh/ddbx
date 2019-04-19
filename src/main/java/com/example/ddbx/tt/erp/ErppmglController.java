package com.example.ddbx.tt.erp;

import com.example.ddbx.tt.data.TtMap;
import com.example.ddbx.tt.tool.DbTools;
import com.example.ddbx.tt.tool.Tools;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ErppmglController {

    @PostMapping(value = "/manager/pmglajaxpost")
    @ResponseBody
    public TtMap ajaxpost(HttpServletRequest request) {
        System.out.println("进入拍卖");
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

        TtMap map = new TtMap();
        map.put("qryid", post.get("lolId"));
        map.put("mid_add", minfo.get("id"));
        map.put("mid_edit", minfo.get("id"));
        map.put("dt_add", LoanImportExcelController.Getnow());
        map.put("dt_edit", LoanImportExcelController.Getnow());
        map.put("result_msg", post.get("result_msg"));
        map.put("icbc_id", post.get("icbc_id"));
        switch (post.get("pmtype")) {
            case "1":   //未拍卖的信息录入提交
                String coolStatus = post.get("coolStatus"); //获取处置结果
                if ("53".equals(coolStatus)) {  //盈利(拍卖完成)
                    DbTools dbTools = new DbTools();
                    dbTools.recupdate("update loan_overdue_list set type_id=5,type_status=53 where icbc_id="+post.get("icbc_id"));

                    map.put("type_id", "5");
                    map.put("type_status", "53");
                    map.put("remark", "未拍卖页进行信息录入栏提交");
                    Tools.recAdd(map, "loan_overdue_list_result");
                } else if ("41".equals(coolStatus)) { //亏损>6000(拍卖完成)[进入诉讼]
                    DbTools dbTools = new DbTools();
                    dbTools.recupdate("update loan_overdue_list set type_id=4,type_status=" +coolStatus+ " where icbc_id="+post.get("icbc_id"));

                    map.put("type_id", "5");
                    map.put("type_status", "52");
                    map.put("remark", "亏损进入诉讼");
                    Tools.recAdd(map, "loan_overdue_list_result");

                    map.put("type_id", "4");
                    map.put("type_status", "41");
                    map.put("remark", "未拍卖页进行信息录入栏提交");
                    Tools.recAdd(map, "loan_overdue_list_result");
                }  else if ("71".equals(coolStatus)) { //亏损<6000(拍卖完成)[进入未核销]
                    DbTools dbTools = new DbTools();
                    dbTools.recupdate("update loan_overdue_list set type_id=7,type_status=" +coolStatus+ " where icbc_id="+post.get("icbc_id"));

                    map.put("type_id", "5");
                    map.put("type_status", "52");
                    map.put("remark", "亏损进入核销");
                    Tools.recAdd(map, "loan_overdue_list_result");

                    map.put("type_id", "7");
                    map.put("type_status", "71");
                    map.put("remark", "未拍卖页进行信息录入栏提交");
                    Tools.recAdd(map, "loan_overdue_list_result");
                }
                break;
            case "2": //亏损(拍卖完成)的信息录入提交

            break;

            case "3":   //盈利(拍卖完成)的信息录入提交
                DbTools dbTools = new DbTools();    //进入未核销
                dbTools.recupdate("update loan_overdue_list set type_id=7,type_status=71 where icbc_id="+post.get("icbc_id"));

                map.put("type_id", "7");
                map.put("type_status", "71");
                map.put("remark", "盈利(拍卖完成)进行信息录入栏提交");
                Tools.recAdd(map, "loan_overdue_list_result");
            break;
        }

        res.put("msg", msg);
        return res;
    }

}
