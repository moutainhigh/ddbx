/*
 * @Description:TT后台管理
 * @Author: tt
 * @Date: 2019-01-03 16:30:50
 * @LastEditTime: 2019-02-13 10:19:33
 * @LastEditors: tt
 */
package com.example.ddbx.tt.manager;

import com.example.ddbx.tt.data.TtList;
import com.example.ddbx.tt.data.TtMap;
import com.example.ddbx.tt.tool.Config;
import com.example.ddbx.tt.tool.DbCtrl;
import com.example.ddbx.tt.tool.DbTools;
import com.example.ddbx.tt.tool.Tools;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

@Controller
public class Manager {
  /**
   * INDEX 的 GET处理
   * 
   * @return
   * @throws IOException
   * @throws ServletException
   */
  @RequestMapping(value = "/manager/index", method = RequestMethod.GET)
  public String index(String cn, String type, String sdo, String id, HttpServletRequest request,
      HttpServletResponse resp) throws ServletException, IOException {
    String sLogin = ManagerTools.checkLogin();// 检查是否登陆
    if (!Tools.myIsNull(sLogin)) {// 如未登陆跳转到登陆页面
      return sLogin + "?refer=" + URLEncoder.encode(Tools.urlKill("toExcel|toZip"), "UTF-8");
    }
    return new ManagerGet().doGet(cn, type, sdo, id, request, resp);
  }

  /**
   * INDEX的POST 处理
   * 
   * @param request
   * @return
   * @throws ServletException
   * @throws IOException
   */
  @RequestMapping(value = "/manager/index", method = RequestMethod.POST)
  @ResponseBody
  private String indexpost(HttpServletRequest request) throws ServletException, IOException {
    String sLogin = ManagerTools.checkLogin();// 检查是否登陆
    if (!Tools.myIsNull(sLogin)) {// 如未登陆跳转到登陆页面
      return sLogin + "?refer=" + URLEncoder.encode(Tools.urlKill(""), "UTF-8");
    }
    return Tools.jsonEnCode(new ManagerPost().doPost(request));
  }

  /**
   * @description: Login的GET处理
   * @param {type}
   * @return:
   */
  @RequestMapping(value = "/manager/login", method = RequestMethod.GET)
  public String login(HttpServletRequest request) {
    request.setAttribute("cssName", Config.MANAGER_SKINCSS);
    return "jsp/manager/login";
  }

  /**
   * @description: Login的POST处理
   * @param {type}
   * @return:
   * @throws UnsupportedEncodingException
   */
  @RequestMapping(value = "/manager/login", method = RequestMethod.POST)
  @ResponseBody
  public String loginPost(HttpServletRequest request) throws UnsupportedEncodingException {
    TtMap post = Tools.getPostMap(request);// 过滤参数，过滤mysql的注入，url参数注入
    String refer = post.get("refer");
    String loginTb = Config.DB_USERTABLENAME;
    System.out.println(Tools.jsonEnCode(post));
    TtMap result2 = new TtMap();
    Tools.formatResult(result2, false, 999, "异常，请重试！", "");// 初始化返回
    if (ManagerTools.checkSdo(post.get("sdo"))) {// 过滤掉sdo
      switch (post.get("sdo")) {
      case "login":/** 登陆 */
        String pass = Tools.md5(Tools.md5("kgc" + post.get("password")));
        String sql = "select id,isadmin from " + loginTb + " where username='" + post.get("username")
            + "' AND password='" + pass + "'";
        System.out.println("SQL:" + sql);
        TtMap info = Tools.recinfo(sql);
        if (info.size() > 0) {
          Tools.formatResult(result2, true, 0, "登陆成功！",
              Tools.myIsNull(refer) ? "/manager/index?cn=home&sdo=form&type=demo" : URLDecoder.decode(refer, "UTF-8"));
          long id = Long.parseLong(info.get("id"));
          Tools.setNowUser(id, Boolean.parseBoolean(info.get("isadmin")));
        } else {
          Tools.formatResult(result2, false, 998, "用户名或者密码错误！", Tools.urlKill(""));
        }
        break;
      case "logout":
        HttpSession session = request.getSession();
        session.removeAttribute("tt_mid");
        session.removeAttribute("tt_isadmin");
        Tools.formatResult(result2, true, 0, "退出成功！", "/manager/login");
        break;
      }
    }
    return Tools.jsonEnCode(result2);
  }

  /**
   * 错误页面
   * 
   * @return
   * @throws IOException
   * @throws ServletException
   */
  @RequestMapping(value = "/manager/404", method = RequestMethod.GET)
  public String Show404(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
    return "jsp/manager/404"; 
  }

  /**
   * 删除
   */
  @RequestMapping(value = "/manager/todel", method = RequestMethod.POST)
  @ResponseBody
  public Map todel(long id,String cn){
    Map result=new HashMap();
    DbTools myDbTools=new DbTools();
    String sql="DELETE FROM "+cn+" WHERE id="+id;
    try {
      myDbTools.recexec(sql);
      result.put("code",true);
    }catch (Exception e) {
      result.put("code",false);
      Tools.logError(e.getMessage(), true, false);
    }finally {
      myDbTools.closeConn();
    }
    return result;
  }


}