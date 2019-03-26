package com.example.ddbx.wx.controller;

import com.alibaba.fastjson.JSONObject;
import com.example.ddbx.tt.tool.DbTools;
import com.example.ddbx.tt.tool.Tools;
import com.example.ddbx.wx.tools.WxCode2Session;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
public class UserLogin {

    private static Logger log = Logger.getLogger(UserLogin.class);

    @PostMapping(value = "/wx/getMark")
    @ResponseBody
    public Object getOpenId(String code){
        log.info("微信code->code:"+code);
        Map result2 = null;
        String s = WxCode2Session.get(code);
        log.info("获取微信OpenId->reponse"+s);
        JSONObject jsonObject = JSONObject.parseObject(s);
        if(jsonObject.get("openid") != null){
            result2 = WxCode2Session.formatResult(true, 0, "已绑定");
        }else{//权限不存在
            result2 = WxCode2Session.formatResult(false, 999, "还未绑定");
        }
        result2.put("mark",jsonObject.get("openid"));
        return result2;
    }


    //开始绑定用户
    @PostMapping(value = "/wx/bindUser")
    @ResponseBody
    public Object bindUser(String userN,String passW,String mark){
        Map result2=null;
        log.info("绑定用户->用户名:"+userN+",密码:"+passW+",openid:"+mark);

        Map<String, String> ass_admin = Tools.recinfo("select id from assess_admin where showtag = 1 and deltag = 0 and username='" + userN + "' and userpass= '" + passW + "' AND wx_openid = '" + mark + "'");
        log.info("ass_admin>>>"+ass_admin);
        //存在此用户且已经绑定open_id
        if(ass_admin.size()>0){
                result2 = WxCode2Session.formatResult(true, 0, "绑定成功");
                result2.put("steward","1,2,3,4,5,6,7,8");
                result2.put("mark",mark);
        }else{
            Map<String, String> adminM = Tools.recinfo("select id from assess_admin where showtag = 1 and deltag = 0 and username='" + userN + "' and userpass= '" + passW + "' AND ( wx_openid is NULL OR wx_openid='')");
            if(adminM.size()>0){//存在这个用户名 和 密码 并且有效没有绑定过
                log.info("开始绑定");
                DbTools dbTools5 = new DbTools();
                int adminUpdateCount = dbTools5.recupdate(new StringBuilder("UPDATE assess_admin SET dt_edit='").append(Tools.dateToStrLong(null)).append("',wx_openid='").append(mark).append("' WHERE id =").append(adminM.get("id")).toString());
                dbTools5.closeConn();
                log.info("admin表关联用户->updteCount"+adminUpdateCount);
                result2 = WxCode2Session.formatResult(true, 0, "绑定成功");
                result2.put("steward",adminM.get("value"));
                result2.put("mark",mark);
            }else{
                result2 = WxCode2Session.formatResult(false, 0, "用户名或者密码不正确！");
            }
        }
        return result2;
    }

}
