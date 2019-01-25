/*
 * @Description:  * 数据库操作基类 创建日期：2018-10-15 NOTE:使用时，需要实例化一个对象 获取版本号调用
 * ver(); 使用时建议在此基础上继承个自己的单独类。
 * @Author: tt
 * @Date: 2018-12-07 10:47:04
 * @LastEditTime: 2019-01-20 10:09:34
 * @LastEditors: tt
 */
package com.example.ddbx.tt.tool;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.*;

public class DbCtrl {
    public Connection conn = null;
    public String title = "";
    public boolean canadd;
    public boolean thick = false;
    public boolean candel = true;
    public boolean realdel = true;
    public boolean canhide = false;
    public boolean cancheck = true;
    static int now = 0, closenow = 0;
    /**
     * 是否允許自動設定排序值,在獲取數據表結構的時候會自動設定
     *
     * @var boolean
     */
    public boolean cansort = false;
    /**
     * 操作的表名,必鬚
     *
     * @var string
     */
    public String table = "";
    /* 多数据源时设置使用的数据源 */
    public String dsi = "1";
    /**
     * 獲取結果時所使用的字段
     *
     * @var string
     */
    public String fields = "t.*";
    /**
     * 表結構
     *
     * @var array
     */
    public List<String> fieldconf = null;
    /**
     * 條件語句
     *
     * @var string
     */
    public String wheres = "";
    /**
     * group字段
     *
     * @var string
     */
    public String groupby = "";
    /**
     * 獲取第幾頁
     *
     * @var integer
     */
    public int p = 1;
    /**
     * 獲取列表時的開始行數
     *
     * @var integer
     */
    public int start = 0;
    /**
     * 獲取列表時的結束行數
     *
     * @var integer
     */
    public int limit = 10;
    /**
     * 獲取列表時不限制函數
     *
     * @var boolean
     */
    public boolean nopage = false;
    /**
     * 獲取資料時不限定showtag字段
     *
     * @var boolean
     */
    public boolean showall = false;
    /**
     * 獲取資料時不限定deltag字段
     *
     * @var boolean
     */
    public boolean getall = false;
    /**
     * order字段
     *
     * @var string
     */
    public String orders = "";
    /**
     * 用於inner join的設定 請使用setinner來進行設定
     *
     * @var array
     * @see setinner();
     */
    public Map<String, String> innerary = new HashMap<String, String>();
    /**
     * inner join的語句
     *
     * @var string
     */
    public String innersql = "";
    /**
     * 用於left join的設定 請使用setleft來進行設定
     *
     * @var array
     * @see setleft();
     */
    public Map<String, String> leftary = new HashMap<String, String>();
    /**
     * left join的語句
     *
     * @var string
     */
    public String leftsql = "";
    /**
     * 用於right join的設定 請使用setright來進行設定
     *
     * @var array
     * @see setright();
     */
    public Map<String, String> rightary = new HashMap<String, String>();
    /**
     * right join的語句
     *
     * @var string
     */
    public String rightsql = "";
    /**
     * 主鍵名
     *
     * @var string
     */
    public String key = "id";
    /**
     * 是否自增長主鍵
     *
     * @var boolean
     */
    public boolean autokey = true;
    /**
     * 用於統計符合條件的記錄總數的sql
     *
     * @var string
     */
    public String countSql = "";
    /**
     * 獲取列表時的總記錄數,需執行getpage()
     *
     * @var integer
     * @see getpage();
     */
    public long recs = 0;
    /**
     * 插入或修改時最終的插入數據
     *
     * @var array
     */
    public Map<String, String> recary = null;
    /**
     * 修改或删除的时候,旧数据的记录
     *
     * @var array
     */
    public Map<String, String> oldrec = null;
    /**
     * 獲取列表時的總分頁數,需執行getpage()
     *
     * @var integer
     * @see getpage();
     */
    public int pages = 0;
    /**
     * 查詢SQL
     *
     * @var string
     */
    public String sql = "";
    /**
     * 新增SQL
     *
     * @var string
     */
    public String sql_Add = "";
    /**
     * 返回檢查信息
     *
     * @var string
     */
    public String chkMsg = "";
    /**
     * 權限檢查,暫時無用
     *
     * @var boolean
     */
    public boolean permCheck = false;
    /**
     * 上传的文件记录
     */
    public long id = 0;
    /**
     * todo 文件上传处理
     */
    public Map<String, String> uploads = null;
    /**
     * 错误代码
     */
    public int errCode = 0;
    /**
     * 错误信息
     */
    public String errorMsg = "";
    /**
     * 是否显示日志
     */
    private boolean showlog = true;
    private DbTools myDbTools;

