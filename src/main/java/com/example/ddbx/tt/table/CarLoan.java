package com.example.ddbx.tt.table;

import com.example.ddbx.tt.data.TtList;
import com.example.ddbx.tt.data.TtMap;
import com.example.ddbx.tt.manager.ManagerTools;
import com.example.ddbx.tt.tool.*;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.sql.Time;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;

import static com.example.ddbx.tt.tool.Tools.time;

public class CarLoan extends DbCtrl {

    private final String title = "汽车贷款";
    private String orderString = "ORDER BY dt_edit DESC"; // 默认排序
    private boolean canDel = false;
    private boolean canAdd = true;
    private final String classAgpId = "148"; // 随便填的，正式使用时应该跟model里此模块的ID相对应
    public boolean agpOK = false;// 默认无权限

    public CarLoan() {
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


    /**
     * @说明: 给继承的子类重载用的
     * @param {type} {type}
     * @return: 返回
     */
    public void doGetForm(HttpServletRequest request, TtMap post) {
        long nid = Tools.myIsNull(post.get("id"))?0:Tools.strToLong(post.get("id"));
        TtMap info = info(nid);
        String jsonInfo = Tools.jsonEncode(info);
        request.setAttribute("info", jsonInfo);//info为json后的info
        request.setAttribute("infodb", info);//infodb为TtMap的info
        request.setAttribute("id", nid);
        request.setAttribute("names",selectAllOrderName());
    }

    /**
     * @description: 重载edit方法，可以在这里处理一些edit逻辑
     * @param {type}
     * @return:
     */
    @Override
    public int edit(TtMap ary, long id) {
        String icbc_id = ary.get("icbc_id");
        //1 其他表操作  add
//        TtMap carLoanErpStatus = new TtMap();
//        carLoanErpStatus.put("now_status","32"); //提交查询
//        carLoanErpStatus.put("later_status","33"); //专员审核
        Tools.recexec("update dd_icbc_erp set now_status=32,later_status=33 where type_id=70 and icbc_id="+icbc_id);
        //添加订单状态
        DbTools dbTools = new DbTools();
        dbTools.recupdate("update dd_icbc_status set car_loan_status=1 where icbc_id="+icbc_id);
        //2 本表操作
        //证明材料
        String imgstep9_1ss =
                ary.get("imgstep9_1ss1")+","
                        +ary.get("imgstep9_1ss2")+","
                        +ary.get("imgstep9_1ss3")+","
                        +ary.get("imgstep9_1ss4")+","
                        +ary.get("imgstep9_1ss5")+","
                        +ary.get("imgstep9_1ss6");
        ary.put("imgstep9_1ss",imgstep9_1ss);
        //合同材料
        String imgstep9_2ss =
                ary.get("imgstep9_2ss1")+","
                        +ary.get("imgstep9_2ss2")+","
                        +ary.get("imgstep9_2ss3")+","
                        +ary.get("imgstep9_2ss4")+","
                        +ary.get("imgstep9_2ss5")+","
                        +ary.get("imgstep9_2ss6")+","
                        +ary.get("imgstep9_2ss7")+","
                        +ary.get("imgstep9_2ss8")+","
                        +ary.get("imgstep9_2ss9")+","
                        +ary.get("imgstep9_2ss10")+","
                        +ary.get("imgstep9_2ss11")+","
                        +ary.get("imgstep9_2ss12")+","
                        +ary.get("imgstep9_2ss13")+","
                        +ary.get("imgstep9_2ss14")+","
                        +ary.get("imgstep9_2ss15")+","
                        +ary.get("imgstep9_2ss16")+","
                        +ary.get("imgstep9_2ss17")+","
                        +ary.get("imgstep9_2ss18")+","
                        +ary.get("imgstep9_2ss19")+","
                        +ary.get("imgstep9_2ss20")+","
                        +ary.get("imgstep9_2ss21")+","
                        +ary.get("imgstep9_2ss22")+","
                        +ary.get("imgstep9_2ss23")+","
                        +ary.get("imgstep9_2ss24")+","
                        +ary.get("imgstep9_2ss25")+","
                        +ary.get("imgstep9_2ss26")+","
                        +ary.get("imgstep9_2ss27");
        ary.put("imgstep9_2ss",imgstep9_2ss);
        //其他材料
        String imgstep9_3ss =
                ary.get("imgstep9_3ss1")+","
                        +ary.get("imgstep9_3ss2")+","
                        +ary.get("imgstep9_3ss3")+","
                        +ary.get("imgstep9_3ss4");
        ary.put("imgstep9_3ss",imgstep9_3ss);
        //补充材料
        String imgstep9_4ss =
                ary.get("imgstep9_4ss1")+","
                        +ary.get("imgstep9_4ss2")+","
                        +ary.get("imgstep9_4ss3")+","
                        +ary.get("imgstep9_4ss4");
        ary.put("imgstep9_4ss",imgstep9_4ss);

        TtMap erpMap = Tools.recinfo("select * from dd_icbc_erp where icbc_id="+ary.get("icbc_id")+" and type_id=70");

        //向dd_icbc_erp_result表中添加数据 start
        DbCtrl dbCtrl2 = new DbCtrl("dd_icbc_erp_result");
        try {
            //添加 提交查询
            TtMap ttMap2 = new TtMap();
            ttMap2.put("qryid",String.valueOf(erpMap.get("id")));
            ttMap2.put("icbc_id",erpMap.get("icbc_id"));
            ttMap2.put("type_id","70");
            ttMap2.put("later_status","33");
            ttMap2.put("now_status","32");
            ttMap2.put("result_value",Tools.jsonEncode(ary));
            dbCtrl2.add(ttMap2);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            dbCtrl2.closeConn();
        }
        //向dd_icbc_erp_result表中添加数据 end
        return super.edit(ary, id);
    }

    //汽车贷款进件 查询全部征信订单并选择一个进件
    public TtList selectAllOrderName(){
        DbTools myDbTools=new DbTools();
        String sql="SELECT icbc.id,icbc.c_name FROM dd_icbc icbc LEFT JOIN dd_icbc_status st ON icbc.id=st.icbc_id WHERE (st.zx_status=3)OR(st.zx_status=5 and tr_status=3)";
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

    //通过icbc_id 获取到用户主订单信息
    public TtMap getInfoByIcbc_id(String icbc_id){
        DbTools myDbTools=new DbTools();
        String sql="select * from dd_icbc where id="+icbc_id;
        TtMap ontCustomer = null;
        try {
            ontCustomer = myDbTools.recinfo(sql);
            recs = Long.parseLong(myDbTools.recexec_getvalue("SELECT FOUND_ROWS() as rno;", "rno"));
        }catch (Exception e) {
            Tools.logError(e.getMessage(), true, false);
        }finally {
            myDbTools.closeConn();
        }
        return ontCustomer;
    }

    public TtMap selectCarLoanPlate(String icbc_id) {
        DbTools myDbTools = new DbTools();
        String sql = "select count(*) sum,e.* from dd_icbc_erp e where type_id=70 and icbc_id=" + icbc_id;
        TtMap ontCustomer = null;
        try {
            ontCustomer = myDbTools.recinfo(sql);
            recs = Long.parseLong(myDbTools.recexec_getvalue("SELECT FOUND_ROWS() as rno;", "rno"));
        } catch (Exception e) {
            Tools.logError(e.getMessage(), true, false);
        } finally {
            myDbTools.closeConn();
        }
        return ontCustomer;
    }

    public TtMap selectCarLoanPlateInto(String icbc_id) {
        DbTools myDbTools = new DbTools();
        String sql = "select count(*) sum,e.* from dd_icbc_materials e where icbc_id=" + icbc_id;
        TtMap ontCustomer = null;
        try {
            ontCustomer = myDbTools.recinfo(sql);
            recs = Long.parseLong(myDbTools.recexec_getvalue("SELECT FOUND_ROWS() as rno;", "rno"));
        } catch (Exception e) {
            Tools.logError(e.getMessage(), true, false);
        } finally {
            myDbTools.closeConn();
        }
        return ontCustomer;
    }

    @Override
    public long add(TtMap ary){
        //添加时先判断一下有没有这个板块，如果有该板块>0就不添加，没有0该板块就添加
        String icbc_id = ary.get("icbc_id");
        TtMap ttMap = selectCarLoanPlate(icbc_id);
        System.err.println(ttMap.get("sum")+"-99999999999999"+ttMap.get("sum").equals("0"));
        //添加订单状态
        DbTools dbTools = new DbTools();
        dbTools.recupdate("update dd_icbc_status set car_loan_status=1 where icbc_id="+icbc_id);
        // 没有该板块添加
        if(ttMap.get("sum").equals("0")){
            //首先通过获取到主订单id查询到客户的主订单信息
            TtMap ontCustomer = getInfoByIcbc_id(icbc_id);
            //1本表操作
            ary.put("icbc_id",ontCustomer.get("id"));
            ary.put("gems_fs_id",ontCustomer.get("gems_fs_id"));
            ary.put("gems_id",ontCustomer.get("gems_id"));
            //订单编号生成规则1: C(1位)+用户id(9位)
            //JAVA补字符串固定位数，位数不够左补0操作
            DecimalFormat countFormat = new DecimalFormat("000000000");
            ary.put("order_code","C"+countFormat.format(Integer.parseInt(ontCustomer.get("id"))));
            //证明材料
            String imgstep9_1ss =
                    ary.get("imgstep9_1ss1")+","
                            +ary.get("imgstep9_1ss2")+","
                            +ary.get("imgstep9_1ss3")+","
                            +ary.get("imgstep9_1ss4")+","
                            +ary.get("imgstep9_1ss5")+","
                            +ary.get("imgstep9_1ss6");
            ary.put("imgstep9_1ss",imgstep9_1ss);
            //合同材料
            String imgstep9_2ss =
                    ary.get("imgstep9_2ss1")+","
                            +ary.get("imgstep9_2ss2")+","
                            +ary.get("imgstep9_2ss3")+","
                            +ary.get("imgstep9_2ss4")+","
                            +ary.get("imgstep9_2ss5")+","
                            +ary.get("imgstep9_2ss6")+","
                            +ary.get("imgstep9_2ss7")+","
                            +ary.get("imgstep9_2ss8")+","
                            +ary.get("imgstep9_2ss9")+","
                            +ary.get("imgstep9_2ss10")+","
                            +ary.get("imgstep9_2ss11")+","
                            +ary.get("imgstep9_2ss12")+","
                            +ary.get("imgstep9_2ss13")+","
                            +ary.get("imgstep9_2ss14")+","
                            +ary.get("imgstep9_2ss15")+","
                            +ary.get("imgstep9_2ss16")+","
                            +ary.get("imgstep9_2ss17")+","
                            +ary.get("imgstep9_2ss18")+","
                            +ary.get("imgstep9_2ss19")+","
                            +ary.get("imgstep9_2ss20")+","
                            +ary.get("imgstep9_2ss21")+","
                            +ary.get("imgstep9_2ss22")+","
                            +ary.get("imgstep9_2ss23")+","
                            +ary.get("imgstep9_2ss24")+","
                            +ary.get("imgstep9_2ss25")+","
                            +ary.get("imgstep9_2ss26")+","
                            +ary.get("imgstep9_2ss27");
            ary.put("imgstep9_2ss",imgstep9_2ss);
            //其他材料
            String imgstep9_3ss =
                    ary.get("imgstep9_3ss1")+","
                            +ary.get("imgstep9_3ss2")+","
                            +ary.get("imgstep9_3ss3")+","
                            +ary.get("imgstep9_3ss4");
            ary.put("imgstep9_3ss",imgstep9_3ss);
            //补充材料
            String imgstep9_4ss =
                    ary.get("imgstep9_4ss1")+","
                            +ary.get("imgstep9_4ss2")+","
                            +ary.get("imgstep9_4ss3")+","
                            +ary.get("imgstep9_4ss4");
            ary.put("imgstep9_4ss",imgstep9_4ss);

            //icbc操作添加记录  start
            DbCtrl testdb = new DbCtrl("dd_icbc_erp");
            long id = 0;
            try {
                TtMap info = new TtMap();
                info.put("later_status", "33"); //下一任务节点:专员审核结果
                info.put("now_status", "32"); //当前任务状态节点:专员审核中
                info.put("icbc_id", icbc_id);
                info.put("gems_id", ontCustomer.get("gems_id"));
                info.put("gems_fs_id", ontCustomer.get("gems_fs_id"));
                info.put("type_id", "70"); //业务类型id
                info.put("c_name", ontCustomer.get("c_name"));
                info.put("c_tel", ontCustomer.get("c_tel"));
                info.put("c_cardno", ontCustomer.get("c_cardno"));
                info.put("c_carvin", ontCustomer.get("c_carvin")); //暂无暂无
                info.put("c_carno", ontCustomer.get("c_carno"));
                info.put("adminop_tag", Tools.minfo().get("id")); //当前操作人id
                /*
                 * 新增一条记录,返回生成记录的id
                 */
                id = testdb.add(info);
                System.out.println("新增的ID为：" + id);
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                testdb.closeConn();
            }
            //icbc操作添加记录  end
            //向dd_icbc_erp_result表中添加数据 start
            DbCtrl dbCtrl2 = new DbCtrl("dd_icbc_erp_result");
            try {
                //添加 开始
                TtMap ttMap1 = new TtMap();
                ttMap1.put("qryid",id+"");
                ttMap1.put("icbc_id",icbc_id);
                ttMap1.put("type_id","70");
                ttMap1.put("later_status","32");
                ttMap1.put("now_status","31");
                dbCtrl2.add(ttMap1);
                //添加 提交查询
                TtMap ttMap2 = new TtMap();
                ttMap2.put("qryid",id+"");
                ttMap2.put("icbc_id",icbc_id);
                ttMap2.put("type_id","70");
                ttMap2.put("later_status","33");
                ttMap2.put("now_status","32");
                ttMap2.put("result_value",Tools.jsonEncode(ary));
                dbCtrl2.add(ttMap2);
            }catch (Exception e){
                e.printStackTrace();
            }finally {
                dbCtrl2.closeConn();
            }
            //向dd_icbc_erp_result表中添加数据 end
            TtMap ttMap2 = selectCarLoanPlateInto(icbc_id);
            if(ttMap2.get("sum").equals("0")){ //如果没有有汽车贷款进件就添加
                return super.add(ary);
            }else{//如果有汽车贷款进件就不添加
                return 0;
            }
        }
        return 0;
    }

    @Override
    public void setTable(String table) {
        super.setTable(table);
    }

    /**
     * @description: 处理后台的get,演示独立类处理sdo=list的get
     * @param {type}
     * @return:
     */
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
//        leftsql = "LEFT JOIN admin a on a.id=t.gems_id " +
//                "LEFT JOIN fs f on f.id=t.gems_fs_id ";
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
            tmpInfo.put("fsname", Tools.unDic("fs", Tools.strToLong(tmpInfo.get("gems_fs_id"))));// 所属公司
            tmpInfo.put("name", Tools.unDic("admin", Tools.strToLong(tmpInfo.get("gems_id"))));// 所属公司业务员名字
            tmpInfo.put("choice", Tools.dicopt("sys_dic_tag", Tools.strToLong(tmpInfo.get("showtag")))); // 显示/隐藏
            tmpInfo.put("c_name", Tools.unDic("dd_icbc", Tools.strToLong(tmpInfo.get("icbc_id"))));// 客户订单名字
            tmpInfo.put("car_loan_status", Tools.unDic("dd_icbc_status", Tools.strToLong(tmpInfo.get("icbc_id"))));// 客户订单状态
        }
        return lmss;
    }



    @Override
    public void closeConn() {
        super.closeConn();
    }

}
