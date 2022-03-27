package team.system.lostandfoundserver.config;
/*
 *
 *@ClassName CpatchaConfig
 *@Description 验证码配置
 *@Author Pisces
 *@Date 2022/3/3 17:04
 *@Version 1.0
 **/

import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.google.code.kaptcha.util.Config;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Properties;

@Configuration
public class CaptchaConfig {
    @Bean
    public DefaultKaptcha defaultKaptcha(){
        // 验证码生成器
        DefaultKaptcha defaultKaptcha = new DefaultKaptcha();
        // 配置
        Properties properties = new Properties();
        // 是否有边框
        properties.setProperty("kaptcha.border","yes");
        // 设置边框颜色
        //properties.setProperty("kaptcha.border.color","105,179,90");
        properties.setProperty("kaptcha.border.color","white");
        // 边框粗细度，默认为1
        properties.setProperty("kaptcha.border.thickness","1");
        // 验证码图片宽度，默认为 200
        properties.setProperty("kaptcha.image.width", "100");
        // 验证码图片高度，默认为40
        properties.setProperty("kaptcha.image.height", "40");
        // 设置干扰(也就是图片字母干净NoNoise)
        properties.setProperty("kaptcha.noise.impl", "com.google.code.kaptcha.impl.NoNoise");// 没有干扰
        // 设置验证码文本字符颜色，默认黑色
        properties.setProperty("kaptcha.textproducer.font.color", "130,55,191");
        // 设置字体样式
        properties.setProperty("kaptcha.textproducer.font.names", "宋体");
        //properties.setProperty("kaptcha.textproducer.font.names", "宋体,楷体,微软雅黑");
        // 验证码 session key
        properties.setProperty("kaptcha.session.key", "code");
        // 字体大小
        properties.setProperty("kaptcha.textproducer.font.size", "30");
        // 验证码长度
        properties.setProperty("kaptcha.textproducer.char.length", "4");
        //字符间距
        properties.setProperty("kaptcha.textproducer.char.space","4");

        Config config = new Config(properties);
        defaultKaptcha.setConfig(config);

        return defaultKaptcha;
    }
}
