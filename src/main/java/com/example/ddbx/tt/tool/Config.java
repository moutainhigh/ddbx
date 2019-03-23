/*
 * @Description: TT总配置文件。
 * @Author: tt
 * @Date: 2018-12-26 17:42:40
 * @LastEditTime: 2019-02-15 14:00:15
 * @LastEditors: tt
 */
package com.example.ddbx.tt.tool;
import org.apache.log4j.Logger;

public class Config {
    public final static boolean TESTMODE = true;/* 测试/生产环境开关 */
    public final static boolean DEBUGMODE = true;/* 调试模式开关，调试模式下会打印异常到浏览器 */
    public final static String TTVER = "2.0 build 20190226"; /* 版本号 */
    public final static String APP_TITLE = "大地保险"; //项目名称：类似大地保险
    public final static String APP_VER = " 1.0 build 20190226"; //项目版本
    public static String MANAGER_SKINCSS="skin-yellow";//皮肤主题{skin-black  ,skin-purple ,skin-yellow,skin-red,skin-green}
    /**NOTE:
     * 文件上传相关配置开始
     */
    public final static String[] FILEUP_OKEXT = new String[] { "JPG", "PNG", "GIF", "BMP", "MP4", "ZIP", "RAR" };/* 允许的上传文件类型 */
    public final static long FILEUP_MAXSIZE = 1024 * 1024 * 5;/* 最大支持文件大小 */
    /* 后台管理员支持上传最大文件大小 */
    public final static long FILEUP_MAXSIZE_ISADMIN = 1024 * 1024 * 50;
    public final static String FILEUP_SAVEPATH = TESTMODE 
            ? "src/main/webapp/upload/" /* 测试模式上传文件保存路径，/\开头的为绝对路径，否则是相对路径 */
            : "/KCDIMG/ddbx-upload/"; /* 生产模式上传文件保存路径，/\开头的为绝对路径，否则是相对路径 */
    public final static String FILEUP_URLPRE = TESTMODE ? "/upload/" :"/upload/";/* 对应访问的url前缀 */
    public final static int FILEUP_WRITEBLOCKSIZE = 1024 * 8;/* 写文件时每次写入的块大小，默认8KB每次读写量 */
    
    /**NOTE:
     * 数据库配置
     */
    public final static String DB_PRECONNSTR = "jdbc:mysql://localhost:3306/" ;/** 数据库连接前缀，指定服务器和端口 */
    public final static String DB_DRIVER =  "com.mysql.cj.jdbc.Driver";//6.0以下用 "com.mysql.jdbc.Driver"
    public final static String DB_MAXACTIVECOMNNECTION = "20";/* 连接池最大连接数.连接池里面最大的连接数，超过这个数时，再获取连接需要等待 */
    public final static String[] DB_CONFIG = TESTMODE/* 数据源配置，格式：数据库名/用户名/密码，每三个一组为一个数据源 */
            ? new String[] { //测试环境
            "ddbxdb", "root", "root",//ttdemo
            "kcway2", "root", "root" //ddbxdb
            //"kjbdb", "root", "root",
    }
            : new String[] { //生产环境    
                "ddbxdb","ddbxu","xDCnx5G9Wv2Ah4rc",
                "kcway2", "kcway","NDXppG2qUNB6pXcA" ,
               // "kjbdb", "kjb", "exxH29nVn232mDMS",
            };
/*  服务器  mysql:


    库： ddbxdb
    用户：ddbxu
    密码：xDCnx5G9Wv2Ah4rc*/
    public final static String DB_ENDCONNSTR = "?useUnicode=true&characterEncoding=utf-8&autoReconnect=true&failOverReadOnly=false&useSSL=false&serverTimezone=GMT%2B8";/* 数据库连接字符串尾端配置，指定配置的一些参数，SSL，字符编码等 */
    public final static String DB_USERTABLENAME="admin";

    /**NOTE:
     * 自写日志文件相关配置，使用log4j,文件保存位置等配置在log4j.Properties文件;
     */
    public final static Boolean GLOBAL_SHOWLOG = true;
    public static Logger log = Logger.getLogger(Config.class);
    /**
     * SQL防注入的相关配置
     */
    public static String[] SQLINJ_EXINCLUDE= {"form","do","cn","id","mid_add","mid_edit","wxmini_car_store","car_stora","color"};/* SQL防注入白名单 */
    public static String[] SQLINJ_INJ_STR = {"'"," and ","exec","insert ","select ","delete ","update ","count ","*","%","chr","mid","master","truncate","char","declare",";"," or ","+",",","alert"};
    /**
     * UI方面配置，字体，字体大小todo:可存于用户个性化设置的数据库中
     */
    public static String UI_FONT_SIZE="18px";
    public static String UI_FONT_FAMILY=null;//"Source Code Pro"; 
    public static String UI_FONT_COMPONENTS = "body,span,b,input,select,a";
}