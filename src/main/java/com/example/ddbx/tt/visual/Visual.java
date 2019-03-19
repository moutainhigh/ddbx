package com.example.ddbx.tt.visual;

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
/**
 *
 *  import java.io.IOException;
 *   import java.io.PrintWriter;
 *    import net.sf.json.JSONArray;
 */

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
    String [] string;
    Object [][] object;

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
    public String[] select(){
        String sql="select id,gems_id from dd_icbc";
        TtList list=selectSQL(sql);
        string=new String[5];
        string[0]=list.get(0).get("id");
        string[1]=list.get(1).get("id");
        string[2]=list.get(2).get("id");
        string[2]=list.get(2).get("gems_id");
        return string;
    }

    //前台数据后台获取
    public static void management(HttpServletRequest request) {



       /* request.setAttribute("billlist",kj_icbcService.SelectBill(assess_fs));//每月报单总量     0
        request.setAttribute("loanlist",loanlist);//每月已放款单数，总金额
        request.setAttribute("fklist",fklist);//每月已放款未抵押单数，总金额
        request.setAttribute("carselect",kj_icbcService.CountSelect(assess_fs));//所有汽车贷款     0
        request.setAttribute("carpass",kj_icbcService.CountPass(assess_fs));//汽车贷款通过          0
        request.setAttribute("rankinglist",rankinglist);//每月总订单数各省排名
        request.setAttribute("gemslist",gemslist);//每月总订单数各代理商排名
        request.setAttribute("rankingloanlist",rankingloanlist);//每月总订过件单数各省排名
        request.setAttribute("gemsloanlist",gemsloanlist);//每月总订单数过件各代理商排名
        request.setAttribute("cardpasscomm",cardpasscomm );//每月汽车贷款过件率各省排名
        request.setAttribute("cardpassgems",cardpassgems );//每月汽车贷款过件率各代理商排名*/
    }

    //每月数据总单数折线图ajax前台获取           null,null,null
    @RequestMapping("/manager/visual/getPathMap.do")
    @ResponseBody
    public Object[][] getPathMap(HttpServletRequest request, HttpServletResponse response){
        /*** 根据条件取值生成二维数据，并转成json ***/
        String sql="";
        //TtList chart=selectSQL(sql);

        object=new Object[2][9];
        /*if(chart.size()<9){
            for(int i=0;i<chart.size();i++){
                object[1][i]=(chart.get(i).get("year")+"-"+chart.get(i).get("month"));//把日期格式输出放入二维数组xxxx-xx
                object[0][i]=(chart.get(i).get("total"));//把每月数据放入二维数组
            }
            for(int i=chart.size();i<9;i++){
                object[1][i] = "2018-";
                object[0][i] = "0";
            }
        }else{
            for(int i=0;i<9;i++){
                object[1][i]=(chart.get(i).get("year")+"-"+chart.get(i).get("month"));//把日期格式输出放入二维数组xxxx-xx
                object[0][i]=(chart.get(i).get("total"));//把每月数据放入二维数组
            }
        }*/
        object[0][1]=1;
    return object;
    }
    //汽车贷款通过率折线图ajax前台获取
    @RequestMapping("/manager/visual/getCarPathMap.do")
    @ResponseBody
    public Object[][] getCarPathMap(HttpServletRequest request, HttpServletResponse response) {
        /*** 根据条件取值生成二维数据，并转成json ***/
        String sql="";
        TtList chart=selectSQL(sql);
        object=new Object[2][9];
        /*if(chart.size()<9){
            for(int i=0;i<chart.size();i++){
                object[1][i]=(chart.get(i).get("year")+"-"+chart.get(i).get("month"));//把日期格式输出放入二维数组xxxx-xx
                object[0][i]=(chart.get(i).get("total"));//把每月数据放入二维数组

            }
            for(int i=chart.size();i<9;i++){
                object[1][i] = "2018-";
                object[0][i] = "0";
            }
        }else{
            for(int i=0;i<9;i++){
                object[0][i]=(chart.get(i).get("total"));//把每月数据放入二维数组
                object[1][i]=(chart.get(i).get("year")+"-"+chart.get(i).get("month"));//把日期格式输出放入二维数组xxxx-xx
            }
        }*/
        object[0][1]=2;
    return object;
    }
    //新旧汽车贷款分布扇形图ajax前台获取
    @RequestMapping("/manager/visual/getCarFkPathMap.do")
    @ResponseBody
    public String[] getCarFkPathMap(HttpServletRequest request, HttpServletResponse response) {
        /*** 根据条件取值生成二维数据，并转成json ***/
        String sql="";
        TtList chart=selectSQL(sql);

        string = new String[2];
        /*if(chart.size() < 2){
            if(chart.size()<1){
                for(int i=0;i<2;i++){
                    string[i]="0";
                }
            }else{
                if(chart.get(0).get("cartype").equals("1")){
                    string[0]=chart.get(0).get("cartotal");
                    string[1]="0";
                }else{
                    string[0]="0";
                    string[1]=chart.get(0).get("cartotal");
                }
            }
        }else{
            for(int i=0;i<2;i++){
                string[i]=chart.get(i).get("cartotal");
            }
        }*/
    string[0]="3";
    return string;
    }
    //贷款金额分布扇形图ajax前台获取     null,null,null,null
    @RequestMapping("/manager/visual/getMoneyPathMap.do")
    @ResponseBody
    public String[] getMoneyPathMap(HttpServletRequest request, HttpServletResponse response) {
        /*** 根据条件取值生成二维数据，并转成json ***/
        String sql="";
        TtList chart=selectSQL(sql);

        string = new String[4];
        /*if(chart.get(0) == null){
            for(int i=0;i<4;i++){
                string[i]="0";
            }
        }else{
            for(int i=1;i<5;i++){
                if(chart.get(0).get("singular"+i)==null){
                    string[i-1]="0";
                }else{
                    string[i-1]=chart.get(0).get("singular"+i);
                }
            }
        }*/
        string[0]="4";
    return string;
    }
    //抵押完成天数分布扇形图ajax前台获取
    @RequestMapping("/manager/visual/getPawnPathMap.do")
    @ResponseBody
    public String[] getPawnPathMap(HttpServletRequest request, HttpServletResponse response) {
        /*** 根据条件取值生成二维数据，并转成json ***/
        String sql="";
        TtList chart=selectSQL(sql);

        string = new String[5];
        /*if(chart.get(0) == null){
            for(int i=0;i<5;i++){
                string[i]="0";
            }
        }else{
            for(int i=1;i<6;i++){
                if(chart.get(0).get("paw"+i)==null){
                    string[i-1]="0";
                }else{
                    string[i-1]=chart.get(0).get("paw"+i);
                }
            }
        }*/
        string[0]="5";
        return string;
    }
    //征信查询分布扇形图ajax前台获取   null,null       0,1
    @RequestMapping("/manager/visual/getCreditPathMap.do")
    @ResponseBody
    public String[] getCreditPathMap(HttpServletRequest request, HttpServletResponse response) {
        /*** 根据条件取值生成二维数据，并转成json ***/
        String sql="";
        TtList credit=selectSQL(sql);

        string = new String[3];
       /* if(credit.size() < 3){
            if(credit.size()<1){
                for(int i=0;i<3;i++){
                    string[i]="0";
                }
            }else{
                if(credit.get(0).get("zxok_tag").equals("1")){
                    string[0]=credit.get(0).get("zxok");
                }else{
                    string[0]="0";
                    for(int i=0;i<credit.size();i++){
                        string[i+1]=credit.get(i).get("zxok");
                    }
                    for(int i=credit.size();i<3;i++){
                        string[i+1]="0";
                    }
                }
            }
        }else{
            for(int i=0;i<3;i++){
                string[i]=credit.get(i).get("zxok");
            }
        }*/
        string[0]="6";
        return string;
    }
    //客户年龄分布扇形图ajax前台获取      null,null,null,null
    @RequestMapping("/manager/visual/getAgePathMap.do")
    @ResponseBody
    public String[] getAgePathMap(HttpServletRequest request, HttpServletResponse response) {
        /*** 根据条件取值生成二维数据，并转成json ***/
        String sql="";
        TtList credit=selectSQL(sql);

        string = new String[4];
        /*if(credit.get(0) == null){
            for(int i=0;i<4;i++){
                string[i]="0";
            }
        }else{
            for(int i=1;i<5;i++){
                if(credit.get(0).get("age"+i)==null){
                    string[i-1]="0";
                }else{
                    string[i-1]=credit.get(0).get("age"+i);
                }
            }
        }*/
        string[0]="7";
        return string;
    }
    //新车年龄分布扇形图ajax前台获取    null,null,null,null
    @RequestMapping("/manager/visual/getCarsAgePathMap.do")
    @ResponseBody
    public String[] getCarsAgePathMap(HttpServletRequest request, HttpServletResponse response) {
        /*** 根据条件取值生成二维数据，并转成json ***/
        String sql="";
        TtList carsage=selectSQL(sql);

        string = new String[4];
        /*if(carsage.get(0) == null){
            for(int i=0;i<4;i++){
                string[i]="0";
            }
        }else{
            for(int i=1;i<5;i++){
                if(carsage.get(0).get("age"+i)==null){
                    string[i-1]="0";
                }else{
                    string[i-1]=carsage.get(0).get("age"+i);
                }
            }
        }*/
        string[0]="8";
        return string;
    }
    //垫资天数分布图ajax前台获取   null,null,null
    @RequestMapping("/manager/visual/getAdvanceFundPathMap.do")
    @ResponseBody
    public Object[][] getAdvanceFundPathMap(HttpServletRequest request, HttpServletResponse response) {
        String sql="";
        TtList fund=selectSQL(sql);

        object=new Object[2][12];
        /*if(fund.size()<12){
            for(int i=0;i<fund.size();i++){
                object[1][i]=(fund.get(i).get("year")+"-"+fund.get(i).get("month"));//把日期格式输出放入二维数组xxxx-xx
                object[0][i]=(fund.get(i).get("adate"));//把每月数据放入二维数组

            }
            for(int i=fund.size();i<12;i++){
                object[1][i] = "2018-";
                object[0][i] = "0";
            }
        }else{
            for(int i=0;i<12;i++){
                object[0][i]=(fund.get(i).get("adate"));//把每月数据放入二维数组
                object[1][i]=(fund.get(i).get("year")+"-"+fund.get(i).get("month"));//把日期格式输出放入二维数组xxxx-xx
            }
        }*/

        object[0][1]=9;
        return object;
    }
    //抵押材料回收分布图ajax前台获取   null,null,null
    @RequestMapping("/manager/visual/getRecyclePathMap.do")
    @ResponseBody
    public Object[][] getRecyclePathMap(HttpServletRequest request, HttpServletResponse response) {

        String sql="";
        TtList fund=selectSQL(sql);

        object=new Object[2][9];
        /*if(fund.size()<9){
            for(int i=0;i<fund.size();i++){
                object[1][i]=(fund.get(i).get("year")+"-"+fund.get(i).get("month"));//把日期格式输出放入二维数组xxxx-xx
                object[0][i]=(fund.get(i).get("total"));//把每月数据放入二维数组

            }
            for(int i=fund.size();i<9;i++){
                object[1][i] = "2018-";
                object[0][i] = "0";
            }
        }else{
            for(int i=0;i<9;i++){
                object[0][i]=(fund.get(i).get("total"));//把每月数据放入二维数组
                object[1][i]=(fund.get(i).get("year")+"-"+fund.get(i).get("month"));//把日期格式输出放入二维数组xxxx-xx
            }
        }*/
        object[0][1]=10;
        return object;
    }
    //新旧车放款分布图ajax前台获取    null,null,null,null
    @RequestMapping("/manager/visual/getNewOldCarsPathMap.do")
    @ResponseBody
    public Object[][] getNewOldCarsPathMap(HttpServletRequest request, HttpServletResponse response) {
        String sql="";
        TtList newcars=selectSQL(sql);

        object=new Object[5][12];
        /*if(newcars.size()<12){
            for(int i=0;i<newcars.size();i++){
                object[0][i]=(newcars.get(i).get("year1")+"-"+newcars.get(i).get("month1"));//把日期格式输出放入二维数组xxxx-xx
                object[1][i]=(newcars.get(i).get("newcon"));//把新车每月放款单数放入二维数组
                object[2][i]=(newcars.get(i).get("newmoney"));//把新车每月放款总金额放入二维数组
                object[3][i]=(newcars.get(i).get("oldcon"));//把二手车每月放款单数放入二维数组
                object[4][i]=(newcars.get(i).get("oldmoney"));//把二手车每月放款总金额放入二维数组

            }
            for(int i=newcars.size();i<12;i++){
                object[0][i] = "2018-";
                object[1][i] = "0";
                object[2][i] = "0";
                object[3][i] = "0";
                object[4][i] = "0";
            }
        }else{
            for(int i=0;i<12;i++){
                object[0][i]=(newcars.get(i).get("year1")+"-"+newcars.get(i).get("month1"));//把日期格式输出放入二维数组xxxx-xx
                object[1][i]=(newcars.get(i).get("newcon"));//把新车每月放款单数放入二维数组
                object[2][i]=(newcars.get(i).get("newmoney"));//把新车每月放款总金额放入二维数组
                object[3][i]=(newcars.get(i).get("oldcon"));//把二手车每月放款单数放入二维数组
                object[4][i]=(newcars.get(i).get("oldmoney"));//把二手车每月放款总金额放入二维数组
            }
        }*/
        object[0][1]=11;
        return object;
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
