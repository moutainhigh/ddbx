/*
 * @Description: 后台常用command修改数据库用
 * @Author: tt
 * @Date: 2019-01-29 11:08:47
 * @LastEditTime: 2019-02-11 16:15:48
 * @LastEditors: tt
 */
package com.example.ddbx.tt.manager;

import com.example.ddbx.tt.data.TtMap;
import com.example.ddbx.tt.table.Admin;
import com.example.ddbx.tt.tool.Tools;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.net.URLEncoder;

@Controller
public class ManagerCmd {
  /**
   * command模式的POST处理
   * 
   * @param request
   * @return
   * @throws ServletException
   * @throws IOException
   */
  @RequestMapping(value = "/manager/command", method = RequestMethod.POST)
  @ResponseBody
  private String doPost(HttpServletRequest request) throws ServletException, IOException {
    String sLogin = ManagerTools.checkLogin();// 检查是否登陆
    if (!Tools.myIsNull(sLogin)) {// 如未登陆跳转到登陆页面
      return sLogin + "?refer=" + URLEncoder.encode(Tools.urlKill("toExcel"), "UTF-8");
    }
    TtMap postUrl = Tools.getUrlParam();
    TtMap post = Tools.getPostMap(request, true);// 过滤参数，过滤mysql的注入，url参数注入
    System.out.println(Tools.jsonEnCode(post));
    String cn = postUrl.get("cn") == null ? "" : postUrl.get("cn");
    TtMap result2 = new TtMap();
    Tools.formatResult(result2, false, 999, "异常，请重试！", "");// 初始化返回
    if (ManagerTools.checkCn(cn) && ManagerTools.checkSdo(postUrl.get("sdo"))) {// 过滤掉cn
      post.put("fromcommand", "1");
      switch (postUrl.get("sdo")) { // 目前只有form模式下有post
      case "edit":
        long id = Tools.myIsNull(postUrl.get("id")) ? 0 : Tools.strToLong(postUrl.get("id"));
        switch (cn) {
        case "admin":
          if (id > 0) {
            Admin admin = new Admin();
            try {
              admin.edit(post, id);
              boolean success = admin.errorCode == 0 && Tools.myIsNull(admin.errorMsg);
              Tools.formatResult(result2, success, admin.errorCode, admin.errorMsg, "");
            } catch (Exception e) {
              Tools.logError(e.getMessage(),true,true);
            } finally {
              admin.closeConn();
            }
          }
          break;
        }
        break;
      default:
        break;
      }
    }
    return Tools.jsonEnCode(result2);
  }
}