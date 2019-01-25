/*
 * @Description: TT数据库封装-连接池，数据源处理类
 * @Author: tt
 * @Date: 2018-12-20 19:48:20
 * @LastEditTime: 2019-01-16 09:27:28
 * @LastEditors: tt
 */
package com.example.ddbx.tt.tool;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import javax.sql.DataSource;

/**
 * pom.xml配置注意，因为要使用阿里的druid控件所以要导入druid组件 <properties>
 * <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
 * <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
 * <java.version>1.8</java.version> <druid>1.1.12</druid> </properties>
 * <dependency> <groupId>mysql</groupId>
 * <artifactId>mysql-connector-java</artifactId> <scope>runtime</scope>
 * <version>6.0.6</version> </dependency> <dependency>
 * <groupId>com.alibaba</groupId> <artifactId>druid</artifactId>
 * <version>${druid}</version> </dependency>
 */

public class DbConfig {
    public static int errorCode = 0;
    public static Map<String, DataSource> g_dsmap = new HashMap<>();
    public static boolean showlog = true;

    /**
     * @description: 获取数据源，创建数据源
     * @param {type}
     * @return:
     */
    public static final DataSource getDataSource(String dbname, String user, String pass) throws Exception {
        DataSource dataSource = null;

        Properties p = new Properties();
        /**
         * todo 设置连接参数，具体的可以参考阿里云druid的每项配置的意义 下面的配置参数，每一项的具体意义可以参考阿里云Druid的文档。
         */
        p.put("initialSize", "1");
        p.put("minIdle", "1");
        p.put("maxActive", Config.DB_MAXACTIVECOMNNECTION);// 比较重要的参数，最大连接数.连接池里面最大的连接数，超过这个数时，再获取连接需要等待
        p.put("maxWait", "3000");// 获取连接等待时间，超时时间
        p.put("timeBetweenEvictionRunsMillis", "60000");
        p.put("minEvictableIdleTimeMillis", "300000");
        p.put("validationQuery", "SELECT 'x' from dual");
        p.put("testWhileIdle", "true");
        p.put("testOnBorrow", "false");
        p.put("testOnReturn", "false");
        p.put("poolPreparedStatements", "true");
        p.put("maxPoolPreparedStatementPerConnectionSize", "20");
        p.put("filters", "stat,wall,log4j");// todo 可以加上防sql注入参数,wall,stat
        p.put("logAbandoned", "true");
        p.put("removeAbandoned", "true");
        p.put("removeAbandonedTimeout", "30");
        String DB_URL = Config.DB_PRECONNSTR + dbname + Config.DB_ENDCONNSTR;
        p.put("url", DB_URL);
        p.put("username", user);
        p.put("password", pass);
        p.put("slowSqlMillis", "200");
        p.put("logSlowSql", "true");
        // p.put("sessionStatEnable","true");
        p.put("driverClassName", Config.DB_DRIVER);
        /** 使用阿里云开源数据库连接池管理 Druid */
        dataSource = DruidDataSourceFactory.createDataSource(p);
        g_dsmap.put(Integer.toString(g_dsmap.size() + 1), dataSource);
        return dataSource;
    }

    /**
     * @description: 写日志。
     * @param {type}
     * @return:
     */
    private static void mylog(String mString) {
        if (showlog == true) {
            Log log = LogFactory.getLog(DbConfig.class);
            // System.out.println("com.tt.tool.DbConfig:"+mString);
            log.info(mString);
        }
        if (Config.GLOBAL_SHOWLOG) {
            Config.log.debug("DbConfig:" + mString);
        }
    }

    /* 默认的数据库链接，目前直接写到类里 */
    static private void CreateCc(String dbname, String user, String pass) {
        try {
            mylog("开始连接数据库：" + dbname);
            getDataSource(dbname, user, pass);
        } catch (SQLException e) {
            // 处理 JDBC 错误
            errorCode = 999;
            mylog(e.getMessage());
            Tools.logError("DbConfig:errorCode :999,CreateCc() error:" + e.getMessage());
        } catch (Exception e) {
            // 处理 Class.forName 错误
            errorCode = 998;
            Tools.logError("DbConfig:errorCode :998,CreateCc() error:" + e.getMessage());
            mylog(e.getMessage());
        } finally {

        }
        mylog("Goodbye!");
    }

    /**
     * 初始化DbConfig
     * 
     * @param ashowlog
     */
    static public void init(boolean ashowlog) {
        if (g_dsmap.size() > 0) {// 已经初始化了
            return;
        }
        showlog = ashowlog;
        for (int i = 0; i < Config.DB_CONFIG.length; i += 3) {
            CreateCc(Config.DB_CONFIG[i], Config.DB_CONFIG[i + 1], Config.DB_CONFIG[i + 2]);
        }
    }
}
