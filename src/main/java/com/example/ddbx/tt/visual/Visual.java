package com.example.ddbx.tt.visual;


import net.sf.json.JSONArray;
import com.example.ddbx.tt.data.TtList;
import com.example.ddbx.tt.tool.DbCtrl;
import com.example.ddbx.tt.tool.DbTools;
import com.example.ddbx.tt.tool.Tools;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
/**
 *
 * 可视化页面ajax控制器
 * 用于显示可视化数据
 *
 */
@RestController      //  默认类中的方法都会以 json 的格式返回
@Controller
public class Visual {
    DbCtrl dbCtrl;
    String [][] s;

    //输入sql语句进行查询操作
    public TtList selectSQL(String sql){
        DbTools myDbTools=new DbTools();
        TtList allCustomer = null;
        try {
            allCustomer = myDbTools.reclist(sql);
            dbCtrl.recs = Long.parseLong(myDbTools.recexec_getvalue("SELECT FOUND_ROWS() as rno;", "rno"));
        }catch (Exception e) {
            Tools.logError(e.getMessage(), true, false);
        }finally {
            myDbTools.closeConn();
        }
        return allCustomer;
    }


    /**
     * 使用 注解@RestController
     *  使用注解不需要转换成json
     *  默认类中的方法都会以 json 的格式返回
     * */
    @RequestMapping(value = "/manager/visual/select", method = RequestMethod.POST)
    @ResponseBody
    public String[][] select(){
        String sql="select id,gems_id from dd_icbc";
        TtList list=selectSQL(sql);
        s=new String[5][5];
        s[0][0]=list.get(0).get("id");
        s[1][1]=list.get(1).get("id");
        s[2][2]=list.get(2).get("id");
        s[1][2]=list.get(1).get("gems_id");
        s[2][3]=list.get(2).get("gems_id");
        return s;
    }

    /**
     * 不使用 注解@RestController      //  默认类中的方法都会以 json 的格式返回
     * 需要方法转换成json字符串然后传到前台
     *
     *   @RequestMapping(value = "/manager/visual/select1", method = RequestMethod.POST)
     *   @ResponseBody
     *   public String select1(HttpServletRequest request, HttpServletResponse response){
     *       String sql="select id,gems_id from dd_icbc";
     *       TtList list=selectSQL(sql);
     *       String [][] s=new String[3][5];
     *       s[0][0]=list.get(0).get("id");
     *       s[0][1]=list.get(1).get("id");
     *       s[1][2]=list.get(2).get("id");
     *       s[2][1]=list.get(3).get("id");
     *       s[2][2]=list.get(4).get("gems_id");
     *       JSONArray jsonArray = JSONArray.fromObject(s);
     *       ToJson(request,response,jsonArray);
     *       return null;
     *   }
     *
     *   //转换成json字符串并输出到前台
     *   public void ToJson(HttpServletRequest request, HttpServletResponse response,JSONArray jsonArray){
     *       try {
     *           response.setContentType("text/html;charset=UTF-8");
     *           response.setContentType("application/json");
     *           PrintWriter pw = null;
     *           pw = response.getWriter();
     *           pw.print(jsonArray); // 轨迹图条件，取少量数据
     *           pw.flush();
     *           pw.close();
     *       } catch (IOException e) {
     *           e.printStackTrace();
     *       }
     *   }
     */

}
