package com.example.ddbx.tt.table;

import com.alibaba.druid.pool.DruidPooledConnection;
import com.example.ddbx.tt.data.TtList;
import com.example.ddbx.tt.data.TtMap;
import com.example.ddbx.tt.tool.*;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class AllTask extends DbCtrl {
    private final String title = "全部任务";
    private String orderString = "ORDER BY dt_edit DESC"; // 默认排序
    private boolean canDel = false;
    private boolean canAdd = false;
    private final String classAgpId = "6"; // 随便填的，正式使用时应该跟model里此模块的ID相对应
    public boolean agpOK = false;// 默认无权限

    public AllTask() {
        super("dd_icbc_erp");
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
     * 获取处理过程显示数据
     * @param request
     */
    public TtList getclgc(){
        DbTools myDbTools=new DbTools();
        String sql="select * from sys_modal where type='rwcl' and id_uplevel=0 order by sort";
        TtList clgc_list = null;
        try {
            clgc_list = myDbTools.reclist(sql);
        }catch (Exception e) {
            Tools.logError(e.getMessage(), true, false);
        }finally {
            myDbTools.closeConn();
        }
        return clgc_list;
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
        String fieldsString = "t.*,a.name as admin_name,f.name as fs_name" +
                ",sm.name as type_name" +
                ",(select name from sys_modal  where type='rwcl' and id_uplevel=t.type_id and sort=t.later_status) as later_name," +
                "(select name from sys_modal  where type='rwcl' and id_uplevel=t.type_id and sort=t.now_status) as now_name ";
        // 显示字段列表如t.id,t.name,t.dt_edit,字段数显示越少加载速度越快，为空显示所有
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


        whereString += tmpWhere; // 过滤
        orders = orderString;// 排序
        p = pageInt; // 显示页
        limit = limtInt; // 每页显示记录数
        showall = true; // 忽略deltag和showtag
        leftsql="LEFT JOIN admin a on a.id=t.gems_id " +
                "LEFT JOIN fs f on f.id=t.gems_fs_id " +
                "LEFT JOIN sys_modal sm ON sm.id=t.type_id ";
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


    /**
     * 获取erp所有版块类型数据
     * @return
     */
    public static TtList geticbc_erp_type(){
        TtList ttList=new TtList();
        DbTools dbTools=new DbTools();
        String sql="select id,name,sort from sys_modal where type='rwcl' and id_uplevel=0 order by sort";
        try{
            ttList=dbTools.reclist(sql);
        }catch(Exception e){
            Tools.logError(e.getMessage());
            if (Config.DEBUGMODE) {
                e.printStackTrace();
            }
        }finally{
            dbTools.closeConn();
        }
        return ttList;
    }

    /**
     * 获取erp 单个类型name
     * @return
     */
    public static TtMap geticbc_erp_status(int id){
        TtMap ttMap=new TtMap();
        DbTools dbTools=new DbTools();
        String sql="select id,name,sort from sys_modal where id="+id;
        try{
            ttMap=dbTools.recinfo(sql);
        }catch(Exception e){
            Tools.logError(e.getMessage());
            if (Config.DEBUGMODE) {
                e.printStackTrace();
            }
        }finally{
            dbTools.closeConn();
        }
        return ttMap;
    }
    /**
     * 获取erp 任务节点name
     * @return
     */
    public static TtMap geticbc_erp_status_node(int type_id,int id1,int id2){
        TtMap ttMap=new TtMap();
        DbTools dbTools=new DbTools();
        String sql="select " +
                "s1.name as type_name, " +
                "s2.name as now_name, " +
                "s3.name as later_name " +
                "from  " +
                "(select id,name,sort from sys_modal where type='rwcl' and id_uplevel=0 order by sort) s1 " +
                "LEFT JOIN sys_modal s2 ON s2.id_uplevel=s1.id " +
                "LEFT JOIN sys_modal s3 ON s3.id_uplevel=s1.id " +
                "where s1.id="+type_id+" and s2.sort="+id1+" and s3.sort="+id2;
        try{
            ttMap=dbTools.recinfo(sql);
        }catch(Exception e){
            Tools.logError(e.getMessage());
            if (Config.DEBUGMODE) {
                e.printStackTrace();
            }
        }finally{
            dbTools.closeConn();
        }
        return ttMap;
    }
}
