package com.example.ddbx.tt.erp;

import com.example.ddbx.tt.data.TtList;
import com.example.ddbx.tt.data.TtMap;
import com.example.ddbx.tt.tool.Tools;
import net.sf.json.JSONArray;
import org.apache.http.HttpResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;


@Controller
public class ErpbjlsController {

    @RequestMapping(value = "/manager/bjlspost", method = RequestMethod.POST)
    @ResponseBody
    public Map ajaxpost(String cl_type, int icbc_id, HttpServletResponse response) throws IOException{

        System.out.println("类型："+cl_type);
        Map map = new HashMap();

        if("zx_zdr".equals(cl_type) || "zx_po".equals(cl_type) || "zx_gh1".equals(cl_type) || "zx_gh2".equals(cl_type)){
            String zxsql = "SELECT * FROM dd_icbc_erp_result WHERE icbc_id =" + icbc_id + " and now_status = 2";
            TtList zxlist = Tools.reclist(zxsql);
            System.out.println("zxxxx"+zxlist);
            map.put("zxlist", zxlist);
        }

        if ("zxtr".equals(cl_type)) {
            String trsql = "SELECT * FROM dd_icbc_erp_result WHERE icbc_id =" + icbc_id + " AND now_status = 7";
            TtList trlist = Tools.reclist(trsql);
            map.put("zxlist", trlist);
        }

        if ("qcpg_cl".equals(cl_type) || "qcpg_zp".equals(cl_type)) {
            String qcsql = "SELECT * FROM dd_icbc_erp_result WHERE icbc_id =" + icbc_id + " AND now_status = 10";
            TtList qclist = Tools.reclist(qcsql);
            map.put("zxlist", qclist);
        }

        if("htcl".equals(cl_type) || "zmcl".equals(cl_type) || "qtcl".equals(cl_type) || "bccl".equals(cl_type)){
            String dksql = "SELECT * FROM dd_icbc_erp_result WHERE icbc_id =" + icbc_id + " and now_status = 32";
            TtList dklist = Tools.reclist(dksql);
            map.put("zxlist", dklist);
            System.out.println("dkkkkk"+dklist);
        }
        if("kasq".equals(cl_type)){
            String qcsql = "SELECT * FROM dd_icbc_erp_result WHERE icbc_id =" + icbc_id + " AND now_status = 18";
            TtList qclist = Tools.reclist(qcsql);
            System.out.println("开卡申请："+qclist);
            map.put("zxlist", qclist);
        }

        return map;
    }
}
