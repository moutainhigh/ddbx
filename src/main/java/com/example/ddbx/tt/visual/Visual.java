package com.example.ddbx.tt.visual;

import com.example.ddbx.tt.data.TtList;
import com.example.ddbx.tt.data.TtMap;
import com.example.ddbx.tt.tool.Tools;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
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
    private String [] string;
    private Object [][] object;
    private static TtMap minfo;
    private static String fs_id;


    //输入sql语句进行查询操作
    private static TtList selectSQL(String sql){
        return Tools.reclist(sql);
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

    //查询代理商ID
    private String selectGemsId(String gems){
        String s;
        String sql="select id from fs where name='"+gems+"'";
        TtList chart=selectSQL(sql);//数据库查询操作
        if(chart.size() == 0){
            s="0";
        }else{
            s=chart.get(0).get("id");
        }
        return s;
    }



    //前台数据后台获取
    public static void management(HttpServletRequest request) {
        minfo =Tools.minfo();
        fs_id=minfo.get("fsid");
        String sql;

        sql="select count(*) amount from dd_icbc  " +
                " where month(dt_add)=MONTH(SYSDATE())  " +
                " and YEAR(dt_add)=year(SYSDATE())  " +
                " and gems_fs_id in(select id from fs where up_id="+ fs_id +" or id ="+ fs_id +") " +
                "";
        TtList billlist=selectSQL(sql);
        request.setAttribute("billlist",billlist);//每月报单总量     0



        sql="  select count(di.state_id) sell,cs.`name` name  " +
                "  from dd_icbc di,comm_states cs  " +
                "  where di.state_id=cs.id  " +
                "  and month(di.dt_add)=MONTH(SYSDATE())  " +
                "  and YEAR(di.dt_add)=year(SYSDATE())  " +
                "  and di.gems_fs_id in(select id from fs where up_id="+ fs_id +" or id ="+ fs_id +") " +
                "  GROUP BY di.state_id  " +
                "  ORDER BY count(di.state_id) DESC";
        TtList rankinglist=selectSQL(sql);
        request.setAttribute("rankinglist",rankinglist);//每月总订单数各省排名



        sql="     select count(di.gems_fs_id) gems,af.`name` name  " +
                "    from dd_icbc di,fs af  " +
                "    where di.gems_fs_id=af.id  " +
                "    and month(di.dt_add)=MONTH(SYSDATE())  " +
                "    and YEAR(di.dt_add)=year(SYSDATE())  " +
                "    and di.gems_fs_id in(select id from fs where up_id="+ fs_id +" or id ="+ fs_id +")  " +
                "    GROUP BY di.gems_fs_id  " +
                "    ORDER BY count(di.gems_fs_id) DESC";
        TtList gemslist=selectSQL(sql);
        request.setAttribute("gemslist",gemslist);//每月总订单数各代理商排名



        sql="   select count(di.id) amount,sum(di.lending_money) money  " +
                "   from dd_icbc di " +
                "  where month(di.lending_date)=MONTH(SYSDATE())  " +
                "  and YEAR(di.lending_date)=year(SYSDATE())  " +
                "  and di.lending_result=1  " +
                "  and di.gems_fs_id in(select id from fs where up_id="+ fs_id +" or id ="+ fs_id +")" +
                "";
        TtList loanlist=selectSQL(sql);
        request.setAttribute("loanlist",loanlist);//每月已放款单数，总金额
        double loan;
        if(loanlist.get(0).get("amount").equals("0")){
            loan=0.00;
        }else{
            loan=Double.parseDouble(loanlist.get(0).get("money"))/Double.parseDouble(loanlist.get(0).get("amount"));
        }
        request.setAttribute("loan",loan);//每月已放款单数，总金额



        sql=" select count(di.state_id) sell,cs.`name` name  " +
                "  from dd_icbc di,comm_states cs  " +
                "  where di.state_id=cs.id  " +
                "  and month(di.lending_date)=MONTH(SYSDATE())  " +
                "  and YEAR(di.lending_date)=year(SYSDATE())  " +
                "  and di.lending_result=1  " +
                "  and di.gems_fs_id in(select id from fs where up_id="+ fs_id +" or id ="+ fs_id +")  " +
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
                "  and di.gems_fs_id in(select id from fs where up_id="+ fs_id +" or id ="+ fs_id +" )  " +
                "   GROUP BY di.gems_fs_id  " +
                "   ORDER BY count(di.gems_fs_id) DESC";
        TtList gemsloanlist=selectSQL(sql);
        request.setAttribute("gemsloanlist",gemsloanlist);//每月放款单数各代理商排名




        sql="select count(*) amount,sum(lending_money) money from dd_icbc " +
                "where lending_result=1 and pledge_result=2 " +
                "and gems_fs_id in(select id from fs where up_id="+ fs_id +" or id ="+ fs_id +" )" +
                "";
        TtList fklist=selectSQL(sql);
        request.setAttribute("fklist",fklist);//每月已放款未抵押单数，总金额




        sql="select count(*) amount from dd_icbc_cars  " +
                "  where month(dt_add)=MONTH(SYSDATE()) " +
                "   and YEAR(dt_add)=year(SYSDATE()) " +
                "   and gems_fs_id in(select id from fs where up_id="+ fs_id +" or id ="+ fs_id +")" +
                "";
        TtList carselect=selectSQL(sql);

        sql="select count(*) amount from dd_icbc_cars  " +
                "  where month(dt_add)=MONTH(SYSDATE())  " +
                "  and YEAR(dt_add)=year(SYSDATE()) " +
                "   and icbc_id in (select icbc_id from dd_icbc_status where car_loan_status in (2,3))  " +
                "   and gems_fs_id in(select id from fs where up_id="+ fs_id +" or id ="+ fs_id +")" +
                "";
        TtList carpass=selectSQL(sql);
        int carspass;
        if(carpass.size() == 0 || carpass.get(0).get("amount").equals("0") || carselect.get(0).get("amount").equals("0")){
            carspass=0;
        }else{
            carspass=Integer.parseInt(carpass.get(0).get("amount"))*100/Integer.parseInt(carselect.get(0).get("amount"));
        }
        request.setAttribute("carspass",carspass);//汽车贷款通过          0



        sql="select round(other.Osell/count(other.Oid),2) rate,other.`name` name from  " +
            "    (select loan.local_states Oid,count(loan.local_states) Osell,cs.`name`  " +
            "      from (select dic.local_states   " +
            "            from dd_icbc_cars dic " +
            "            where dic.icbc_id in (select icbc_id from dd_icbc_status where car_loan_status in (2,3))  " +
            "            and month(dic.dt_add)=MONTH(SYSDATE())  " +
            "            and YEAR(dic.dt_add)=year(SYSDATE())  " +
            "            and dic.gems_fs_id in(select id from fs where up_id="+ fs_id +" or id ="+ fs_id +")  " +
            "            ) loan, " +
            "      comm_states cs where loan.local_states=cs.id  " +
            "      GROUP BY loan.local_states  " +
            "      ORDER BY count(loan.local_states) DESC) other, " +
            "           (select dic.local_states Aid  " +
            "            from dd_icbc_cars dic  " +
            "            where month(dic.dt_add)=MONTH(SYSDATE())  " +
            "            and YEAR(dic.dt_add)=year(SYSDATE())  " +
            "            and dic.gems_fs_id in(select id from fs where up_id="+ fs_id +" or id ="+ fs_id +" )   " +
            "           ) amount  " +
            "      where amount.Aid=other.Oid  " +
            "    GROUP BY other.Oid  " +
            "    ORDER BY rate DESC";
        TtList cardpasscomm=selectSQL(sql);
        request.setAttribute("cardpasscomm",cardpasscomm);//每月汽车贷款过件率各省排名


        

        sql="select round(other.gems/count(other.Oid),2) rate,other.`name` name from  " +
            "    (select dic.gems_fs_id Oid,count(dic.gems_fs_id) gems,af.`name`  " +
            "      from dd_icbc_cars dic,fs af  " +
            "      where dic.gems_fs_id=af.id  " +
            "      and month(dic.dt_add)=MONTH(SYSDATE())  " +
            "      and YEAR(dic.dt_add)=year(SYSDATE())  " +
            "      and dic.gems_fs_id in(select id from fs where up_id="+ fs_id +" or id ="+ fs_id +" )  " +
            "      and dic.icbc_id in (select icbc_id from dd_icbc_status where car_loan_status in (2,3)) GROUP BY dic.gems_fs_id) other, " +
            "    (select dic.gems_fs_id Aid from dd_icbc_cars dic  " +
            "      where month(dic.dt_add)=MONTH(SYSDATE())  " +
            "      and YEAR(dic.dt_add)=year(SYSDATE())  " +
            "      and dic.gems_fs_id in(select id from fs where up_id="+ fs_id +" or id ="+ fs_id +" )" +
            "     ) amount  " +
            "  where other.Oid=amount.Aid  " +
            "  GROUP BY other.Oid  " +
            "  ORDER BY rate DESC";
        TtList cardpassgems=selectSQL(sql);
        request.setAttribute("cardpassgems",cardpassgems );//每月汽车贷款过件率各代理商排名


        sql="select round(m2.loan*100/m1.amount,2) yuqilv,m2.gid,m2.gname from   " +
            "  (select count(di.gems_fs_id) amount,f.id gid,f.name gname   " +
            "   from dd_icbc di,fs f   " +
            "   where di.lending_result=1   " +
            "     and f.id=di.gems_fs_id   " +
            "     and di.gems_fs_id in(select id from fs where up_id="+ fs_id +" or id ="+ fs_id +" )" +
            "     GROUP BY di.gems_fs_id) m1,  " +
            "  (select count(lol.gems_fs_id) loan,f.id gid,f.name gname   " +
            "   from loan_overdue_list lol,fs f   " +
            "   where lol.type_id!=6   " +
            "     and f.id=lol.gems_fs_id   " +
            "     and lol.gems_fs_id in(select id from fs where up_id="+ fs_id +" or id ="+ fs_id +" )" +
            "     GROUP BY lol.gems_fs_id) m2   " +
            "where m1.gid=m2.gid ORDER BY yuqilv desc";
        TtList yuqilv=selectSQL(sql);
        request.setAttribute("yuqilv",yuqilv );//逾期率代理商排名


        sql="select id,name from comm_states";
        TtList comm_city=selectSQL(sql);
        request.setAttribute("comm_city",comm_city );//省份列表

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
        Date date = new Date();
        int formatDate = Integer.parseInt(sdf.format(date));
        int[] years=new int[5];
        for(int i=0;i<5;i++){
            years[i]=formatDate-i;
        }
        request.setAttribute("years",years );//年份列表

        String[] count = new String[10];
        for(int i=0;i<10;i++){
            count[i]=i+"";
        }
        request.setAttribute("count",count );
    }

    //每月数据总单数折线图ajax前台获取           null,null,null
    @RequestMapping("/manager/visual/getPathMap.do")
    @ResponseBody
    public Object[][] getPathMap(String baodanname,String baodancity,String baodantime){
        minfo =Tools.minfo();
        fs_id=minfo.get("fsid");
        //提取sql语句共同的部分
        String sql="select year(dt_add) year,month(dt_add) month,count(*) total " +
                   "  from dd_icbc " +
                   "  where year(SYSDATE())-year(dt_add) < 6 " +
                   "  and gems_fs_id in(select id from fs where up_id="+ fs_id +" or id ="+ fs_id +") ";
        String sqlEdit="  GROUP BY year(dt_add),month(dt_add) ORDER BY dt_add DESC limit 9 ";
        //判断是否输入代理商,是否选择省份
        String gems_id=selectGemsId(baodanname);
        if(!baodanname.equals("请输入代理商") && !baodanname.equals("")) {
            sql += "  and gems_fs_id= " + gems_id;
        }
        if(!baodancity.equals("0")){
            sql += "  and state_id= " + baodancity;
        }
        //判断是否选择时间
        if(!baodantime.equals("0")){
            sql += " and year(dt_add)="+ baodantime;
        }
        TtList chart=selectSQL(sql+sqlEdit);//数据库查询操作
        object=new Object[2][9];
        object=returnList(chart);//遍历查询判断是否为空，排序，返回处理过的数据
    return object;
    }


    //汽车贷款通过率折线图ajax前台获取
    @RequestMapping("/manager/visual/getCarPathMap.do")
    @ResponseBody
    public Object[][] getCarPathMap(String guojianname,String guojiancity,String guojiantime) {
        minfo =Tools.minfo();
        fs_id=minfo.get("fsid");
        //提取sql语句共同的部分
        String sql=" select year(dt_add) year,month(dt_add) month,count(*) total " +
                " from dd_icbc_cars " +
                " where icbc_id in (select icbc_id from dd_icbc_status where car_loan_status in (2,3)) " +
                " and gems_fs_id in(select id from fs af where up_id="+ fs_id +" or id ="+ fs_id +") " +
                " and year(SYSDATE())-year(dt_add) < 6 ";
        String sqlEdit=" GROUP BY year(dt_add),month(dt_add) ORDER BY dt_add DESC limit 9";

        //判断是否输入代理商，是否选择省份
        String gems_id=selectGemsId(guojianname);//获取输入代理商的id
        if(!guojianname.equals("请输入代理商") && !guojianname.equals("")){
            sql += " and gems_fs_id=" + gems_id;
        }
        //判断是否选择省份
        if(!guojiancity.equals("0")){
            sql += " and local_states=" + guojiancity;
        }
        //判断是否选择时间
        if(!guojiantime.equals("0")){
            sql += " and year(dt_add)="+ guojiantime;
        }
        TtList chart=selectSQL(sql+sqlEdit);//数据库查询操作
        object=new Object[2][9];
        object=returnList(chart);//遍历查询判断是否为空，排序，返回处理过的数据
    return object;
    }


    //新旧汽车贷款分布扇形图ajax前台获取
    @RequestMapping("/manager/visual/getCarFkPathMap.do")
    @ResponseBody
    public String[] getCarFkPathMap(String fangkuanname,String fangkuancity,String fangkuantime) {
        minfo =Tools.minfo();
        fs_id=minfo.get("fsid");
        //拼接sql语句
        String sql="  select dic.car_type cartype,count(dic.car_type) cartotal  " +
                   "  from dd_icbc_cars dic  " +
                   "  where dic.icbc_id  " +
                   "   in(select di.id  " +
                   "    from dd_icbc di  " +
                   "    where month(di.lending_date)=MONTH(SYSDATE())  " +
                   "   and YEAR(di.lending_date)=year(SYSDATE()) " +
                   "   and di.lending_result=1  " +
                   "  and di.gems_fs_id in(select id from fs where up_id="+ fs_id +" or id ="+ fs_id +")" +
                   "";
        String sqlEdit=" )  GROUP BY dic.car_type  ORDER BY dic.car_type ";
        //判断是否输入代理商
        String gems_id=selectGemsId(fangkuanname);
        if(!fangkuanname.equals("") && !fangkuanname.equals("请输入代理商")){
            sql += " and di.gems_fs_id= " + gems_id;
        }
        //判断是否选择省份
        if(!fangkuancity.equals("0")){
            sql += " and di.state_id= " + fangkuancity;
        }
        //判断是否选择时间
        if(!fangkuantime.equals("0")){

        }
        //判读是否为空
        TtList chart=selectSQL(sql+sqlEdit);
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
    public String[] getMoneyPathMap(String fangkuanname,String fangkuancity,String fangkuantime) {
        minfo =Tools.minfo();
        fs_id=minfo.get("fsid");
        //拼接sql语句
        String sql="select sum(case when di.lending_money >= 30000 and di.lending_money < 100000 then 1 end) singular1, " +
                "     sum(case when di.lending_money >= 100000 and di.lending_money < 200000 then 1 end) singular2, " +
                "     sum(case when di.lending_money >= 200000 and di.lending_money < 500000 then 1 end) singular3, " +
                "     sum(case when di.lending_money >= 500000 then 1 end) singular4  " +
                "      from dd_icbc di  " +
                "      where month(di.lending_date)=MONTH(SYSDATE())  " +
                "      and YEAR(di.lending_date)=year(SYSDATE())  " +
                "     and di.lending_result=1   " +
                "     and di.gems_fs_id in(select id from fs where up_id="+ fs_id +" or id ="+ fs_id +") " +
                "";

        //判断是否输入代理商
        String gems_id=selectGemsId(fangkuanname);
        if(!fangkuanname.equals("请输入代理商") && !fangkuanname.equals("")){
            sql += " and di.gems_fs_id= " + gems_id;
        }
        //判断是否选择省份
        if(!fangkuancity.equals("0")){
            sql += " and di.state_id= " + fangkuancity;
        }
        //判断是否选择时间
        if(!fangkuantime.equals("0")){

        }
        //判断是否为空
        TtList chart=selectSQL(sql);
        string = new String[4];

        for(int i=1;i<5;i++){
            if(chart.size() != 0){
                if(chart.get(0).get("singular"+i)==null || chart.get(0).get("singular"+i).equals("")){
                    string[i-1]="0";
                }else{
                    string[i-1]=chart.get(0).get("singular"+i);
                }
            }else{
                string[i-1]="0";
            }

        }
    return string;
    }


    //抵押完成天数分布扇形图ajax前台获取
    @RequestMapping("/manager/visual/getPawnPathMap.do")
    @ResponseBody
    public String[] getPawnPathMap(String diyaname,String diyacity,String diyatime) {
        minfo =Tools.minfo();
        fs_id=minfo.get("fsid");
        //拼接sql语句
        String sql ="select sum(case when  to_days(pawn.d1) - to_days(pawn.d) < 15 then 1 end) paw1, " +
                "       sum(case when to_days(pawn.d1) - to_days(pawn.d) >= 15 and to_days(pawn.d1) - to_days(pawn.d) < 30 then 1 end) paw2,  " +
                "       sum(case when to_days(pawn.d1) - to_days(pawn.d) >= 30 and to_days(pawn.d1) - to_days(pawn.d) < 45 then 1 end) paw3,  " +
                "       sum(case when to_days(pawn.d1) - to_days(pawn.d) >= 45 and to_days(pawn.d1) - to_days(pawn.d) < 60 then 1 end) paw4, " +
                "       sum(case when to_days(pawn.d1) - to_days(pawn.d) >= 60 then 1 end) paw5  " +
                "       from (select iekir1.qryid,iekir1.now_status s,iekir1.dt_add d,iekir2.now_status s1,iekir2.dt_add d1  " +
                "              from (select dier.qryid,dier.now_status,dier.dt_add  " +
                "                   from dd_icbc_erp_result dier,dd_icbc di  " +
                "                   where dier.now_status=72   " +
                "                   and di.id=dier.icbc_id) iekir1, " +
                "                  (select dier.qryid,dier.now_status,dier.dt_add  " +
                "                   from dd_icbc_erp_result dier,dd_icbc di  " +
                "                   where dier.now_status=82  " +
                "                   and di.gems_fs_id in(select id from fs where up_id="+ fs_id +" or id ="+ fs_id +")  " +
                "                   and di.id=dier.icbc_id  ";
        String sqlEdit="  ) iekir2 where iekir1.qryid=iekir2.qryid ) pawn ";

        //判断是否输入代理商
        String gems_id=selectGemsId(diyaname);
        if(!diyaname.equals("请输入代理商") && !diyaname.equals("")) {
            sql += " and and di.gems_fs_id= " + gems_id;
        }
        //判断是否选择城市
        if(!diyacity.equals("0")){
            sql += " and di.state_id= " + diyacity;
        }
        //判断是否选择时间
        if(!diyatime.equals("0")){
            sql += " and year(dier.dt_add)="+ diyatime;
        }
        //判断是否为空
        TtList chart=selectSQL(sql+sqlEdit);
        string = new String[5];
        for (int i = 1; i < 6; i++) {
            if(chart.size() == 0){
                string[i - 1] = "0";
            }else{
                if (chart.get(0).get("paw" + i) == null  || chart.get(0).get("paw" + i).equals("")) {
                    string[i - 1] = "0";
                } else {
                    string[i - 1] = chart.get(0).get("paw" + i);
                }
            }
        }
        return string;
    }


    //征信查询分布扇形图ajax前台获取   null,null       0,1
    @RequestMapping("/manager/visual/getCreditPathMap.do")
    @ResponseBody
    public String[] getCreditPathMap(String zhengxinname,String zhengxincity,String zhengxintime) {
        minfo =Tools.minfo();
        fs_id=minfo.get("fsid");
        //拼接sql语句
        String sql="select zx1.zxok_tag,zx2.zxok  " +
                " from (select count(*) zxok_tag from dd_icbc_status dis,dd_icbc di " +
                " where dis.zx_status=3 and di.id=dis.icbc_id " +
               " and di.gems_fs_id in(select id from fs where up_id="+ fs_id +" or id ="+ fs_id +")" +
                " ";
        String sqlEdit=" ) zx1," +
                " (select count(*) zxok from dd_icbc_status dis,dd_icbc di " +
                " where dis.zx_status != 3 and di.id=dis.icbc_id " +
                " and di.gems_fs_id in(select id from fs where up_id="+ fs_id +" or id ="+ fs_id +")" +
                "";

        //判断是否输入代理商
        String gems_id=selectGemsId(zhengxinname);
        if(!zhengxinname.equals("请输入代理商") && !zhengxinname.equals("")){
            sql += " and di.gems_fs_id= "+ gems_id;
            sqlEdit += " and di.gems_fs_id= "+ gems_id;
        }
        //判断是否点击选择城市
        if(!zhengxincity.equals("0")){
            sql += " and di.state_id= "+ zhengxincity;
            sqlEdit += " and di.state_id= "+ zhengxincity;
        }
        //判断是否点击选择时间
        if(!zhengxintime.equals("0")){
            sql += " and YEAR(dis.dt_add)= "+ zhengxintime;
            sqlEdit += " and YEAR(dis.dt_add)= "+ zhengxintime;
        }else{
            sql += " and YEAR(dis.dt_add)=YEAR(SYSDATE()) and MONTH(dis.dt_add)=MONTH(SYSDATE()) ";
            sqlEdit += " and YEAR(dis.dt_add)=YEAR(SYSDATE()) and MONTH(dis.dt_add)=MONTH(SYSDATE()) ";
        }
        //判断是否为空
        TtList chart=selectSQL(sql+sqlEdit+" ) zx2 ");
        string = new String[2];
        if(chart.get(0).get("zxok_tag").equals("0")){
            string[0]="0";
        }else{
            string[0]=chart.get(0).get("zxok_tag");
        }

        if(chart.get(0).get("zxok").equals("0")){
            string[1]="0";
        }else{
            string[1]=chart.get(0).get("zxok");
        }

        return string;
    }


    //客户年龄分布扇形图ajax前台获取      null,null,null,null
    @RequestMapping("/manager/visual/getAgePathMap.do")
    @ResponseBody
    public String[] getAgePathMap() {
        minfo =Tools.minfo();
        fs_id=minfo.get("fsid");
        String sql="    select sum(case when cardage.card >= 18 and cardage.card < 30 then 1 end) age1, " +
                "      sum(case when cardage.card >= 30 and cardage.card < 40 then 1 end) age2, " +
                "      sum(case when cardage.card >= 40 and cardage.card < 50 then 1 end) age3, " +
                "      sum(case when cardage.card >= 50 then 1 end) age4 from  " +
                "     (select (year(SYSDATE())-Mid(c_cardno,7,4)) card from dd_icbc  " +
                "     where gems_fs_id in(select id from fs where up_id="+ fs_id +" or id ="+ fs_id +")  " +
                "    ) cardage";
        TtList chart=selectSQL(sql);
        string = new String[4];
        for(int i=1;i<5;i++){
            if(chart.get(0).get("age"+i)==null || chart.get(0).get("age"+i).equals("")){
                string[i-1]="0";
            }else{
                string[i-1]=chart.get(0).get("age"+i);
            }
        }

        return string;
    }


    //新车年龄分布扇形图ajax前台获取    null,null,null,null
    @RequestMapping("/manager/visual/getCarsAgePathMap.do")
    @ResponseBody
    public String[] getCarsAgePathMap() {
        minfo =Tools.minfo();
        fs_id=minfo.get("fsid");
        String sql="select sum(case when carage.age >= 1 and carage.age  < 3 then 1 end) age1, " +
                "      sum(case when carage.age >= 3 and carage.age  < 6 then 1 end) age2, " +
                "      sum(case when carage.age >= 6 and carage.age  < 9 then 1 end) age3, " +
                "      sum(case when carage.age >= 9 then 1 end) age4 " +
                "     from (select (year(di.dt_add)-year(dic.cardt1)) age  " +
                "      from dd_icbc_cars dic,dd_icbc di  " +
                "      where di.id=dic.icbc_id  " +
                "      and di.gems_fs_id in(select id from fs where up_id="+ fs_id +" or id ="+ fs_id +")  " +
                "     and dic.car_type=1 ) carage";
        TtList chart=selectSQL(sql);
        string = new String[4];
        for(int i=1;i<5;i++){
            if(chart.get(0).get("age"+i)==null || chart.get(0).get("age"+i).equals("")){
                string[i-1]="0";
            }else{
                string[i-1]=chart.get(0).get("age"+i);
            }
        }

        return string;
    }


    //抵押材料回收分布图ajax前台获取   null,null,null
    @RequestMapping("/manager/visual/getRecyclePathMap.do")
    @ResponseBody
    public Object[][] getRecyclePathMap(String cailiaoname,String cailiaocity,String cailiaotime) {
        minfo =Tools.minfo();
        fs_id=minfo.get("fsid");
        //拼接sql语句
        String sql="select year(di.dt_add) year, " +
                   " month(di.dt_add) month,  " +
                   " count(*) total from dd_icbc di  " +
                   " where di.pledge_result=1  " +
                   " and di.gems_fs_id in(select id from fs where up_id="+ fs_id +" or id ="+ fs_id +")  " +
                   " and year(SYSDATE())-year(di.dt_add) < 6  " ;
        String sqlEdit= " GROUP BY year(di.dt_add),month(di.dt_add)  ORDER BY di.dt_add DESC limit 9";

        //判读是否输入代理商
        String gems_id=selectGemsId(cailiaoname);
        if(!cailiaoname.equals("请输入代理商") && !cailiaoname.equals("")) {
            sql += " and di.gems_fs_id= " + gems_id;
        }
        //判断是否选择城市
        if(!cailiaocity.equals("0")){
            sql += " and di.state_id= " + cailiaocity;
        }
        //判断是否选择时间
        if(!cailiaotime.equals("0")){
            sql += " and year(di.dt_add)="+ cailiaotime;
        }
        //判断是否为空，并且排序
        TtList chart=selectSQL(sql+sqlEdit);
        object=new Object[2][9];
        object=returnList(chart);
        return object;
    }


    //新旧车放款分布图ajax前台获取    null,null,null,null
    @RequestMapping("/manager/visual/getNewOldCarsPathMap.do")
    @ResponseBody
    public Object[][] getNewOldCarsPathMap(String fangkuanname,String fangkuancity,String fangkuantime) {
        minfo =Tools.minfo();
        fs_id=minfo.get("fsid");
        //拼接sql语句
        String sql="   select newcars.year1,newcars.month1,oldcars.oldcon,oldcars.oldmoney,newcars.newcon,newcars.newmoney from " +
                "  (select year(lending_date) year1,month(lending_date) month1, " +
                "   count(*) oldcon,(sum(lending_money)/10000) oldmoney  " +
                "   from dd_icbc  " +
                "     where id in(select dic.icbc_id  " +
                "      from dd_icbc_cars dic,dd_icbc di  " +
                "      where dic.car_type=2  " +
                "      and di.id=dic.icbc_id  ";
        String sqlEdit=""+
                 "      and di.gems_fs_id in(select id from fs where up_id="+ fs_id +" or id ="+ fs_id +")  " +
                "     ) and lending_result=1  " +
                "     and year(SYSDATE())-year(lending_date) < 6  " +
                "     GROUP BY year(lending_date),month(lending_date)  " +
                "     ORDER BY lending_date DESC limit 12) oldcars, " +
                "    (select year(lending_date) year1,month(lending_date) month1, " +
                "   count(*) newcon,(sum(lending_money)/10000) newmoney  " +
                "   from dd_icbc  " +
                "     where id in(select dic.icbc_id  " +
                "      from dd_icbc_cars dic,dd_icbc di  " +
                "      where dic.car_type=1  " +
                "      and di.id=dic.icbc_id  ";
        String sqlCar=""+
                "      and di.gems_fs_id in(select id from fs where up_id="+ fs_id +" or id ="+ fs_id +")  " +
                "     ) and lending_result=1  " +
                "     and year(SYSDATE())-year(lending_date) < 6  " +
                "     GROUP BY year(lending_date),month(lending_date)  " +
                "     ORDER BY lending_date DESC limit 12) newcars  " +
                "  where oldcars.year1=newcars.year1  " +
                "  and oldcars.month1=newcars.month1";

        //判断是否输入代理商
        String gems_id=selectGemsId(fangkuanname);
        if(!fangkuanname.equals("请输入代理商") && !fangkuanname.equals("")){
            sql += " and di.gems_fs_id=  " + gems_id;
            sqlEdit += " and di.gems_fs_id=  " + gems_id;
        }
        //判断是否选择城市
        if(!fangkuancity.equals("0")){
            sql += " and di.state_id=  " + fangkuancity;
            sqlEdit += " and di.state_id=  " + fangkuancity;
        }
        //判断是否选择时间
        if(!fangkuantime.equals("0")){
            sql += " and year(di.lending_date)="+ fangkuantime;
            sqlEdit += " and year(di.lending_date)="+ fangkuantime;
        }
        //判断是否为空
        TtList chart=selectSQL(sql+sqlEdit+sqlCar);
        object=new Object[5][12];
        if(chart.size()<12){
            for(int i=0;i<chart.size();i++){
                object=selectList(i,chart);
            }
            for(int i=chart.size();i<12;i++){
                object[0][i] = "2018-";
                object[1][i] = "0";
                object[2][i] = "0";
                object[3][i] = "0";
                object[4][i] = "0";
            }
        }else{
            for(int i=0;i<12;i++){
                object=selectList(i,chart);
            }
        }
        return object;
    }


    //逾期率M1，M2，M3分布图ajax前台获取    null,null,null,null
    @RequestMapping("/manager/visual/getOverdueMap.do")
    @ResponseBody
    public Object[][] getOverdueMap(String yuqiname,String yuqicity){
        minfo =Tools.minfo();
        fs_id=minfo.get("fsid");
        String sqlNew="          and dic.car_type=1  ";
        String sqlOld="          and dic.car_type=2  ";
        String gemsId="in(select id from fs where up_id="+ fs_id +" or id ="+ fs_id +")";
        String sql= "select m1.amount m1a,m1.money/10000 m1m, m2.amount m2a,m2.money/10000 m2m, m3.amount m3a,m3.money/10000 m3m  " +
                "from (select count(*) amount,sum(lol.overdue_amount) money   " +
                "      from loan_overdue_list lol,dd_icbc di,dd_icbc_cars dic  " +
                "        where lol.overdue_days<30   " +
                "          and lol.type_id!=6 " +
                "          and lol.icbc_id=di.id  " +
                "          and dic.icbc_id=lol.icbc_id  ";
        String sqlEdit= "  and di.gems_fs_id " + gemsId +
                "        ) m1,(select count(*) amount,sum(lol.overdue_amount) money   " +
                "      from loan_overdue_list lol,dd_icbc di,dd_icbc_cars dic  " +
                "        where lol.overdue_days<60   " +
                "          and lol.overdue_days>=30   " +
                "          and lol.type_id!=6  " +
                "          and lol.icbc_id=di.id  " +
                "          and dic.icbc_id=lol.icbc_id  ";
        String sqlEnd= "   and di.gems_fs_id " + gemsId +
                "           ) m2,(select count(*) amount,sum(lol.overdue_amount) money   " +
                "      from loan_overdue_list lol,dd_icbc di,dd_icbc_cars dic  " +
                "        where lol.overdue_days>=60   " +
                "          and lol.type_id!=6" +
                "          and lol.icbc_id=di.id  " +
                "          and dic.icbc_id=lol.icbc_id  " +
                "          and di.gems_fs_id "+ gemsId ;
        String e=") m3";
        //判断是否输入代理商
        String gems_id=selectGemsId(yuqiname);
        if(!yuqiname.equals("请输入代理商") && !yuqiname.equals("")){
            sql += " and di.gems_fs_id=  " + gems_id;
            sqlEdit += " and di.gems_fs_id=  " + gems_id;
            sqlEnd += " and di.gems_fs_id=  " + gems_id;

        }
        //判断是否选择城市
        if(!yuqicity.equals("0")){
            sql += " and di.state_id=  " + yuqicity;
            sqlEdit += " and di.state_id=  " + yuqicity;
            sqlEnd += " and di.state_id=  " + yuqicity;
        }
        TtList chart=selectSQL(sql+sqlEdit+sqlEnd+e);
        TtList chart1=selectSQL(sql+sqlNew+sqlEdit+sqlNew+sqlEnd+sqlNew+e);
        TtList chart2=selectSQL(sql+sqlOld+sqlEdit+sqlOld+sqlEnd+sqlOld+e);
        String []s={"m1a","m1m","m2a","m2m","m3a","m3m"};
        object=new Object[3][6];

        for(int i=0;i<6;i++){
            if(chart.get(0).get(s[i]) == "" && chart.get(0).get(s[i]).equals("")){
                object[0][i]="0";
            }else{
                object[0][i]=chart.get(0).get(s[i]);
            }
            if(chart1.get(0).get(s[i]) == "" && chart1.get(0).get(s[i]).equals("")){
                object[1][i]="0";
            }else {
                object[1][i] = chart1.get(0).get(s[i]);
            }
            if(chart2.get(0).get(s[i]) == "" && chart2.get(0).get(s[i]).equals("")){
                object[2][i]="0";
            }else{
                object[2][i]=chart2.get(0).get(s[i]);
            }
        }
        return object;
    }

    //逾期省份分布图ajax前台获取    null,null,null,null
    @RequestMapping("/manager/visual/getStateMap.do")
    @ResponseBody
    public Object[][] getStateMap(){
        minfo =Tools.minfo();
        fs_id=minfo.get("fsid");
        //排名前五逾期省份
        String sql= "select count(cs.name) amount,sum(lol.overdue_amount) money,cs.name cname  " +
                    "  from loan_overdue_list lol,dd_icbc di,comm_states cs   " +
                    "  where di.id=lol.icbc_id   " +
                    "    and di.state_id=cs.id  " +
                    "    and lol.type_id!=6   " +
                    "    and lol.gems_fs_id in(select id from fs where up_id="+ fs_id +" or id ="+ fs_id +")" +
                    "    GROUP BY cname   " +
                    "    ORDER BY amount  " +
                    "    limit 0,5";
        //其他逾期省份
        String sqlOth="select sum(other.amount) Oamount,sum(other.money) Omoney " +
                        "from (select count(cs.name) amount,sum(lol.overdue_amount) money,cs.name cname  " +
                        "      from loan_overdue_list lol,dd_icbc di,comm_states cs   " +
                        "      where di.id=lol.icbc_id   " +
                        "        and di.state_id=cs.id  " +
                        "        and lol.type_id!=6   " +
                        "        and lol.gems_fs_id in(select id from fs where up_id="+ fs_id +" or id ="+ fs_id +")" +
                        "        GROUP BY cname   " +
                        "        ORDER BY amount  " +
                        "        limit 5,30  ) other";
        TtList chart=selectSQL(sql);
        TtList chart1=selectSQL(sqlOth);
        object=new Object[6][3];
        if(chart.size()<5){
            for(int i=0;i<chart.size();i++){
                object[i][0]=chart.get(i).get("amount");
                object[i][1]=chart.get(i).get("money");
                object[i][2]=chart.get(i).get("cname");
            }
            for(int i=chart.size();i<5;i++){
                object[i][0]="0";
                object[i][1]="0";
                object[i][2]="某某省"+i;
            }
        }else{
            for(int i=0;i<5;i++){
                object[i][0]=chart.get(i).get("amount");
                object[i][1]=chart.get(i).get("money");
                object[i][2]=chart.get(i).get("cname");
            }
        }
        if(chart1.get(0).get("Oamount").equals("") && chart1.get(0).get("Oamount") == ""){
            object[5][0]="0";
            object[5][1]="0";
            object[5][2]="其他省";
        }else{
            object[5][0]=chart1.get(0).get("Oamount");
            object[5][1]=chart1.get(0).get("Omoney");
            object[5][2]="其他省";
        }
        return object;
    }

    //代理商综合能力图ajax前台获取    null,null,null,null
    @RequestMapping("/manager/visual/getAgencyMap.do")
    @ResponseBody
    public Object[] getAgencyMap(String dailiname,String dailitime){
        minfo =Tools.minfo();
        fs_id=minfo.get("fsid");
        String GemsId="in(select id from fs where up_id="+ fs_id +" or id ="+ fs_id +")";
        //业务能力
        String sqlBd= "select year(SYSDATE()) years,count(*) amount from dd_icbc  " +
                       " where YEAR(dt_add)=year(SYSDATE()) " +
                       " and gems_fs_id " + GemsId;
        //进件效率
        String sqlJj= "select round(avg(timestampdiff(day,dt_add,lending_date)),2) da " +
                        "from dd_icbc " +
                        " where lending_result=1 and year(SYSDATE())=year(dt_add) " +
                        " and gems_fs_id " + GemsId;
        //风控能力
        String sqlFk= "select count(*) amount " +
                         "  from loan_overdue_list " +
                         "  where overdue_days<30 " +
                         "    and type_id!=6 " +
                         "    and year(SYSDATE())=year(dt_add) " +
                         "    and gems_fs_id " + GemsId;
        //运营能力
        String sqlYy= "select count(*) amount from dd_icbc " +
                     " where pledge_result=1 " +
                     " and year(SYSDATE())=year(dt_add)" +
                     " and gems_fs_id " + GemsId;
        //贷后能力
        String sqlDh= "select count(*) amount  " +
                       "  from loan_overdue_list lol " +
                       "  where overdue_days>=60 " +
                       "    and type_id!=6 " +
                       "    and year(SYSDATE())=year(dt_add) " +
                       "    and gems_fs_id " + GemsId;
        //判断是否输入代理商
        String gems_id=selectGemsId(dailiname);
        if(!dailiname.equals("请输入代理商") && !dailiname.equals("")){
            String sqlEdit = " and gems_fs_id=  " + gems_id;
            sqlBd += sqlEdit;
            sqlJj += sqlEdit;
            sqlFk += sqlEdit;
            sqlYy += sqlEdit;
            sqlDh += sqlEdit;
        }
        //判断是否选择时间
        if(!dailitime.equals("0")){
            String sqlEdit = " and year(dt_add)="+ dailitime;
            sqlBd += sqlEdit;
            sqlJj += sqlEdit;
            sqlFk += sqlEdit;
            sqlYy += sqlEdit;
            sqlDh += sqlEdit;
        }
        Object[] obj = new Object[6];
        TtList chart1=selectSQL(sqlBd);//业务-报单
        TtList chart2=selectSQL(sqlJj);//进件-时长
        TtList chart3=selectSQL(sqlYy);//运营-抵押
        TtList chart4=selectSQL(sqlDh);//贷后-M3逾期
        TtList chart5=selectSQL(sqlFk);//风控-M1逾期

        obj[0] = chart1.get(0).get("years");
        obj[1] = chart1.get(0).get("amount");
        if(chart2.get(0).get("da").equals("")){
            obj[2] = "0";
        }else{
            obj[2] = chart2.get(0).get("da");
        }
        obj[3] = chart3.get(0).get("amount");
        obj[4] = chart4.get(0).get("amount");
        obj[5] = chart5.get(0).get("amount");


        return obj;
    }

    /**
     * 使用 注解@RestController
     *  使用注解不需要转换成json
     *  默认类中的方法都会以 json 的格式返回
     * */
/*    @RequestMapping(value = "/manager/visual/select", method = RequestMethod.POST)
    @ResponseBody
    public String[] select(){
        sql="select id,gems_id from dd_icbc";
        chart=selectSQL(sql);
        string=new String[5];
        string[0]=chart.get(0).get("id");
        string[1]=chart.get(1).get("id");
        string[2]=chart.get(2).get("id");
        string[2]=chart.get(2).get("gems_id");
        return string;
    }*/

}
