package com.example.ddbx.tt.table;

import com.alibaba.druid.pool.DruidPooledConnection;
import com.example.ddbx.tt.data.TtList;
import com.example.ddbx.tt.data.TtMap;
import com.example.ddbx.tt.tool.Config;
import com.example.ddbx.tt.tool.DbCtrl;
import com.example.ddbx.tt.tool.Tools;

import javax.servlet.http.HttpServletRequest;

public class kk extends DbCtrl {

    private final String title = "全部任务";
    private String orderString = "ORDER BY dt_add DESC"; // 默认排序
    private boolean canDel = true;
    private boolean canAdd = true;
    private final String classAgpId = "32"; // 随便填的，正式使用时应该跟model里此模块的ID相对应
    public boolean agpOK = false;// 默认无权限

    public kk() {
        super("icbc_kk");
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


    @Override//遍历list
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
        String whereString = "true";
        String tmpWhere = "";
        String fieldsString = "";
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
        leftsql = "";
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

    @Override//遍历form
    public void doGetForm(HttpServletRequest request, TtMap post) {

        long nid = Tools.myIsNull(post.get("id")) ? 0 : Tools.strToLong(post.get("id"));

        //获取补充材料信息
        TtList bclist=Tools.reclist("select * from icbc_kk_bcxx where kk_id="+nid);
        request.setAttribute("bclist", bclist);

        TtMap info = info(nid);
        String jsonInfo = Tools.jsonEncode(info);
        request.setAttribute("info", jsonInfo);//info为json后的info
        request.setAttribute("infodb", info);//infodb为TtMap的info
        request.setAttribute("id", nid);
    }

    @Override//添加更新
    public void doPost(TtMap post, long id, TtMap result2) {
        //chk(post,id);//验证
        //System.out.println("接收到的post：" + Tools.jsonEncode(post));
        TtMap newpost = Tools.jsonDeCode_mp(Tools.jsonEncode(post));
        topost(post);//图片处理
        if (id > 0) { // id为0时，新增
            edit(post, id);
            //补充材料信息处理
            for (int l = 1; l <= 4; l++) {
                TtMap oldmap = Tools.recinfo("select * from icbc_kk_bcxx where icbc_id=" + post.get("icbc_id") + " and kk_id=" + id + " and bc_type=" + l);
                System.out.println("婚姻状况：" + newpost.get("hyzk" + l));
                TtMap map = new TtMap();
                if (!Tools.myIsNull(newpost.get("hyzk" + l))) {
                    System.out.println("1");
                    map.put("hyzk", newpost.get("hyzk" + l));
                }else{
                    map.put("hyzk", "0");
                }
                if (!Tools.myIsNull(newpost.get("ysr" + l))) {
                    System.out.println("2");
                    map.put("ysr", newpost.get("ysr" + l));
                }else{
                    map.put("ysr","0");
                }
                if (!Tools.myIsNull(newpost.get("xl" + l))) {
                    System.out.println("3");
                    map.put("xl", newpost.get("xl" + l));
                }else{
                    map.put("xl","0");
                }
                if (!Tools.myIsNull(newpost.get("jzzk" + l))) {
                    map.put("jzzk", newpost.get("jzzk" + l));
                }else{
                    map.put("jzzk","0");
                }
                if (!Tools.myIsNull(newpost.get("xzdz" + l))) {
                    map.put("xzdz", newpost.get("xzdz" + l));
                }else{
                    map.put("xzdz","");
                }
                if (!Tools.myIsNull(newpost.get("yzbm" + l))) {
                    map.put("yzbm", newpost.get("yzbm" + l));
                }else{
                    map.put("yzbm","");
                }
                if (!Tools.myIsNull(newpost.get("gzdw" + l))) {
                    map.put("gzdw", newpost.get("gzdw" + l));
                }else{
                    map.put("gzdw","");
                }

                if (!Tools.myIsNull(newpost.get("dwdh" + l))) {
                    map.put("dwdh", newpost.get("dwdh" + l));
                }else{
                    map.put("dwdh","");
                }
                if (!Tools.myIsNull(newpost.get("dwdz" + l))) {
                    map.put("dwdz", newpost.get("dwdz" + l));
                }else{
                    map.put("dwdz","");
                }
                if (!Tools.myIsNull(newpost.get("dwxz" + l))) {
                    map.put("dwxz", newpost.get("dwxz" + l));
                }else{
                    map.put("dwxz","");
                }
                if (!Tools.myIsNull(newpost.get("wsdz" + l))) {
                    map.put("wsdz", newpost.get("wsdz" + l));
                }else{
                    map.put("wsdz","");
                }
                if (!Tools.myIsNull(newpost.get("wssddz" + l))) {
                    map.put("wssddz", newpost.get("wssddz" + l));
                }else{
                    map.put("wssddz","");
                }
                if (!Tools.myIsNull(newpost.get("sshy" + l))) {
                    map.put("sshy", newpost.get("sshy" + l));
                }else{
                    map.put("sshy","0");
                }
                if (!Tools.myIsNull(newpost.get("zy" + l))) {
                    map.put("zy", newpost.get("zy" + l));
                }else{
                    map.put("zy","0");
                }
                if (!Tools.myIsNull(newpost.get("zw" + l))) {
                    map.put("zw", newpost.get("zw" + l));
                }else{
                    map.put("zw","0");
                }
                if (!Tools.myIsNull(newpost.get("gznx" + l))) {
                    map.put("gznx", newpost.get("gznx" + l));
                }else{
                    map.put("gznx","");
                }
                System.out.println("oldmap:"+oldmap);
                if (!oldmap.isEmpty()) {
                    Tools.recEdit(map, "icbc_kk_bcxx", Long.valueOf(oldmap.get("id")));
                } else {
                    System.out.println("?????:"+newpost.get("icbc_id"));
                    map.put("kk_id", String.valueOf(id));
                    map.put("icbc_id", newpost.get("icbc_id"));
                    map.put("bc_type", String.valueOf(l));
                    System.out.println("纯属数据："+map);
                    Tools.recAdd(map, "icbc_kk_bcxx");
                }
            }
        } else {
            long kid = add(post);
            //补充材料信息处理
            for (int l = 1; l <= 4; l++) {
                TtMap map = new TtMap();
                map.put("kk_id", String.valueOf(kid));
                map.put("icbc_id", newpost.get("icbc_id"));
                map.put("bc_type", String.valueOf(l));
                if (!Tools.myIsNull(newpost.get("hyzk" + l))) {
                    map.put("hyzk", newpost.get("hyzk" + l));
                }
                if (!Tools.myIsNull(newpost.get("ysr" + l))) {
                    map.put("ysr", newpost.get("ysr" + l));
                }
                if (!Tools.myIsNull(newpost.get("xl" + l))) {
                    map.put("xl", newpost.get("xl" + l));
                }
                if (!Tools.myIsNull(newpost.get("jzzk" + l))) {
                    map.put("jzzk", newpost.get("jzzk" + l));
                }
                if (!Tools.myIsNull(newpost.get("xzdz" + l))) {
                    map.put("xzdz", newpost.get("xzdz" + l));
                }
                if (!Tools.myIsNull(newpost.get("yzbm" + l))) {
                    map.put("yzbm", newpost.get("yzbm" + l));
                }
                if (!Tools.myIsNull(newpost.get("gzdw" + l))) {
                    map.put("gzdw", newpost.get("gzdw" + l));
                }

                if (!Tools.myIsNull(newpost.get("dwdh" + l))) {
                    map.put("dwdh", newpost.get("dwdh" + l));
                }
                if (!Tools.myIsNull(newpost.get("dwdz" + l))) {
                    map.put("dwdz", newpost.get("dwdz" + l));
                }
                if (!Tools.myIsNull(newpost.get("dwxz" + l))) {
                    map.put("dwxz", newpost.get("dwxz" + l));
                }
                if (!Tools.myIsNull(newpost.get("wsdz" + l))) {
                    map.put("wsdz", newpost.get("wsdz" + l));
                }
                if (!Tools.myIsNull(newpost.get("wssddz" + l))) {
                    map.put("wssddz", newpost.get("wssddz" + l));
                }
                if (!Tools.myIsNull(newpost.get("sshy" + l))) {
                    map.put("sshy", newpost.get("sshy" + l));
                }
                if (!Tools.myIsNull(newpost.get("zy" + l))) {
                    map.put("zy", newpost.get("zy" + l));
                }
                if (!Tools.myIsNull(newpost.get("zw" + l))) {
                    map.put("zw", newpost.get("zw" + l));
                }
                if (!Tools.myIsNull(newpost.get("gznx" + l))) {
                    map.put("gznx", newpost.get("gznx" + l));
                }
                Tools.recAdd(map, "icbc_kk_bcxx");
            }
        }
        String nextUrl = Tools.urlKill("sdo") + "&sdo=list";
        boolean bSuccess = errorCode == 0;
        // 失败时停留在当前页面,nextUrl为空
        Tools.formatResult(result2, bSuccess, errorCode, bSuccess ? "编辑成功！" : errorMsg, bSuccess ? nextUrl : "");
    }

    //其他处理
    public void topost(TtMap post) {
        //补充材料文件处理 “,” 隔开
        if (!Tools.myIsNull(post.get("imgstep3_1s_num"))) {
            String imgstep3_1s = "";
            for (int i = 1; i <= Integer.parseInt(post.get("imgstep3_1s_num")); i++) {
                imgstep3_1s = imgstep3_1s + post.get("imgstep3_1s" + i) + ",";
            }
            post.put("imgstep3_1s", imgstep3_1s);
        }
        // System.out.println("开卡申请:"+post);
        //{dwdh1=12131313, dwdh2=, dwdh3=, dwdh4=, kk_car_cityid=0,
        // dt_edit=2019-03-15 11:10:54,

        // aj_bank=0, id=0, qtlxr_xzdz=上海,
        // jjlxr_c_tel=21412412412, gznx1=2,
        // gznx2=, gznx3=, gznx4=, jjlxr_xzdz=上海,
        // wsdz1=上海, jjlxr_jdrgx=兄弟, kk_car_stateid=0,
        // imgstep3_8=images/mgcaraddimg.jpg,
        // imgstep3_7=images/mgcaraddimg.jpg,
        // dt_add=2019-03-15 11:10:54, imgstep3_9=images/mgcaraddimg.jpg,
        // dwxz2=0, jjlxr_c_name=图图, imgstep3_4=images/mgcaraddimg.jpg,
        // dwxz1=0, imgstep3_3=images/mgcaraddimg.jpg, showtag=0,
        // kk_loan_stateid=0, dwxz4=0, imgstep3_6=images/mgcaraddimg.jpg,
        // dwxz3=0, imgstep3_5=images/mgcaraddimg.jpg,
        // bc_type3=3, gcfqbj=1200, bc_type2=2, bc_type1=1,
        // imgstep3_2=images/mgcaraddimg.jpg,
        // imgstep3_1=/upload/2019/03/15/debaff15dc31e5bf1d7cb04a24217857.jpg,
        // bc_type4=4,
        // dwdz1=上海, dwdz2=,
        // kk_loan_cityid=0, dwdz3=, dwdz4=, yzbm2=,
        // yzbm3=, yzbm1=555555, sshy3=0, sshy4=0, sshy1=0, yzbm4=,
        // dk_total_price=1200, sshy2=0, qtlxr_c_name=图图, hyzk4=0,
        // hyzk2=0, aj_date=0, hyzk3=0, qtlxr_c_tel=21412412412, zw2=0,
        // zw1=0, zw4=0, zw3=0, hyzk1=0, c_tel=15544345534,
        // imgstep3_1s_1=images/mgcaraddimg.jpg, ysr1=2000,
        // ysr2=, ysr3=, ysr4=, cars_type=1, sort=100, jrfw_price=1200,
        // c_name=测试, kp_price=1200, xl1=0, xl3=0, xl2=0,
        // imgstep3_1s_2=images/mgcaraddimg.jpg, wsdz4=,
        // qtlxr_jdrgx=兄弟, xl4=0, wsdz2=, wsdz3=, wssddz1=上海,
        // gzdw2=, xzdz4=, wssddz2=, gzdw3=, gzdw4=, mid_add=21, dz_type=0,
        // imgstep3_1s=2, xzdz1=上海, xzdz2=, gzdw1=上海, xzdz3=, zy2=0, zy1=0,
        // zy4=0, zy3=0, wssddz3=, wssddz4=, jzzk4=0, jzzk3=0, jzzk2=0, jzzk1=0,
        // aj_lv=0.1, sfje=1200, mid_edit=21}
    }

    @Override
    public boolean chk(TtMap array, long id) {
        if (!agpOK) {// 演示在需要权限检查的地方插入权限标志判断
            return false;
        }
        if (!Tools.myIsNull(array.get("fromcommand"))) { // 从ManagerCmd来的。不用过滤参数
        } else {
            String myErroMsg = "";
            if (Tools.myIsNull(array.get("dk_total_price"))) {
                myErroMsg += "您忘记输入贷款总额啦！\n";
            }
            if (Tools.myIsNull(array.get("gcfqbj"))) {
                myErroMsg += "您忘记输入购车分期本金啦！\n";
            }
            if (Tools.myIsNull(array.get("kp_price"))) {
                myErroMsg += "您忘记输入开票价啦！\n";
            }
            if (Tools.myIsNull(array.get("jrfw_price"))) {
                myErroMsg += "您忘记输入金融服务费啦！\n";
            }
            if (Tools.myIsNull(array.get("sfje"))) {
                myErroMsg += "您忘记输入首付金额啦！\n";
            }
            if (array.get("icbc_id").equals("0")) {
                myErroMsg += "您忘记选择关联客户啦！\n";
            }
            if (Tools.myIsNull(array.get("aj_lv"))) {
                myErroMsg += "您忘记输入按揭利率啦！\n";
            }
            super.errorMsg = super.chkMsg = myErroMsg;
            if (!Tools.myIsNull(myErroMsg)) {
                super.errorCode = 888;
            }
        }
        return super.errorCode == 0;
    }
}
