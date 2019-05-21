package com.example.ddbx.transfer.base;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.ddbx.transfer.utils.Charsets;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.DigestUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

/**基础 controller
 * @Description:TODO
 * @author:LiWang
 * @time:2018年8月2日
 */
public abstract class BaseController {
    private static Logger log = LogManager.getLogger(BaseController.class.getName());
    public static String getErrorInfoFromException(Exception e) {
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            e.printStackTrace(pw);
            return "\r\n" + sw.toString() + "\r\n";
        } catch (Exception e2) {
            return "bad getErrorInfoFromException";
        }
    }
    //业务对象
    public Map AddBoToMap(HttpServletRequest request) {
        Map map=this.updateBoToMap(request);
        map.put("midAdd", this.getUserId(request));
        map.put("dtAdd", this.getTime());
        return map;
    }

    public Map updateBoToMap(HttpServletRequest request) {
        Map map=new HashMap<>();
        map.put("midEdit", this.getUserId(request));
        map.put("dtEdit", this.getTime());
        return map;
    }
    /**
     * 获取当前登录用户id
     * @return {Long}
     */
    public String getUserId(HttpServletRequest request) {
        //return String.valueOf(Tools.mid());
        return "21";
    }
    /**
     * 获取当前登录用户bankId
     * @return {Long}
     */
    public String getBankId(HttpServletRequest request) {
        //return String.valueOf(Tools.mid());
        return "21";
    }
    public static String getTime(){
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String nowStr = now .format(format);
        return nowStr;
    }
    /**
     * ajax失败
     * @param msg 失败的消息
     * @return {Object}
     */
    public static Result renderError(String msg) {
        Result result = new Result();
        result.setSuccess(false);
        result.setMessage(msg);
        return result;
    }

    /**
     * ajax成功
     * @return {Object}
     */
    public static Result renderSuccess() {
        Result result = new Result();
        return result;
    }

    /**
     * ajax成功
     * @param msg 消息
     * @return {Object}
     */
    public static Result renderSuccess(String msg) {
        Result result = new Result();
        result.setMessage(msg);
        return result;
    }

    /**
     * ajax成功
     * @param obj 成功时的对象
     * @return {Object}
     */
    public   Result renderSuccess(Object obj) {
        Result result = new Result();
        result.setData(obj);
        return result;
    }

    /**
     * 重定向跳转跳转
     * @param url 目标url
     */
    protected String redirect(String url) {
        return new StringBuilder("redirect:").append(url).toString();
    }
    /**
     * 下载文件
     * @param file 文件
     */
    protected ResponseEntity<Resource> download(File file) {
        String fileName = file.getName();
        return download(file, fileName);
    }

    /**获取实际路径
     * @param request
     * @param s
     * @return
     * @Description: TODO
     * @param name
     * @return
     */
    public static String readPath(HttpServletRequest request,String s){
        return request.getSession().getServletContext().getRealPath(s);
    }
    /**
     * 下载
     * @param file 文件
     * @param fileName 生成的文件名
     * @return {ResponseEntity}
     */
    protected ResponseEntity<Resource> download(File file, String fileName) {
		/*获取资源的几种方式
		ClassPathResource   classpath中读取
		FileSystemResource  文件系统中读取
		ServletContextResource  读取Tomcat中的application配置文件, 必须导入Spring3-Web.jar包*/
        Resource resource = new FileSystemResource(file);
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes()).getRequest();
        String header = request.getHeader("User-Agent");//获取客户端浏览器和操作系统信息
        // 避免空指针 转换为大写
        header = header == null ? "" : header.toUpperCase();
        HttpStatus status;
        /*下载文件:同时兼容chrome Firefox IE 三个浏览器写法*/
        if (header.contains("MSIE") || header.contains("TRIDENT") || header.contains("EDGE")) {
            try {
                fileName = URLEncoder.encode(fileName, "utf-8");
                fileName = fileName.replace("+", "%20"); //IE下载文件名空格变+号问题
            } catch (UnsupportedEncodingException e) {
                //如果不支持指定的编码
                e.printStackTrace();
            }
            status = HttpStatus.OK;
        } else {
            fileName = new String(fileName.getBytes(Charsets.UTF_8), Charsets.ISO_8859_1);
            status = HttpStatus.CREATED;
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", fileName);
        return new ResponseEntity<Resource>(resource, headers, status);
    }
    //获取随机的字符串
    public static String getRandomMark(){
        return  DigestUtils.md5DigestAsHex(UUID.randomUUID().toString().replace("-", "").toLowerCase().getBytes());
    }
    //下载服务器端文件到浏览器
    public HttpServletResponse download(String path, HttpServletResponse response) {
        try {
            // path是指欲下载的文件的路径。
            File file = new File(path);
            // 取得文件名。
            String filename = file.getName();
            // 取得文件的后缀名。
            String ext = filename.substring(filename.lastIndexOf(".") + 1).toUpperCase();

            // 以流的形式下载文件。
            InputStream fis = new BufferedInputStream(new FileInputStream(path));
            byte[] buffer = new byte[fis.available()];
            fis.read(buffer);
            fis.close();
            // 清空response
            response.reset();
            // 设置response的Header
            response.addHeader("Content-Disposition", "attachment;filename=" + new String(filename.getBytes()));
            response.addHeader("Content-Length", "" + file.length());
            OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
            response.setContentType("application/octet-stream");
            toClient.write(buffer);
            toClient.flush();
            toClient.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return response;
    }
    //文件上传
    protected boolean uploadServer(MultipartFile file, String path,String fileName) {
        // 判断文件是否为空
        if (!file.isEmpty()) {
            try {
                File filepath = new File(path);
                if (!filepath.exists())
                    filepath.mkdirs();
                // 文件保存路径
                String savePath = path + fileName;
                log.info("图片路径->"+savePath);
                File imgPath=new File(savePath);
                imgPath.createNewFile();//且仅当不存在具有此抽象路径名指定名称的文件时，不可分地创建一个新的空文件
                // 转存文件
                file.transferTo(imgPath);
                return true;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }
    /**
     * TODO 下载文件到本地
     * @author nadim
     * @date Sep 11, 2015 11:45:31 AM
     * @param fileUrl 远程地址
     * @param fileLocal 本地路径
     * @throws Exception
     */
    public static void downloadFile(String fileUrl,String file) throws Exception {
        log.info("下载url地址->"+fileUrl);

        URL url = new URL(fileUrl);
        HttpURLConnection urlCon = (HttpURLConnection) url.openConnection();
//       urlCon.setConnectTimeout(6000);
//       urlCon.setReadTimeout(6000);
        int code = urlCon.getResponseCode();
        if (code != HttpURLConnection.HTTP_OK) {
            throw new Exception("文件读取失败"+code);
        }
        BufferedInputStream bufferedInputStream = new  BufferedInputStream(urlCon.getInputStream());

        FileOutputStream fileOutputStream = new FileOutputStream(file);
        int count=0;
        byte[] b = new byte[100];
        while((count = bufferedInputStream.read(b)) != -1) {
            fileOutputStream.write(b, 0,count);
        }
        bufferedInputStream.close();
        fileOutputStream.close();
    }
    //浏览器端下载
    public static void urlToWeb(String farUrl, HttpServletResponse response,String fileName) throws Exception{
        URL url = new URL(farUrl);
        HttpURLConnection urlCon = (HttpURLConnection) url.openConnection();
        int code = urlCon.getResponseCode();
        if (code != HttpURLConnection.HTTP_OK) {
            throw new Exception("文件读取失败"+code);
        }
        BufferedInputStream bis=null;
        BufferedOutputStream bos=null;
        try{
            bis = new  BufferedInputStream(urlCon.getInputStream());
            response.setContentType("application/x-msdownload;");
            /* 设置文件头：最后一个参数是设置下载文件名(假如我们叫a.ini)   */
            response.setHeader("Content-disposition", "attachment; filename=" +fileName);
            bos = new BufferedOutputStream(response.getOutputStream());
            byte[] buff = new byte[2048];
            int bytesRead;
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length)))
                bos.write(buff, 0, bytesRead);
            bos.flush();
        }catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (bis != null) {
                    bis.close();
                }
                if (bos != null) {
                    bos.close();
                }
            } catch (Exception e){}
        }
    }
}