    private void mylog(String mString) {
        if (this.showlog == true) {
            // System.out.println(this.toString() + ":" + mString);
            Log log = LogFactory.getLog(DbCtrl.class);
            log.info(mString);
        }
        if (Config.GLOBAL_SHOWLOG) {
            Config.log.debug("DbCtrl:" + mString);
        }
    }

    /* 默认的数据库链接，目前直接写到类里 */
    private void GetdfConnection() {
        if (DbConfig.g_dsmap.size() <= 0) {
            mylog("开始初始化,使用默认数据库链接..");
            DbConfig.init(true);
        } else {
            mylog("已经初始化过的..");
        }
        try {
            this.conn = DbConfig.g_dsmap.get(this.dsi).getConnection();
            now++;
            mylog("累计创建getConnection连接数：" + now);
        } catch (SQLException e) {
            this.errCode = 900;
            Tools.logError("DbCtrl:" + e.getMessage());
            mylog(e.getMessage());
        }
        if (this.conn == null) {
            this.errCode = 999;
            Tools.logError("DbCtrl:connect is null!");
            mylog("connect is null!");
        } else {
        }
    }

    /* 多数据源情况下修改数据源 */
    public void setDsi(String adsi) {
        this.closeConn();// 先关闭连接
        this.dsi = adsi;
        GetdfConnection();
        initconn();
    }

    /* 多数据源情况下修改数据源 */
    public void setTable(String table) {
        this.table = table;
    }

    /* 类初始化，带数据库链接，如果链接为空，使用默认的数据库账号密码 */
    public DbCtrl(Connection connection, String tbName) {
        this.table = tbName;
        this.conn = connection;
        if (this.conn == null) {
            GetdfConnection();
        } else {
        }
        this.initconn();
        this.canadd = true;
        this.candel = true;
    }

    /* 类初始化，带数据库链接，如果链接为空，使用默认的数据库账号密码 */
    public DbCtrl(String tbName) {
        this.table = tbName;
        this.GetdfConnection();
        this.initconn();
        this.canadd = true;
        this.candel = true;
    }

    /* 初始数据连接 */
    private void initconn() {
        if (this.conn != null) {
            this.myDbTools = null;
            this.myDbTools = new DbTools(this.conn, this.showlog);
            this.getTableField(true);
        } else {
            this.errCode = 996;
            Tools.logError("DbCtrl:initconn() error:");
        }
    }

    /**
     * 實際删除數據 根據表結構是否有deltag字段判斷是真正的删除,還是僅更改deltag的狀態位
     *
     * @param unknown_type id 主鍵的值
     */
    public boolean delete(long id, String deltag) {
        // deltag = "del";
        if (this.fieldconf == null) {
            this.getTableField(true);
        }
        if (Tools.in_array_list("deltag", this.fieldconf)) {
            int delval = (deltag == "del" ? 1 : (deltag == "realdel" ? -1 : 0));
            String setshow = "";
            if (Tools.in_array_list("showtag", this.fieldconf)) {
                setshow = ",showtag=0";
            }
            String setlast = "";
            if (Tools.in_array_list("dt_edit", this.fieldconf)) {
                setlast = ",dt_edit=NOW()";
            }
            return myDbTools.recexec("update " + this.table + " set deltag=" + delval + " " + setshow + " " + setlast
                    + " where " + this.key + "='" + id + "'");
        } else {
            return myDbTools.recexec("delete from " + this.table + " where " + this.key + "='" + id + "'");
        }
    }

    /**
     * 數據檢查
     *
     * @param $ary 待檢查的數據
     * @param $id  如果id不爲null,則爲更新數據,否則爲新增數據
     * @return 數據通過返回true, 失敗返回false
     */
    public boolean chkdel(long id) {
        return this.chkdel(id, null);
    }

    /**
     * 數據檢查
     *
     * @param $ary 待檢查的數據
     * @param $id  如果id不爲null,則爲更新數據,否則爲新增數據
     * @return 數據通過返回true, 失敗返回false
     */
    public boolean chkdel(long id, Map<String, String> ary) {
        return true;
    }

    /**
     * 删除數據
     *
     * @param 需删除數據的主鍵的值
     */
    public boolean del(long id) {
        return this.del(id, "");
    }

