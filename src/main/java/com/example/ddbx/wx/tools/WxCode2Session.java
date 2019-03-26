package com.example.ddbx.wx.tools;
import com.example.ddbx.wx.tools.WXFinal;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

/**
 * @Auther: liwang
 * @Date: 2018/11/27 0027
 * @Description:
 */
public class WxCode2Session {
    public static String get(String code) {
        //获取session_key和openId
        String url = WXFinal.JSCODE2SESSION+"?appid=" + WXFinal.appid + "&secret=" + WXFinal.appSecret + "&js_code=" +code+"&grant_type=authorization_code";
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.GET, null, String.class);
        if (responseEntity != null && responseEntity.getStatusCode() == HttpStatus.OK) {
            String sessionData = responseEntity.getBody();
            return sessionData;
        }
        return null;
    }

    /**
     * 结果格式化
     * */
    public static Map<String, String> formatResult(boolean success, int code, String msg) {
        Map<String, String> result2 = new HashMap<>();
        result2.put("success", success ? "true" : "false");
        result2.put("errorcode", success ? "0" : String.valueOf(code));
        result2.put("errormsg", msg);
        return result2;
    }

}
