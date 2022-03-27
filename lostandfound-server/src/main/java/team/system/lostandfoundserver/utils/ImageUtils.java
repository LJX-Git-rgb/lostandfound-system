package team.system.lostandfoundserver.utils;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Random;

public class ImageUtils {

    //随机字符集合，去除0、o、1、l
    //"abcdefghijkmnpqrstuvwxyz23456789"
    static String[] strs = {"a","b","c","d","e","f","g","h",
            "i","j","k","m","n","p","q","r","s","t","u",
            "v","w","x","y","z","2","3","4","5","6","7","8","9"};

    public static void main(String[] args) throws IOException {
        //定义图片的宽度
        int w = 150;
        //定义图片的高度
        int h = 50;
        //图片类型
        int imageType = BufferedImage.TYPE_INT_RGB;
        //画板 纸 JDK中提供画板类
        BufferedImage image = new BufferedImage(w, h, imageType);
        //图片默认的颜色是黑色 修改图片颜色
        //获取画笔对象
        Graphics g = image.getGraphics();
        //填充矩形颜色
        g.setColor(Color.blue);
        //画一个填充矩形
        g.fillRect(0,0,w,h);
        //画笔颜色
        g.setColor(Color.black);
        //字体特性
        g.setFont(new Font("楷体",Font.PLAIN,25));
        //使用Random类
        Random random = new Random();
        int x = 30;
        int y = 30;
        //准备一组数据，随即从数组中获取4个
        for (int i = 0; i < 4; i++) {
            int num = random.nextInt(strs.length);
            String str = strs[num];
            //画到画板上
            g.drawString(str,x,y);
            //每画一次x的值要变大
            x +=25;
        }
        //画一些干扰线
        for (int i = 0; i < 6; i++) {
            int x1 = random.nextInt(30);
            int y1 = random.nextInt(50);
            int x2 = random.nextInt(30+120);
            int y2 = random.nextInt(50);
            g.drawLine(x1,y1,x2,y2);
        }
        //生成一张图片 把image生成到本地的磁盘上
        ImageIO.write(image, "jpg", new File("C:\\Users\\Jennifer\\Pictures\\suanfa\\aaa.jpg"));
    }


}
