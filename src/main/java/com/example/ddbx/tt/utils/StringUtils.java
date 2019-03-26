package com.example.ddbx.tt.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 字符串处理
 */
public class StringUtils {


    //去除字符串中的空格、回车、换行符、制表符
    public static String replaceBlank(String str) {
        String dest = "";
        if (str!=null) {
            Pattern p = Pattern.compile("\\s*|\t|\r|\n");
            Matcher m = p.matcher(str);
            dest = m.replaceAll("");
        }
        return dest;
    }

//    public static void main(String[] args) {
//        System.out.println(StringUtils.replaceBlank("{\"zdrpo_zx1_result\":\"\",\"later_status\":\"3\",\"dt_add\":\"2019-03-05 10:54:09\",\"zdr_zx1_result\":\"41241414\",\"gjr2_dsj_code\":\"\",\"gjr1_zx1_result\":\"\",\"type_id\":\"36\",\"gems_id\":\"21\",\"remark\":\"12441241241\n" +
//                "                        \",\"zdr_dsj_code\":\"124141\",\"icbc_id\":\"40\",\"gjr1_dsj_code\":\"\",\"result_msg\":\"12441241241\n" +
//                "                        \",\"dt_edit\":\"2019-03-05 10:54:09\",\"gjr2_zx1_result\":\"\",\"result_code\":\"3\",\"gems_fs_id\":\"33\",\"id\":\"32\",\"state_code\":\"3\",\"zdrpo_dsj_code\":\"\",\"qryid\":\"32\",\"now_status\":\"2\"}\n"));
//    }
}
