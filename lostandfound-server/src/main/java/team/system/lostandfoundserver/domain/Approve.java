package team.system.lostandfoundserver.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("approve")
public class Approve {
    @TableId(type = IdType.AUTO)
    private Integer id;
    private String uid;
    private String name;
    private String idNumber;
}
