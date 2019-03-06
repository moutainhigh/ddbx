package com.example.ddbx.tt.table;

import com.alibaba.druid.pool.DruidPooledConnection;
import com.example.ddbx.tt.data.TtList;
import com.example.ddbx.tt.data.TtMap;
import com.example.ddbx.tt.tool.Config;
import com.example.ddbx.tt.tool.DbCtrl;
import com.example.ddbx.tt.tool.DbTools;
import com.example.ddbx.tt.tool.Tools;
import com.example.ddbx.tt.utils.orderutil;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public class zxcx extends DbCtrl {

    private final String title = "征信列表";
    private String orderString = "ORDER BY dt_edit DESC"; // 默认排序
    private boolean canDel = false;
    private boolean canAdd = true;
    private final String classAgpId = "6"; // 随便填的，正式使用时应该跟model里此模块的ID相对应
    public boolean agpOK = false;// 默认无权限

    public zxcx() {
        super("dd_icbc");
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

    //获取id 最大的数据
    public TtMap getmaxid() {
        DbTools myDbTools = new DbTools();
        String sql = "select MAX(id) as id from dd_icbc";
        TtMap map = null;
        try {
            map = myDbTools.recinfo(sql);
        } catch (Exception e) {
            Tools.logError(e.getMessage(), true, false);
        } finally {
            myDbTools.closeConn();
        }
        return map;
    }

    /**
     * @param {type} {type}
     * @说明: 给子类重载用，处理post
     * @return: 返回
     */
    public void doPost(TtMap post, long id, TtMap result2) {
        addicbc_erp_zx(post);
        String type_id = post.get("type_id");
        System.out.println("type_id:" + type_id);
        String zx_status=post.get("zx_status");
        String tr_status=post.get("tr_status");
        System.out.println("状态值"+zx_status+"------"+tr_status);
        if (id > 0) { // id为0时，新增
            edit(post, id);
            String icbc_status_id=Tools.unDic("dd_icbc_status",String.valueOf(id),"id","icbc_id");
            if(!Tools.myIsNull(icbc_status_id)){
                TtMap icbc_status = new TtMap();
                System.out.println("status:"+post+"****");
                icbc_status.put("icbc_id",String.valueOf(id));
                icbc_status.put("zx_status",zx_status);
                icbc_status.put("tr_status",tr_status);
                Tools.recEdit(icbc_status, "dd_icbc_status",Long.valueOf(icbc_status_id));
            }else {
                TtMap icbc_status = new TtMap();
                System.out.println("status:"+post+"****");
                icbc_status.put("icbc_id",String.valueOf(id));
                icbc_status.put("zx_status",zx_status);
                icbc_status.put("tr_status",tr_status);
                Tools.recAdd(icbc_status, "dd_icbc_status");
            }
            if(tr_status.equals("1")){
                //add 通融板块
                TtMap ttMap1 = new TtMap();
                ttMap1.put("now_status", "5");
                ttMap1.put("later_status", "6");
                ttMap1.put("icbc_id", String.valueOf(id));
                ttMap1.put("gems_id", post.get("gems_id"));
                ttMap1.put("gems_fs_id", post.get("gems_fs_id"));
                ttMap1.put("type_id", "42");
                ttMap1.put("c_name", post.get("c_name"));
                ttMap1.put("c_cardno", post.get("c_cardno"));
                ttMap1.put("c_tel", post.get("c_tel"));
                System.out.println("icbc_erp_map:" + ttMap1);
                long qryid = Tools.recAdd(ttMap1, "dd_icbc_erp");
                //add 通融板块 result
                TtMap ttMap_res = new TtMap();
                ttMap_res.put("qryid", String.valueOf(qryid));
                ttMap_res.put("now_status", "5");
                ttMap_res.put("later_status", "6");
                ttMap_res.put("icbc_id", String.valueOf(id));
                ttMap_res.put("gems_id", post.get("gems_id"));
                ttMap_res.put("gems_fs_id", post.get("gems_fs_id"));
                ttMap_res.put("type_id", "42");
                ttMap_res.put("result_msg",post.get("tr_msg"));
                ttMap_res.put("result_value", Tools.jsonEncode(post));
                Tools.recAdd(ttMap_res, "dd_icbc_erp_result");
            }
        } else {
            long icbc_id = 0;
            long qryid = 0;
            icbc_id = add(post);
            TtMap icbc_code = new TtMap();
            icbc_code.put("order_code", orderutil.getOrderId("ddbx", 8, icbc_id));
            edit(icbc_code, icbc_id);
            //获取订单最大id  获取 当前表里 最大的id  然后+1  得到当前订单编号
//                TtMap ttMap = getmaxid();
//                int maxid = Integer.parseInt(ttMap.get("id"));
//                post.put("order_code", orderutil.getOrderId("ddbx", 8, maxid + 1));

            //erp业务类型添加
            TtMap ttMap1 = new TtMap();
            ttMap1.put("now_status", "2");
            ttMap1.put("later_status", "3");
            ttMap1.put("icbc_id", String.valueOf(icbc_id));
            ttMap1.put("gems_id", post.get("gems_id"));
            ttMap1.put("gems_fs_id", post.get("gems_fs_id"));
            ttMap1.put("type_id", type_id);
            ttMap1.put("c_name", post.get("c_name"));
            ttMap1.put("c_cardno", post.get("c_cardno"));
            ttMap1.put("c_tel", post.get("c_tel"));
            System.out.println("icbc_erp_map:" + ttMap1);
            qryid = Tools.recAdd(ttMap1, "dd_icbc_erp");

            System.out.println("icbc_erp_id:" + id);
            //erp业务result类型添加 erp_1
            TtMap ttMap_res = new TtMap();
            ttMap_res.put("qryid", String.valueOf(qryid));
            ttMap_res.put("now_status", "1");
            ttMap_res.put("later_status", "2");
            ttMap_res.put("icbc_id", String.valueOf(icbc_id));
            ttMap_res.put("gems_id", post.get("gems_id"));
            ttMap_res.put("gems_fs_id", post.get("gems_fs_id"));
            ttMap_res.put("type_id", type_id);
            //            ttMap_res.put("c_name", post.get("c_name"));
            //            ttMap_res.put("c_cardno", post.get("c_cardno"));
            //            ttMap_res.put("c_tel", post.get("c_tel"));
            Tools.recAdd(ttMap_res, "dd_icbc_erp_result");

            //erp业务result类型添加 erp_2
            TtMap ttMap_res2 = new TtMap();
            ttMap_res2.put("qryid", String.valueOf(qryid));
            ttMap_res2.put("now_status", "2");
            ttMap_res2.put("later_status", "3");
            ttMap_res2.put("icbc_id", String.valueOf(icbc_id));
            ttMap_res2.put("gems_id", post.get("gems_id"));
            ttMap_res2.put("gems_fs_id", post.get("gems_fs_id"));
            ttMap_res2.put("type_id", type_id);
            ttMap_res2.put("result_value", Tools.jsonEncode(post));
            Tools.recAdd(ttMap_res2, "dd_icbc_erp_result");


            //erp业务result类型添加 erp_2
            String icbc_status_id=Tools.unDic("dd_icbc_status",String.valueOf(icbc_id),"id","icbc_id");
            if(!Tools.myIsNull(icbc_status_id)){
                TtMap icbc_status = new TtMap();
                System.out.println("status:"+post+"****");
                icbc_status.put("icbc_id",String.valueOf(icbc_id));
                icbc_status.put("zx_status",zx_status);
                icbc_status.put("tr_status",tr_status);
                Tools.recEdit(icbc_status, "dd_icbc_status",Long.valueOf(icbc_status_id));
            }else {
                TtMap icbc_status = new TtMap();
                System.out.println("status:"+post+"****");
                icbc_status.put("icbc_id",String.valueOf(icbc_id));
                icbc_status.put("zx_status",zx_status);
                icbc_status.put("tr_status",tr_status);
                Tools.recAdd(icbc_status, "dd_icbc_status");
            }


        }
        String nextUrl = Tools.urlKill("sdo") + "&sdo=list";
        boolean bSuccess = errorCode == 0;
        Tools.formatResult(result2, bSuccess, errorCode, bSuccess ? "编辑成功！" : errorMsg, bSuccess ? nextUrl : "");// 失败时停留在当前页面,nextUrl为空
    }

    /**
     * 新增订单  erp操作
     */
    public void addicbc_erp_zx(TtMap post) {
        //图片路径存放操作
        String imgstep1_1ss = "";
        String imgstep1_2ss = "";
        String imgstep1_3ss = "";
        String imgstep1_4ss = "";
        String imgstep1_5ss = "";
        for (int i = 1; i <= 4; i++) {
            imgstep1_1ss = imgstep1_1ss + post.get("imgstep1_1ss" + i) + ",";
            imgstep1_2ss = imgstep1_2ss + post.get("imgstep1_2ss" + i) + ",";
            imgstep1_3ss = imgstep1_3ss + post.get("imgstep1_3ss" + i) + ",";
            imgstep1_4ss = imgstep1_4ss + post.get("imgstep1_4ss" + i) + ",";
            imgstep1_5ss = imgstep1_5ss + post.get("imgstep1_5ss" + i) + ",";
        }
        post.put("imgstep1_1ss", imgstep1_1ss);
        post.put("imgstep1_2ss", imgstep1_2ss);
        post.put("imgstep1_3ss", imgstep1_3ss);
        post.put("imgstep1_4ss", imgstep1_4ss);
        post.put("imgstep1_5ss", imgstep1_5ss);
        post.put("bc_status", post.get("type_id"));
    }


    /**
     * 添加
     *
     * @param ary
     * @return
     */
    @Override
    public long add(TtMap ary) {
        return super.add(ary);
    }

    /**
     * 更新
     *
     * @param ary
     * @param id  需更新數據的主鍵的值
     * @return
     */
    @Override
    public int edit(TtMap ary, long id) {
        return super.edit(ary, id);
    }

    @Override
    public void setTable(String table) {
        super.setTable(table);
    }

    /**
     * @param {type} {type}
     * @说明: 给继承的子类重载用的
     * @return: 返回
     */
    public void doGetForm(HttpServletRequest request, TtMap post) {
        //获取erp类型数据
        MyTask myTask2 = new MyTask();
        try {
            TtList erplist = myTask2.geticbc_erp_type();
            request.setAttribute("erplist", erplist);
        } catch (Exception e) {
            Tools.logError(e.getMessage(), true, false);
        } finally {
            myTask2.closeConn();
        }

        if (post.get("id") != null && !post.get("id").equals("")) {
            //获取公司名 人名
            Admin admin = new Admin();
            try {
                TtMap ttMap = admin.getgems_name("dd_icbc", Integer.parseInt(post.get("id")));
                request.setAttribute("gsnamemap", ttMap);
            } catch (Exception e) {
                Tools.logError(e.getMessage(), true, false);
            } finally {
                admin.closeConn();
            }
        }
        String f="t.*,dis.zx_status as zx_status,dis.tr_status as tr_status";
        leftsql="LEFT JOIN dd_icbc_status dis ON dis.icbc_id=t.id";
        long nid = Tools.myIsNull(post.get("id")) ? 0 : Tools.strToLong(post.get("id"));
        TtMap info = info(nid,f);
        String jsonInfo = Tools.jsonEncode(info);
        request.setAttribute("info", jsonInfo);//info为json后的info
        request.setAttribute("infodb", info);//infodb为TtMap的info
        request.setAttribute("id", nid);
    }

    //list 处理
    public void doGetList(HttpServletRequest request, TtMap post) {
        System.out.println("查询list");
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
        String fieldsString = "t.*,a.name as admin_name,f.name as fs_name,s.zx_status as zx_status,s.tr_status as tr_status"; // 显示字段列表如t.id,t.name,t.dt_edit,字段数显示越少加载速度越快，为空显示所有
        TtList list = null;
        /* 开始处理搜索过来的字段 */
        kw = post.get("kw");
        dtbe = post.get("dtbe");

        if (Tools.myIsNull(kw) == false) {
            whereString += " AND c_name like '%" + kw + "%'";
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

        System.out.println("查询list");

        whereString += tmpWhere; // 过滤
        orders = orderString;// 排序
        p = pageInt; // 显示页
        limit = limtInt; // 每页显示记录数
        showall = true; // 忽略deltag和showtag
        leftsql = "LEFT JOIN admin a on a.id=t.gems_id " +
                "LEFT JOIN fs f on f.id=t.gems_fs_id "+
                "LEFT JOIN dd_icbc_status s on s.icbc_id=t.id ";
        list = lists(whereString, fieldsString);

        if (!Tools.myIsNull(kw)) { // 搜索关键字高亮
            for (TtMap info : list) {
                info.put("c_name",
                        info.get("c_name").replace(kw, "<font style='color:red;background:#FFCC33;'>" + kw + "</font>"));
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
    public void closeConn() {
        super.closeConn();
    }

}
