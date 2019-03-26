package com.example.ddbx.wx.tools;
/**
 * 文件上传处理附带文件复制移动方法
 * 创建日期：2018-11-17
 * 最后修改：2018-11-23
 */

import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.nio.channels.FileChannel;
import java.util.HashMap;
import java.util.Map;

public class FileUp {
    public String tmpSavePath = "tmp";//临时文件夹,暂时未用
    //public String savePath = "/work/sd128/work/source/JAVA/springboot1/src/main/webapp/upload/";//最好以/结尾，windows下以\结尾，支持相对路径和绝对路径，相对路径不要以/或者\开头
    public String savePath=WXFinal.media_file;
    public static String urlPre = WXFinal.BasePath+"wxupload/";//URL可以访问的前缀，最好以/结尾
    public int writeBlockSize = 1024 * 8;//8KB每次读写量
    public final String[] OKEXT = new String[]{"JPG", "PNG", "GIF", "BMP", "MP4", "ZIP", "RAR"};//允许上传的文件类型
    public final long MAXSIZE = 1024 * 1024 * 5;//最大支持文件大小
    public final long MAXSIZE_ISADMIN = 1024 * 1024 * 50;//后台管理员支持上传最大文件大小

    public void FileUp() {
    }

    /**
     * todo 改为多线程处理
     * 文件上传处理函数
     *
     * @param srcFile
     * @param toFile  为相对路径比如/2018/11/22/xxxxsddsa.jpg，实际保存的文件完整路径是savePath+tofile路径，
     * @return
     */
    public Map<String, String> upFile(MultipartFile srcFile, String toFile, int smallWidth, int smallHeight) {
        Map<String, String> result = new HashMap<>();
        result.put("success", "false");
        result.put("errorcode", "999");
        result.put("msg", "上传出错,初始化出错！");
        try {
            String sExt = Tools.getFileExt(toFile).toUpperCase();
            if (Tools.arrayIndexOf(OKEXT, sExt) == false) {//不允许的文件类型
                result.put("msg", "上传出错,不允许的文件类型！");
                result.put("errorcode", "998");
                return result;
            }
            long size = srcFile.getSize();
            if (size > (Tools.isadmin() ? MAXSIZE_ISADMIN : MAXSIZE)) {//文件太大
                result.put("msg", "上传出错,文件尺寸超过指定数值！");
                result.put("errorcode", "997");
                return result;
            }
            String toFileFullPath = savePath + "/" + toFile;
            toFileFullPath = Tools.formatFilePath(toFileFullPath);
            System.out.println(toFileFullPath);
            if (Tools.delFile(toFileFullPath)) {//目标文件如果已经存在，就删除旧文件，不存在，直接写入
                String s = Tools.delSpc(Tools.extractFilePath(toFileFullPath));
                System.out.println("crdir:" + s);
                if (!Tools.createDir(Tools.delSpc(Tools.extractFilePath(toFileFullPath)))) {
                    result.put("msg", "创建文件夹失败！");
                    result.put("errorcode", "996");
                    return result;
                }
                System.out.println(size);
                DataInputStream in = new DataInputStream(srcFile.getInputStream());
                OutputStream out = new FileOutputStream(toFileFullPath);
                byte[] bufferOut = new byte[writeBlockSize];
                int bytes = 0;
                while ((bytes = in.read(bufferOut)) != -1) {
                    out.write(bufferOut, 0, bytes);
                }
                in.close();
                out.flush();
                out.close();
                if (Tools.fileExists(toFileFullPath)) {
                    if (smallWidth > 0) {//生成缩略图
                        if (smallHeight <= 0) {
                            smallHeight = smallWidth;
                        }
                        /**开始生成缩略图,支持水印，最后一个参数是本地水印图片完整路径，方法返回缩略图的相对url*/
                        String sSmall = urlPre + ImgTools.small(toFileFullPath, smallWidth, smallHeight, toFile, "");
                        if (sSmall.equals("") == false) {
                            result.put("small", Tools.formatFilePath(sSmall).replace("\\", "/"));
                        }
                    }
                    result.put("success", "true");
                    result.put("errorcode", "0");
                    result.put("fileName", srcFile.getOriginalFilename());
                    result.put("fileSize", Long.toString(size));
                    result.put("url", Tools.formatFilePath(urlPre + toFile).replace("\\", "/"));
                    result.put("fileExt", sExt);
                    result.put("msg", "");//成功时不输出错误信息
                }
            }
        } catch (Exception E) {
            System.err.println(E.getMessage());
            result.put("msg", "处理文件过程中异常,信息：" + E.getMessage());
            result.put("errorcode", "996");
        }
        return result;
    }

