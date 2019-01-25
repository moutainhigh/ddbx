/*
 * @Description: 后台sidebar管理，对应于sys_modal_sub表
 * @Author: tt
 * @Date: 2019-01-21 10:03:57
 * @LastEditTime: 2019-01-22 14:52:37
 * @LastEditors: tt
 */
package com.example.ddbx.tt.tool;

import java.util.List;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

public class ManagerSidebar {
    public Object getMenus(){ //获取多级菜单列表，目前支持2级，对应于sys_modal_sub表
      Map<String,Object> result = new LinkedHashMap<>(); //不使用HashMap的原因是因为HashMap会自动排序
      DbCtrl dbCtrl = new DbCtrl("sys_modal");
      try{
        dbCtrl.showall = true;
        dbCtrl.nopage = true;
        dbCtrl.orders = "ORDER BY t.sort,t.showmmenuname";
        List<Map<String, String>> list = dbCtrl.lists("level=1 AND showmmenutag=1", "t.name,t.id,t.showmmenuname,t.icohtml");
        System.out.println("list order:"+list.toString());
        for (Map<String, String> model :list){
          String whString = "level=2 AND showmmenutag=1 AND id_uplevel='"+model.get("id")+"'"; //查询二级菜单
          List<Map<String, String>> listsub = dbCtrl.lists(whString, "t.name,t.id,t.showmmenuname,t.cn,t.type,t.icohtml,t.sdo");
          System.out.println(model.get("showmmenuname"));
          Map<String,String> mpIcon = new HashMap<>();
          mpIcon.put("icon", model.get("icohtml"));
          listsub.add(mpIcon);//最后一个为图标配置
          result.put(model.get("showmmenuname"),listsub);
        }
        //Map<String, String> info = dbCtrl.info();
      }catch(Exception e){
        Tools.logError(e.getMessage());
      }finally{
        dbCtrl.closeConn();
      }
      return (Object) result;
    }
}