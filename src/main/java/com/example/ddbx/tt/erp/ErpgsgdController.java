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
public class ErpgsgdController {

    /**
     * 添加任务进度
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/manager/gsgd67ajaxpost", method = RequestMethod.POST)
    @ResponseBody
    public TtMap ajaxpost(HttpServletRequest request) {
        TtMap post = Tools.getPostMap(request, true);// 过滤参数，过滤mysql的注入，url参数注入
        System.out.println("***"+post);
        String result_msg = Tools.jsonEncode(post);
        TtMap res = new TtMap();
        String msg = "进入材料复核";
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

        // 其他表添加数据
        long qryid = 0;

        if (post.get("result_1_code").equals("1")){//材料复核结果通过
            System.out.println("材料复核结果通过");
            TtMap ttMap = new TtMap();
            ttMap.put("type_id", post.get("type_id"));
            ttMap.put("later_status", "70");
            ttMap.put("now_status", "68");
            qryid = Tools.recEdit(ttMap, "dd_icbc_erp", Long.valueOf(post.get("id")));

            //dd_icbc_erp_result 添加
            TtMap erp_result = new TtMap();
            erp_result.put("qryid", post.get("id"));
            erp_result.put("later_status", "68");       //材料复核结果---纸质归档
            erp_result.put("now_status", "67");
            erp_result.put("result_code", post.get("result_1_code"));
            erp_result.put("result_value", result_msg);
            erp_result.put("result_msg", post.get("result_1_msg"));
            erp_result.put("type_id", post.get("type_id"));
            erp_result.put("icbc_id", post.get("icbc_id"));
            erp_result.put("gems_id", minfo.get("id"));
            erp_result.put("gems_fs_id", minfo.get("fsid"));
            Tools.recAdd(erp_result, "dd_icbc_erp_result");

            //dd_icbc_erp_result 添加
            TtMap erp_result2 = new TtMap();
            erp_result2.put("qryid", post.get("id"));
            erp_result2.put("later_status", "70");       //纸质归档---行政入库
            erp_result2.put("now_status", "68");
            erp_result.put("result_code", post.get("result_1_code"));
            erp_result.put("result_value", result_msg);
            erp_result2.put("type_id", post.get("type_id"));
            erp_result2.put("icbc_id", post.get("icbc_id"));
            erp_result2.put("gems_id", minfo.get("id"));
            erp_result2.put("gems_fs_id", minfo.get("fsid"));
            Tools.recAdd(erp_result2, "dd_icbc_erp_result");

        } else {    //材料复核结果不通过
            System.out.println("材料复核结果不通过");
            System.out.println("//////"+post);
            TtMap ttMap = new TtMap();
            ttMap.put("type_id", post.get("type_id"));
            ttMap.put("later_status", "69");
            ttMap.put("now_status", "67");
            qryid = Tools.recEdit(ttMap, "dd_icbc_erp", Long.valueOf(post.get("id")));

            //dd_icbc_erp_result 添加
            TtMap erp_result = new TtMap();
            erp_result.put("qryid", post.get("id"));
            erp_result.put("later_status", "69");       //材料复核结果---纸质归档
            erp_result.put("now_status", "67");
            erp_result.put("result_code", post.get("result_1_code"));
            erp_result.put("result_value", result_msg);
            erp_result.put("result_msg", post.get("result_1_msg"));
            erp_result.put("type_id", post.get("type_id"));
            erp_result.put("icbc_id", post.get("icbc_id"));
            erp_result.put("gems_id", minfo.get("id"));
            erp_result.put("gems_fs_id", minfo.get("fsid"));
            Tools.recAdd(erp_result, "dd_icbc_erp_result");

        }

        res.put("code", String.valueOf(code));
        res.put("msg", msg);
        return res;
    }


    @RequestMapping(value = "/manager/gsgd69ajaxpost", method = RequestMethod.POST)
    @ResponseBody
    public TtMap ajaxpost1(HttpServletRequest request) {
        TtMap post = Tools.getPostMap(request, true);// 过滤参数，过滤mysql的注入，url参数注入
        System.out.println("***"+post);
        String result_msg = Tools.jsonEncode(post);
        TtMap res = new TtMap();
        String msg = "审核员补材料";
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

            TtMap ttMap = new TtMap();
            ttMap.put("type_id", post.get("type_id"));
            ttMap.put("later_status", "67");
            ttMap.put("now_status", "69");
            Tools.recEdit(ttMap, "dd_icbc_erp", Long.valueOf(post.get("id")));

            //dd_icbc_erp_result 添加
            TtMap erp_result = new TtMap();
            erp_result.put("qryid", post.get("id"));
            erp_result.put("later_status", "67");       //审核员补材料---公司纸质归档
            erp_result.put("now_status", "69");
            erp_result.put("result_value", result_msg);
            erp_result.put("result_msg", post.get("result_1_msg"));
            erp_result.put("type_id", post.get("type_id"));
            erp_result.put("icbc_id", post.get("icbc_id"));
            erp_result.put("gems_id", minfo.get("id"));
            erp_result.put("gems_fs_id", minfo.get("fsid"));
            Tools.recAdd(erp_result, "dd_icbc_erp_result");

        res.put("code", String.valueOf(code));
        res.put("msg", msg);
        return res;
    }


    @RequestMapping(value = "/manager/gsgd70ajaxpost", method = RequestMethod.POST)
    @ResponseBody
    public TtMap ajaxpost2(HttpServletRequest request) {
        TtMap post = Tools.getPostMap(request, true);// 过滤参数，过滤mysql的注入，url参数注入
        System.out.println("***"+post);
        String result_msg = Tools.jsonEncode(post);
        TtMap res = new TtMap();
        String msg = "行政入库审核";
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

        // 其他表添加数据
        long qryid = 0;

        if (post.get("result_1_code").equals("1")){//行政入库审核通过
            System.out.println("行政入库审核通过");
            TtMap ttMap = new TtMap();
            ttMap.put("type_id", post.get("type_id"));
            ttMap.put("later_status", "71");
            ttMap.put("now_status", "71");
            qryid = Tools.recEdit(ttMap, "dd_icbc_erp", Long.valueOf(post.get("id")));

            //dd_icbc_erp_result 添加
            TtMap erp_result = new TtMap();
            erp_result.put("qryid", post.get("id"));
            erp_result.put("later_status", "71");       //行政入库---完成
            erp_result.put("now_status", "70");
            erp_result.put("result_code", post.get("result_1_code"));
            erp_result.put("result_value", result_msg);
            erp_result.put("result_msg", post.get("result_1_msg"));
            erp_result.put("type_id", post.get("type_id"));
            erp_result.put("icbc_id", post.get("icbc_id"));
            erp_result.put("gems_id", minfo.get("id"));
            erp_result.put("gems_fs_id", minfo.get("fsid"));
            Tools.recAdd(erp_result, "dd_icbc_erp_result");

            //dd_icbc_erp_result 添加
            TtMap erp_result2 = new TtMap();
            erp_result2.put("qryid",post.get("id"));
            erp_result2.put("later_status", "71");       //行政入库---完成
            erp_result2.put("now_status", "71");
            erp_result.put("result_code", post.get("result_1_code"));
            erp_result.put("result_value", result_msg);
            erp_result2.put("type_id", post.get("type_id"));
            erp_result2.put("icbc_id", post.get("icbc_id"));
            erp_result2.put("gems_id", minfo.get("id"));
            erp_result2.put("gems_fs_id", minfo.get("fsid"));
            Tools.recAdd(erp_result2, "dd_icbc_erp_result");

        } else {    //行政入库审核不通过
            System.out.println("行政入库审核不通过");
            TtMap ttMap = new TtMap();
            ttMap.put("type_id", post.get("type_id"));
            ttMap.put("later_status", "67");
            ttMap.put("now_status", "70");
            qryid = Tools.recEdit(ttMap, "dd_icbc_erp", Long.valueOf(post.get("id")));

            //dd_icbc_erp_result 添加
            TtMap erp_result = new TtMap();
            erp_result.put("qryid", post.get("id"));
            erp_result.put("later_status", "67");       //行政入库---公司纸质归档
            erp_result.put("now_status", "70");
            erp_result.put("result_code", post.get("result_1_code"));
            erp_result.put("result_value", result_msg);
            erp_result.put("result_msg", post.get("result_1_msg"));
            erp_result.put("type_id", post.get("type_id"));
            erp_result.put("icbc_id", post.get("icbc_id"));
            erp_result.put("gems_id", minfo.get("id"));
            erp_result.put("gems_fs_id", minfo.get("fsid"));
            Tools.recAdd(erp_result, "dd_icbc_erp_result");
        }

        res.put("code", String.valueOf(code));
        res.put("msg", msg);
        return res;
    }
}
