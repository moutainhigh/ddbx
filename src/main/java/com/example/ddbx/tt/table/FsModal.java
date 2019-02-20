/*
 * @Description: 公司的模块权限管理
 * @Author: tt
 * @Date: 2019-01-24 17:15:47
 * @LastEditTime: 2019-02-16 14:28:03
 * @LastEditors: tt
 */
package com.example.ddbx.tt.table;


import com.example.ddbx.tt.data.TtMap;
import com.example.ddbx.tt.tool.DbCtrl;
import com.example.ddbx.tt.tool.Tools;

public class FsModal extends DbCtrl {
  private String purview_map = "";
  private final String title = "公司模块设置";
  public FsModal() {
    super("fs");
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