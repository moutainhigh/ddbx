package com.example.ddbx.tt.table;

import com.example.ddbx.tt.data.TtList;
import com.example.ddbx.tt.data.TtMap;
import com.example.ddbx.tt.tool.Config;
import com.example.ddbx.tt.tool.DbCtrl;
import com.example.ddbx.tt.tool.Tools;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletRequest;

public class ddjd extends DbCtrl {
    private final String classAgpId = "32"; // 随便填的，正式使用时应该跟model里此模块的ID相对应
    public boolean agpOK = false;// 默认无权限

    public ddjd() {
        super("sys_modal");
        AdminAgp adminAgp = new AdminAgp();
        try {
            if (adminAgp.checkAgp(classAgpId)) { // 如果有权限
                Config.log.info("权限检查成功！");
                agpOK = true;
            } else {
                errorCode = 444;
                errorMsg = "您好，您暂无权限！";
            }
        } catch (Exception e) {
            Tools.logError(e.getMessage(), true, false);
        } finally {
            adminAgp.closeConn();
        }
    }

    /**
     * @param {type} {type}
     * @说明: 给继承的子类重载用的
     * @return: 返回
     */
    public void doGetForm(HttpServletRequest request, TtMap post) {

        String sql = "";
        switch (post.get("tab")) {
            case "28":
                sql = "select * from kj_icbc_result where qryid=" + post.get("id");
                break;
            case "29":
                sql = "select * from hbyh_xxzl_result where qryid=" + post.get("id");
                break;
            case "49":
                sql = "select * from hbyh_yhht_result where qryid=" + post.get("id");
                break;
            case "50":
                sql = "select * from hbyh_gsht_result where qryid=" + post.get("id");
                break;
            case "34":
                sql = "select * from hbyh_gpsgd_result where qryid=" + post.get("id");
                break;
            case "40":
                sql = "select * from hbyh_dygd_result where qryid=" + post.get("id");
                break;
            case "51":
                sql = "select * from hbyh_yhclhs_result where qryid=" + post.get("id");
                break;
            case "52":
                sql = "select * from hbyh_gsclhs_result where qryid=" + post.get("id");
                break;
            case "53":
                sql = "select * from hbyh_dyclhs_result where qryid=" + post.get("id");
                break;
        }
        TtList jdlist = Tools.reclist(sql);
        request.setAttribute("jdlist", jdlist);

        //获取进度各板块
        TtList modallist = Tools.reclist("select * from sys_modal where show_tag=1 and id_uplevel=" +post.get("id_uplevel") + " order by sort");
        request.setAttribute("modallist", modallist);
        System.err.println("modallist--"+modallist);

        String bankname = "";
        String jdsql1 = "";
        if ("176".equals(post.get("id_uplevel"))){ //河北银行
            bankname = "hbyh";
            jdsql1 = "select \n" +
                    "i1.id as id_28, \n" +
                    "i2.id as id_29,\n" +
                    "i3.id as id_49,\n" +
                    "i4.id as id_50,\n" +
                    "i5.id as id_34,\n" +
                    "i6.id as id_40,\n" +
                    "i7.id as id_51,\n" +
                    "i8.id as id_52,\n" +
                    "i9.id as id_53\n" +
                    "from kj_icbc i1\n";
        }

        //查询各板块是否已进件
        String jdsql = jdsql1 +
                "LEFT JOIN " +bankname + "_xxzl i2 ON i2.icbc_id=i1.id\n" +
                "LEFT JOIN " +bankname + "_yhht i3 ON i3.icbc_id=i1.id\n" +
                "LEFT JOIN " +bankname + "_gsht i4 ON i4.icbc_id=i1.id\n" +
                "LEFT JOIN " +bankname + "_gpsgd i5 ON i5.icbc_id=i1.id\n" +
                "LEFT JOIN " +bankname + "_dygd i6 ON i6.icbc_id=i1.id\n" +
                "LEFT JOIN " +bankname + "_yhclhs i7 ON i7.icbc_id=i1.id\n" +
                "LEFT JOIN " +bankname + "_gsclhs i8 ON i8.icbc_id=i1.id\n" +
                "LEFT JOIN " +bankname + "_dyclhs i9 ON i9.icbc_id=i1.id\n" +
                "where i1.id=" + post.get("icbc_id");
        TtMap jdtag = Tools.recinfo(jdsql);
        request.setAttribute("jdtag", jdtag);
        request.setAttribute("tab", post.get("tab"));
        request.setAttribute("id", post.get("id"));
        request.setAttribute("icbc_id", post.get("icbc_id"));
        request.setAttribute("saveButton", "true");
    }


}
