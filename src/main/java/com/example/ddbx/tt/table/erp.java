package com.example.ddbx.tt.table;

import com.alibaba.druid.pool.DruidPooledConnection;
import com.example.ddbx.tt.data.TtMap;
import com.example.ddbx.tt.tool.Config;
import com.example.ddbx.tt.tool.DbCtrl;
import com.example.ddbx.tt.tool.Tools;

public class erp  extends DbCtrl {
    private final String classAgpId = "6"; // 随便填的，正式使用时应该跟model里此模块的ID相对应
    public boolean agpOK = false;// 默认无权限



    public erp() {
        super("dd_icbc_erp_result");
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
     * @说明: 给子类重载用，处理post
     * @param {type} {type}
     * @return: 返回
     */
    public void doPost(TtMap post, long id, TtMap result2) {



        if (id > 0) { // id为0时，新增
            edit(post, id);
        } else {
            add(post);
        }

        String nextUrl = Tools.urlKill("sdo") + "&sdo=list";
        boolean bSuccess = errorCode == 0;
        Tools.formatResult(result2, bSuccess, errorCode, bSuccess ? "编辑成功！" : errorMsg, bSuccess ? nextUrl : "");// 失败时停留在当前页面,nextUrl为空
    }






}
