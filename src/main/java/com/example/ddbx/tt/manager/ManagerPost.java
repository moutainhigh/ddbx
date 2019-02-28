/*
 * @Description: Manager的post处理
 * @Author: tt
 * @Date: 2019-01-25 16:41:58
 * @LastEditTime: 2019-02-16 14:30:04
 * @LastEditors: tt
 */
package com.example.ddbx.tt.manager;

import com.example.ddbx.tt.data.TtList;
import com.example.ddbx.tt.data.TtMap;
import com.example.ddbx.tt.table.*;
import com.example.ddbx.tt.tool.DbCtrl;
import com.example.ddbx.tt.tool.Tools;
import com.example.ddbx.tt.utils.orderutil;
import org.springframework.core.annotation.OrderUtils;

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
    System.out.println(Tools.jsonEncode(post));
    String cn = postUrl.get("cn") == null ? "" : postUrl.get("cn");
    TtMap result2 = new TtMap();
    Tools.formatResult(result2, false, 999, "异常，请重试！", "");// 初始化返回
    String realCn = ManagerTools.getRealCn(cn);
    if (!ManagerTools.checkSdo(postUrl.get("sdo")) || realCn == null) {// 过滤cn和sdo，realCn为null时表示此cn不合法。
      return result2;
    }
    switch (postUrl.get("sdo")) { // 目前只有form模式下有post
        case "form":
        case "float":
          long id = Tools.strToLong(post.get("id"));
          DbCtrl dbCtrl = null;
          String nextUrl = Tools.urlKill("sdo") + "&sdo=list";
          try {
            switch (postUrl.get("cn")) {
              case "sys_modal": // 直接用dbCtrl来处理，但是要特殊处理一些数据的演示。
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
                break;
                case "car_loan":
                    cn = "dd_icbc_materials";
                    dbCtrl = (DbCtrl) new CarLoan();
                    break;
                case "sys_config"://业务板块
                    dbCtrl = (DbCtrl) new Sys_config();
                    break;
                case "sys_config_son"://业务子版块
                    dbCtrl = (DbCtrl) new Sys_config_son();
                    break;
                case "admin":
                    dbCtrl = (DbCtrl) new Admin();
                    break;
                case "admin_agp":
                    dbCtrl = (DbCtrl) new AdminAgp();
                    break;
                case "spmq":
                    post.put("order_id",post.get("icbc_id"));
                    dbCtrl = (DbCtrl) new spmq();
                    break;
                case "fs_agp": // 用单独的类演示处理post，保存数据
                    dbCtrl = (DbCtrl) new FsModal();
                    break;
                default: // 不用特殊处理的cn
                Class<?> b = ManagerTools.doGetClass(realCn);
                if (null != b) {
                  dbCtrl = (DbCtrl) b.newInstance();
                }
                break;
            }
            if (dbCtrl == null) {// 使用dbCtrl默认的配置输出数据
              dbCtrl = new DbCtrl(realCn.toLowerCase());
            }
            dbCtrl.doPost(post, id, result2);
          } catch (Exception e) {
            Tools.logError(e.getMessage(), true, false);
            Tools.formatResult(result2, false, 0, e.getMessage(), nextUrl);
          } finally {
            if (dbCtrl != null) {
              dbCtrl.closeConn();
              dbCtrl = null;
            }
            post.clear();
            post = null;
          }
          break;
    }
    return result2;
  }
}