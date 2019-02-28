/*
 * @Description: Manager需要用到的一些方法
 * @Author: tt
 * @Date: 2019-01-25 16:44:40
 * @LastEditTime: 2019-02-14 14:34:21
 * @LastEditors: tt
 */
package com.example.ddbx.tt.manager;

import com.example.ddbx.tt.tool.Tools;

import javax.servlet.http.HttpServletRequest;


/**
 * @description: Manager需要用到的一些方法
 * @param {type}
 * @return:
 */
public class ManagerTools {
  /**
   * @description: url传递过啦的参数cn的合法性检查
   * @param {type}
   * @return:
   */
  public static boolean checkCn(String cn) {
    String[] allowCnList = { "admin", "assess_admin", "home", "admin2", "button", "demo_upfile", "icon", "general",
        "admin_agp", "Timeline", "Modals", "table", "comm_citys", "sys_modal", "fs_agp", "readme", "sys_error","readmedev",
            "fs",
            "dd_icbc_materials",
            "gems","dd_icbc","zxcx","alltask","mytask","my_job","sys_config","sys_config_son","qcpg"  }; // 允许的cn,只有在列表中的cn才允许访问
    return Tools.arrayIndexOf(allowCnList, cn);
  }

  /**
   * @description: url传递过来的参数cn合法性检查（必须连接数据库的cn）
   * @param {type}
   * @return:
   */
  public static boolean checkCnDbctrl(String cn) {
    String[] allowCnList = { "admin",
            "assess_admin",
            "comm_citys",
            "sys_modal",
            "admin_agp",
            "fs_agp",
            "sys_error",
            "fs",
            "gems",
            "dd_icbc",
            "dd_icbc_materials",
            "alltask","zxcx","qcpg",
            "mytask","sys_config","sys_config_son"
    }; // 允许的cn,只有在列表中的cn才使用数据库，
    return Tools.arrayIndexOf(allowCnList, cn);
  }

  /**
   * @description: url传递过来的sdo参数值合法性检查，列表中的才处理
   * @param {type}
   * @return:
   */
  public static boolean checkSdo(String sdo) {
    if (Tools.myIsNull(sdo)) {
      return false;
    }
    String[] allowDoList = { "form", "list", "login", "logout", "edit", "float" }; // 允许的sdo，过滤不安全的url和参数
    return Tools.arrayIndexOf(allowDoList, sdo);
  }

  /**
   * @description: 后台是否已经登陆检查，如果未登录，返回登陆页的链接
   * @param {type}
   * @return:
   */
  public static String checkLogin() {
    String result = null;
    if (Tools.mid() == 0) {
      System.out.println("没有登陆:" + Tools.mid());
      result = "redirect:/manager/login";
    } else {
    }
    return result;
  }

  /**
   * @description: 一些需要隐藏真实cn的处理，返回真实cn
   * @param {type}
   * @return 返回对应真实的使用数据库表的cn
   */
  public static String getRealCn(String cn) {
    switch (cn) {
    case "fs_agp":
      return "fs";
   case "mytask":
      return "dd_icbc_erp";
<<<<<<< HEAD
  case "qcpg":
    return "dd_icbc_materials";
=======
   case "alltask":
        return "dd_icbc_erp";
   case "zx_1":
      return "dd_icbc_erp";
   case "zxcx":
      return "dd_icbc";
>>>>>>> 440938a50f7b7387df9d0d3862ff0c131c92035c
    default:
      return cn;
    }
  }

    /**
     * @说明 填充默认的数据。显示list.jsp和form.jsp
     * @param {type} {type}
     * @return: 返回
     */
    public static void doFetchDefault(HttpServletRequest request, String cn, String sdo) {
        switch (sdo) {
            case "form":
                request.setAttribute("sHideButton", "true");
                break;
            case "list":
                request.setAttribute("recs", 0); // 总记录数
                request.setAttribute("pages", 0); // 总页数
                request.setAttribute("p", 0); // 当前页码
                request.setAttribute("l", 0); // limit量
                request.setAttribute("lsitTitleString", ""); // 标题
                request.setAttribute("htmlpages", ""); // 分页的html代码
                request.setAttribute("canDel", false); // 分页的html代码
                request.setAttribute("canAdd", false); // 分页的html代码
                if (cn.equals("home")) {
                    request.setAttribute("sHideButton", "true");
                }
        }
    }

    /**
     * 获取默认后台首页的链接
     * @param {type} {type}
     * @return: 返回
     */
    public static String getHomeUrl(){
        return Tools.urlKill("sdo|type|cn|kw")+"&sdo=form&type=demo&cn=home";
    }


    /**
     * 获取目前可以用的class，根据cn值（realcn）
     * @param {type} {type}
     * @return: 返回
     */
    public static Class<?> doGetClass(String realCn) {
        Class<?> b = null; // 使用反射方式来实例化
        try {
            b = Class.forName("com.tt.table." + realCn);
        } catch (Exception e) {
            Tools.logError(e.getMessage());
        } finally {
        }
        return b;
    }
}
