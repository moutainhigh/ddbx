/*
 * @Description: file content
 * @Author: tt
 * @Date: 2018-12-18 18:00:00
 * @LastEditTime: 2019-02-11 17:30:00
 * @LastEditors: tt
 */
package com.example.ddbx.tt.tool;

import com.alibaba.druid.pool.DruidPooledConnection;
import com.example.ddbx.tt.data.TtList;
import com.example.ddbx.tt.data.TtMap;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DbTools {
    public int errcode = 0;
    public DruidPooledConnection conn = null;
    // private Statement stmt = null;
    public boolean showlog = true;
    // ResultSet rs = null;

    private void mylog(String mString) {
        if (showlog == true) {
            // System.out.println(toString() + ":" + mString);
            Log log = LogFactory.getLog(DbTools.class);
            log.info(mString);
        }
        Tools.logInfo(mString,getClass().toString());
    }

    public void init(DruidPooledConnection connection, boolean ashowlog) {
        showlog = ashowlog;
        if (connection == null) {
            if (DbConfig.g_dsmap.size() <= 0) {
                mylog("开始初始化..");
                DbConfig.init(true);
            } else {
                mylog("已经初始化过的..");
            }
            try {
                conn = DbConfig.g_dsmap.get("1").getConnection();
                mylog("获取新的2Connection..");
            } catch (SQLException e) {
                if (Config.DEBUGMODE) {
                    e.printStackTrace();
                }
                errcode = 900;
            }
        } else {
            mylog("使用指定的Connection..");
            conn = connection;
        }
        if (conn == null) {
            errcode = 999;
            mylog("connect is null!");
        } else {
            mylog("createStatement");
        }
    }

    public DbTools() {
        init(null, true);
    }

    public DbTools(DruidPooledConnection connection, boolean ashowlog) {
        init(connection, ashowlog);
    }

    /* 显示列表 */
    public TtList reclist(String sql) {
        TtList result = new TtList();
        mylog(sql);
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            ResultSetMetaData md = rs.getMetaData(); // 获得结果集结构信息,元数据
            int columnCount = md.getColumnCount(); // 获得列数
            List<String> lsFields = new ArrayList<String>();
            for (int i = 1; i <= columnCount; i++) {
                String tmpStr = md.getColumnLabel(i);
                lsFields.add(Tools.myIsNull(tmpStr) == false ? tmpStr : md.getColumnName(i));
            }
            mylog("字段数：" + Integer.toString(lsFields.size()));
            while (rs.next()) {
                TtMap rowData = new TtMap();
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
            
            Tools.logError(e.getMessage());
            e.printStackTrace();
        }

        return result;
    }

    public TtMap recinfo(String sql) {
        return recinfo(sql, true, "", null);
    }

    /* 显示一条记录,field,retype,conf为以后扩展用 */
    public TtMap recinfo(String sql, boolean field, String retype, Connection conf) {
        TtMap result = new TtMap();
        mylog(sql);
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            ResultSetMetaData md = rs.getMetaData(); // 获得结果集结构信息,元数据
            int columnCount = md.getColumnCount(); // 获得列数
            mylog("columnCount:" + columnCount);
            while (rs.next()) {
                for (int i = 1; i <= columnCount; i++) {
                    // mylog(md.getColumnLabel(i)+"-"+md.getColumnTypeName(i));
                    String vString = paramvalue(rs, md, i);
                    String tmpStr = md.getColumnLabel(i);
                    result.put(Tools.myIsNull(tmpStr) == false ? tmpStr : md.getColumnName(i), vString);
                }
                break;
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            Tools.logError(e.getMessage());
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
            vString = Tools.myIsNull(tmpStr) ? "" : tmpStr;
        } catch (SQLException e) {
            Tools.logError(e.getMessage());
            
            e.printStackTrace();
        }
        /*
         * try { if (Tools.myisnull(vString) == false && md.getColumnTypeName(i) ==
         * "DATETIME") {//去掉DATE-TIME的.0 vString = vString.substring(0, vString.length()
         * - 2); } } catch (SQLException e) { 
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
            Statement stmt = conn.createStatement();
            ret = stmt.execute(sql);
            stmt.close();
        } catch (SQLException e) {
            Tools.logError(e.getMessage());
            
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
        TtMap re = recinfo(sql, false, "auto", null);
        String reString = re.get(field);
        return reString;
    }

    /* 更新条记录 */
    public int recupdate(String sql) {
        mylog(sql);
        int result = 0;
        try {
            Statement stmt = conn.createStatement();
            boolean ret = stmt.execute(sql);
            if (ret == false) {
                result = stmt.getUpdateCount();
            }
            stmt.close();
        } catch (SQLException e) {
            Tools.logError(e.getMessage());
            
            e.printStackTrace();
        }

        return result;
    }

    /* 更新条记录 ，返回id */
    public long recinsert(String sql) {
        mylog(sql);
        long result = 0;
        try {
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
            ResultSet rs = stmt.getGeneratedKeys();
            while (rs.next()) {
                result = rs.getInt(1);
            }
            mylog("生成记录的key为 ：" + result);
            stmt.close();
        } catch (SQLException e) {
            Tools.logError(e.getMessage());
            
            e.printStackTrace();
        }

        return result;
    }

    /* unDic，定位id为nid的name字段值或者其他值 */
    public String unDic(String tbName, String nid, String fieldName, String fieldId) {
        if (Tools.myIsNull(fieldName) == true) {
            if (tbName == "dd_icbc") {
                fieldName = "c_name";
            }else{
                fieldName = "name";
            }
        }
        if (Tools.myIsNull(fieldId) == true) {
            fieldId = "id";
        }
        // "select $nf from $dic where $kf='$val'",$nf
        String fSql = "select " + fieldName + " from " + tbName + " where " + fieldId + "='" + nid + "'";
        TtMap mpResult = recinfo(fSql);
        return mpResult != null ? mpResult.get(fieldName) : "";
    }

    public String unDic(String tbName, String nid) {
        return unDic(tbName, nid, "", "");
    }

    public String unDic(String tbName, long nid) {
        return unDic(tbName, String.valueOf(nid));
    }

    /**
     * 关闭数据库连接，每次使用完后调用此方法。
     */
    public void closeConn() {
        try {
            if (conn != null) {
                conn.close();
                mylog("dbTools关闭连接");
            }
        } catch (SQLException e) {
            Tools.logError(e.getMessage());
            e.printStackTrace();
        }
    }
}