package com.example.ddbx.tt.erp;

import com.example.ddbx.tt.data.TtMap;
import com.example.ddbx.tt.tool.DbTools;
import com.example.ddbx.tt.tool.Tools;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ErphxglController {

    @PostMapping(value = "/manager/hxglajaxpost")
    @ResponseBody
    public TtMap ajaxpost(HttpServletRequest request) {
        System.out.println("进入核销");
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
        switch (post.get("hxtype")) {
            case "1":   //未核销的信息录入提交
                DbTools dbTools1 = new DbTools();
                dbTools1.recupdate("update loan_overdue_list set type_id=7,type_status=72 where icbc_id="+post.get("icbc_id"));

                map.put("type_id", "7");
                map.put("type_status", "72");
                map.put("remark", "未核销页进行信息录入栏提交");
                Tools.recAdd(map, "loan_overdue_list_result");
            break;
            case "2": //已核销的信息录入提交
                String coolStatus = post.get("coolStatus"); //获取处置结果
                DbTools dbTools = new DbTools();
                dbTools.recupdate("update loan_overdue_list set type_id=6,type_status=" +coolStatus+ " where icbc_id="+post.get("icbc_id"));
                if ("61".equals(coolStatus)) {  //正常结清

                    map.put("type_id", "6");
                    map.put("type_status", "61");
                    map.put("remark", "已核销页进行信息录入栏提交");
                    Tools.recAdd(map, "loan_overdue_list_result");
                } else if ("62".equals(coolStatus)) { //提前结清

                    map.put("type_id", "6");
                    map.put("type_status", "62");
                    map.put("remark", "已核销页进行信息录入栏提交");
                    Tools.recAdd(map, "loan_overdue_list_result");
                }  else if ("63".equals(coolStatus)) { //强制结清

                    map.put("type_id", "6");
                    map.put("type_status", "63");
                    map.put("remark", "已核销页进行信息录入栏提交");
                    Tools.recAdd(map, "loan_overdue_list_result");
                } else if ("64".equals(coolStatus)) { //亏损结清

                    map.put("type_id", "6");
                    map.put("type_status", "64");
                    map.put("remark", "已核销页进行信息录入栏提交");
                    Tools.recAdd(map, "loan_overdue_list_result");
                }
            break;
        }

        res.put("msg", msg);
        return res;
    }

}
