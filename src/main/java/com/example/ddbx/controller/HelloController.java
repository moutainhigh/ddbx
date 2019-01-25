/*
 * @Description: tt 相关组件部分演示类，很多并没有演示到，需要挖掘
 * @Author: tt
 * @Date: 2018-12-20 19:06:32
 * @LastEditTime: 2019-01-22 14:16:33
 * @LastEditors: tt
 * dbCtrl类的建议xx=new DbCtrl("xxx");try{}finally{xxx.closeConn();};的模式就是在finally使用closeConn();保证数据库连接池在使用完后关闭，不管有没出现异常都执行
 */
package com.example.ddbx.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.ddbx.tt.api.Api_Hyw;
import com.example.ddbx.tt.api.Api_Wx;
import com.example.ddbx.tt.table.KjbUser;
import com.example.ddbx.tt.tool.DbCtrl;
import com.example.ddbx.tt.tool.DbMap;
import com.example.ddbx.tt.tool.DbTools;
import com.example.ddbx.tt.tool.HttpTools;
import com.example.ddbx.tt.tool.Tools;
import com.example.ddbx.tt.tool.Wx;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {
    @RequestMapping("/")
    @ResponseBody
    public String hello() {
        return "这个是新修改的！！！哈哈哈——hello,world!";
    }




    @RequestMapping("/demo_add")
    public static long demo_add() {
        System.out.println("========开始演示:增==========");
        KjbUser testdb = new KjbUser();
        try {
            Map<String, String> info = new HashMap<>();
            info.put("name", "张三丰");
            info.put("idcard", "张三丰");
            info.put("cn", "helloaad");
            info.put("qq", "");
            info.put("dsada", "");
            // info.put("dt_add", "2018-11-11 20:08:03");
            /*
             * 新增一条记录,返回生成记录的id
             */
            long id = testdb.add(info);
            System.out.println("新增的ID为：" + id);
            return id;
        } catch (Exception e) {
            // TODO: handle exception
        } finally {
            testdb.closeConn();
        }
        return 0;
    }

    public static boolean demo_del() {
        System.out.println("========开始演示:删==========");
        KjbUser testdb = new KjbUser();
        boolean result = testdb.del(9);// 如果字段名里有deltag，自动设置deltag为1，showtag为0
        // ，如果没有deltag字段，执行真正的删除操作。
        testdb.closeConn();
        return result;
        // return testdb.del(9,"realdel");
    }

    public static void demo_info() {
        System.out.println("========开始演示:查2==========");
        KjbUser testdb = new KjbUser();
        DbMap dbMap = new DbMap();// 使用DbMap模式替代 Map<String,String>复杂的写法demo
        dbMap.info = testdb.info(3, "t.name,t.idcard");
        /* 查询单条记录info(记录id,字段名，用t.xxx这样的方式) */
        // info = testdb.info(3);
        testdb.closeConn();
        System.out.println(Tools.maptostring(dbMap.info, ","));
    }

    public static void demo_edit() {
        System.out.println("========开始演示:改==========");
        KjbUser testdb = new KjbUser();
        Map<String, String> info = new HashMap<>();
        info.put("name", "张四丰");
        info.put("userpass", "hhhh");
        /*
         * 编辑字段edit(map,记录id) dt_edit,mid_edit自动修改
         */
        testdb.edit(info, 3);// id为3的记录更新
        testdb.closeConn();
    }

    /* 设置第二数据源demo,如果有第三，第四数据源，同理 */
    public static boolean demo_datasource2() {
        System.out.println("========开始演示:第二数据源==========");
        DbCtrl testdb = new DbCtrl("KjbUser");
        testdb.showall = true;// 显示所有，否则showtag=0或者deltag=1的都不显示
        testdb.limit = 20;// 每页数据量
        testdb.p = 2;// 当前显示的页
        testdb.nopage = false; // 是否分页显示
        /* 下面是操作第二数据源的demo */
        testdb.setDsi("2");// 设置为第二个数据源
        testdb.setTable("assess_admin");// 设置表明
        // List<Map<String, String>> list = testdb.lists();
        testdb.getPage("", testdb.limit, true);
        /*
         * for (int i = 0; i < list.size(); i++) {
         * System.out.println(Tools.maptostring(list.get(i), ",")); }
         * System.out.println("总数量：" + testdb.recs + ",分：" + testdb.pages + "页显示，当前页码："
         * + testdb.p); testdb.closeConn();
         */
        return true;
    }

    /* 单独使用DbTools里面的工具 */
    public static boolean demo_dbtoolsclass() {
        System.out.println("========开始演示:dbTools单独==========");
        DbTools myDbTools = new DbTools(null, true);
        Map<String, String> info = myDbTools.recinfo("select * from KjbUser", false, "", null);
        System.out.println(Tools.maptostring(info, ","));
        myDbTools.closeConn();
        return true;
    }

    /* VER */
    public static boolean demo_Ver() {
        DbCtrl testDb = new DbCtrl(null, "KjbUser");
        System.out.println(testDb.ver());
        return true;
    }

    /**
     * Tools里面对DbTools工具的封装,recinfo,reclist等的加强以及其他方法的演示。
     * 测试访问URL：http://127.0.0.1:8092/list/tools?cn=cnnnn&do=form&desc=dddddddd&p=10
     */
    @RequestMapping("/list/tools")
    private static String demo_tools(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("========开始演示:Tools==========");
        System.out.println("unDic 1:" + Tools.unDic("KjbUser", 3));
        System.out.println("unDic 2:" + Tools.unDic("KjbUser", "3", "username", "id"));
        System.out.println("urlKill:" + Tools.urlKill("cn|p"));
        System.out.println("recinfo:" + Tools.maptostring(Tools.recinfo("select * from KjbUser where id=3"), ","));
        System.out.println("reclist:" + Tools.reclist("select * from KjbUser").toString());
        String t = "<select class=\"form-control form-inline hidden-xs\">";
        t = t + Tools.dicopt("KjbUser", 14);
        t = t + "</select>";
        Tools.recexec("udpate xxx set xxx=xxx where xxx=xxx");
        return t;
    }

    /**
     * 测试微信公众号，网页授权登陆，获取用户openid，post登陆指定网站抓取数据等
     */
    @RequestMapping("/wb")
    private static String demo_wb(HttpServletRequest request, HttpServletResponse response) throws IOException {
        /*
         * ((ServletRequestAttributes) RequestContextHolder.
         * getRequestAttributes()).getRequest().getSession().e
         * ((ServletRequestAttributes) RequestContextHolder.
         * getRequestAttributes()).getRequest().getSession(). getAttribute("Openid");
         */
        /*
         * HttpSession session = request.getSession();
         * session.removeAttribute("ttopenid");//删除原来的openid Wx wx = new Wx();
         * wx.defWxName = "mytest"; wx.tbWxConfig = "tt_wxconfig";
         * wx.tt_GetWxCode("mid=3",request,response);//用户授权登陆获取openid
         * System.out.println("wxMini openID:"+wx.ttWxMini_GetOpenId("小程序端发送过来的code",
         * "mytest"
         *//* tt_wxconfig表里面name为mytest的记录里配置的appid和appsecret *//* )); */
        /** http post演示登陆 */
        String url = "http://www.tianyigps.cn/loginController.do?checkuser";
        Map<String, Object> params = new HashMap<>();// 这里用最新的方式来测试。
        params.put("loginName", "优信融资租赁");
        params.put("password", "kcd20172017");
        System.out.println("HHH:" + HttpTools.httpClientPost(url, params, "UTF-8", null));
        Map<String, String> mps = Tools.jsonDeCode_mpob(HttpTools.httpClientPost(url, params, "UTF-8", null));
        System.out.println(mps.size());
        System.out.println(mps.get("success"));
        // response.sendRedirect();
        return Tools.jsonEnCode(mps);
    }

    public static String testDbCtrl(String arg) {
        String result = "";
        DbCtrl tmpDb = new DbCtrl("admin");
        try {
            System.out.println(tmpDb.info(25).toString());
        } catch (Exception e) {
            // TODO: handle exception
        } finally {
            tmpDb.closeConn();
        }
        return result;
    }

    @RequestMapping("/api_hyw1")
    @ResponseBody
    public static String api_hyw1() {
        Api_Hyw hyw = new Api_Hyw();
        return hyw.api_demo();
    }

    public static void main(String[] args) {
        DbCtrl testdb = new DbCtrl("dd_gems");
        Map map=new HashMap();
        map.put("","");
        map.put("","");
        map.put("","");
        map.put("","");
        map.put("","");
        map.put("","");
        map.put("","");
        map.put("","");
        map.put("","");
        map.put("","");
        map.put("","");
        map.put("","");
        testdb.addData(map);

//        Api_Wx api_Wx = new Api_Wx();
//        Map<String, Object> map = (Map<String, Object>) api_Wx.getToken();
//        // System.out.println(map.toString());
//        api_Wx.docall((String) map.get("token"));// d8426c63551212d52b551ef3062624d970096b0a
//        // System.out.println(ManagerPage.getpage(10, 1, 10));
//
//        // System.out.println(Tools.time("2018-11-11 22:00:00"));
//        boolean bgo = false;
//        if (bgo) {
//            api_hyw1();
//            System.out.println("thi is md5:" + Tools.getTimeMd5FileName());
//            Date tmpDate = new Date();
//            System.err.println(Tools.dateToStrLong(tmpDate));
//            testDbCtrl("");
//            // Tools.logError("sessionID:test");
//
//            /*
//             * 演示调用阿里云违章查询接口 String api_result2="";//返回的结果集 Integer result_type2=4;//订单的大状态
//             * 默认回退 String breakRules="https://ali-carlaw.showapi.com/break-rules"; String
//             * appcode = "98eb6a0d1ebb46c1ac924ed570c55710"; Map<String, String> headers =
//             * new HashMap<String, String>(); headers.put("Authorization", "APPCODE " +
//             * appcode); headers.put("Content-Type",
//             * "application/x-www-form-urlencoded; charset=UTF-8");
//             * headers.put("Content-Type",
//             * "application/x-www-form-urlencoded;charset=utf-8"); Map bodys = new
//             * HashMap(); bodys.put("carCode","LSGNB83L0JA070537");//车架号 具体所需位数请查看规则查询接口
//             * bodys.put("carEngineCode", "180656239");//发动机号 具体所需位数请查看规则查询接口
//             * bodys.put("carNumber", "沪C871VG");//车牌号 bodys.put("carType", "02"); String
//             * alApiResultS=HttpTools.httpClientPost(breakRules,(Map)bodys,"UTF-8",headers);
//             * System.out.println("阿里云违章查询->response"+alApiResultS);
//             */
//            /** http Post演示，调用钛镕的一个接口实例演示，要扣费的 */
//            /*
//             * String url = "http://tidata.taifinance.cn:8080/api/preloan/submit";
//             * Map<String,Object> map = new HashMap<>(); map.put("name","孟另山");
//             * map.put("idCardNo","132423197501143114"); map.put("mobileNo","13933214160");
//             * map.put("appKey","7yScQE0SHF5TxO65lq1BoOyNeXQfv3");
//             * System.out.println(HttpTools.httpClientPost(url,map,"UTF-8",null));
//             */
//            /** http get演示 */
//            String url = "http://kjbtest.kcway.net/ttAjax?cn=comm_citys&do=opt&state_id=23&re=json";
//            System.out.println(HttpTools.httpClientGet(url, null, "UTF-8", null));
//            /** 微信小程序openid获取演示 */
//            Wx wx = new Wx();
//            wx.defWxName = "mytest";
//            wx.tbWxConfig = "tt_wxconfig";
//            // System.out.println("wxMini openID:" + wx.ttWxMini_GetOpenId("小程序端发送过来的code",
//            // "mytest"/* tt_wxconfig表里面name为mytest的记录里配置的appid和appsecret */));
//            /** ===========微信公众号模板消息/小程序模板消息================ */
//            Map<String, Object> params = new HashMap<>();
//            params.put("touser", "oZuVnv0f_bKFRSsvWvWvSESNA_Ac");// openid
//            params.put("template_id", "vCa8gutuw9316LXNj9fwHCmRKsMhLFbHuo5s8rO03hY");// 模板id
//            params.put("url", "/query/query");// 点击跳转到小程序页面
//            Map<String, Object> data = new HashMap<>();
//            data.put("first", "1111111");
//            data.put("remark", "222222");
//            params.put("data", data);
//            System.out.println(wx.wxTempMessage(params));
//            /** ===========DbCtrl演示================ */
//            /*
//             * demo_add();// 增 demo_del();// 删 demo_edit();// 改 //demo_list();//
//             * 查——列表（直接dbctrl类） demo_info();// 查-单条记录 demo_datasource2();//多数据源演示，连接多数据库
//             * demo_dbtoolsclass();//dbTools类单独使用演示
//             */
//        }
    }
}