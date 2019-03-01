package com.example.ddbx.tt.table;

import com.example.ddbx.tt.data.TtList;
import com.example.ddbx.tt.data.TtMap;
import com.example.ddbx.tt.tool.Config;
import com.example.ddbx.tt.tool.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.text.DecimalFormat;


public class spmq extends DbCtrl {

    private final String title = "视频面签";
    private String orderString = "ORDER BY dt_edit DESC"; // 默认排序
    private boolean canDel = false;
    private boolean canAdd = true;
    private final String classAgpId = "6"; // 随便填的，正式使用时应该跟model里此模块的ID相对应
    public boolean agpOK = false;// 默认无权限

    public spmq() {
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
        DbTools myDbTools=new DbTools();
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
        //从dd_icbc表中查询出id,gems_fs_id,gems_id,order_code
        DbTools myDbTools=new DbTools();
        String sql="select id,gems_fs_id,gems_id,order_code,c_tel,c_cardno from dd_icbc where id="+ary.get("icbc_id");
        TtMap ontCustomer = null;
        try {
            ontCustomer = myDbTools.recinfo(sql);
            recs = Long.parseLong(myDbTools.recexec_getvalue("SELECT FOUND_ROWS() as rno;", "rno"));
        }catch (Exception e) {
            Tools.logError(e.getMessage(), true, false);
        }finally {
            myDbTools.closeConn();
        }

        //从dd_icbc表中查询出id,gems_fs_id,gems_id,order_code


        //向dd_icbc_erp表中添加数据
        DbCtrl dbCtrl1 = new DbCtrl("dd_icbc_erp");
        TtMap ttMap1 = new TtMap();
        ttMap1.put("c_name",ary.get("c_name"));
        ttMap1.put("icbc_id",ontCustomer.get("id"));
        ttMap1.put("gems_fs_id",ontCustomer.get("gems_fs_id"));
        ttMap1.put("gems_id",ontCustomer.get("gems_id"));
        ttMap1.put("order_id",ary.get("icbc_id"));
        ttMap1.put("type_id","3");
        ttMap1.put("later_status","11");
        ttMap1.put("now_status","10");
        ttMap1.put("c_tel",ontCustomer.get("c_tel"));
        ttMap1.put("c_cardno",ontCustomer.get("c_cardno"));
        ttMap1.put("adminop_tag", Tools.minfo().get("id")); //当前操作人id
        dbCtrl1.add(ttMap1);
        dbCtrl1.closeConn();

        //向dd_icbc_erp_result表中添加数据
        DbCtrl dbCtrl2 = new DbCtrl("dd_icbc_erp_result");
        TtMap ttMap2 = new TtMap();
        ttMap2.put("order_id",ary.get("icbc_id"));
        ttMap2.put("type_id","3");
        ttMap2.put("later_status","11");
        ttMap2.put("now_status","10");
        dbCtrl2.add(ttMap2);
        dbCtrl2.closeConn();

        // 本表操作添加数据
        //ary.put("order_id",ontCustomer.get("id"));
        ary.put("gems_fs_id",ontCustomer.get("gems_fs_id"));
        ary.put("gems_id",ontCustomer.get("gems_id"));
        DecimalFormat countFormat = new DecimalFormat("000000000");
        ary.put("order_code","S"+countFormat.format(Integer.parseInt(ontCustomer.get("id"))));
        ary.put("videostep1",ary.get("videostep1"));

        return super.add(ary);
    }

    @Override
    public void setTable(String table) {
        super.setTable(table);
    }


    //list 处理
    @Override
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
            tmpInfo.put("fsname", Tools.unDic("dd_fs", Tools.strToLong(tmpInfo.get("gems_fs_id"))));// 所属公司
            tmpInfo.put("c_name", Tools.unDic("dd_icbc", Tools.strToLong(tmpInfo.get("order_id"))));//客户姓名
        }
        return lmss;
    }
    @Override
    public void closeConn() {
        super.closeConn();
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
}
