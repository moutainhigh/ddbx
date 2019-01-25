/*
 * @Description:TT后台管理
 * @Author: tt
 * @Date: 2019-01-03 16:30:50
 * @LastEditTime: 2019-01-22 14:15:47
 * @LastEditors: tt
 */
package com.example.ddbx.tt.tool;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.ddbx.tt.table.KjbUser;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
    String sLogin = this.checkLogin();// 检查是否登陆
    if (!Tools.myisnull(sLogin)) {// 如未登陆跳转到登陆页面
      return sLogin + "?refer=" + URLEncoder.encode(Tools.urlKill(""), "UTF-8");
    }
    //System.out.println("minfo:"+Tools.minfo("admin").toString());
    Map<String, String> info = null;
    List<Map<String, String>> list = null;
    String jsonInfo = "";
    Map<String, String> post = Tools.getpostmap(request);// 过滤参数，过滤mysql的注入，url参数注入
    ManagerSidebar managerSidebar = new ManagerSidebar();
    request.setAttribute("menus", managerSidebar.getMenus()); // 后台左侧菜单,sidebar.jsp里面用到的菜单列表

    System.out.println(Tools.jsonEnCode(post));

    if (this.checkCn(cn) && this.checkSdo(sdo)) {// 过滤掉cn

      if (checkCnDbctrl(cn)) { // 过滤需要操作数据库的cn
        System.out.println("过滤后的cn："+cn);
        DbCtrl dbCtrl = new DbCtrl(cn);
        long nid = 0;
        try {
          switch (sdo) {
          case "":
          case "form": /* 下面的如果功能复杂，建议每一个table新建一个专属的class来处理，保持代码清洁生成相关的参数 */
            switch (cn) {
            case "formdemo":// 单独的class演示，所有相关的操作在这个类方法里完成
              KjbUser kjbUser = new KjbUser();
              kjbUser.setJspDataForForm(request, dbCtrl);
              break;
            default:
              if (Tools.myisnull(id)) {
              } else {
                nid = Long.valueOf(id);
              }
              dbCtrl.showall = true;
              info = dbCtrl.info(nid);
              if (!Tools.myisnull(info.get("password"))) {// 密码处理，不显示
                info.put("password", "");
              }
              jsonInfo = Tools.jsonEnCode(info);
              System.out.println(jsonInfo);
              request.setAttribute("info", jsonInfo);
              request.setAttribute("infodb", info);
              request.setAttribute("id", nid > 0 ? nid : 0);
              break;
            }

            break;
          case "list": /* 下面的如果功能复杂，建议每一个table新建一个专属的class来处理，保持代码清洁生成相关的参数 */
            String whereString = "true";// 过滤 如 t.mid=222 ，只显示mid为222的列表
            String fieldsString = ""; // 显示字段列表如t.id,t.name,t.dt_edit
            String orderString = ""; // 排序
            String lsitTitleString = ""; // list的jsp页面左上角的标题
            String kw = "";
            String dtbe = "";
            int pageInt = Integer.valueOf(Tools.myisnull(post.get("p")) == false ? post.get("p") : "1"); // 当前页
            int limtInt = Integer.valueOf(Tools.myisnull(post.get("l")) == false ? post.get("l") : "10"); // 每页显示多少数据量
            boolean candel = false;
            dbCtrl.showall = true;
            switch (cn) {
            case "listdemo": // 单独的class演示，所有相关的操作在这个类里完成
              KjbUser kjbUser = new KjbUser();
              kjbUser.setJspDataForList(request, dbCtrl);
              break;
            case "comm_citys":
              candel = true;
              lsitTitleString = "城市列表管理";
              orderString = "ORDER BY id DESC";
              kw = post.get("kw");
              String state_id = post.get("state_id");
              dtbe = post.get("dtbe");
              if (Tools.myisnull(kw) == false) {
                whereString += " AND name like '%" + kw + "%'";
              }
              if (Tools.myisnull(state_id) == false && !state_id.equals("0")) {
                whereString += " AND state_id=" + state_id;
              }
              if (Tools.myisnull(dtbe) == false) {
                dtbe = dtbe.replace("%2f", "-").replace("+", "");
                String[] dtArr = dtbe.split("-");
                dtArr[0] = dtArr[0].trim();
                dtArr[1] = dtArr[1].trim();
                System.out.println("DTBE开始日期:" + dtArr[0] + "结束日期:" + dtArr[1]);
              }
              break;
            case "sys_modal":
              lsitTitleString = "模块管理";
              orderString = "ORDER BY level,id_uplevel,sort";
              candel = false;
              kw = post.get("kw");
              String id_uplevel = post.get("id_uplevel");
              if (Tools.myisnull(kw) == false) {
                whereString += " AND showmmenuname like '%" + kw + "%'";
              }
              if (Tools.myisnull(id_uplevel) == false && !id_uplevel.equals("0")) {
                whereString += " AND level=" + id_uplevel;
              }
              break;
            default:
              orderString = "ORDER BY dt_edit DESC";
              break;
            }
            dbCtrl.orders = orderString;
            dbCtrl.p = pageInt;
            dbCtrl.limit = limtInt;
            list = dbCtrl.lists(whereString, fieldsString);
            System.out.println("list:"+list);
            request.setAttribute("list", list);
            request.setAttribute("recs", dbCtrl.recs); // 总记录数
            String htmlpages = dbCtrl.getPage("", 0, true); // 分页html代码
            request.setAttribute("pages", dbCtrl.pages); // 总页数
            request.setAttribute("p", pageInt); // 当前页码
            request.setAttribute("l", limtInt); // limit量
            request.setAttribute("lsitTitleString", lsitTitleString); // 标题
            request.setAttribute("htmlpages", htmlpages); // 分页的html代码
            request.setAttribute("canDel", candel); // 分页的html代码
            // request.setAttribute("dbCtrl", dbCtrl);
            break;
          }
        } catch (Exception e) {
          Config.log.error(e.getMessage());
        } finally {
          dbCtrl.closeConn();
          if (post != null) {
            post.clear();
            post = null;
          }
        }
      }
      return "jsp/manager/index_b"; // 统一的入口
    } else {
      return "jsp/manager/404"; // 统一的入口
    }
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
    String sLogin = this.checkLogin();// 检查是否登陆
    if (!Tools.myisnull(sLogin)) {// 如未登陆跳转到登陆页面
      return sLogin + "?refer=" + URLEncoder.encode(Tools.urlKill(""), "UTF-8");
    }
    Map<String,String> postUrl = Tools.getUrlParam();
    Map<String, String> post = Tools.getpostmap(request,true);// 过滤参数，过滤mysql的注入，url参数注入
    System.out.println(Tools.jsonEnCode(postUrl));
    String cn = postUrl.get("cn") == null ? "" : postUrl.get("cn");
    Map<String, String> result2 = new HashMap<>();
    Tools.formatResult(result2, false, 999, "异常，请重试！", "");// 初始化返回
    System.out.println(Tools.jsonEnCode(result2));
    if (this.checkCn(cn) && this.checkSdo(postUrl.get("sdo"))) {// 过滤掉cn
      switch (postUrl.get("sdo")) {
      case "form":
        long id = 0;
        try {
          id = Long.parseLong(post.get("id"));
        } catch (Exception e) {
          // TODO: handle exception
        }
        DbCtrl dbCtrl = new DbCtrl(cn);
        try {
          if (!Tools.myisnull(post.get("password"))) { // 密码处理
            post.put("password", Tools.md5(Tools.md5("kgc" + post.get("password"))));
          }else{
            post.remove("password");
          }
          switch (postUrl.get("cn")){
            case "sys_modal":
              System.out.println(post.toString());
              if (post.get("id_uplevel").equals("0")){
                post.put("level", "1");
              }else{
                post.put("level", "2");
              }
              if (Tools.myisnull(post.get("icohtml"))){
                if (post.get("level")=="1"){
                  post.put("icohtml", "<i class=\"fa fa-home\"></i>");
                }else{
                  post.put("icohtml", "<i class=\"fa fa-arrow-circle-o-right\"></i>");
                }
              }
            break;
          }
         /*   如果有提交预定的关键字时
          if (!Tools.myisnull(post.get("s_cn"))){
            post.put("cn", post.get("s_cn"));
            post.remove("s_cn");
          }
          if (!Tools.myisnull(post.get("s_type"))){
            post.put("type", post.get("s_type"));
            post.remove("s_type");
          }
          if (!Tools.myisnull(post.get("s_sdo"))){
            post.put("sdo", post.get("s_sdo"));
            post.remove("s_sdo");
          }else{
            
          } */
          if (id > 0) { // id为0时，新增
            dbCtrl.edit(post, id);
          } else {
            dbCtrl.add(post);
          }
          Tools.formatResult(result2, true, 0, "编辑成功！", Tools.urlKill("sdo") + "&sdo=list");
        } catch (Exception e) {
          Tools.logError(e.getMessage());
        } finally {
          dbCtrl.closeConn();
          post.clear();
          post = null;
        }
        break;
      }
    }
    return Tools.jsonEnCode(result2);
  }

  /**
   * @description: Login的GET处理
   * @param {type}
   * @return:
   */
  @RequestMapping(value = "/manager/login", method = RequestMethod.GET)
  public String login(HttpServletRequest request) {
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
    Map<String, String> post = Tools.getpostmap(request);// 过滤参数，过滤mysql的注入，url参数注入
    String refer = post.get("refer");
    String loginTb = Config.DB_USERTABLENAME;
    System.out.println(Tools.jsonEnCode(post));
    Map<String, String> result2 = new HashMap<>();
    Tools.formatResult(result2, false, 999, "异常，请重试！", "");// 初始化返回
    if (this.checkSdo(post.get("sdo"))) {// 过滤掉sdo
      switch (post.get("sdo")) {
      case "login":/** 登陆 */
        String pass = Tools.md5(Tools.md5(post.get("password")));
        String sql = "select id,name,fsid,isadmin from " + loginTb + " where username='" + post.get("username")
            + "' AND password='" + pass + "'";
        System.out.println("SQL:" + sql);
        Map<String, String> info = Tools.recinfo(sql);
        if (info.size() > 0) {
          Tools.formatResult(result2, true, 0, "登陆成功！",
              Tools.myisnull(refer) ? "/manager/index?cn=home&sdo=form&type=demo" : URLDecoder.decode(refer, "UTF-8"));
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
   * @description: 一些工具方法
   * @param {type}
   * @return:
   */
  private boolean checkCn(String cn) {
    String[] allowCnList = { "admin", "assess_admin", "home", "admin2", "button", "demo_upfile", "icon", "general",
        "Timeline", "Modals", "table", "comm_citys","sys_modal"
            ,"dd_fs","dd_gems","dd_icbc","dd_icbc_erp","dd_icbc_erp_result","dd_icbc_materials","dd_icbc_result"
            ,"sys_menulevels","sys_session","tt_wxconfig"
    }; // 允许的cn,只有在列表中的cn才使用数据库，T
    return Tools.arrayIndexOf(allowCnList, cn);
  }

  private boolean checkCnDbctrl(String cn) {
    String[] allowCnList = {"admin", "assess_admin", "home", "admin2", "button", "demo_upfile", "icon", "general",
            "Timeline", "Modals", "table", "comm_citys","sys_modal"
            ,"dd_fs","dd_gems","dd_icbc","dd_icbc_erp","dd_icbc_erp_result","dd_icbc_materials","dd_icbc_result"
            ,"sys_menulevels","sys_session","tt_wxconfig"}; // 允许的cn,只有在列表中的cn才使用数据库，
    return Tools.arrayIndexOf(allowCnList, cn);
  }

  private boolean checkSdo(String sdo) {
    if (Tools.myisnull(sdo)) {
      return false;
    }
    String[] allowDoList = { "form", "list", "login", "logout" }; // 允许的sdo，过滤不安全的url和参数
    return Tools.arrayIndexOf(allowDoList, sdo);
  }

  private String checkLogin() {
    String result = null;
    if (Tools.mid() == 0) {
      System.out.println("没有登陆:" + Tools.mid());
      result = "redirect:/manager/login";
    } else {
    }
    return result;
  }

}