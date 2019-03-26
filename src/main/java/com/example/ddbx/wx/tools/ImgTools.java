package com.example.ddbx.wx.tools;
/**
 * 图片工具类，图片生成缩略图和加水印，压缩等处理
 * 创建日期：2018-11-23
 * 最后修改：2018-11-23
 */

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.geom.Area;
import java.awt.geom.RoundRectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Random;

/**
 * maven打包时提示上面3个包提示程序包不存在，在pom.xml的插件栏加入：
 * <plugin>
 * <artifactId>maven-compiler-plugin</artifactId>
 * <version>2.5.1</version>
 * <configuration>
 * <source>1.7</source>
 * <target>1.7</target>
 * <encoding>UTF-8</encoding>
 * <compilerArguments>
 * <verbose />
 * <bootclasspath>${java.home}\lib\rt.jar;${java.home}\lib\jce.jar</bootclasspath>
 * </compilerArguments>
 * </configuration>
 * </plugin>
 */

public class ImgTools {
    /**
     * 图片缩略图方法。创建在源文件的_cache_文件夹下，以cache_加源文件名.jpg结束。
     *
     * @param srcFile   源图片文件
     * @param width
     * @param height
     * @param urlPath   URL访问的路径，决定了代表缩略图的返回值的前缀
     * @param shuiyfile 水印文件路径，如果不使用水印功能，设为""
     * @return 相对的缩略图的完整路径，如果此文件已经存在，不再创建缩略图，直接返回旧的缩略图的url
     * 具体参考FileUp里面的调用
     */
    public static String small(String srcFile, int width, int height, String urlPath, String shuiyfile) {
        File fsrc = new File(srcFile);
        /*固定的缩略图生成文件夹为源文件目录下的_cache_目录*/
        String sSubPath = "_cache_/cache_" + width + "_" + height + "_" + Tools.extractFileName(srcFile) + ".jpg";
        String sto = Tools.extractFilePath(srcFile) + sSubPath;//文件保存路径完整版
        String sResult = Tools.extractFilePath(urlPath) + sSubPath;//url格式
        if (Tools.createDir(Tools.delSpc(Tools.extractFilePath(sto)))) {
            File fto = new File(sto);
            if (fto.exists()) {
                return sResult;
            }
            try {
                mtoJPG(fsrc, fto, width, 100, height, "");
                if (Tools.myisnull(shuiyfile) == false) {
                    shuiy(sto, shuiyfile, 3);
                }
                return Tools.extractFilePath(urlPath) + sSubPath;
            } catch (Exception E) {
                System.err.println(E.getMessage());
                return sResult;
            }
        } else {
            return "";
        }
    }

    /**
     * 给图片加上水印
     * @param srcFile
     * @param shuiyfile
     * @param pos
     * @return
     */
    public static boolean shuiy(String srcFile, String shuiyfile, int pos) {
        boolean result = true;
        try {
            BufferedImage mpsrc2 = ImageIO.read(new File(srcFile));
            BufferedImage suiyin = ImageIO.read(new File(shuiyfile));
            Graphics2D gsrc = mpsrc2.createGraphics();
            //Graphics2D gsuiyin = suiyin.createGraphics();
            gsrc.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, 1.0f)); //透明
            if (pos == -1) {
                Random rand = new Random();
                pos = rand.nextInt(4);
                System.out.println(pos);
            }
            switch (pos) {
                case 1://左上
                    gsrc.drawImage(suiyin, 5, 5, null);
                    break;
                case 2://右上
                    gsrc.drawImage(suiyin, mpsrc2.getWidth() - 5 - suiyin.getWidth(), 5, null);
                    break;
                case 3://右下
                    gsrc.drawImage(suiyin, mpsrc2.getWidth() - 5 - suiyin.getWidth(), mpsrc2.getHeight() - 5 - suiyin.getHeight(), null);
                    break;
                case 4://左下
                    gsrc.drawImage(suiyin, 5, mpsrc2.getHeight() - 5 - suiyin.getHeight(), null);
                    break;
                default:
                    gsrc.drawImage(suiyin, mpsrc2.getWidth() - 5 - suiyin.getWidth(), mpsrc2.getHeight() - 5 - suiyin.getHeight(), null);
            }

            gsrc.dispose();