    /**
     * 删除數據
     *
     * @param 需删除數據的主鍵的值
     */
    public boolean del(long id, String deltag) {
        if (Tools.myisnull(deltag)) {
            deltag = "del";
        }
        this.oldrec = this.info(id);
        if (this.chkdel(id)) {
            boolean re = this.delete(id, deltag);
            this.succ(null, id, -1);
            /*
             * global tablog_tabs; //写删除日志todo if(in_array(this.table, tablog_tabs)){
             * this.tablog(this.title,this.table,id,"del",array(),this.oldrec); }
             */
            return re;
        } else {
            return false;
        }
    }

    /**
     * 獲取表結構
     *
     * @param boolean nameonly 設置爲true,則只獲取字段名,目前只能允許true
     */
    public List<String> getTableField(boolean nameonly) {
        // todo 可以加入cache功能。
        if (this.fieldconf == null || this.fieldconf.size() <= 0) {
            if (this.fieldconf == null) {
                this.fieldconf = new ArrayList<>();
            }
            mylog("加载字段列表。。。");
            List<Map<String, String>> list = myDbTools.reclist("SHOW COLUMNS FROM " + table);
            for (int i = 0; i < list.size(); i++) {
                String tmpStr = list.get(i).get("Field");
                if (Tools.myisnull(tmpStr)) {
                    tmpStr = list.get(i).get("COLUMN_NAME");
                }
                if (Tools.myisnull(tmpStr) == false) { // 如果不为空
                    this.fieldconf.add(tmpStr);
                }
            }
        }
        // mylog(this.fieldconf == null ? "null" : "not null");
        // mylog(Integer.toString(this.fieldconf.size()));
        if (this.fieldconf != null && this.fieldconf.size() <= 0) {
            mylog("字段列表为空");
            try {
                throw new Exception("TT异常：获取数据表所有字段名失败！" + table);
            } catch (Exception e) {
                mylog(e.getMessage());
                Tools.logError("DbCtrl:" + e.getMessage());
            }
            mylog("<----------------ERROR,获取字段出错---------------->");
            Tools.logError("DbCtrl:<----------------ERROR,获取字段出错---------------->");
        }
        if (this.fieldconf != null) {
            if (this.fieldconf.contains("sort")) {
                cansort = true;
            }
            if (this.fieldconf.contains("deltag")) {
                realdel = false;
            }
            if (this.fieldconf.contains("showtag")) {
                canhide = true;
            }
        }
        return this.fieldconf;
    }

    /**
     * 實際更新數據
     *
     * @param array        array 更新的數據
     * @param unknown_type id 主鍵的值
     */
    private int editData(Map<String, String> array, long id) {
        array.remove(key);
        int result = 0;
        String sql = getAESql(array, "update ");
        if (array.size() > 0) {
            sql = sql.substring(0, sql.length() - 1);
            sql = sql + " where " + key + "='" + id + "'";
            result = myDbTools.recupdate(sql);
        }
        return result;
    }

    private String getAESql(Map<String, String> array, String s) {
        if (this.fieldconf == null) {
            this.getTableField(true);
        }
        /*
         * todo if(_FILES){ array=this.files(array,id); }
         */
        for (Iterator<Map.Entry<String, String>> it = array.entrySet().iterator(); it.hasNext();) {
            Map.Entry<String, String> item = it.next();
            if (!this.fieldconf.contains(item.getKey())) {
                it.remove();
            }
            // ... todo with item
        }

        /*
         * todo foreach(array as key=>val){ if(is_array(val)){
         * array[key]=self::arytostr(val); } }
         */
        this.recary = array;
        String sql = s + table + " set";
        for (String key : array.keySet()) { // 过滤不存在的字段
            if (array.get(key) == "null") {
                sql = sql + " " + key + "=NULL,";
            } else {
                sql = sql + " `" + key + "`='" + array.get(key) + "',";
            }
        }
        return sql;
    }

    public boolean chk(Map<String, String> array, long id) {
        return true;
    }

    public Map<String, String> param(Map<String, String> ary, long id) {
        // todo
        return ary;
    }

    public void succ(Map<String, String> array, long id, int sqltp) {
        // todo
    }

    /**
     * 更新數據
     *
     * @param array ary 待更新的數據
     * @param id    需更新數據的主鍵的值
     */
    public int edit(Map<String, String> ary, long id) {
        // todo this.oldrec=this.info(id);
        if (chk(ary, id)) {
            if (Tools.myisnull(ary.get("dt_edit"))) {
                ary.put("dt_edit", Tools.dateToStrLong(null));
            }
            if (Tools.mid() != 0) {
                ary.put("mid_edit", String.valueOf(Tools.mid()));
            }
            ary = this.param(ary, id);
            if (ary == null) {
                return 0;
            } else {
                int re = this.editData(ary, id);
                this.succ(ary, id, 1);
                /*
                 * todo global tablog_tabs; if(in_array(this.table, tablog_tabs)){
                 * this.tablog(this.title,this.table,id,'edit',ary,this.oldrec); }
                 */
                return re;
            }
        } else {
            return 0;
        }
    }

