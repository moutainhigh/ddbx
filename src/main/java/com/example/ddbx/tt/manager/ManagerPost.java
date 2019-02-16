/*
 * @Description: Manager的post处理
 * @Author: tt
 * @Date: 2019-01-25 16:41:58
 * @LastEditTime: 2019-02-11 16:16:01
 * @LastEditors: tt
 */
package com.example.ddbx.tt.manager;

import com.example.ddbx.tt.data.TtMap;
import com.example.ddbx.tt.table.Admin;
import com.example.ddbx.tt.table.AdminAgp;
import com.example.ddbx.tt.table.FsModal;
import com.example.ddbx.tt.tool.DbCtrl;
import com.example.ddbx.tt.tool.Tools;

import javax.servlet.http.HttpServletRequest;

/**
 * @description: Manager的所有Post请求入口
 * @param {type} 
 * @return: 
 */
public class ManagerPost {
  public TtMap doPost(HttpServletRequest request) {
    TtMap postUrl = Tools.getUrlParam();
    TtMap post = Tools.getPostMap(request, true);// 过滤参数，过滤mysql的注入，url参数注入
    System.out.println(Tools.jsonEnCode(post));
    String cn = postUrl.get("cn") == null ? "" : postUrl.get("cn");
    TtMap result2 = new TtMap();
    Tools.formatResult(result2, false, 999, "异常，请重试！", "");// 初始化返回
    if (ManagerTools.checkCn(cn) && ManagerTools.checkSdo(postUrl.get("sdo"))) {// 过滤掉cn
      switch (postUrl.get("sdo")) { // 目前只有form模式下有post
      case "form":
      case "float":
        long id = Tools.strToLong(post.get("id"));
        DbCtrl dbCtrl = new DbCtrl(cn);
        String nextUrl = Tools.urlKill("sdo") + "&sdo=list";
        try {
          switch (postUrl.get("cn")) {
          case "admin":
            Admin admin = new Admin();
            try {
              if (id > 0) { // id为0时，新增
                admin.edit(post, id);
              } else {
                admin.add(post);
              }
              boolean bSuccess = admin.errorCode == 0;
              Tools.formatResult(result2, bSuccess, admin.errorCode, bSuccess ? "编辑成功！" : admin.errorMsg,
                  bSuccess ? nextUrl : "");//失败时停留在当前页面,nextUrl为空
            } catch (Exception e) {
              Tools.formatResult(result2, false, 777, e.getMessage(),  "");//异常时设置提示保存失败并保持停留在当前页面
              Tools.logError(e.getMessage(),true,false);
            } finally {
              admin.closeConn();
            }
            break;
          case "admin_agp":
            AdminAgp adminAgp = new AdminAgp();
            try {
              if (id > 0) { // id为0时，新增
                adminAgp.edit(post, id);
              } else {
                adminAgp.add(post);
              }
              boolean bSuccess = adminAgp.errorCode == 0;
              Tools.formatResult(result2, bSuccess, adminAgp.errorCode, bSuccess ? "编辑成功！" : adminAgp.errorMsg,
                  bSuccess ? nextUrl : "");//失败时停留在当前页面,nextUrl为空
            } catch (Exception e) {
              Tools.logError(e.getMessage(),true,false);
              Tools.formatResult(result2, false, 777, e.getMessage(), "");
            } finally {
              adminAgp.closeConn();
            }
            break;
          case "fs_agp": // 用单独的类演示处理post，保存数据
            FsModal fsModal = new FsModal();
            try {
              if (id > 0) { // id为0时，新增
                fsModal.edit(post, id);
              } else {
                fsModal.add(post);
              }
              boolean bSuccess = fsModal.errorCode == 0;
              nextUrl = Tools.urlKill("");
              Tools.formatResult(result2, bSuccess, fsModal.errorCode, bSuccess ? "编辑成功！" : fsModal.errorMsg, bSuccess ? nextUrl : "");
            } catch (Exception e) {
              Tools.logError(e.getMessage(),true,false);
              Tools.formatResult(result2, false, 777, e.getMessage(), "");
            } finally {
              fsModal.closeConn();
            }
            break;
            case "fs": // 用单独的类演示处理post，保存数据
              FsModal fs = new FsModal();
              try {
                if (id > 0) { // id为0时，新增
                  fs.edit(post, id);
                } else {
                  fs.add(post);
                }
                boolean bSuccess = fs.errorCode == 0;
                nextUrl = Tools.urlKill("");
                Tools.formatResult(result2, bSuccess, fs.errorCode, bSuccess ? "编辑成功！" : fs.errorMsg, bSuccess ? nextUrl : "");
              } catch (Exception e) {
                Tools.logError(e.getMessage(),true,false);
                Tools.formatResult(result2, false, 777, e.getMessage(), "");
              } finally {
                fs.closeConn();
              }
              break;
            case "sys_modal":
            System.out.println(post.toString());
            if (post.get("id_uplevel").equals("0")) {
              post.put("level", "1");
            } else {
              post.put("level", "2");
            }
            if (Tools.myIsNull(post.get("icohtml"))) {
              if (post.get("level") == "1") {
                post.put("icohtml", "<i class=\"fa fa-home\"></i>");
              } else {
                post.put("icohtml", "<i class=\"fa fa-arrow-circle-o-right\"></i>");
              }
            }
            if (id > 0) { // id为0时，新增
              dbCtrl.edit(post, id);
            } else {
              dbCtrl.add(post);
            }
            Tools.formatResult(result2, true, 0, "编辑成功！", nextUrl);
            break;
          default:
            if (id > 0) { // id为0时，新增
              dbCtrl.edit(post, id);
            } else {
              dbCtrl.add(post);
            }
            Tools.formatResult(result2, true, 0, "编辑成功！", nextUrl);
          }
        } catch (Exception e) {
          Tools.logError(e.getMessage(),true,false);
          Tools.formatResult(result2, false, 0, e.getMessage(), nextUrl);
        } finally {
          dbCtrl.closeConn();
          post.clear();
          post = null;
        }
        break;
      }
    }
    return result2;
  }
}