    /**
     * 复制文件，自动创建目标文件所在文件夹，如果目标文件复制前已经存在，自动先删除
     *
     * @param srcFile 源文件
     * @param toFile  目标文件
     * @return boolean，返回成功信息
     * @throws IOException
     */
    public boolean ttCopyFile(String srcFile, String toFile) throws IOException {
        boolean result = false;
        if (Tools.fileExists(srcFile) == false) {
            return result;
        }
        if (Tools.delFile(toFile) == false) {
            return result;
        }
        Tools.createDir(Tools.delSpc(Tools.extractFilePath(toFile)));
        File source = new File(srcFile);
        File dest = new File(toFile);
        FileChannel inputChannel = null;
        FileChannel outputChannel = null;
        try {
            Tools.delFile(toFile);//删除旧的文件
            inputChannel = new FileInputStream(source).getChannel();
            outputChannel = new FileOutputStream(dest).getChannel();
            outputChannel.transferFrom(inputChannel, 0, inputChannel.size());
            result = true;
        } catch (Exception E) {
        } finally {
            inputChannel.close();
            outputChannel.close();
        }
        if (result) {//复制完成，检查文件是否存在。
            result = Tools.fileExists(toFile);
        }
        return result;
    }

    /**
     * 移动文件，复制完文件，删除源文件
     *
     * @param srcFile
     * @param toFile
     * @return
     * @throws IOException
     */
    public boolean ttMoveFile(String srcFile, String toFile) throws IOException {
        boolean result = false;
        try {
            result = ttCopyFile(srcFile, toFile);
            if (result) {
                Tools.delFile(srcFile);
            }
        } catch (IOException ee) {
        }
        return result;
    }

    public void main2(String[] args) {
        try {
            String srcFile = "/work/sd128/downloads/test.rar";
            String toFile = "/work/sd128/downloads/2/test.rar";
            System.out.println(Tools.extractFileName(srcFile));
            System.out.println(Tools.delSpc(Tools.extractFilePath(srcFile)));
            Tools.createDir(Tools.delSpc(Tools.extractFilePath(toFile)));
            System.out.println(ttCopyFile(srcFile, toFile));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 字节流格式上传文件？？
     *
     * @param file
     * @param filePath
     * @param fileName
     * @throws Exception
     */
    public void uploadFile(byte[] file, String filePath, String fileName) throws Exception {
        File targetFile = new File(filePath);
        if (!targetFile.exists()) {
            targetFile.mkdirs();
        }
        FileOutputStream out = new FileOutputStream(Tools.formatFilePath(filePath + "/" + fileName));
        out.write(file);
        out.flush();
        out.close();
    }

    public void showmessage() {//获取一些路径，参考用
        System.out.println("Java运行时环境版本:" + System.getProperty("java.version"));
        System.out.println("Java 运行时环境供应商:" + System.getProperty("java.vendor"));
        System.out.println("Java 供应商的URL:" + System.getProperty("java.vendor.url"));
        System.out.println("Java安装目录:" + System.getProperty("java.home"));
        System.out.println("Java 虚拟机规范版本:" + System.getProperty("java.vm.specification.version"));
        System.out.println("Java 类格式版本号:" + System.getProperty("java.class.version"));
        System.out.println("Java类路径：" + System.getProperty("java.class.path"));
        System.out.println("加载库时搜索的路径列表:" + System.getProperty("java.library.path"));
        System.out.println("默认的临时文件路径:" + System.getProperty("java.io.tmpdir"));
        System.out.println("要使用的 JIT 编译器的名称:" + System.getProperty("java.compiler"));
        System.out.println("一个或多个扩展目录的路径:" + System.getProperty("java.ext.dirs"));
        System.out.println("操作系统的名称:" + System.getProperty("os.name"));
        System.out.println("操作系统的架构:" + System.getProperty("os.arch"));
        System.out.println("操作系统的版本:" + System.getProperty("os.version"));
        System.out.println("文件分隔符（在 UNIX 系统中是“/”）:" + System.getProperty("file.separator"));
        System.out.println("路径分隔符（在 UNIX 系统中是“:”）:" + System.getProperty("path.separator"));
        System.out.println("行分隔符（在 UNIX 系统中是“/n”）:" + System.getProperty("line.separator"));
        System.out.println("用户的账户名称:" + System.getProperty("user.name"));
        System.out.println("用户的主目录:" + System.getProperty("user.home"));
        System.out.println("用户的当前工作目录:" + System.getProperty("user.dir"));
        System.out.println("当前的classpath的绝对路径的URI表示法:" + Thread.currentThread().getContextClassLoader().getResource(""));
        System.out.println("得到的是当前的classpath的绝对URI路径:" + FileUp.class.getResource("/"));
        System.out.println("得到的是当前类FileUp.class文件的URI目录:" + FileUp.class.getResource(""));
        File directory = new File("");//参数为空
        String courseFile = null;//标准的路径 ;
        try {
            courseFile = directory.getCanonicalPath();
        } catch (IOException e) {
            e.printStackTrace();
        }
        String author = directory.getAbsolutePath();//绝对路径;
        System.out.println(courseFile);
        System.out.println(author);
    }
}
