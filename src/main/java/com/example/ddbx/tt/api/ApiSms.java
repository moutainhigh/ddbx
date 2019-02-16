/*
 * @说明: 短信发送类接口。目前使用国都的短信接口。
 * 后台链接：https://web.guodulink.net:8505/gdums/enterLogin，用户密码已经忘记。接口用户名和密码保存着呢
 * @Description: file content
 * @Author: tt
 * @Date: 2019-02-15 15:24:44
 * @LastEditTime: 2019-02-15 16:59:14
 * @LastEditors: tt
 */
package com.example.ddbx.tt.api;

import com.example.ddbx.tt.data.TtMap;
import com.example.ddbx.tt.tool.HttpTools;
import com.example.ddbx.tt.tool.Tools;


import java.util.HashMap;
import java.util.Map;

/**
 * 短信发送类 第三方短信接口方：国都
 */
public class ApiSms {
  private static String posturl = "http://124.251.7.68:8000/HttpQuickProcess/submitMessageAll";
  private static String postUsr = "kuaiched";
  private static String postPwd = "aG5u2stC"; 
  
  public static void main(String[] args) {
    mmsSend("18950388428", "测试一下！", "");
  }

  /**
   * 发送短信，支持群发
   * @param tel 群发时每个手机号码以,为间隔。如果无,则表示非群发，只发送给一个目标号码。
   * @return: boolean 是否成功
   */
  public static boolean mmsSend(String tel, String msg, String postKey) {
    boolean r = false;

    postKey = !Tools.myIsNull(postKey) ? postKey : "【快加认证】";
    String[] ssTel = tel.contains(",")?tel.split(","):new String[]{tel};
    msg = postKey + msg;
    for (String stel : ssTel) {
      Map<String, Object> params = new HashMap<>();
      params.put("OperID", postUsr);
      params.put("OperPass", postPwd);
      params.put("DesMobile", stel);
      params.put("Content",Tools.toGbk(msg));
      TtMap headers = new TtMap();
      headers.put("Content-Type", "application/x-www-form-urlencoded");
      String re = HttpTools.httpClientPost(posturl, params, "UTF-8", headers);
      //成功时返回类似03,f80385f026bcadae800，03为状态码，后面为订单号。
      r = re.contains("03,");
      System.out.println(re);
    }
    return r;//批量发送时，以最后一个发送的返回为准
  }
}