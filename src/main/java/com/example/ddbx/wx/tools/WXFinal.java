package com.example.ddbx.wx.tools;

/**
 * @Auther: liwang
 * @Date: 2018/11/27 0027
 * @Description:
 */
public class WXFinal {

    //登录凭证校验
    public static String VerificationOfLoginCredentials="https://api.weixin.qq.com/sns/jscode2session?appid=APPID&secret=SECRET&js_code=JSCODE&grant_type=authorization_code";
    public static String CbsUserid="60206";
    public static String CbsKeysecret="b2082f585b0fcb96f19283bb74e5f235";
    //钛镕车辆出险
    public static String insuranceClaims="http://tidata.taifinance.cn:8080/api/vehical/insurance-claims";
    //阿里云维保
    public static String breakRules="http://ali-carlaw.showapi.com/break-rules";
    //微信统一下单
    public static String unifiedorder="https://api.mch.weixin.qq.com/pay/unifiedorder";
       //我的
//    //小程序的 app secret
//    public static String appSecret="206f67f1b1561f69d017403aff8b851c";
//    //小程序唯一标识
//    public static String appid="wx9cef4a1d7c28cdd5";

//    小程序的 app secret
    public static String appSecret="98fb0c3ef64772c5b3dcf74dfc5c1161";
    //小程序唯一标识
    public static String appid="wxdb2e6c6b98d6cd10";
    /*快管车小程序（原快加汽车鉴定·）
    APPID：wx2cfecb6317bf2578
    AppSecret:857c2de277533665c31883cd8ea7dbf3*/
//    //数据库开发环境
//    public static boolean  TESTMODE=true;
    //域名地址
    public static String BasePath="http://192.168.50.100:8092/";
    //开发地址
    public final static String media_file="D:/gitRepository/ddbx/src/main/webapp/wxupload/";
    //微信支付回调地址 开发环境
    public static String WX_PAY="http://5c204324b918e.vipbj1.tunnelnat.com/";
    //证书的路径 开发环境
    public static String  APICLIENT_CERT="C:\\Users\\Administrator\\Desktop\\kjc\\apiclient_cert.p12";

//    //证书路径 正式环境
//    public static String  APICLIENT_CERT="/home/tomcat/cert/apiclient_cert.p12";
//    //微信支付回调正式环境
//   public static String WX_PAY="https://kgcserver.kcway.net/";
//    //数据库线上环境
//    public static boolean TESTMODE=false;
//    //线上域名地址
//    public static String BasePath="https://kgcserver.kcway.net/";
//    //线上图片存储地址
//    public final static String media_file="/KCDIMG/kjbupload/";

    //key设置路径：微信商户平台(pay.weixin.qq.com)-->账户设置-->API安全-->密钥设置
    public static String KEY="kcwaykcway1885916909018859169090";
    //微信退款
    public static String refund="https://api.mch.weixin.qq.com/secapi/pay/refund";
    //微信小程序 通过code获取openID
    public static String JSCODE2SESSION="https://api.weixin.qq.com/sns/jscode2session";
    //access_token
    public static String ACCESS_TOKEN="https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
   //与ehcache.xml中的cache.name对应
   public final static String TOKEN_CACHE_NAME="tokenCache";
   //accessKey
   public final static String ACCESS_CACHE_TOKEN="access_cache_token";
   //js api ticket
   public final static String JSAPI_CACHE_TICKET="jsapi_cache_ticket";
 //获取JSsdk
 public final static String JSAPI_TICKET="https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi";
 public final static String SEND="https://api.weixin.qq.com/cgi-bin/message/wxopen/template/send?access_token=ACCESS_TOKEN";
    /*微信支付商户号 1415137402
    MCHID:1415137402   KEY:kcwaykcway1885916909018859169090*/
    /*MCHID:1413624202
    APPID:wx2cfecb6317bf2578*/
    public static String MCHID="1413624202";
}
