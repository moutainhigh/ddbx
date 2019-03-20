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
    private static DbCtrl dbCtrl;
    private String [] string;
    private Object [][] object;

    //输入sql语句进行查询操作
    private static TtList selectSQL(String sql){
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
    //遍历查询到的数组，如果为空附一个初始值，并排序
    private Object[][] returnList(TtList chart){
        if(chart.size()<9){
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
        }
        return object;
    }
    //遍历数组
    private Object[][] selectList(int i,TtList newcars){
        object[0][i]=(newcars.get(i).get("year1")+"-"+newcars.get(i).get("month1"));//把日期格式输出放入二维数组xxxx-xx
        object[1][i]=(newcars.get(i).get("newcon"));//把新车每月放款单数放入二维数组
        object[2][i]=(newcars.get(i).get("newmoney"));//把新车每月放款总金额放入二维数组
        object[3][i]=(newcars.get(i).get("oldcon"));//把二手车每月放款单数放入二维数组
        object[4][i]=(newcars.get(i).get("oldmoney"));//把二手车每月放款总金额放入二维数组
        return object;
    }



    //前台数据后台获取
    public static void management(HttpServletRequest request) {
        String sql="select count(*) amount from dd_icbc  " +
                " where month(dt_add)=MONTH(SYSDATE())  " +
                " and YEAR(dt_add)=year(SYSDATE())  " +
//                " and gems_fs_id in(select id from fs where up_id=${up_id} or id =${id}) " +
                "";
        TtList billlist=selectSQL(sql);
        request.setAttribute("billlist",billlist.get(0).get("amount"));//每月报单总量     0



        sql="  select count(di.state_id) sell,cs.`name` name  " +
                "  from dd_icbc di,comm_states cs  " +
                "  where di.state_id=cs.id  " +
                "  and month(di.dt_add)=MONTH(SYSDATE())  " +
                "  and YEAR(di.dt_add)=year(SYSDATE())  " +
                "  and di.gems_fs_id in(select id from fs where up_id=${up_id} or id =${id})  " +
                "  GROUP BY di.state_id  " +
                "  ORDER BY count(di.state_) DESC";
        TtList rankinglist=selectSQL(sql);
        request.setAttribute("rankinglist",rankinglist);//每月总订单数各省排名



        sql="     select count(di.gems_fs_id) gems,af.`name` name  " +
                "    from dd_icbc di,fs af  " +
                "    where di.gems_fs_id=af.id  " +
                "    and month(di.dt_add)=MONTH(SYSDATE())  " +
                "    and YEAR(di.dt_add)=year(SYSDATE())  " +
//                "  and di.gems_fs_id in(select id from fs where up_id=${up_id} or id =${id} )  " +
                "    GROUP BY di.gems_fs_id  " +
                "    ORDER BY count(di.gems_fs_id) DESC";
        TtList gemslist=selectSQL(sql);
        request.setAttribute("gemslist",gemslist);//每月总订单数各代理商排名



        sql="   select count(di.id) amount,sum(di.lending_money) money  " +
                "   from dd_icbc di " +
                "  where month(di.lending_date)=MONTH(SYSDATE())  " +
                "  and YEAR(di.lending_date)=year(SYSDATE())  " +
                "  and di.lending_result=1  " +
//                "  and di.gems_fs_id in(select id from fs where up_id=${up_id} or id =${id})" +
                "";
        TtList loanlist=selectSQL(sql);
        request.setAttribute("loanlist",loanlist);//每月已放款单数，总金额



        sql=" select count(di.state_id) sell,cs.`name` name  " +
                "  from dd_icbc di,comm_states cs  " +
                "  where di.state_id=cs.id  " +
                "  and month(di.lending_date)=MONTH(SYSDATE())  " +
                "  and YEAR(di.lending_date)=year(SYSDATE())  " +
                "  and di.lending_result=1  " +
//                "  and di.gems_fs_id in(select id from fs where up_id=${up_id} or id =${id})  " +
                "  GROUP BY di.state_id  " +
                "  ORDER BY count(di.state_id) DESC";
        TtList rankingloanlist=selectSQL(sql);
        request.setAttribute("rankingloanlist",rankingloanlist);//每月放款单数各省排名


        
        sql="select count(di.gems_fs_id) gems,af.`name` name  " +
                "    from dd_icbc di,fs af   " +
                "    where di.gems_fs_id=af.id  " +
                "    and month(di.lending_date)=MONTH(SYSDATE())  " +
                "    and YEAR(di.lending_date)=year(SYSDATE())  " +
                "   and di.lending_result=1  " +
//                "  and di.gems_fs_id in(select id from fs where up_id=${up_id} or id =${id} )  " +
                "   GROUP BY di.gems_fs_id  " +
                "   ORDER BY count(di.gems_fs_id) DESC";
        TtList gemsloanlist=selectSQL(sql);
        request.setAttribute("gemsloanlist",gemsloanlist);//每月放款单数各代理商排名


        /*request.setAttribute("carselect",);//所有汽车贷款     0
        request.setAttribute("carpass",);//汽车贷款通过          0
        request.setAttribute("fklist",);//每月已放款未抵押单数，总金额
        request.setAttribute("cardpasscomm", );//每月汽车贷款过件率各省排名
        request.setAttribute("cardpassgems", );//每月汽车贷款过件率各代理商排名*/
    }

    //每月数据总单数折线图ajax前台获取           null,null,null
    @RequestMapping("/manager/visual/getPathMap.do")
    @ResponseBody
    public Object[][] getPathMap(){
        String sql="select year(dt_add) year,month(dt_add) month,count(*) total " +
                "  from dd_icbc " +
                "  where year(SYSDATE())-year(dt_add) < 2 " +
//                "  and gems_fs_id in(select id from fs where up_id=${up_id} or id =${id}) " +
                "  GROUP BY year(dt_add),month(dt_add) " +
                "  ORDER BY dt_add DESC limit 9";
        TtList chart=selectSQL(sql);//数据库查询操作

        object=new Object[2][9];
        object=returnList(chart);//调用遍历查询，排序方法，返回处理过的数据
    return object;
    }
    //汽车贷款通过率折线图ajax前台获取
    @RequestMapping("/manager/visual/getCarPathMap.do")
    @ResponseBody
    public Object[][] getCarPathMap() {
        String sql=" select year(kic.dt_sub) year,month(kic.dt_sub) month,count(*) total " +
                " from kjs_icbc_cardk kic,dd_icbc ki " +
                " where kic.bc_status=3 " +
                " and kic.icbc_id=ki.id " +
//                " and ki.gems_fs_id in(select id from assess_fs af where up_id=${up_id} or id =${id}) " +
                " and year(SYSDATE())-year(kic.dt_sub) < 2 " +
                " GROUP BY year(kic.dt_sub),month(kic.dt_sub) " +
                " ORDER BY kic.dt_sub DESC limit 9";
        TtList chart=selectSQL(sql);//数据库查询操作
        object=new Object[2][9];
        object=returnList(chart);//调用遍历查询，排序方法，返回处理过的数据
    return object;
    }
    //新旧汽车贷款分布扇形图ajax前台获取
    @RequestMapping("/manager/visual/getCarFkPathMap.do")
    @ResponseBody
    public String[] getCarFkPathMap() {
        String sql="  select dic.car_type cartype,count(dic.car_type) cartotal  " +
                "  from dd_icbc_cars dic  " +
                "  where dic.icbc_id  " +
                "   in(select di.id  " +
                "    from dd_icbc di  " +
                "    where month(di.lending_date)=MONTH(SYSDATE())  " +
                "   and YEAR(di.lending_date)=year(SYSDATE()) " +
                "   and di.lending_result=1  " +
//                "  and di.gems_fs_id in(select id from fs where up_id=${up_id} or id =${id})" +
                " )  " +
                " GROUP BY dic.car_type  " +
                " ORDER BY dic.car_type";
        TtList chart=selectSQL(sql);

        string = new String[2];
        if(chart.size() < 2){
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
        }
    return string;
    }
    //贷款金额分布扇形图ajax前台获取     null,null,null,null
    @RequestMapping("/manager/visual/getMoneyPathMap.do")
    @ResponseBody
    public String[] getMoneyPathMap() {
        String sql="select sum(case when di.lending_money >= 30000 and di.lending_money < 100000 then 1 end) singular1, " +
                "     sum(case when di.lending_money >= 100000 and di.lending_money < 200000 then 1 end) singular2, " +
                "     sum(case when di.lending_money >= 200000 and di.lending_money < 500000 then 1 end) singular3, " +
                "     sum(case when di.lending_money >= 500000 then 1 end) singular4  " +
                "      from dd_icbc di  " +
                "      where month(di.lending_date)=MONTH(SYSDATE())  " +
                "      and YEAR(di.lending_date)=year(SYSDATE())  " +
                "     and di.lending_result=1   " +
//                "     and di.gems_fs_id in(select id from fs where up_id=${up_id} or id =${id}) " +
                "";
        TtList chart=selectSQL(sql);

        string = new String[4];
        if(chart.get(0) == null){
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
        }
    return string;
    }
    //抵押完成天数分布扇形图ajax前台获取
    @RequestMapping("/manager/visual/getPawnPathMap.do")
    @ResponseBody
    public String[] getPawnPathMap() {
        String sql="";
        TtList chart=selectSQL(sql);

        string = new String[5];
        if(chart.get(0) == null){
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
        }
        return string;
    }
    //征信查询分布扇形图ajax前台获取   null,null       0,1
    @RequestMapping("/manager/visual/getCreditPathMap.do")
    @ResponseBody
    public String[] getCreditPathMap() {
        String sql="select count(iekir.result_1_code) zxok,iekir.result_1_code zxok_tag  " +
                "    from icbc_erp_kj_icbc_result iekir,kj_icbc ki  " +
                "    where iekir.`status`=3  " +
                "    and ki.id=iekir.icbc_id  " +
//                "    and ki.gems_fs_id in(select id from assess_fs af where up_id=${up_id} or id =${id})  " +
                "    GROUP BY iekir.result_1_code  " +
                "    ORDER BY iekir.result_1_code LIMIT 0,2";
        TtList credit=selectSQL(sql);

        string = new String[3];
        if(credit.size() < 3){
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
        }
        return string;
    }
    //客户年龄分布扇形图ajax前台获取      null,null,null,null
    @RequestMapping("/manager/visual/getAgePathMap.do")
    @ResponseBody
    public String[] getAgePathMap() {
        String sql="    select sum(case when cardage.card >= 18 and cardage.card < 30 then 1 end) age1, " +
                "      sum(case when cardage.card >= 30 and cardage.card < 40 then 1 end) age2, " +
                "      sum(case when cardage.card >= 40 and cardage.card < 50 then 1 end) age3, " +
                "      sum(case when cardage.card >= 50 then 1 end) age4 from  " +
                "     (select (year(SYSDATE())-Mid(c_cardno,7,4)) card from dd_icbc  " +
//                "     where gems_fs_id in(select id from fs where up_id=${up_id} or id =${id})  " +
                "    ) cardage";
        TtList credit=selectSQL(sql);

        string = new String[4];
        if(credit.get(0) == null){
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
        }
        return string;
    }
    //新车年龄分布扇形图ajax前台获取    null,null,null,null
    @RequestMapping("/manager/visual/getCarsAgePathMap.do")
    @ResponseBody
    public String[] getCarsAgePathMap() {
        String sql="select sum(case when carage.age >= 1 and carage.age  < 3 then 1 end) age1, " +
                "      sum(case when carage.age >= 3 and carage.age  < 6 then 1 end) age2, " +
                "      sum(case when carage.age >= 6 and carage.age  < 9 then 1 end) age3, " +
                "      sum(case when carage.age >= 9 then 1 end) age4 " +
                "     from (select (year(di.dt_sub)-year(dic.cardt1)) age  " +
                "      from dd_icbc_cars dic,dd_icbc di  " +
                "      where di.id=dic.icbc_id  " +
//                "      and di.gems_fs_id in(select id from fs where up_id=${up_id} or id =${id})  " +
                "     and dic.car_type=1) carage";
        TtList carsage=selectSQL(sql);

        string = new String[4];
        if(carsage.get(0) == null){
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
        }
        return string;
    }
    //垫资天数分布图ajax前台获取   null,null,null
    @RequestMapping("/manager/visual/getAdvanceFundPathMap.do")
    @ResponseBody
    public Object[][] getAdvanceFundPathMap() {
        String sql="select year(yh_date.fk_date) year, " +
                "           month(yh_date.fk_date) month, " +
                "           avg(timestampdiff(day,dz_date.dt_sub,yh_date.fk_date)) adate  " +
                "       from (select iekir.icbc_id,iekir.dt_sub  " +
                "           from icbc_erp_kj_icbc_result iekir,kj_icbc ki  " +
                "           where iekir.`status`=52  " +
                "           and iekir.result_1_code=1  " +
                "           and ki.id=iekir.icbc_id  " +
//                "           and ki.gems_fs_id in(select id from assess_fs af where up_id=${up_id} or id =${id}) " +
                ") dz_date, " +
                "       (select iekir.icbc_id,iekir.fk_date  " +
                "           from icbc_erp_kj_icbc_result iekir,kj_icbc ki  " +
                "           where iekir.`status`=62  " +
                "           and iekir.result_1_code=1  " +
                "           and ki.id=iekir.icbc_id  " +
//                "           and ki.gems_fs_id in(select id from assess_fs af where up_id=${up_id} or id =${id}) " +
                ") yh_date  " +
                "       where dz_date.icbc_id=yh_date.icbc_id  " +
                "       GROUP BY year(yh_date.fk_date),month(yh_date.fk_date)  " +
                "       ORDER BY yh_date.fk_date DESC limit 12";
        TtList fund=selectSQL(sql);

        object=new Object[2][12];
        if(fund.size()<12){
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
        }

        return object;
    }
    //抵押材料回收分布图ajax前台获取   null,null,null
    @RequestMapping("/manager/visual/getRecyclePathMap.do")
    @ResponseBody
    public Object[][] getRecyclePathMap() {
        String sql="select year(iekir.dt_sub) year," +
                " month(iekir.dt_sub) month," +
                " count(*) total from icbc_erp_kj_icbc_result iekir,kj_icbc ki " +
                " where iekir.status=81 " +
                " and ki.id=iekir.icbc_id " +
//                " and ki.gems_fs_id in(select id from assess_fs af where up_id=${up_id} or id =${id}) " +
                " and year(SYSDATE())-year(iekir.dt_sub) < 2 " +
                " GROUP BY year(dt_sub),month(iekir.dt_sub) " +
                " ORDER BY iekir.dt_sub DESC limit 9";
        TtList fund=selectSQL(sql);

        object=new Object[2][9];
        object=returnList(fund);
        return object;
    }
    //新旧车放款分布图ajax前台获取    null,null,null,null
    @RequestMapping("/manager/visual/getNewOldCarsPathMap.do")
    @ResponseBody
    public Object[][] getNewOldCarsPathMap() {
        String sql="   select newcars.year1,newcars.month1,oldcars.oldcon,oldcars.oldmoney,newcars.newcon,newcars.newmoney from " +
                "  (select year(lending_date) year1,month(lending_date) month1, " +
                "   count(*) oldcon,(sum(lending_money)/10000) oldmoney  " +
                "   from dd_icbc  " +
                "     where icbc_id in(select dic.icbc_id  " +
                "      from dd_icbc_cars dic,dd_icbc di  " +
                "      where dic.car_type=2  " +
                "      and di.id=dic.icbc_id  " +
//                "      and di.gems_fs_id in(select id from fs where up_id=${up_id} or id =${id}))  " +
                "     and lending_result=1  " +
                "     and year(SYSDATE())-year(lending_date) < 2  " +
                "     GROUP BY year(lending_date),month(lending_date)  " +
                "     ORDER BY lending_date DESC limit 12) oldcars, " +
                "    (select year(lending_date) year1,month(lending_date) month1, " +
                "   count(*) oldcon,(sum(lending_money)/10000) oldmoney  " +
                "   from dd_icbc  " +
                "     where icbc_id in(select dic.icbc_id  " +
                "      from dd_icbc_cars dic,dd_icbc di  " +
                "      where dic.car_type=1  " +
                "      and di.id=dic.icbc_id  " +
//                "      and di.gems_fs_id in(select id from fs where up_id=${up_id} or id =${id}))  " +
                "     and lending_result=1  " +
                "     and year(SYSDATE())-year(lending_date) < 2  " +
                "     GROUP BY year(lending_date),month(lending_date)  " +
                "     ORDER BY lending_date DESC limit 12) newcars  " +
                "  where oldcars.year1=newcars.year1  " +
                "  and oldcars.month1=newcars.month1";
        TtList newcars=selectSQL(sql);
        object=new Object[5][12];
        if(newcars.size()<12){
            for(int i=0;i<newcars.size();i++){
                object=selectList(i,newcars);
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
                object=selectList(i,newcars);
            }
        }
        return object;
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

}
