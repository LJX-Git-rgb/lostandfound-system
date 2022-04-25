package team.system.lostandfoundserver.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@TableName("admin_user")
@Data
public class Admin {
    @TableId(type = IdType.AUTO) //id自增
    private Integer id;
    private String uid;
    private String name;
    private String pwd;
    private String phone;
}