    /**
     * 實際插入數據
     *
     * @param array 插入的數據
     * @return 返回插入的ID
     */
    public long addData(Map<String, String> array) {
        if (this.autokey) {
            array.remove(this.key);
        }
        long result = 0;
        String sql = getAESql(array, "insert into ");
        if (array.size() > 0) {
            sql = sql.substring(0, sql.length() - 1);
            // sql = sql+" where "+key+"='"+id+"'";
            result = myDbTools.recinsert(sql);
        }
        return result;
    }

    /**
     * 新增數據
     *
     * @param Map ary 待新增的數據
     * @return 新增記錄的ID
     */
    public long add(Map<String, String> ary) {
        if (ary == null || ary.size() == 0) {
            return 0;
        }
        if (this.chk(ary, 0)) {
            String dt = Tools.dateToStrLong(null);
            if (Tools.myisnull(ary.get("dt_edit"))) {
                ary.put("dt_edit", dt);
            }
            if (Tools.myisnull(ary.get("dt_add"))) {
                ary.put("dt_add", dt);
            }
            if (Tools.myisnull(ary.get("mid_add")) && Tools.mid() != 0) {
                ary.put("mid_edit", String.valueOf(Tools.mid()));
                ary.put("mid_add", String.valueOf(Tools.mid()));
            }
            if (Tools.myisnull(ary.get("sort"))) {
                ary.put("sort", "100");
            }
            if (Tools.myisnull(ary.get("showtag"))) {
                ary.put("showtag", "0");
            }
            if (Tools.myisnull(ary.get("up_id"))) {
                ary.put("up_id", "0");
            }
            ary = this.param(ary, 0);
            System.out.println("add :" + ary);
            this.id = this.addData(ary);
            this.succ(ary, this.id, 0);
            /*
             * todo 写数据库日志
             */
            return this.id;
        } else {
            return 0;
        }
    }

    private String getListSqlStr(String sql) {
        boolean _in_admin = Tools.isadmin();
        if (this.fieldconf == null) {
            this.getTableField(true);
        }
        if (_in_admin && Tools.in_array_list("showtag", this.fieldconf) && !this.showall) {
            sql = sql + (sql.equals("") ? " t.showtag=1 " : " and t.showtag=1 ");
        }
        if (_in_admin && Tools.in_array_list("deltag", this.fieldconf) && !this.getall) {
            sql = sql + (sql.equals("") ? " t.deltag=0 " : " and t.deltag=0 ");
        }
        return sql;
    }

    private String getListSqlStrlimit() {
        String r = "";
        if (!this.nopage) {
            if (this.p == 0)
                this.p = 1;
            if (this.start == 0)
                this.start = this.limit * (this.p - 1);
            if (this.start < 0)
                this.start = 0;
            r += " limit " + this.start + "," + this.limit;
        }
        return r;
    }

    /**
     * 显示列表,wheres为条件，f为字段名格式t.username,t.password或者t.*,或者直接为""
     */
    public List<Map<String, String>> lists(String wheres, String f) {
        List<Map<String, String>> result = null;// new ArrayList<Map<String, String>>();
        String strWhere = getListSqlStr(wheres);
        /** todo 组合字符串，查询列表 */
        sql = "select SQL_CALC_FOUND_ROWS " + (Tools.myisnull(f) == false ? f : this.fields) + " from " + this.table
                + " t " + this.leftsql + " " + this.rightsql + " " + this.innersql + " "
                + (Tools.myisnull(wheres) == false ? " where " + strWhere
                        : (Tools.myisnull(strWhere) ? "" : " where " + strWhere))+" "
                + this.orders + " " + this.groupby + " " + getListSqlStrlimit() + " ";
        result = myDbTools.reclist(sql);
        this.recs = Long.parseLong(myDbTools.recexec_getvalue("SELECT FOUND_ROWS() as rno;", "rno"));
        return result;
    }

    public List<Map<String, String>> lists() {
        return this.lists("", "");
    }

    public Map<String, String> info(long id) {
        return this.info(id, "");
    }

