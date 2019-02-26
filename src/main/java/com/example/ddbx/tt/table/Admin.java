/*
 * @Description: 单独的管理员管理类演示，继承自DbCtrl类
 * @Author: tt
 * @Date: 2019-01-26 11:35:00
 * @LastEditTime: 2019-02-16 14:05:15
 * @LastEditors: tt
 */
package com.example.ddbx.tt.table;

import com.example.ddbx.tt.data.TtList;
import com.example.ddbx.tt.data.TtMap;
import com.example.ddbx.tt.tool.*;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;


public class Admin extends DbCtrl {
  private final String title = "管理员管理";
  private String orderString = "ORDER BY dt_edit DESC"; // 默认排序
  private boolean canDel = false;
  private boolean canAdd = true;
  private final String classAgpId = "6"; // 随便填的，正式使用时应该跟model里此模块的ID相对应
  public boolean agpOK = false;// 默认无权限

  public Admin() {
    super("admin");
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

  /**
   * @description: 重载lists方法，这里可以处理一些lists前的逻辑
   * @param {type}
   * @return:
   */
  @Override
  public TtList lists(String wheres, String f) {
    if (!agpOK) {// 演示在需要权限检查的地方插入权限标志判断
      return null;
    }
    TtMap minfo = Tools.minfo();
    if (Tools.myIsNull(wheres)) {
      wheres = (Tools.isSuperAdmin(minfo) || Tools.isCcAdmin(minfo)) ? "" : " fsid=" + minfo.get("fsid"); // 只显示自己公司的
    } else {
      wheres += (Tools.isSuperAdmin(minfo) || Tools.isCcAdmin(minfo)) ? "" : " AND fsid=" + minfo.get("fsid"); // 只显示自己公司的
    }

    TtList lmss = super.lists(wheres, f);
    for (TtMap tmpInfo : lmss) {
      tmpInfo.put("fsname", Tools.unDic("fs", Tools.strToLong(tmpInfo.get("fsid"))));// 所属公司
      tmpInfo.put("choice", Tools.dicopt("sys_dic_tag", Tools.strToLong(tmpInfo.get("showtag")))); // 显示/隐藏
    }
    return lmss;
  }

  /**
   * @description: 重载info方法
   * @param {type}
   * @return:
   */
  @Override
  public TtMap info(long id, String f) {
    return super.info(id, f);
  }

  /**
   * @description: 重载edit方法，可以在这里处理一些edit逻辑
   * @param {type}
   * @return:
   */
  @Override
  public int edit(TtMap ary, long id) {
    return super.edit(ary, id);
  }

  /**
   * @description: 重载add方法，可以在这里添加一些添加数据时的逻辑
   * @param {type}
   * @return:
   */
  @Override
  public long add(TtMap ary) {
    return super.add(ary);
  }

  /**
   * @description: 重载closeConn方法，可以在关闭数据库前处理一些逻辑
   * @param {type}
   * @return:
   */
  @Override
  public void closeConn() {
    super.closeConn();
  }

  /**
   * @description: 重载的param方法，此方法在保存数据前调用！就是Add和Edit前都会调用这个方法
   * @param {type}
   * @return:
   */
  @Override
  public TtMap param(TtMap ary, long id) {
    if (!Tools.myIsNull(ary.get("password"))) { // 密码处理
      ary.put("password", Tools.md5(Tools.md5("kgc" + ary.get("password"))));
    } else {
      ary.remove("password");
    }
    return ary;
  }

  /**
   * @description: 处理后台的get,演示独立类处理sdo=form的get
   * @param {type}
   * @return:
   */
  @Override
  public void doGetForm(HttpServletRequest request, TtMap post) {
    if (!agpOK) {// 演示在需要权限检查的地方插入权限标志判断
      request.setAttribute("errorMsg", "权限访问错误！");
      return;
    }
    String id = post.get("id");
    long nid = 0;
    if (!Tools.myIsNull(id)) {
      nid = Long.valueOf(id);
    }
    showall = true;
    TtMap info = info(nid);
    System.out.println(info);
    String jsonInfo = Tools.jsonEnCode(info);
    System.out.println(jsonInfo);
    request.setAttribute("info", jsonInfo);
    request.setAttribute("infodb", info);
    request.setAttribute("id", nid > 0 ? nid : 0);
  }

  /**
   * @description: 处理后台的get,演示独立类处理sdo=list的get
   * @param {type}
   * @return:
   */
  @Override
  public void doGetList(HttpServletRequest request, TtMap post) {
    if (!agpOK) {  // 演示在需要权限检查的地方插入权限标志判断
      request.setAttribute("errorMsg", errorMsg);
      return;
    }
    String kw = "";  //搜索关键字
    String dtbe = ""; // 搜索日期选择
    int pageInt = Integer.valueOf(Tools.myIsNull(post.get("p")) == false ? post.get("p") : "1"); // 当前页
    int limtInt = Integer.valueOf(Tools.myIsNull(post.get("l")) == false ? post.get("l") : "10"); // 每页显示多少数据量
    String whereString = "true";
    String tmpWhere = "";
    String fieldsString = ""; // 显示字段列表如t.id,t.name,t.dt_edit,字段数显示越少加载速度越快，为空显示所有
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

    // 导出到Excel处理
    boolean bToExcel = false, toZip = false;
    if (!Tools.myIsNull(post.get("toExcel")) && post.get("toExcel").equals("1")) {// 导出excel时设置不分页，导出所有
      nopage = true;
      bToExcel = true;
    }
    if (!Tools.myIsNull(post.get("toZip")) && post.get("toZip").equals("1")) {// 导出excel时设置不分页，导出所有
      nopage = true;
      toZip = true;
    }
    whereString += tmpWhere; // 过滤
    orders = orderString;// 排序
    p = pageInt; // 显示页
    limit = limtInt; // 每页显示记录数
    showall = true; // 忽略deltag和showtag
    list = lists(whereString, fieldsString);
    if (bToExcel) { // Excel导出演示：导出到Excel并下载
      String[] headers = new String[] { "管理员名称", "密码MD5", "用户名" };
      String[] fields = new String[] { "name", "password", "username" };
      String toFile = Config.FILEUP_SAVEPATH + "excel/" + title + ".xlsx";
      closeConn();// 因为要跳到下载，所以要提前closeConn
      if (!Excel.doOut(list, headers, fields, toFile, "excel2007", true)) {
        errorMsg = "导出Excel失败";
        request.setAttribute("errorMsg", errorMsg);
      }
    } else if (toZip) { // ZIP打包演示：打包头像图片到zip并下载
      TtMap info = new TtMap();
      for (TtMap mss : list) {
        if (!Tools.myIsNull(mss.get("avatarurl"))) {
          info.put(mss.get("name"), mss.get("avatarurl"));
        }
      }
      try {
        closeConn();// 因为要跳到下载，所以要提前closeConn
        if (!Zip.imgsToZipDown(info, title + ".zip", null)) {
          errorMsg = "导出ZIP失败!";
          request.setAttribute("errorMsg", errorMsg);
        }
      } catch (IOException e) {

        errorMsg = "导出ZIP失败:" + e.getMessage();
        request.setAttribute("errorMsg", errorMsg);
        if (Config.DEBUGMODE) {
          e.printStackTrace();
        }
      }
    } else {
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
    }
    // request.setAttribute("showmsg", "测试弹出消息提示哈！"); //如果有showmsg字段，在载入列表前会提示
  }
  @Override
  public void doPost(TtMap post, long id,TtMap result2) {
    if (id > 0) { // id为0时，新增
      edit(post, id);
    } else {
      add(post);
    }
    String nextUrl = Tools.urlKill("sdo") + "&sdo=list";
    boolean bSuccess = errorCode == 0;
    Tools.formatResult(result2, bSuccess, errorCode, bSuccess ? "编辑成功！" : errorMsg,
            bSuccess ? nextUrl : "");//失败时停留在当前页面,nextUrl为空
  }
  /**
   * @description: 重载chk方法，就是数据写入前的一些判断逻辑可以在这里完成，如果返回false，将放弃数据写入操作
   * @param {type}
   * @return:
   */
  @Override
  public boolean chk(TtMap array, long id) {
    if (!agpOK) {// 演示在需要权限检查的地方插入权限标志判断
      return false;
    }
    if (!Tools.myIsNull(array.get("fromcommand"))) { // 从ManagerCmd来的。不用过滤参数
    } else {
      String myErroMsg = "";
      String userName = Tools.myIsNull(array.get("username")) ? "" : array.get("username").trim();// 去掉用户名前后空格;
      boolean bNew = id == 0;
      if (Tools.myIsNull(userName)) {
        myErroMsg = "您貌似忘记输入用户名了！\n";
      } else {
        if (bNew) {// 新增用户
          String sql = "select id from " + table + " where username='" + array.get("username") + "'";
          if (Tools.reclist(sql).size() > 0) {
            myErroMsg = "已经存在此用户：" + array.get("username") + "\n";
          }
        }
      }
      if (Tools.myIsNull(array.get("name"))) {
        myErroMsg += "您忘记输入用户姓名啦！\n";
      }

      if (array.get("fsid").equals("0")) {
        myErroMsg += "您忘记选择给哪个公司开户啦！\n";
      }
      if (array.get("agp_id").equals("0")) {
        myErroMsg += "您忘记选择用户所属角色啦！\n";
      }
      if (bNew) {// 新增用户，需要密码为空验证
        if (Tools.myIsNull(array.get("name"))) {
          myErroMsg += "您忘记输入用户密码啦！！\n";
        }
      }
      super.errorMsg = super.chkMsg = myErroMsg;
      if (!Tools.myIsNull(myErroMsg)) {
        super.errorCode = 888;
      }
    }
    return super.errorCode == 0;
  }
}