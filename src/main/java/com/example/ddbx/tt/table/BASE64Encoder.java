package com.example.ddbx.tt.table;

import com.example.ddbx.tt.tool.Tools;
import sun.misc.BASE64Decoder;

import java.io.IOException;
import java.lang.reflect.Method;

/**
 * base64编码工具类
 */
public class BASE64Encoder {

    /**
     * 编码1
     *
     * @param content
     * @return
     */
    public static String encode(byte[] content) {
        return new sun.misc.BASE64Encoder().encode(content);
    }

    /**
     * 解码1
     *
     * @param source
     * @return
     */
    public static byte[] decode(String source) {
        try {
            BASE64Decoder decoder = new sun.misc.BASE64Decoder();
            return decoder.decodeBuffer(source);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
    /**
     * 编码2
     *
     * @param input
     * @return
     * @throws Exception
     */
    public static String encodeBase64(byte[] input) throws Exception {
        Class clazz = Class.forName("com.sun.org.apache.xerces.internal.impl.dv.util.Base64");
        Method mainMethod = clazz.getMethod("encode", byte[].class);
        mainMethod.setAccessible(true);
        Object retObj = mainMethod.invoke(null, new Object[]{input});
        return (String) retObj;
    }

    /**
     * 解码2
     *
     * @param input
     * @return
     * @throws Exception
     */
    public static byte[] decodeBase64(String input) throws Exception {
        Class clazz = Class.forName("com.sun.org.apache.xerces.internal.impl.dv.util.Base64");
        Method mainMethod = clazz.getMethod("decode", String.class);
        mainMethod.setAccessible(true);
        Object retObj = mainMethod.invoke(null, input);
        return (byte[]) retObj;
    }

//    public static void main(String[] args) throws Exception {
//        String s="你好";
//        if(Tools.myIsNull(s)){
//            System.out.println("null");
//        }
//        System.out.println("编码1："+encode(s.getBytes()));
//        System.out.println("解码1："+new String(decode(encode(s.getBytes()))));
//        System.out.println("编码2："+encodeBase64(s.getBytes()));
//        System.out.println("解码2："+new String(decodeBase64(encodeBase64(s.getBytes()))));
//    }
}
