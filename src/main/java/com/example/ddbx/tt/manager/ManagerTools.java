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
 * @param {type}
 * @description: Manager需要用到的一些方法
 * @return:
 */
public class ManagerTools {
    /**
     * @param {type}
     * @description: url传递过啦的参数cn的合法性检查
     * @return:
     */
    public static boolean checkCn(String cn) {
        String[] allowCnList = {"admin", "assess_admin", "home", "admin2", "button", "demo_upfile", "icon", "general",
                "admin_agp", "Timeline", "Modals", "table", "comm_citys", "sys_modal", "fs_agp", "readme", "sys_error", "readmedev",
                "fs","spmq",
                "gems", "dd_icbc", "zxcx", "alltask", "mytask", "my_job", "sys_config", "sys_config_son"}; // 允许的cn,只有在列表中的cn才允许访问
        return Tools.arrayIndexOf(allowCnList, cn);
    }

    /**
     * @param {type}
     * @description: url传递过来的参数cn合法性检查（必须连接数据库的cn）
     * @return:
     */
    public static boolean checkCnDbctrl(String cn) {
        String[] allowCnList = {"admin",
                "assess_admin",
                "comm_citys",
                "sys_modal",
                "admin_agp",
                "fs_agp",
                "sys_error",
                "fs",
                "gems",
                "dd_icbc",
                "alltask", "zxcx","spmq",
                "mytask", "sys_config", "sys_config_son"
        }; // 允许的cn,只有在列表中的cn才使用数据库，
        return Tools.arrayIndexOf(allowCnList, cn);
    }

    /**
     * @param {type}
     * @description: url传递过来的sdo参数值合法性检查，列表中的才处理
     * @return:
     */
    public static boolean checkSdo(String sdo) {
        if (Tools.myIsNull(sdo)) {
            return false;
        }
        String[] allowDoList = {"form", "list", "login", "logout", "edit", "float"}; // 允许的sdo，过滤不安全的url和参数
        return Tools.arrayIndexOf(allowDoList, sdo);
    }

    /**
     * @param {type}
     * @description: 后台是否已经登陆检查，如果未登录，返回登陆页的链接
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
     * @param {type}
     * @return 返回对应真实的使用数据库表的cn
     * @description: 一些需要隐藏真实cn的处理，返回真实cn
     */
    public static String getRealCn(String cn) {
        switch (cn) {
            // 需要用到数据库的CN
            case "erp":
                return "erp";
            case "fs_agp":
                return "fs";
            case "fs":
                return "Fs";
            case "admin":
                return "Admin";
            case "comm_citys":
                return "CommCitys";
            case "fsmodal":
                return "FsModal";
            case "admin_agp":
                return "AdminAgp";
            case "sys_modal":
                return "sys_modal";
            case "sys_error":
                return "sys_error";
            case "mytask":
                return "MyTask";
            case "alltask":
                return "AllTask";
            case "zx_1":
                return "zx_1";
            case "zxcx":
                return "zxcx";
            // 不需要使用数据库的CN
            case "home":
            case "button":
            case "admin2":
            case "demo_upfile":
            case "icon":
            case "general":
            case "readmedev":
            case "readme":
            case "table":
            case "Modals":
            case "Timeline":
            case "font":
                return "";
            default:
                return null;
        }
    }

    /**
     * @param {type} {type}
     * @说明 填充默认的数据。显示list.jsp和form.jsp
     * @return: 返回
     */
    public static void doFetchDefault(HttpServletRequest request, String cn, String sdo) {
        switch (sdo) {
            case "form":
                System.out.println("没有表的form情况");
                request.setAttribute("sHideButton", "true");

                break;
            case "list":
                System.out.println("没有表的list情况");
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
     *
     * @param {type} {type}
     * @return: 返回
     */
    public static String getHomeUrl() {
        return Tools.urlKill("sdo|type|cn|kw") + "&sdo=form&type=demo&cn=home";
    }


    /**
     * 获取目前可以用的class，根据cn值（realcn）
     *
     * @param {type} {type}
     * @return: 返回
     */
    public static Class<?> doGetClass(String realCn) {
        Class<?> b = null; // 使用反射方式来实例化
        try {
            b = Class.forName("com.example.ddbx.tt.table." + realCn);
        } catch (Exception e) {
            Tools.logError(e.getMessage());
        } finally {
        }
        return b;
    }
}