            FileOutputStream out = new FileOutputStream(new File(srcFile));
            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
            //如果图像是透明的，就丢弃Alpha通道
            doToFile(mpsrc2, out, encoder);
            out.close();
        } catch (Exception E) {
            System.err.println(E.getMessage());
            result = false;
        }
        return result;
    }

    private static void doToFile(BufferedImage mpsrc2, FileOutputStream out, JPEGImageEncoder encoder) throws IOException {
        if (mpsrc2.getTransparency() == Transparency.TRANSLUCENT) {
            mpsrc2 = get24BitImage(mpsrc2);
        }
        JPEGEncodeParam param = encoder.getDefaultJPEGEncodeParam(mpsrc2);//使用jpeg编码器
        param.setQuality(1, true);//高质量jpg图片输出
        encoder.encode(mpsrc2, param);
    }

    /**
     * 针对高度与宽度进行等比缩放
     *
     * @param img
     * @param maxSize 要缩放到的尺寸
     * @param type    1:高度与宽度的最大值为maxSize进行等比缩放 , 2:高度与宽度的最小值为maxSize进行等比缩放
     * @return
     */
    private static Image getScaledImage(BufferedImage img, int maxSize, int type, int height) {
        int w0 = img.getWidth();
        int h0 = img.getHeight();
        int w = w0;
        int h = h0;
        if (type == 1) {
            w = w0 > h0 ? maxSize : (maxSize * w0 / h0);
            h = w0 > h0 ? (maxSize * h0 / w0) : maxSize;
        } else if (type == 2) {
            w = w0 > h0 ? (maxSize * w0 / h0) : maxSize;
            h = w0 > h0 ? maxSize : (maxSize * h0 / w0);
        } else if (type == 3) {
            w = maxSize;
            h = height;
        }
        Image image = img.getScaledInstance(w, h, Image.SCALE_SMOOTH);
        BufferedImage result = new BufferedImage(w, h, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g = result.createGraphics();
        g.drawImage(image, 0, 0, null);//在适当的位置画出
        return result;
    }

    /**
     * 先按最小宽高为size等比例绽放, 然后图像居中抠出直径为size的圆形图像
     *
     * @param img
     * @param size
     * @return
     */
    private static BufferedImage getRoundedImage(BufferedImage img, int size) {
        return getRoundedImage(img, size, size / 2, 2, 0, "");
    }

    /**
     * 先按最小宽高为size等比例绽放, 然后图像居中抠出半径为radius的圆形图像
     *
     * @param img
     * @param size   要缩放到的尺寸
     * @param radius 圆角半径
     * @param type   1:高度与宽度的最大值为maxSize进行等比缩放 , 2:高度与宽度的最小值为maxSize进行等比缩放
     * @return
     */
    private static BufferedImage getRoundedImage(BufferedImage img, int size, int radius, int type, int height, String shuiyfile) {

        BufferedImage result = new BufferedImage(size, type == 3 ? height : size, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g = result.createGraphics();

        //先按最小宽高为size等比例绽放, 然后图像居中抠出直径为size的圆形图像
        Image fixedImg = getScaledImage(img, size, type, height);
        if (type == 3) {
            g.drawImage(fixedImg, 0, 0, null);//在适当的位置画出
        } else {
            g.drawImage(fixedImg, (size - fixedImg.getWidth(null)) / 2, ((type == 3 ? height : size) - fixedImg.getHeight(null)) / 2, null);//在适当的位置画出
        }
        //水印
        if (!shuiyfile.equals("")) {
            try {
                BufferedImage suiyin = ImageIO.read(new File(shuiyfile));
                g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, 1.0f)); //透明
                g.drawImage(suiyin, size - 5 - suiyin.getWidth(), (type == 3 ? height : size) - 5 - suiyin.getHeight(), null);//在适当的位置画出水印
            } catch (Exception E) {
                System.err.printf(E.getMessage());
            }
        }
        //圆角
        if (radius > 0) {
            RoundRectangle2D round = new RoundRectangle2D.Double(0, 0, size, type == 3 ? height : size, radius * 2, radius * 2);
            Area clear = new Area(new Rectangle(0, 0, size, type == 3 ? height : size));
            clear.subtract(new Area(round));
            g.setComposite(AlphaComposite.Clear);

            //抗锯齿
            g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            g.fill(clear);
        }

        g.dispose();
        return result;
    }

    /**
     * 使用删除alpha值的方式去掉图像的alpha通道
     *
     * @param $image
     * @return
     */
    protected static BufferedImage get24BitImage(BufferedImage $image) {
        int __w = $image.getWidth();
        int __h = $image.getHeight();
        int[] __imgARGB = getRGBs($image.getRGB(0, 0, __w, __h, null, 0, __w));
        BufferedImage __newImg = new BufferedImage(__w, __h, BufferedImage.TYPE_INT_RGB);
        __newImg.setRGB(0, 0, __w, __h, __imgARGB, 0, __w);
        return __newImg;
    }

    /**
     * 使用绘制的方式去掉图像的alpha值
     *
     * @param $image
     * @param $bgColor
     * @return
     */
    protected static BufferedImage get24BitImage(BufferedImage $image, Color $bgColor) {
        int $w = $image.getWidth();
        int $h = $image.getHeight();
        BufferedImage img = new BufferedImage($w, $h, BufferedImage.TYPE_INT_RGB);
        Graphics2D g = img.createGraphics();
        g.setColor($bgColor);
        g.fillRect(0, 0, $w, $h);
        g.drawRenderedImage($image, null);
        g.dispose();
        return img;
    }

    /**
     * 将32位色彩转换成24位色彩（丢弃Alpha通道）
     *
     * @param $argb
     * @return
     */
    public static int[] getRGBs(int[] $argb) {
        int[] __rgbs = new int[$argb.length];
        for (int i = 0; i < $argb.length; i++) {
            __rgbs[i] = $argb[i] & 0xFFFFFF;
        }
        return __rgbs;
    }

    public static void mtoJPG(File img, File save, int size, int quality, int height, String shuiyfile) throws IOException {
        FileOutputStream out = new FileOutputStream(save);
        JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
        BufferedImage image = (BufferedImage) getRoundedImage(ImageIO.read(img), size, 0, 3, height, shuiyfile);//默认无圆角
        //如果图像是透明的，就丢弃Alpha通道
        doToFile(image, out, encoder);
        out.close();
    }

    public static void toPNG(File img, File save, int size) throws IOException {
        ImageIO.write((BufferedImage) getRoundedImage(ImageIO.read(img), size, 0, 2, 0, ""), "PNG", save);//默认无圆角
    }
    /**
     * 测试方法
     * @param args
     * @throws IOException
     */
    public static void main3(String[] args) throws IOException {
        shuiy("/work/sd128/work/source/JAVA/springboot1/src/main/webapp/upload/2018/11/23/d4c6fda999b86a966cf71bb69cdee62f.jpg", "/work/sd128/work/source/JAVA/springboot1/src/main/webapp/upload/2018/11/23/3.png", -1);
        // String sSmall = urlPre + ImgTools.small(toFileFullPath, smallWidth, smallHeight, toFile, "");
    }
}
