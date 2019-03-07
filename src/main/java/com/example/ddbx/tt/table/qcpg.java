package com.example.ddbx.tt.table;

import com.example.ddbx.tt.data.TtList;
import com.example.ddbx.tt.data.TtMap;
import com.example.ddbx.tt.tool.*;
import org.apache.commons.lang.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.text.DecimalFormat;

import com.example.ddbx.tt.tool.Config;
import com.example.ddbx.tt.tool.DbCtrl;
import com.example.ddbx.tt.tool.Tools;


public class qcpg extends DbCtrl {

    private final String title = "汽车评估";
    private String orderString = "ORDER BY dt_edit DESC"; // 默认排序
    private boolean canDel = false;
    private boolean canAdd = true;
    private final String classAgpId = "6"; // 随便填的，正式使用时应该跟model里此模块的ID相对应
    public boolean agpOK = false;// 默认无权限

    public qcpg() {
        super("dd_icbc_materials");

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

    //视频面签进件 查询全部征信订单并选择一个进件
    public TtList selectAllOrderName(){
        DbTools myDbTools = new DbTools();
        String sql="select id,c_name from dd_icbc";
        TtList allCustomer = null;
        try {
            allCustomer = myDbTools.reclist(sql);
            recs = Long.parseLong(myDbTools.recexec_getvalue("SELECT FOUND_ROWS() as rno;", "rno"));
        }catch (Exception e) {
            Tools.logError(e.getMessage(), true, false);
        }finally {
            myDbTools.closeConn();
        }
        return allCustomer;
    }

    @Override
    public long add(TtMap ary) {

        DbTools myDbTools = new DbTools();
        String sql="select id,gems_fs_id,gems_id,order_code,c_name,c_tel,c_cardno from dd_icbc where id="+ary.get("icbc_id");
        TtMap ontCustomer = null;
        try {
            ontCustomer = myDbTools.recinfo(sql);
            recs = Long.parseLong(myDbTools.recexec_getvalue("SELECT FOUND_ROWS() as rno;", "rno"));
        }catch (Exception e) {
            Tools.logError(e.getMessage(), true, false);
        }finally {
            myDbTools.closeConn();
        }

        // 其他表添加数据
        long qryid = 0;
            TtMap ttMap = new TtMap();
            ttMap.put("c_name", ontCustomer.get("c_name"));
            ttMap.put("c_tel", ontCustomer.get("c_tel"));
            ttMap.put("later_status", "11");
            ttMap.put("now_status", "10");
            ttMap.put("icbc_id", ontCustomer.get("id"));
            ttMap.put("gems_id", ontCustomer.get("gems_id"));
            ttMap.put("gems_fs_id", ontCustomer.get("gems_fs_id"));
            ttMap.put("type_id", "47");
            ttMap.put("c_cardno", ontCustomer.get("c_cardno"));
//        ttMap.put("c_carvin", ontCustomer.get(""));
            ttMap.put("c_carno", ary.get("license_plate"));
            ttMap.put("adminop_tag", Tools.minfo().get("id"));
            qryid = Tools.recAdd(ttMap, "dd_icbc_erp");
            TtMap ttMap1 = new TtMap();
            ttMap1.put("qryid", qryid+"");
            ttMap1.put("now_status", "9");
            ttMap1.put("later_status", "10");
            ttMap1.put("type_id", "47");
            ttMap1.put("icbc_id", ontCustomer.get("id"));
            Tools.recAdd(ttMap1, "dd_icbc_erp_result");

            TtMap ttMap2 = new TtMap();
            ttMap2.put("qryid", qryid+"");
            ttMap2.put("now_status", "10");
            ttMap2.put("later_status", "11");
            ttMap2.put("type_id", "47");
            ttMap2.put("icbc_id", ontCustomer.get("id"));
            Tools.recAdd(ttMap2, "dd_icbc_erp_result");
        // 本表操作添加数据
        ary.put("icbc_id",ontCustomer.get("id"));
        ary.put("gems_fs_id",ontCustomer.get("gems_fs_id"));
        ary.put("gems_id",ontCustomer.get("gems_id"));
        DecimalFormat countFormat = new DecimalFormat("000000000");
        ary.put("order_code","Q"+countFormat.format(Integer.parseInt(ontCustomer.get("id"))));

        String models = "";
        if (StringUtils.isNotEmpty(ary.get("models1")) && StringUtils.isNotEmpty(ary.get("models2")) && StringUtils.isNotEmpty(ary.get("models3"))){
            models = ary.get("models1")+" "+ary.get("models2")+ " "+ary.get("models1");
        }
        ary.put("models", models);

        String imgstep1_1qp = ary.get("imgstep1_1qp1") + ","
                            + ary.get("imgstep1_1qp2") + ","
                            + ary.get("imgstep1_1qp3") + ","
                            + ary.get("imgstep1_1qp4") + ","
                            + ary.get("imgstep1_1qp5");
        ary.put("imgstep1_1qp", imgstep1_1qp);

        String imgstep1_2qp = ary.get("imgstep1_2qp1") + ","
                            + ary.get("imgstep1_2qp2") + ","
                            + ary.get("imgstep1_2qp3") + ","
                            + ary.get("imgstep1_2qp4") + ","
                            + ary.get("imgstep1_2qp5") + ","
                            + ary.get("imgstep1_2qp6") + ","
                            + ary.get("imgstep1_2qp7") + ","
                            + ary.get("imgstep1_2qp8") + ","
                            + ary.get("imgstep1_2qp9") + ","
                            + ary.get("imgstep1_2qp10");
        ary.put("imgstep1_2qp", imgstep1_2qp);

        return super.add(ary);
    }


    public void setTable(String table) {
        super.setTable(table);
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
        String fieldsString = "t.*,a.name as admin_name,f.name as fs_name"; // 显示字段列表如t.id,t.name,t.dt_edit,字段数显示越少加载速度越快，为空显示所有
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
        leftsql="LEFT JOIN admin a on a.id=t.gems_id " +
                "LEFT JOIN fs f on f.id=t.gems_fs_id ";
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
    public void doPost(TtMap post, long id,TtMap result2) {
        if (id > 0) { // id为0时，新增
            edit(post, id);
        } else {
            add(post);
        }
        String nextUrl = Tools.urlKill("sdo") + "&sdo=list";
        boolean bSuccess = errorCode == 0;
        Tools.formatResult(result2, bSuccess, errorCode, bSuccess ? "编辑"+title+"成功！" : errorMsg,
                bSuccess ? nextUrl : "");//失败时停留在当前页面,nextUrl为空
    }

    /**
     * @description: 重载lists方法，这里可以处理一些lists前的逻辑
     * @param {type}
     * @return:
     */
    @Override
    public TtList lists(String wheres, String f){
        if (!agpOK) {// 演示在需要权限检查的地方插入权限标志判断
            return null;
        }
        TtMap minfo = Tools.minfo();
        if (Tools.myIsNull(wheres)) {
            wheres = (Tools.isSuperAdmin(minfo) || Tools.isCcAdmin(minfo)) ? "" : " gems_fs_id=" + minfo.get("gems_fs_id"); // 只显示自己公司的
        } else {
            wheres += (Tools.isSuperAdmin(minfo) || Tools.isCcAdmin(minfo)) ? "" : " AND gems_fs_id=" + minfo.get("gems_fs_id"); // 只显示自己公司的
        }

        TtList lmss = super.lists(wheres, f);
        for (TtMap tmpInfo : lmss) {
            tmpInfo.put("c_name", Tools.unDic("dd_icbc", tmpInfo.get("icbc_id"), "c_name", "id"));// 所属公司
        }
        return lmss;
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

    @Override
    public void doGetForm(HttpServletRequest request, TtMap post) {

        //查询进件客户列表
        qcpg qcpg = new qcpg();
        TtList getAllOrderName1 = qcpg.selectAllOrderName();
        request.setAttribute("names",getAllOrderName1);

        long nid = Tools.myIsNull(post.get("id")) ? 0 : Tools.strToLong(post.get("id"));
        TtMap info = info(nid);
        String jsonInfo = Tools.jsonEncode(info);
        request.setAttribute("info", jsonInfo);//info为json后的info
        request.setAttribute("infodb", info);//infodb为TtMap的info
        request.setAttribute("id", nid);
    }

    @Override
    public void closeConn() {
        super.closeConn();
    }

}
