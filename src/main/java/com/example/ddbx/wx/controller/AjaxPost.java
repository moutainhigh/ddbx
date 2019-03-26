package com.example.ddbx.wx.controller;

import com.alibaba.fastjson.JSON;
import com.example.ddbx.wx.tools.DbCtrl;
import com.example.ddbx.wx.tools.FileUp;
import com.example.ddbx.wx.tools.Tools;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Random;

@Controller
public class AjaxPost {

    private static Logger log = Logger.getLogger(UserLogin.class);

    @PostMapping(value = "/wx/getList")
    @ResponseBody
    public String GetList(String selStatus, String mark, String sel_type, String fuzzyQuery){

        String result = "";

        if (StringUtils.isNotEmpty(mark) && StringUtils.isNotEmpty(selStatus)) {

//            System.out.println("mmmm"+mark);
            //查询登录用户信息
            Map<String, String> minfo = Tools.recinfo("select * from assess_admin where wx_openid='" + mark + "'");
            log.info("minfo+>>>>"+minfo);

            if (minfo.size()>0) {
                StringBuilder sql;
                List resultList;
                switch (selStatus) {

                    case "1":
                        log.info("查询征信列表");

                            System.out.println("进入征信查询列表");
                            //根据登录用户所属公司查询该公司征信业务列表
                            sql = new StringBuilder("SELECT ki.id, ki.bc_status, ki.zxok_tag, ki.gems_code, ki.c_name, ki.c_cardno, ki.c_tel, ki.dt_add, ki.zx_result, ag.`name` ag_name FROM kj_icbc ki LEFT JOIN assess_gems ag on ag.icbc_id = ki.id WHERE gems_fs_id = " + minfo.get("icbc_erp_fsid"));
                            //判断查询类型
                            if (StringUtils.isNotEmpty(sel_type) && !sel_type.equals("0")) {
                                sql = sql.append(" AND bc_status = " + sel_type);
                            }
                            //判断是否为模糊查询
                            if (StringUtils.isNotEmpty(fuzzyQuery) && StringUtils.trim(fuzzyQuery).length() > 0) {
                                sql = sql.append(" AND concat(c_name,gems_code,c_cardno,c_tel) like '%" + StringUtils.trim(fuzzyQuery) + "%'");
                            }
                            resultList = Tools.reclist(sql.toString());
                            result = JSON.toJSONString(resultList);

                        break;

                    case "2":
                        log.info("查询汽车评估列表");

                            sql = new StringBuilder("SELECT ac.vincode, ac.car_km_icbc, ac.bc_status, ac.icbc_pricecs, ki.zxok_tag, ki.gems_code, ki.c_name, ki.c_cardno, ki.dt_add, ki.zx_result, ag.`name` ag_name FROM assess_cars ac JOIN kj_icbc ki on ac.icbc_id = ki.id LEFT JOIN assess_gems ag on ac.gems_id = ag.id WHERE ac.gems_fs_id = " + minfo.get("icbc_erp_fsid"));
                            //判断查询类型
                            if (StringUtils.isNotEmpty(sel_type) && !sel_type.equals("0")) {
                                sql = sql.append(" AND ac.bc_status = " + sel_type);
                            }
                            //判断是否为模糊查询
                            if (StringUtils.isNotEmpty(fuzzyQuery) && StringUtils.trim(fuzzyQuery).length() > 0) {
                                sql = sql.append(" AND concat(ki.c_name, ki.gems_code, ki.c_cardno) like '%" + StringUtils.trim(fuzzyQuery) + "%'");
                            }
                            resultList = Tools.reclist(sql.toString());
                            result = JSON.toJSONString(resultList);

                        break;

                    case "3":
                        log.info("查询家访材料列表");

                        sql = new StringBuilder("SELECT ki.id, ki.gems_code, ki.c_name, ki.c_cardno, ki.c_tel, ki.dt_add, ag.`name` ag_name, kk.dk_total_price FROM kj_icbc ki LEFT JOIN assess_gems ag on ag.icbc_id = ki.id JOIN kjs_icbc_kk kk  ON kk.icbc_id = ki.id WHERE ki.gems_fs_id = " + minfo.get("icbc_erp_fsid"));

                        break;

                    case "4":

                        break;

                    case "5":

                        break;

                    case "6":

                        break;

                    case "7":

                        break;

                    case "8":

                        break;
                }

            }
        }else{

        }

        return result;
    }

    @PostMapping(value = "/wx/fileUp")
    @ResponseBody
    public String FileUp(HttpServletRequest request) {

        Map<String, String> post = Tools.getpostmap(request);//过滤参数，过滤mysql的注入，url参数注入
        log.info("请求参数:"+Tools.jsonEnCode(post));

        Map result2 = null;
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        List<MultipartFile> fileList = multipartRequest.getFiles("file");//固定为upload_immm的name
        if (fileList == null || fileList.size() == 0) {
            result2.put("errormsg", "文件为空");
            return Tools.jsonEnCode(result2);
        }
        for (MultipartFile file : fileList)
        {//支持多文件上传
//                        然后判断下，这个文件是否已经存在了，已经存在，再md5一次
//                        直到这个文件不存在
            //这里直接用毫秒 和随机字符串的形式来生成，碰撞率基本为0
            String filename = Tools.md5(String.valueOf(System.currentTimeMillis())+new Random().nextInt()) + "." + Tools.getFileExt(file.getOriginalFilename());//file.getOriginalFilename();
            System.out.println(filename);
            try {
                String smallWidth = post.get("smallwidth");//缩略图高
                String smallHeight = post.get("smallheight");////缩略图宽
                int nSmallWidth = 0;
                int nSmallHeight = 0;
                if (Tools.myisnull(smallWidth) == false) {
                    nSmallWidth = Integer.parseInt(smallWidth);
                }
                if (Tools.myisnull(smallHeight) == false) {
                    nSmallHeight = Integer.parseInt(smallHeight);
                    if (nSmallHeight == 0 && nSmallWidth != 0) {
                        nSmallHeight = nSmallWidth;
                    }
                }
                FileUp fu = new FileUp();
                /*下面一行是设置文件保持路径，如不设置，就使用默认的在FileUp里面配置。*/
                //fu.savePath = "/work/sd128/work/source/JAVA/springboot1/src/main/webapp/upload/";
                /*开始上传文件*/
                result2 = fu.upFile(file, Tools.dirDate()/*这个函数是格式话2018/11/23这种格式的路径*/ + filename, nSmallWidth, nSmallHeight);

            } catch (Exception E) {
                System.err.println(E.getMessage());
            }
        }

        return Tools.jsonEnCode(result2);
    }

    @PostMapping(value = "/wx/newAdd")
    public String NewAdd(HttpServletRequest request){

        Map<String, String> post = Tools.getpostmap(request);//过滤参数，过滤mysql的注入，url参数注入
        log.info("请求参数:"+Tools.jsonEnCode(post));


//        new DbCtrl().add(post);

        return "";
    }

}