    /**
     * 獲取單挑記錄
     *
     * @param id 主鍵的值
     * @return 記錄數組
     */
    public Map<String, String> info(long id, String f) {
        // f = false;
        boolean _in_admin = Tools.isadmin();
        String where = "";
        mylog("begin info...");
        if (this.fieldconf == null) {
            this.getTableField(true);
        }
        if (_in_admin && Tools.in_array_list("showtag", this.fieldconf) && !this.showall) {
            where = where + " and t.showtag=1 ";
        }
        ;
        if (_in_admin && Tools.in_array_list("deltag", this.fieldconf) && !this.getall) {
            where += " and t.deltag=0 ";
        }
        /*
         * NOTE:这个比较重要 todo ,left join，right join，inner join查询以及groupby查询功能的加入 if
         * (sizeof(this.leftary)>0){ this.leftsql = ""; foreach (this.leftary as
         * ltab=>ons){ this.leftsql+= " left join ".ltab." on ".implode(",", ons); } }
         * if (sizeof(this.rightary)>0){ this.rightsql = ""; foreach (this.rightary as
         * ltab=>ons){ this.rightsql+= " right join ".ltab." on ".implode(",", ons); } }
         * if (sizeof(this.innerary)>0){ this.innersql = ""; foreach (this.innerary as
         * itab=>ons){ this.innersql+= " inner join ".itab." on ".implode(",", ons); } }
         * if (this.groupby != ""){ this.groupby = " group by "+this.groupby; }else
         * if(this.leftsql || this.rightsql || this.innersql){ this.groupby =
         * " group by t."+this.key; }
         */
        String sql = "select " + (Tools.myisnull(f) == false ? f : this.fields) + " from " + this.table + " t "
                + this.leftsql + " " + this.rightsql + " " + this.innersql + " where t." + this.key + "='" + id + "' "
                + where + " " + this.groupby + " ";
        this.sql = sql;
        Map<String, String> rec = myDbTools.recinfo(sql, false, "ary", null);
        for (String key : rec.keySet()) {
            String vString = rec.get(key);
            if (Tools.myisnull(vString) == false
                    && ((vString.length() >= 10 && vString.substring(0, 10).equals("0000-00-00"))
                            || vString.equals("0000"))) {
                rec.put(key, "");
            }
        }
        return this.show(rec);
        /*
         * todo 其他的处理，imags,mapx,mapy,hit等 foreach(rec as k=>v){ if(substr(v, 0,
         * '10')=='0000-00-00' || v==='0000'){ rec[k]=''; } if(in_array(k,
         * array('mapx','mapy'))){ rec[k]=rtrim(v,'0'); } rec[k]=this.strtoary(rec[k]);
         * } if(f){ rec=this.show(rec); if(sizeof(rec)==1){ return @array_shift(rec);
         * }else{ return rec; } }else if(!rec){ return array(); }else{
         * if(isset(rec['imgs']) &&!rec['imgs']){ rec['imgs']=array(); }
         *
         * //添加点击数 if(rec && in_array('hit', this.fieldconf) && _in_admin){
         * recupdate("update this.table set hit=".(rec['hit']+1)+" where id=".rec['id'
         * ]); }
         *
         * return this.show(rec); }
         */
    }

    private String strGetPage(int pages, int p, String style, int l, boolean auto_hide) {
        // todo
        String myString = ManagerPage.getpage(pages, p, l);// 返回分页的html代码
        return myString;
    }

    /**
     * 獲取分頁代碼
     */
    public String getPage(String style, int l, boolean auto_hide) {
        // this.recs=recinfo(this.countSql,'rno');
        if (this.recs > 0) {
            this.pages = (int) Math.ceil((double) this.recs / this.limit); // update by hong 原來統計出錯
        } else {
            this.recs = this.pages = 0;
        }
        return strGetPage(this.pages, this.p, style, this.limit, auto_hide);
    }

    /* 给子类重载的，做最后的过滤 */
    private Map<String, String> show(Map<String, String> rec) {
        // TODO Auto-generated method stub
        return rec;
    }

    /**
     * 关闭连接，所有数据库操作完成后应该调用此方法关闭连接，释放资源。
     */
    public void closeConn() {
        // 关闭资源
        this.myDbTools.closeConn();// 释放由dbtools创建的connection,本类
        closenow++;
        mylog("累计关闭conn.close()连接数：" + closenow);
        try {
            if (this.conn != null) { // 关闭本类创建的
                // mylog("累计关闭conn.close()连接数：" + closenow);
                this.conn.close();
            }
        } catch (SQLException e) {
            this.errCode = 898;
            mylog(e.getMessage());
            Tools.logError("DbCtrl:" + e.getMessage());
        }
    }

    public String ver() {
        return Config.TTVER;
    }
}
