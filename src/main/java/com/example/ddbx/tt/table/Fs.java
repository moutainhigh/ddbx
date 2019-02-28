/*
 * @Description: 公司的模块权限管理
 * @Author: tt
 * @Date: 2019-01-24 17:15:47
 * @LastEditTime: 2019-02-16 14:28:03
 * @LastEditors: tt
 */
package com.example.ddbx.tt.table;


import com.example.ddbx.tt.data.TtList;
import com.example.ddbx.tt.data.TtMap;
import com.example.ddbx.tt.manager.Modal;
import com.example.ddbx.tt.tool.Config;
import com.example.ddbx.tt.tool.DbCtrl;
import com.example.ddbx.tt.tool.Tools;

import javax.servlet.http.HttpServletRequest;

public class Fs extends DbCtrl {
  private final String title = "公司管理";
  private String orderString = "ORDER BY dt_edit DESC"; // 默认排序
  private boolean canDel = false;
  private boolean canAdd = true;
  private final String classAgpId = "6"; // 随便填的，正式使用时应该跟model里此模块的ID相对应
  public boolean agpOK = false;// 默认无权限
  private String purview_map = "";

  public Fs() {
    super("fs");
    AdminAgp adminAgp = new AdminAgp();
    try {
      if (adminAgp.checkAgp(classAgpId)) { // 如果有权限
        Config.log.info("权限检查成功！");
        agpOK = true;
      } else {
        errorCode = 444;
        errorMsg = "您好，您暂无权限！";
      }
    } catch (Exception e) {
      Tools.logError(e.getMessage(), true, false);
    } finally {
      adminAgp.closeConn();
    }
  }

  @Override
  public int edit(TtMap ary, long id) {
    return super.edit(ary, id);
  }

  @Override
  public long add(TtMap ary) {
    return super.add(ary);
  }

  public void closeConn() {
    if (super.conn != null) {
      super.closeConn();
    }
  }


  /**
   * @说明: 给继承的子类重载用的
   * @param {type} {type}
   * @return: 返回
   */
  public void doGetForm(HttpServletRequest request, TtMap post) {
    Modal modalMenu = new Modal();
    request.setAttribute("modals", modalMenu.getAllModals());

    long nid = Tools.myIsNull(post.get("id"))?0:Tools.strToLong(post.get("id"));
    TtMap info = info(nid);
    String jsonInfo = Tools.jsonEncode(info);
    request.setAttribute("info", jsonInfo);//info为json后的info
    request.setAttribute("infodb", info);//infodb为TtMap的info
    request.setAttribute("id", nid);
  }


  //list 处理
  public void doGetList(HttpServletRequest request, TtMap post) {
    if (!agpOK) {// 演示在需要权限检查的地方插入权限标志判断
      request.setAttribute("errorMsg", errorMsg);
      return;
    }
    String kw = ""; // 搜索关键字
    String dtbe = ""; // 搜索日期选择
    int pageInt = Integer.valueOf(Tools.myIsNull(post.get("p")) == false ? post.get("p") : "1"); // 当前页
    int limtInt = Integer.valueOf(Tools.myIsNull(post.get("l")) == false ? post.get("l") : "10"); // 每页显示多少数据量
    String whereString = "true";
    String tmpWhere = "";
    String fieldsString = "";    // 显示字段列表如t.id,t.name,t.dt_edit,字段数显示越少加载速度越快，为空显示所有
    TtList list = null;
    /* 开始处理搜索过来的字段 */
    kw = post.get("kw");
    dtbe = post.get("dtbe");
    if (Tools.myIsNull(kw) == false) {
      whereString += " AND name like '%" + kw + "%'";
    }
    if (Tools.myIsNull(dtbe) == false) {
      dtbe = dtbe.replace("%2f", "-").replace("+", "");
      String[] dtArr = dtbe.split("-");
      dtArr[0] = dtArr[0].trim();
      dtArr[1] = dtArr[1].trim();
      System.out.println("DTBE开始日期:" + dtArr[0] + "结束日期:" + dtArr[1]);
      // todo处理选择时间段
    }
    /* 搜索过来的字段处理完成 */


    whereString += tmpWhere; // 过滤
    orders = orderString;// 排序
    p = pageInt; // 显示页
    limit = limtInt; // 每页显示记录数
    showall = true; // 忽略deltag和showtag
    leftsql = "";
    list = lists(whereString, fieldsString);

    if (!Tools.myIsNull(kw)) { // 搜索关键字高亮
      for (TtMap info : list) {
        info.put("name",
                info.get("name").replace(kw, "<font style='color:red;background:#FFCC33;'>" + kw + "</font>"));
      }
    }
    request.setAttribute("list", list);// 列表list数据
    request.setAttribute("recs", recs); // 总记录数
    String htmlpages = getPage("", 0, false); // 分页html代码,
    request.setAttribute("pages", pages); // 总页数
    request.setAttribute("p", pageInt); // 当前页码
    request.setAttribute("l", limtInt); // limit量
    request.setAttribute("lsitTitleString", title); // 标题
    request.setAttribute("htmlpages", htmlpages); // 分页的html代码
    request.setAttribute("canDel", canDel); // 是否显示删除按钮
    request.setAttribute("canAdd", canAdd); // 是否显示新增按钮
    // request.setAttribute("showmsg", "测试弹出消息提示哈！"); //如果有showmsg字段，在载入列表前会提示
  }

  @Override
  public TtMap param(TtMap ary, long id) {
    for (String key : ary.keySet()) {
      if (ary.get(key).equals("1")) {
        String[] ss = key.split("/");
        if (ss.length > 1) {
          purview_map += ss[ss.length - 1] + ",";
        }
      }
    }
    ary.put("purview_map", purview_map);
    System.out.println(ary.toString());
    return ary;
  }
  @Override
  public void doPost(TtMap post, long id,TtMap result2) {
    if (id > 0) { // id为0时，新增
      edit(post, id);
    } else {
      add(post);
    }
    String nextUrl = Tools.urlKill("");
    boolean bSuccess = errorCode == 0;
    Tools.formatResult(result2, bSuccess, errorCode, bSuccess ? "编辑"+title+"成功！" : errorMsg,
            bSuccess ? nextUrl : "");//失败时停留在当前页面,nextUrl为空
  }
  @Override
  public boolean chk(TtMap array, long id) {
    if (Tools.myIsNull(array.get("name"))){
      errorMsg = chkMsg = "请输入名称";
      errorCode = 888;
      return false;
    }
    return true;
  }

}