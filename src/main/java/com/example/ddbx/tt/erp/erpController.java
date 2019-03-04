package com.example.ddbx.tt.erp;

import com.example.ddbx.tt.data.TtMap;
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
public class erpController {

    /**
     * 添加任务进度
     * @param request
     * @return
     */
    @RequestMapping(value = "/manager/ajaxpost", method = RequestMethod.POST)
    @ResponseBody
    public TtMap  ajaxpost(HttpServletRequest request){
        TtMap post = Tools.getPostMap(request, true);// 过滤参数，过滤mysql的注入，url参数注入
        String result_msg=Tools.jsonEncode(post);
         TtMap res=new TtMap();
         String msg="编辑成功";
         long code=200;
         TtMap minfo = Tools.minfo();//当前登录用户信息
         System.out.println("minfo："+minfo);
         //dd_icbc更新
         TtMap icbc=new TtMap();
         if(post.get("icbc_id")!=null){
             Tools.recEdit(icbc,"dd_icbc更新",Long.valueOf(post.get("icbc_id")));
         }else{
             res.put("code", "201");
             res.put("msg","系统错误，请返回重试！");
             return res;
         }


         //dd_icbc_erp_result 添加
         TtMap erp_result=new TtMap();
         erp_result.put("qryid",post.get("id"));
         erp_result.put("now_status","3");
         erp_result.put("later_status","4");
         erp_result.put("remark",post.get("remark"));
         erp_result.put("result_code",post.get("state_code"));
         erp_result.put("result_msg","");
         erp_result.put("result_value",result_msg);
         erp_result.put("type_id",post.get("type_id"));
         erp_result.put("icbc_id",post.get("icbc_id"));
         erp_result.put("gems_id",minfo.get("id"));
         erp_result.put("gems_fs_id",minfo.get("fsid"));
         Tools.recAdd(erp_result,"dd_icbc_erp_result");
         System.out.println("post:"+post);

        res.put("code", String.valueOf(code));
        res.put("msg",msg);
        return res;
    }




}
