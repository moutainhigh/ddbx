package com.example.ddbx.tt.erp;

import com.example.ddbx.tt.data.TtMap;
import com.example.ddbx.tt.tool.Tools;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.tools.Tool;
import java.util.HashMap;
import java.util.Map;

/**
 * erp 相关操作
 */
@Controller
public class erpController {

    /**
     * erp 弹窗框体url返回
     * @return
     */
    @RequestMapping(value = "/manager/erpmodal", method = RequestMethod.GET)
    public String erpmodal(HttpServletRequest request){
        TtMap post = Tools.getPostMap(request, true);// 过滤参数，过滤mysql的注入，url参数注入
        return "jsp/manager/rwcl/"+post.get("cn")+"."+post.get("sdo")+".jsp";
    }

    /**
     * 添加任务进度
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/manager/ajaxpost", method = RequestMethod.POST)
    @ResponseBody
    public TtMap ajaxpost(HttpServletRequest request) {
        TtMap post = Tools.getPostMap(request, true);// 过滤参数，过滤mysql的注入，url参数注入
        String msg = "编辑成功";
        long code = 200;
        TtMap minfo = Tools.minfo();//当前登录用户信息
        System.out.println("minfo：" + minfo);
        TtMap res = new TtMap();
        //更新dd_icbc_erp表状态
        TtMap erp = new TtMap();
        erp.put("icbc_id",post.get("icbc_id"));
        erp.put("gems_id",minfo.get("id"));
        erp.put("gems_fs_id",minfo.get("fsid"));
        erp.put("type_id",post.get("type_id"));
        //添加 erp_result
        TtMap erp_result = new TtMap();
        erp_result.put("qryid",post.get("id"));
        erp_result.put("type_id",post.get("type_id"));
        erp_result.put("icbc_id",post.get("icbc_id"));
        erp_result.put("gems_id",minfo.get("id"));
        erp_result.put("gems_fs_id",minfo.get("fsid"));
        //查询主订单信息
        TtMap icbcMap=Tools.recinfo("select * from dd_icbc where id="+post.get("icbc_id"));
        //查询 dd_icbc_status id
        TtMap icbc_status = new TtMap();
        String status_id = Tools.unDic("dd_icbc_status", post.get("icbc_id"), "id", "icbc_id");
        //添加节点完成数据
        TtMap erp_result_end = new TtMap();
//            erp_result1.put("remark", "");
//            erp_result1.put("result_code", "");
//            erp_result1.put("result_msg", "");
//            erp_result1.put("result_value","");
        erp_result_end.put("qryid", post.get("id"));
        erp_result_end.put("type_id", post.get("type_id"));
        erp_result_end.put("icbc_id", post.get("icbc_id"));
        erp_result_end.put("gems_id", minfo.get("id"));
        erp_result_end.put("gems_fs_id", minfo.get("fsid"));

        switch (post.get("type")) {
            case "1"://征信审核结果
                //dd_icbc更新
                TtMap icbc = new TtMap();
                if (post.get("zdr_zx1_result") != null && !post.get("zdr_zx1_result").equals("")) {
                    icbc.put("zdr_zx1_result", post.get("zdr_zx1_result"));
                    icbc.put("zdr_zx1_query_time", Tools.dateToStrLong(null));
                    icbc.put("zdr_zx1_result_time", Tools.dateToStrLong(null));
                }
                if (post.get("gjr1_zx1_result") != null && !post.get("gjr1_zx1_result").equals("")) {
                    icbc.put("gjr1_zx1_result", post.get("gjr1_zx1_result"));
                    icbc.put("gjr1_zx1_query_time", Tools.dateToStrLong(null));
                    icbc.put("gjr1_zx1_result_time", Tools.dateToStrLong(null));
                }
                if (post.get("gjr2_zx1_result") != null && !post.get("gjr2_zx1_result").equals("")) {
                    icbc.put("gjr2_zx1_result", post.get("gjr2_zx1_result"));
                    icbc.put("gjr2_zx1_query_time", Tools.dateToStrLong(null));
                    icbc.put("gjr2_zx1_result_time", Tools.dateToStrLong(null));
                }
                if (post.get("zdrpo_zx1_result") != null && !post.get("zdrpo_zx1_result").equals("")) {
                    icbc.put("zdrpo_zx1_result", post.get("zdrpo_zx1_result"));
                    icbc.put("zdrpo_zx1_query_time", Tools.dateToStrLong(null));
                    icbc.put("zdrpo_zx1_result_time", Tools.dateToStrLong(null));
                }
                if (post.get("icbc_id") != null && !post.get("icbc_id").equals("")) {
                    Tools.recEdit(icbc, "dd_icbc", Long.valueOf(post.get("icbc_id")));
                } else {
                    res.put("code", "201");
                    res.put("msg", "系统错误，请返回重试！");
                    return res;
                }
                //dd_icbc_erp_result 添加
                switch (post.get("state_code")) {
                    case "1":
                        erp_result.put("later_status", "4");
                        break;
                    case "2":
                        erp_result.put("later_status", "4");
                        break;
                    case "3":
                        erp_result.put("later_status", "2");

                        break;
                }
                erp_result.put("now_status", "3");
                erp_result.put("remark", post.get("remark"));
                erp_result.put("result_code", post.get("state_code"));
                erp_result.put("result_msg",post.get("remark"));
                post.putAll(erp_result);
                post.put("dt_add",Tools.dateToStrLong(null));
                post.put("dt_edit",Tools.dateToStrLong(null));
                String result_msg = Tools.jsonEncode(post);
                System.out.println("合并后post"+result_msg);
                erp_result.put("result_value", result_msg);
                Tools.recAdd(erp_result, "dd_icbc_erp_result");
                if (post.get("state_code").equals("1") || post.get("state_code").equals("2")) {
                    erp_result_end.put("later_status", "4");
                    erp_result_end.put("now_status", "4");
                    Tools.recAdd(erp_result_end, "dd_icbc_erp_result");
                }
                switch (post.get("state_code")) {
                    case "1":
                        erp.put("now_status", "4");
                        erp.put("later_status", "4");

                        break;
                    case "2":
                        erp.put("now_status", "4");
                        erp.put("later_status", "4");
                        break;
                    case "3":
                        erp.put("now_status", "3");
                        erp.put("later_status", "2");
                        break;
                }
                Tools.recEdit(erp, "dd_icbc_erp", Long.valueOf(post.get("id")));
                //更新icbc状态
                switch (post.get("state_code")) {
                    case "1":
                        icbc_status.put("zx_status", "3");
                        break;
                    case "2":
                        icbc_status.put("zx_status", "5");
                        break;
                    case "3":
                        icbc_status.put("zx_status", "4");
                        break;
                }

                Tools.recEdit(icbc_status, "dd_icbc_status", Long.valueOf(status_id));
                break;
            case "2"://征信员银行意见
                String imgs=post.get("imgstep1_5ss");
                imgs=imgs.replaceAll("-",",");
                post.put("imgstep1_5ss",imgs);
                erp_result.put("now_status","6");
                erp_result.put("later_status","7");
//                erp_result.put("remark","");
//                erp_result.put("result_code","");
                erp_result.put("result_msg",post.get("zxyyhyj"));
                erp_result.put("result_value",Tools.jsonEncode(post));
                Tools.recAdd(erp_result,"dd_icbc_erp_result");
                erp.put("now_status","6");
                erp.put("later_status","7");
                Tools.recEdit(erp, "dd_icbc_erp", Long.valueOf(post.get("id")));
                break;
            case "3"://通融审核
                String imgs1=post.get("imgstep1_5ss");
                imgs1=imgs1.replaceAll("-",",");
                post.put("imgstep1_5ss",imgs1);
                erp_result.put("now_status","7");
                switch (post.get("state_code")) {
                    case "1":
                        erp_result.put("later_status","8");
                        erp.put("now_status","8");
                        erp.put("later_status","8");
                        break;
                    case "2":
                        erp_result.put("later_status","8");
                        erp.put("now_status","8");
                        erp.put("later_status","8");
                        break;
                    case "3":
                        erp_result.put("later_status","5");
                        erp.put("now_status","7");
                        erp.put("later_status","5");
                        break;
                }
//              erp_result.put("remark","");
                erp_result.put("result_code",post.get("state_code"));
                erp_result.put("result_msg",post.get("yxsm"));
                erp_result.put("result_value",Tools.jsonEncode(post));
                Tools.recAdd(erp_result,"dd_icbc_erp_result");
                Tools.recEdit(erp, "dd_icbc_erp", Long.valueOf(post.get("id")));
                //更新icbc状态
                switch (post.get("state_code")) {
                    case "1":
                        icbc_status.put("tr_status", "3");
                        break;
                    case "2":
                        icbc_status.put("tr_status", "2");
                        break;
                    case "3":
                        icbc_status.put("tr_status", "4");
                        break;
                }
                Tools.recEdit(icbc_status, "dd_icbc_status", Long.valueOf(status_id));
                if (post.get("state_code").equals("1") || post.get("state_code").equals("2")) {
                    erp_result_end.put("later_status", "8");
                    erp_result_end.put("now_status", "8");
                    Tools.recAdd(erp_result_end, "dd_icbc_erp_result");
                }
                break;
            case "4"://业务信息修改申请
                erp.put("now_status","84");
                erp.put("later_status","85");
                erp.put("c_name",icbcMap.get("c_name"));
                erp.put("c_tel",icbcMap.get("c_tel"));
                erp.put("c_cardno",icbcMap.get("c_cardno"));
                long id=Tools.recAdd(erp,"dd_icbc_erp");
                erp_result.put("now_status","83");
                erp_result.put("later_status","84");
                erp_result.put("qryid",String.valueOf(id));
                erp_result.put("result_msg",post.get("xgbz"));
                erp_result.put("result_value", Tools.jsonEncode(post));
                Tools.recAdd(erp_result,"dd_icbc_erp_result");
                erp_result.put("now_status","84");
                erp_result.put("later_status","85");
                erp_result.put("qryid",String.valueOf(id));
                erp_result.put("result_msg",post.get("xgbz"));
                erp_result.put("result_value", Tools.jsonEncode(post));
                Tools.recAdd(erp_result,"dd_icbc_erp_result");
                break;
            case "5"://业务管理部审核
                erp.put("now_status","85");
                erp_result.put("now_status","85");
                switch (post.get("state_code")) {
                    case "1":
                        erp.put("later_status","86");
                        erp_result.put("later_status","86");
                        break;
                    case "2":
                        erp.put("later_status","84");
                        erp_result.put("later_status","84");
                        break;
                }
                Tools.recEdit(erp,"dd_icbc_erp",Long.valueOf(post.get("id")));
                erp_result.put("qryid",post.get("id"));
                erp_result.put("result_msg",post.get("result_msg"));
                erp_result.put("result_code",post.get("state_code"));
                erp_result.put("result_value", Tools.jsonEncode(post));
                Tools.recAdd(erp_result,"dd_icbc_erp_result");
                break;
            case "6":
                erp.put("now_status","84");
                erp.put("later_status","85");
                Tools.recEdit(erp,"dd_icbc_erp",Long.valueOf(post.get("id")));
                erp_result.put("now_status","84");
                erp_result.put("later_status","85");
                erp_result.put("qryid",post.get("id"));
                erp_result.put("result_msg",post.get("xgbz"));
                erp_result.put("result_value", Tools.jsonEncode(post));
                Tools.recAdd(erp_result,"dd_icbc_erp_result");
                break;
            case "7":
                erp_result.put("now_status","86");
                switch (post.get("state_code")) {
                    case "1":
                        erp.put("now_status","87");
                        erp.put("later_status","87");
                        erp_result.put("later_status","87");
                        break;
                    case "2":
                        erp.put("now_status","86");
                        erp.put("later_status","85");
                        erp_result.put("later_status","85");
                        break;
                }
                Tools.recEdit(erp,"dd_icbc_erp",Long.valueOf(post.get("id")));
                erp_result.put("qryid",post.get("id"));
                erp_result.put("result_msg",post.get("result_msg"));
                erp_result.put("result_value", Tools.jsonEncode(post));
                Tools.recAdd(erp_result,"dd_icbc_erp_result");
                if (post.get("state_code").equals("1")) {
                    erp_result_end.put("later_status", "87");
                    erp_result_end.put("now_status", "87");
                    Tools.recAdd(erp_result_end, "dd_icbc_erp_result");
                }
                break;
            default:

                break;

        }
        System.out.println("post:" + post);
        res.put("code", String.valueOf(code));
        res.put("msg", msg);
        return res;
    }


//    public static void main(String[] args) {
//
//        String s="/upload/2019/03/06/85de014ac19b6b5ab58e76ae400a3e2f.jpg-/upload/2019/03/06/e447400ec7a3451a2b45da79849c30aa.jpg-/upload/2019/03/06/9a86e0092757986ddc59d56ef3a7af83.jpg-/upload/2019/03/06/5db0669327dfc538e00b561636c5afce.jpg-";
//        System.out.println(s.replaceAll("-",","));
//
//    }

}

