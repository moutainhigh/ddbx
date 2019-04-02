package com.example.ddbx.tt.table;

import com.example.ddbx.tt.data.TtList;
import com.example.ddbx.tt.data.TtMap;
import com.example.ddbx.tt.tool.Config;
import com.example.ddbx.tt.tool.DbCtrl;
import com.example.ddbx.tt.tool.DbTools;
import com.example.ddbx.tt.tool.Tools;

import javax.servlet.http.HttpServletRequest;


public class MyTask extends DbCtrl {
    private final String title = "我的任务";
    private String orderString = "ORDER BY dt_edit DESC"; // 默认排序
    private boolean canDel = false;
    private boolean canAdd = false;
    private final String classAgpId = "33"; // 随便填的，正式使用时应该跟model里此模块的ID相对应
    public boolean agpOK = false;// 默认无权限

    public MyTask() {
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
     * @param {type} {type}
     * @说明: 给继承的子类重载用的
     * @return: 返回
     */
    public void doGetForm(HttpServletRequest request, TtMap post) {

        long nid = Tools.myIsNull(post.get("id")) ? 0 : Tools.strToLong(post.get("id"));
        TtMap info = info(nid);
        System.out.println("tab:" + post.get("tab"));
        System.out.println("type_id:" + info.get("type_id"));
        System.out.println("later_status:" + info.get("later_status"));
        String icbcid = info.get("icbc_id");
        //erp任务各板块处理
        if (post.get("tab") != null && !post.get("tab").equals("")) {
            switch (post.get("tab")) {
                case "6":

                    break;
                case "0":
                    //查询订单下板块有无进度
                    System.out.println("进来了没有");
                    TtList erp_stylelist = getdd_icbc_erp(Integer.valueOf(post.get("icbc_id")));
                    request.setAttribute("erp_stylelist", erp_stylelist);
                    break;
                case "1":
                    System.out.println("进来了没有11111");
                    String jcxxsql="select * from dd_icbc where id="+icbcid;
                    TtMap jcxxMap = Tools.recinfo(jcxxsql);
                    request.setAttribute("jcxx", jcxxMap);
                    break;
                case "2":

                    break;
                case "3":
                    //贷款管理
                    String dkglsql = "SELECT kk.*, ic.pg_price, ic.old_owner FROM icbc_kk kk JOIN dd_icbc_cars ic ON kk.icbc_id = ic.icbc_id WHERE kk.icbc_id = " + icbcid;
                    TtMap dkglMap = Tools.recinfo(dkglsql);
                    request.setAttribute("dkgl", dkglMap);
                    break;
                case "4":
                    //车辆信息
                    String sql = "select * from dd_icbc_cars where icbc_id=" + icbcid;
                    TtMap cars = Tools.recinfo(sql);
                    request.setAttribute("cars", cars);
                    break;
                case "5":
                    //System.out.println("id::"+id);
                    //征信查询
                    String zxsql = "SELECT * FROM dd_icbc_erp_result WHERE icbc_id =" + icbcid + " and now_status = 2";
                    TtList zxlist = Tools.reclist(zxsql);
                    request.setAttribute("zx_list", zxlist);
                    //征信通融
                    String trsql = "SELECT * FROM dd_icbc_erp_result WHERE icbc_id =" + icbcid + " AND now_status = 7";
                    TtList trlist = Tools.reclist(trsql);
                    request.setAttribute("tr_list", trlist);
                    //汽车评估
                    String qcsql = "SELECT * FROM dd_icbc_cars WHERE icbc_id =" + icbcid;
                    TtMap qcMap = Tools.recinfo(qcsql);
                    request.setAttribute("qc_Map", qcMap);
                    //开卡申请
                    String kksql = "SELECT * FROM icbc_kk WHERE icbc_id =" + icbcid;
                    TtMap kkMap = Tools.recinfo(kksql);
                    System.out.println("kk:" + kkMap);
                    request.setAttribute("kkMap", kkMap);
                    //汽车贷款
                    String dksql = "SELECT * FROM dd_icbc_materials WHERE icbc_id =" + icbcid;
                    TtMap dkMap = Tools.recinfo(dksql);
                    request.setAttribute("dk_Map", dkMap);

                    break;
                default:

                    break;

            }
        }
        //主板块信息
        TtMap icbc = geticbc_detail(Integer.valueOf(post.get("icbc_id")));
        request.setAttribute("icbc", icbc);


        TtList clgc_list = getclgc();
        if (clgc_list != null && clgc_list.size() > 0) {
            request.setAttribute("clgc_list", clgc_list);
        }
        if (post.get("type_id") != null && !post.get("type_id").equals("")) {
            request.setAttribute("type_id", post.get("type_id"));
            TtList erplist = geterplist(Integer.valueOf(post.get("id")), Integer.valueOf(post.get("type_id")));
            if (erplist != null && erplist.size() > 0) {
                request.setAttribute("erplist", erplist);
            }
        }
        //获取当前任务节点信息
        TtMap erp_result = Tools.recinfo("select r.* from dd_icbc_erp_result r where r.qryid=" + nid + " ORDER BY r.id DESC limit 1");
        request.setAttribute("erp_result", erp_result);
        if (erp_result.get("result_value") != null && !erp_result.get("result_value").equals("")) {
            request.setAttribute("erp_result_value", Tools.jsonDeCode_mp(erp_result.get("result_value")));
        }
        //进度板块处理  erp id  不对应问题
        TtList jdlist = Tools.reclist("select * from dd_icbc_erp where icbc_id=" + post.get("icbc_id"));
        request.setAttribute("jdlist", jdlist);


        TtMap modals = get_sys_modal_name(Integer.valueOf(post.get("type_id")), Integer.valueOf(info.get("later_status")));
        request.setAttribute("modals", modals);


        String jsonInfo = Tools.jsonEncode(info);

        request.setAttribute("info", jsonInfo);//info为json后的info
        request.setAttribute("infodb", info);//infodb为TtMap的info
        request.setAttribute("id", nid);
        request.setAttribute("sHideButton", "true");//隐藏保存提交和取消返回标志
    }

    /**
     * 获取订单详细信息
     *
     * @param id
     * @return
     */
    public TtMap geticbc_detail(int id) {
        String sql = "select *," +
                "a.name as admin_name," +
                "f.name as fs_name" +
                " from  " +
                "dd_icbc i " +
                "LEFT JOIN dd_icbc_materials im ON im.icbc_id=i.id " +
                "LEFT JOIN admin a ON a.id=i.gems_id " +
                "LEFT JOIN fs f ON f.id=i.gems_fs_id " +
                "where i.id=" + id;
        return Tools.recinfo(sql);
    }

    /**
     * 查询订单下所有任务板块
     *
     * @return
     */
    public TtList getdd_icbc_erp(int icbc_id) {
        String sql = "select type_id from dd_icbc_erp where icbc_id=" + icbc_id;
        return Tools.reclist(sql);
    }

    /**
     * 获取处理过程显示数据
     *
     * @param
     */
    public TtList getclgc() {
        TtMap minfo = Tools.minfo();// 当前登陆用户信息
        TtMap infoAgp = Tools.recinfo("select * from fs where id=" + minfo.get("fsid"));// 用户所属角色组信息
        String strAgp = "," + infoAgp.get("purview_map"); // 此角色组拥有的权限集合
        System.out.println("purview_map:" + strAgp);
        String sql = "select * from sys_modal where type='rwcl' and id_uplevel=0 order by sort";
        TtList ttList = Tools.reclist(sql);
        TtList newlist = new TtList();
        for (int i = 0; i < ttList.size(); i++) {
            TtMap map = ttList.get(i);
            if (strAgp.contains("," + map.get("id") + ",")) {
                TtMap nmap = ttList.get(i);
                newlist.add(nmap);
            }
        }
        System.out.println("newlist:" + Tools.jsonEncode(newlist));
        return newlist;
    }

//    public static void main(String[] args) {
//    String s=",21,10,27,22,26,11,66,67,89,64,65,110,111,112,9,31,36,113,114,1,115,144,5,14,88,148,149,81,98,127,126,125,13,124,123,122,121,146,120,145,93,92,91,90,97,96,95,94,23,25,6,38,63,102,101,104,103,106,20,105,119,108,109,118,39,107,117,72,71,74,73,76,100,75,43,44,45,46,51,24,50,33,32,41,40,80,48,78,49,77,79,82,83,70,84,85,86,19,87,42,47,28,29,116,8,7,4,99,3,30,";
//    System.out.println("hahah:"+s.contains(",63,"));
//    }

    /**
     * 获取订单单个版块类型 所有进度数据
     *
     * @return
     */
    public TtList geterplist(int id, int type_id) {
        String sql = "select " +
                " e.*, " +
                " (select  " +
                " s2.name as now_name " +
                " from  " +
                " (select id,name,sort from sys_modal where type='rwcl' and id_uplevel=0 order by sort) s1 " +
                " LEFT JOIN sys_modal s2 ON s2.id_uplevel=s1.id " +
                " where s1.id=e.type_id and s2.sort=e.now_status) as now_name," +
                " a.name as admin_name" +
                " from dd_icbc_erp_result e " +
                "LEFT JOIN admin a ON a.id=e.mid_add " +
                "where e.qryid=" + id + " and e.type_id=" + type_id;
        TtList list = Tools.reclist(sql);
        for (int i = 0; i < list.size(); i++) {
            TtMap map = list.get(i);
            TtMap map1 = Tools.recinfo("select r1.id,r1.dt_edit from  dd_icbc_erp_result r1 where r1.qryid=" + id + " and r1.type_id=" + type_id + " and r1.id!=" + map.get("id") + " and r1.id<" + map.get("id") + " ORDER BY r1.id  DESC limit 1");
            map.put("s_time", map1.get("dt_edit"));
        }
        System.out.println("list:" + list);
        return list;
    }

    //list 处理
    public void doGetList(HttpServletRequest request, TtMap post) {
        if (!agpOK) {// 演示在需要权限检查的地方插入权限标志判断
            request.setAttribute("errorMsg", errorMsg);
            return;
        }
        TtMap minfo = Tools.minfo();//获取当前登录用户信息
        String kw = ""; // 搜索关键字
        String dtbe = ""; // 搜索日期选择
        int pageInt = Integer.valueOf(Tools.myIsNull(post.get("p")) == false ? post.get("p") : "1"); // 当前页
        int limtInt = Integer.valueOf(Tools.myIsNull(post.get("l")) == false ? post.get("l") : "10"); // 每页显示多少数据量
        String whereString = "t.gems_fs_id=" + minfo.get("fsid");
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
        leftsql = "LEFT JOIN admin a on a.id=t.gems_id " +
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
     *
     * @return
     */
    public static TtList geticbc_erp_type() {
        TtList ttList = new TtList();
        DbTools dbTools = new DbTools();
        String sql = "select id,name,sort from sys_modal where type='rwcl' and id_uplevel=0 order by sort";
        try {
            ttList = dbTools.reclist(sql);
        } catch (Exception e) {
            Tools.logError(e.getMessage());
            if (Config.DEBUGMODE) {
                e.printStackTrace();
            }
        } finally {
            dbTools.closeConn();
        }
        return ttList;
    }

    /**
     * 获取erp 单个类型name
     *
     * @return
     */
    public static TtMap geticbc_erp_status(int id) {
        TtMap ttMap = new TtMap();
        DbTools dbTools = new DbTools();
        String sql = "select id,name,sort from sys_modal where id=" + id;
        try {
            ttMap = dbTools.recinfo(sql);
        } catch (Exception e) {
            Tools.logError(e.getMessage());
            if (Config.DEBUGMODE) {
                e.printStackTrace();
            }
        } finally {
            dbTools.closeConn();
        }
        return ttMap;
    }

    /**
     * 获取erp 任务节点name1
     *
     * @return
     */
    public static TtMap get_sys_modal_name(int type_id, int id) {

        String sql = "select * from sys_modal where id_uplevel=" + type_id + " and sort=" + id;
        return Tools.recinfo(sql);
    }

    /**
     * 获取erp 任务节点name2
     *
     * @return
     */
    public static TtMap geticbc_erp_status_node(int type_id, int id1, int id2) {
        TtMap ttMap = new TtMap();
        DbTools dbTools = new DbTools();
        String sql = "select  " +
                "s1.name as type_name, " +
                "s2.name as now_name, " +
                "s3.name as later_name " +
                "from  " +
                "(select id,name,sort from sys_modal where type='rwcl' and id_uplevel=0 order by sort) s1 " +
                "LEFT JOIN sys_modal s2 ON s2.id_uplevel=s1.id " +
                "LEFT JOIN sys_modal s3 ON s3.id_uplevel=s1.id " +
                "where s1.id=" + type_id + " and s2.sort=" + id1 + " and s3.sort=" + id2;
        try {
            ttMap = dbTools.recinfo(sql);
        } catch (Exception e) {
            Tools.logError(e.getMessage());
            if (Config.DEBUGMODE) {
                e.printStackTrace();
            }
        } finally {
            dbTools.closeConn();
        }
        return ttMap;
    }
//    public static void main(String[] args) {
//        TtMap ttMap= geticbc_erp_status_node(36,2);
//
//        System.out.println(ttMap);
//    }


}
