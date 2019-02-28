/*
 * @Description: Manager的get处理
 * @Author: tt
 * @Date: 2019-01-25 16:53:56
 * @LastEditTime: 2019-02-15 14:42:41
 * @LastEditors: tt
 */
package com.example.ddbx.tt.manager;

import com.example.ddbx.tt.data.TtList;
import com.example.ddbx.tt.data.TtMap;
import com.example.ddbx.tt.table.*;
import com.example.ddbx.tt.tool.Config;
import com.example.ddbx.tt.tool.DbCtrl;
import com.example.ddbx.tt.tool.Tools;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @description: 处理后台所有Get请求的统一入口
 * @param {type}
 * @return:
 */
public class ManagerGet {
  public String doGet(String cn, String type, String sdo, String id, HttpServletRequest request,
      HttpServletResponse resp) {
    TtMap minfo = Tools.minfo();
    request.setAttribute("minfo", minfo);
    TtMap info = null;
    TtList list = null;
    String jsonInfo = "";
    TtMap post = Tools.getPostMap(request);// 过滤参数，过滤mysql的注入，url参数注入
    boolean haveSetFormData = false; // 是否已经处理
    Modal modalMenu = new Modal();
    request.setAttribute("menus", modalMenu.getMenus()); // 后台左侧菜单,sidebar.jsp里面用到的菜单列表
    request.setAttribute("cssName", Config.MANAGER_SKINCSS);
    if (ManagerTools.checkCn(cn) && ManagerTools.checkSdo(sdo)) {// 过滤掉cn
      if (ManagerTools.checkCnDbctrl(cn)) { // 过滤需要操作数据库的cn
        DbCtrl dbCtrl = new DbCtrl(ManagerTools.getRealCn(cn));
        long nid = 0;
        try {
          switch (sdo) {
          case "":
          case "form": /* 下面的如果功能复杂，建议每一个table新建一个专属的class来处理，保持代码清洁生成相关的参数 */
          case "float":
            switch (cn) {
            case "admin_agp":// 公司角色权限，独立的class演示，显示公司模块下的所有
              AdminAgp adminAgp = new AdminAgp();
              try {
                adminAgp.doGetForm(request, post);
              } catch (Exception e) {
                Tools.logError(e.getMessage(), true, true);
              } finally {
                adminAgp.closeConn();
              }
              haveSetFormData = true;
              break;
              case "fs_agp": // 公司模块选择，显示所有非内部模块
                post.put("id", Tools.minfo().get("fsid")); //修改id为当前登陆用户所在公司的id
                request.setAttribute("modals", modalMenu.getAllModals()); // 后台左侧菜单,sidebar.jsp里面用到的菜
              break;
              case "fs": // 公司模块选择，显示所有非内部模块
                //nid = Long.parseLong(Tools.minfo().get("fsid"));
                request.setAttribute("modals", modalMenu.getAllModals()); // 后台左侧菜单,sidebar.jsp里面用到的菜
                break;
              case "mytask": // 我的任务板块
                //System.out.println("进入我的世界");
                MyTask myTask=new MyTask();
                request.setAttribute("clgc_list",myTask.getclgc());
                break;
              case "sys_config_son": // 我的任务板块
                //System.out.println("进入我的世界");
                MyTask myTask1=new MyTask();
                request.setAttribute("clgc_list",myTask1.getclgc());
                break;
              case "qcpg":
                qcpg qcpg = new qcpg();
                TtList getAllOrderName1 = qcpg.selectAllOrderName();
                request.setAttribute("names",getAllOrderName1);
                try {
                  qcpg.doGetList(request,post);
                } catch (Exception e) {
                  Tools.logError(e.getMessage(), true, true);
                } finally {
                  qcpg.closeConn();
                }
                break;
            default:
              break;
            }
            if (dbCtrl==null) {//使用dbCtrl默认的配置输出数据
              dbCtrl = new DbCtrl(ManagerTools.getRealCn(cn));
            };
            dbCtrl.doGetForm(request, post);
            break;

          // ===============无敌分割线，分割sdo=form和list=================/

          case "list": /* 下面的如果功能复杂，建议每一个table新建一个专属的class来处理，保持代码清洁生成相关的参数 */
            String whereString = "true";// 过滤 如 t.mid=222 ，只显示mid为222的列表
            String fieldsString = ""; // 显示字段列表如t.id,t.name,t.dt_edit
            String orderString = ""; // 排序
            String lsitTitleString = ""; // list的jsp页面左上角的标题
            String kw = "";
            int pageInt = Integer.valueOf(Tools.myIsNull(post.get("p")) == false ? post.get("p") : "1"); // 当前页
            int limtInt = Integer.valueOf(Tools.myIsNull(post.get("l")) == false ? post.get("l") : "10"); // 每页显示多少数据量
            boolean candel = false;
            boolean canAdd = true;
            dbCtrl.showall = true;
            switch (cn) {// list生成前处理
            case "admin_agp": // 演示单独的类来处理数据
              AdminAgp adminAgp = new AdminAgp();
              try {
                adminAgp.doGetList(request, post);
              } catch (Exception e) {
                Tools.logError(e.getMessage(), true, true);
              } finally {
                adminAgp.closeConn();
              }
              haveSetFormData = true;
              break;
            case "comm_citys":// 使用单独的类来处理数据
              CommCitys commCitys = new CommCitys();
              try {
                commCitys.doGetList(request, post);
              } catch (Exception e) {
                Tools.logError(e.getMessage(), true, true);
              } finally {
                commCitys.closeConn();
              }
              haveSetFormData = true;
              break;
            case "admin":
              Admin admin = new Admin();
              try {
                admin.doGetList(request, post);
              } catch (Exception e) {
                Tools.logError(e.getMessage(), true, true);
              } finally {
                admin.closeConn();
              }
              haveSetFormData = true;
              break;
            case "sys_modal":
              lsitTitleString = "模块管理";
              orderString = "ORDER BY level,id_uplevel,sort";
              candel = false;
              kw = post.get("kw");
              String id_uplevel = post.get("id_uplevel");
              if (Tools.myIsNull(kw) == false) {
                whereString += " AND showmmenuname like '%" + kw + "%'";
              }
              if (Tools.myIsNull(id_uplevel) == false && !id_uplevel.equals("0")) {
                whereString += " AND level=" + id_uplevel;
              }
              break;
            case "sys_error": // 演示单独的类来处理数据
              lsitTitleString = "错误日志管理";
              orderString = "ORDER BY dt_add DESC";
              break;
            case "alltask"://全部任务
              System.out.println("来啦老弟！！！");
              AllTask allTask=new AllTask();
              try {
                allTask.doGetList(request,post);
              } catch (Exception e) {
                Tools.logError(e.getMessage(), true, true);
              } finally {
                allTask.closeConn();
              }
              haveSetFormData = true;
              break;
              case "mytask"://我的任务
                MyTask mytask=new MyTask();
                try {
                  mytask.doGetList(request,post);
                } catch (Exception e) {
                  Tools.logError(e.getMessage(), true, true);
                } finally {
                  mytask.closeConn();
                }
                haveSetFormData = true;
                break;
                case "sys_config"://业务板块
                    Sys_config sys_config=new Sys_config();
                    try {
                        sys_config.doGetList(request,post);
                    } catch (Exception e) {
                        Tools.logError(e.getMessage(), true, true);
                    } finally {
                        sys_config.closeConn();
                    }
                    haveSetFormData = true;
                    break;
              case "sys_config_son"://业务子版块
                Sys_config_son sys_config_son=new Sys_config_son();
                try {
                  sys_config_son.doGetList(request,post);
                } catch (Exception e) {
                  Tools.logError(e.getMessage(), true, true);
                } finally {
                  sys_config_son.closeConn();
                }
                haveSetFormData = true;
                break;
              case "zxcx"://征信
                zxcx zxcx=new zxcx();
                try {
                  zxcx.doGetList(request,post);
                } catch (Exception e) {
                  Tools.logError(e.getMessage(), true, true);
                } finally {
                  zxcx.closeConn();
                }
                haveSetFormData = true;
                break;
              case "qcpg":
                qcpg qcpg = new qcpg();
                try {
                  qcpg.doGetList(request,post);
                } catch (Exception e) {
                  Tools.logError(e.getMessage(), true, true);
                } finally {
                  qcpg.closeConn();
                }
                haveSetFormData = true;
                break;
            default:
              lsitTitleString = "相关管理";
              orderString = "ORDER BY id";
              break;
            }
            if (!haveSetFormData) {// 如果没有处理
              dbCtrl.orders = orderString;
              dbCtrl.p = pageInt;
              dbCtrl.limit = limtInt;
              list = dbCtrl.lists(whereString, fieldsString);
              request.setAttribute("list", list);
              request.setAttribute("recs", dbCtrl.recs); // 总记录数
              String htmlpages = dbCtrl.getPage("", 0, true); // 分页html代码
              request.setAttribute("pages", dbCtrl.pages); // 总页数
              request.setAttribute("p", pageInt); // 当前页码
              request.setAttribute("l", limtInt); // limit量
              request.setAttribute("lsitTitleString", lsitTitleString); // 标题
              request.setAttribute("htmlpages", htmlpages); // 分页的html代码
              request.setAttribute("canDel", candel); // 分页的html代码
              request.setAttribute("canAdd", canAdd); // 分页的html代码
              // request.setAttribute("dbCtrl", dbCtrl);
            }
            break;
          }
        } catch (Exception e) {
          if (Config.DEBUGMODE) {
            e.printStackTrace();
          }
          Tools.logError(e.getMessage(), true, true);
        } finally {
          dbCtrl.closeConn();
          if (post != null) {
            post.clear();
            post = null;
          }
        }
      } else {//不涉及数据库操作的list
        request.setAttribute("recs", 0); // 总记录数
        request.setAttribute("pages", 0); // 总页数
        request.setAttribute("p", 0); // 当前页码
        request.setAttribute("l", 0); // limit量
        request.setAttribute("lsitTitleString", ""); // 标题
        request.setAttribute("htmlpages", ""); // 分页的html代码
        request.setAttribute("canDel", false); // 分页的html代码
        request.setAttribute("canAdd", false); // 分页的html代码
        if (cn.equals("home")){
          request.setAttribute("sHideButton","true");
        }
      }
      return "jsp/manager/index_b";
    } else {
      return "jsp/manager/404"; 
    }
  }
}