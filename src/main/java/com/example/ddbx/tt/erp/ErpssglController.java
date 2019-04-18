package com.example.ddbx.tt.erp;

import com.example.ddbx.tt.data.TtMap;
import com.example.ddbx.tt.tool.DbTools;
import com.example.ddbx.tt.tool.Tools;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ErpssglController {

    @PostMapping(value = "/manager/ssglajaxpost")
    @ResponseBody
    public TtMap ajaxpost(HttpServletRequest request) {
        System.out.println("进入诉讼");
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

        if ("1".equals(post.get("sstype"))) {   //未诉讼
            DbTools dbTools = new DbTools();
            dbTools.recupdate("update loan_overdue_list set type_id=4,type_status=42 where icbc_id="+post.get("icbc_id"));

            map.put("type_id", "4");
            map.put("type_status", "42");
            map.put("remark", "开始诉讼");
            map.put("result_msg", post.get("result_msg"));
            map.put("icbc_id", post.get("icbc_id"));
            Tools.recAdd(map, "loan_overdue_list_result");
        } else if ("2".equals(post.get("sstype"))) {
            DbTools dbTools = new DbTools();
            dbTools.recupdate("update loan_overdue_list set type_id=7,type_status=71 where icbc_id="+post.get("icbc_id"));

            map.put("type_id", "7");
            map.put("type_status", "71");
            map.put("remark", "已诉讼提交进入未核销");
            map.put("result_msg", post.get("result_msg"));
            map.put("icbc_id", post.get("icbc_id"));
            Tools.recAdd(map, "loan_overdue_list_result");
        }






        res.put("msg", msg);
        return res;
    }

}
