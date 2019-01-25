/*
 * @Description: file content
 * @Author: tt
 * @Date: 2018-12-18 18:00:00
 * @LastEditTime: 2019-01-20 20:58:36
 * @LastEditors: tt
 */
package com.example.ddbx.tt.tool;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DbTools {
    public int errcode = 0;
    private Connection conn = null;
    // private Statement stmt = null;
    private boolean showlog = true;

    public static void unDic(String dbUsertablename, long mid, String fsid) {
    }
    // ResultSet rs = null;

    private void mylog(String mString) {
        if (showlog == true) {
            // System.out.println(this.toString() + ":" + mString);
            Log log = LogFactory.getLog(DbTools.class);
            log.info(mString);
        }
        if (Config.GLOBAL_SHOWLOG) {
            Config.log.debug("DbTools:" + mString);
        }
    }

    public void init(Connection connection, boolean ashowlog) {
        showlog = ashowlog;
        if (connection == null) {
            if (DbConfig.g_dsmap.size() <= 0) {
                mylog("开始初始化..");
                DbConfig.init(true);
            } else {
                mylog("已经初始化过的..");
            }
            try {
                this.conn = DbConfig.g_dsmap.get("1").getConnection();
                mylog("获取新的2Connection..");
            } catch (SQLException e) {
                errcode = 900;
            }
        } else {
            mylog("使用指定的Connection..");
            this.conn = connection;
        }
        if (this.conn == null) {
            errcode = 999;
            mylog("connect is null!");
        } else {
            mylog("createStatement");
        }
    }

    public DbTools() {
        init(null, false);
    }

    public DbTools(Connection connection, boolean ashowlog) {
        init(connection, ashowlog);
    }

    /* 显示列表 */
    public List<Map<String, String>> reclist(String sql) {
        List<Map<String, String>> result = new ArrayList<Map<String, String>>();
        mylog(sql);
        try {
            Statement stmt = this.conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            ResultSetMetaData md = rs.getMetaData(); // 获得结果集结构信息,元数据
            int columnCount = md.getColumnCount(); // 获得列数
            List<String> lsFields = new ArrayList<String>();
            for (int i = 1; i <= columnCount; i++) {
                String tmpStr = md.getColumnLabel(i);
                lsFields.add(Tools.myisnull(tmpStr) == false ? tmpStr : md.getColumnName(i));
            }
            mylog("字段数：" + Integer.toString(lsFields.size()));
            while (rs.next()) {
                Map<String, String> rowData = new HashMap<String, String>();
                for (int i = 1; i <= lsFields.size(); i++) {
                    String vString = paramvalue(rs, md, i);
                    // mylog(lsFields.get(i - 1));
                    rowData.put(lsFields.get(i - 1), vString);
                }
                result.add(rowData);
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return result;
    }

    public Map<String, String> recinfo(String sql) {
        return this.recinfo(sql, true, "", null);
    }

    /* 显示一条记录,field,retype,conf为以后扩展用 */
    public Map<String, String> recinfo(String sql, boolean field, String retype, Connection conf) {
        Map<String, String> result = new HashMap<>();
        mylog(sql);
        try {
            Statement stmt = this.conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            ResultSetMetaData md = rs.getMetaData(); // 获得结果集结构信息,元数据
            int columnCount = md.getColumnCount(); // 获得列数
            mylog("columnCount:" + columnCount);
            while (rs.next()) {
                for (int i = 1; i <= columnCount; i++) {
                    // mylog(md.getColumnLabel(i)+"-"+md.getColumnTypeName(i));
                    String vString = paramvalue(rs, md, i);
                    String tmpStr = md.getColumnLabel(i);
                    result.put(Tools.myisnull(tmpStr) == false ? tmpStr : md.getColumnName(i), vString);
                }
                break;
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block,写入到log文档
            e.printStackTrace();
        }

        return result;
    }

    /**
     * 处理获取字段值，为空时填写空字符串和处理DATETIME的.0
     */
    public String paramvalue(ResultSet rs, ResultSetMetaData md, int i) {
        String vString = "";
        try {
            String tmpStr = rs.getString(i);
            // mylog("值："+tmpStr);
            vString = Tools.myisnull(tmpStr) ? "" : tmpStr;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        /*
         * try { if (Tools.myisnull(vString) == false && md.getColumnTypeName(i) ==
         * "DATETIME") {//去掉DATE-TIME的.0 vString = vString.substring(0, vString.length()
         * - 2); } } catch (SQLException e) { // TODO Auto-generated catch block
         * e.printStackTrace(); }
         */
        return vString;
    }

    /*
     * 执行一条命令记录execute
     * 允许执行查询语句、更新语句、DDL语句。返回值为true时，表示执行的是查询语句，可以通过getResultSet方法获取结果；返回值为false时，
     * 执行的是更新语句或DDL语句，getUpdateCount方法获取更新的记录数量。
     */
    public boolean recexec(String sql) {
        mylog(sql);
        boolean ret = false;
        try {
            Statement stmt = this.conn.createStatement();
            ret = stmt.execute(sql);
            stmt.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return ret;
    }

    /*
     * 执行一条命令记录execute
     * 允许执行查询语句、更新语句、DDL语句。返回值为true时，表示执行的是查询语句，可以通过getResultSet方法获取结果；返回值为false时，
     * 执行的是更新语句或DDL语句，getUpdateCount方法获取更新的记录数量。
     */
    public String recexec_getvalue(String sql, String field) {
        Map<String, String> re = recinfo(sql, false, "auto", null);
        String reString = re.get(field);
        return reString;
    }

    /* 更新条记录 */
    public int recupdate(String sql) {
        mylog(sql);
        int result = 0;
        try {
            Statement stmt = this.conn.createStatement();
            boolean ret = stmt.execute(sql);
            if (ret == false) {
                result = stmt.getUpdateCount();
            }
            stmt.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return result;
    }

    /* 更新条记录 ，返回id */
    public long recinsert(String sql) {
        mylog(sql);
        long result = 0;
        try {
            Statement stmt = this.conn.createStatement();
            stmt.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
            ResultSet rs = stmt.getGeneratedKeys();
            while (rs.next()) {
                result = rs.getInt(1);
            }
            mylog("生成记录的key为 ：" + result);
            stmt.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return result;
    }

    /* unDic，定位id为nid的name字段值或者其他值 */
    public String unDic(String tbName, String nid, String fieldName, String fieldId) {
        if (Tools.myisnull(fieldName) == true) {
            fieldName = "name";
        }
        if (Tools.myisnull(fieldId) == true) {
            fieldId = "id";
        }
        // "select $nf from $dic where $kf='$val'",$nf
        String fSql = "select " + fieldName + " from " + tbName + " where " + fieldId + "='" + nid + "'";
        Map<String, String> mpResult = this.recinfo(fSql);
        return mpResult != null ? mpResult.get(fieldName) : "";
    }

    public String unDic(String tbName, String nid) {
        return this.unDic(tbName, nid, "", "");
    }

    public String unDic(String tbName, long nid) {
        return this.unDic(tbName, String.valueOf(nid));
    }

    /**
     * 关闭数据库连接，每次使用完后调用此方法。
     */
    public void closeConn() {
        try {
            if (this.conn != null) {
                this.conn.close();
                mylog("dbTools关闭连接");
            }
        } catch (SQLException se) {
        }
    }
}