package com.example.ddbx.tt.erp;

import com.example.ddbx.tt.data.TtMap;
import com.example.ddbx.tt.tool.Tools;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ErpspmqController {

    /**
     * 添加任务进度
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/manager/spmqajaxpost", method = RequestMethod.POST)
    @ResponseBody
    public TtMap ajaxpost(HttpServletRequest request) {
        System.out.println(request.getParameter("suggest_price")+"+++++");
        TtMap post = Tools.getPostMap(request, true);// 过滤参数，过滤mysql的注入，url参数注入
        String result_msg = Tools.jsonEncode(post);
        TtMap res = new TtMap();
        String msg = "编辑成功";
        long code = 200;
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

        //dd_icbc_erp_result 添加
        TtMap erp_result = new TtMap();
        erp_result.put("qryid", post.get("id"));
        switch (post.get("mq_status")) {
            case "1":
                erp_result.put("later_status", "25");
                erp_result.put("now_status", "24");
                break;
            case "3":
                erp_result.put("later_status", "23");
                erp_result.put("now_status", "24");
                break;
        }
        erp_result.put("result_code", post.get("mq_status"));
        erp_result.put("result_msg", post.get("mq_remark"));
        erp_result.put("result_value", result_msg);
        erp_result.put("type_id", post.get("type_id"));
        erp_result.put("icbc_id", post.get("icbc_id"));
        erp_result.put("gems_id", minfo.get("id"));
        erp_result.put("gems_fs_id", minfo.get("fsid"));
        Tools.recAdd(erp_result, "dd_icbc_erp_result");
        if (post.get("mq_status").equals("1")) {
            TtMap erp_result1 = new TtMap();
            erp_result1.put("qryid", post.get("id"));
            erp_result1.put("later_status", "25");
            erp_result1.put("now_status", "25");
            erp_result1.put("remark", "");
            erp_result1.put("result_code", post.get("mq_status"));
            erp_result1.put("result_msg", post.get("mq_remark"));
            erp_result1.put("result_value", "");
            erp_result1.put("type_id", post.get("type_id"));
            erp_result1.put("icbc_id", post.get("icbc_id"));
            erp_result1.put("gems_id", minfo.get("id"));
            erp_result1.put("gems_fs_id", minfo.get("fsid"));
            Tools.recAdd(erp_result1, "dd_icbc_erp_result");
        }
        //更新dd_icbc_erp表状态
        TtMap erp = new TtMap();
        switch (post.get("mq_status")) {
            case "1":
                erp.put("now_status", "25");
                erp.put("later_status", "25");
                break;
            case "3":
                erp.put("now_status", "24");
                erp.put("later_status", "23");
                break;
        }
        Tools.recEdit(erp, "dd_icbc_erp", Long.valueOf(post.get("id")));
//        //更新icbc状态
//        TtMap icbc_status = new TtMap();
//        switch (post.get("state_code")) {
//            case "1":
//                icbc_status.put("zx_status", "11");
//                break;
//            case "2":
//                icbc_status.put("zx_status", "14");
//                break;
//            case "3":
//                icbc_status.put("zx_status", "12");
//                break;
//        }
//        String status_id = Tools.unDic("dd_icbc_status", post.get("icbc_id"), "id", "icbc_id");
//        Tools.recEdit(icbc_status, "dd_icbc_status", Long.valueOf(status_id));
        System.out.println("post:" + post);
        res.put("code", String.valueOf(code));
        res.put("msg", msg);
        return res;
    }
}
