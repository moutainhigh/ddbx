package com.example.ddbx.tt.erp;

import com.example.ddbx.tt.data.TtMap;
import com.example.ddbx.tt.tool.DbTools;
import com.example.ddbx.tt.tool.Tools;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ErptdtfController {

    /**
     * 添加任务进度
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/manager/tdtfajaxpost", method = RequestMethod.POST)
    @ResponseBody
    public TtMap ajaxpost(HttpServletRequest request) {
        System.out.println(request.getParameter("suggest_price")+"+++++");
        TtMap post = Tools.getPostMap(request, true);// 过滤参数，过滤mysql的注入，url参数注入
        String result_msg = Tools.jsonEncode(post);
        TtMap res = new TtMap();
        String msg = "申请代偿成功";
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


        DbTools myDbTools = new DbTools();
        String sql="select id,gems_fs_id,gems_id,order_code,c_name,c_tel,c_cardno from dd_icbc where id="+post.get("icbc_id");
        TtMap ontCustomer = null;
        try {
            ontCustomer = myDbTools.recinfo(sql);
        }catch (Exception e) {
            Tools.logError(e.getMessage(), true, false);
        }finally {
            myDbTools.closeConn();
        }

        // 其他表添加数据
        long qryid = 0;

        TtMap ttMap = new TtMap();
        ttMap.put("type_id", post.get("type_id"));
        ttMap.put("later_status", "89");
        ttMap.put("now_status", "88");
        qryid = Tools.recEdit(ttMap, "dd_icbc_erp", Long.valueOf(post.get("id")));


        //dd_icbc_erp_result 添加
        TtMap erp_result = new TtMap();
        erp_result.put("qryid", qryid+"");
        erp_result.put("later_status", "88");
        erp_result.put("now_status", "87");
        erp_result.put("remark", post.get("result_1_msg"));
//        erp_result.put("result_code", post.get("state_code"));
        erp_result.put("result_msg", "");
//        erp_result.put("result_value", result_msg);
        erp_result.put("type_id", post.get("type_id"));
        erp_result.put("icbc_id", post.get("icbc_id"));
        erp_result.put("gems_id", minfo.get("id"));
        erp_result.put("gems_fs_id", minfo.get("fsid"));
        Tools.recAdd(erp_result, "dd_icbc_erp_result");

        //dd_icbc_erp_result 添加
        TtMap erp_result2 = new TtMap();
        erp_result2.put("qryid", qryid+"");
        erp_result2.put("later_status", "89");
        erp_result2.put("now_status", "88");
        erp_result2.put("remark", post.get("result_1_msg"));
//        erp_result2.put("result_code", post.get("state_code"));
        erp_result2.put("result_msg", "");
//        erp_result2.put("result_value", result_msg);
        erp_result2.put("type_id", post.get("type_id"));
        erp_result2.put("icbc_id", post.get("icbc_id"));
        erp_result2.put("gems_id", minfo.get("id"));
        erp_result2.put("gems_fs_id", minfo.get("fsid"));
        Tools.recAdd(erp_result2, "dd_icbc_erp_result");


        System.out.println("post:" + post);
        res.put("code", String.valueOf(code));
        res.put("msg", msg);
        return res;
    }
}
