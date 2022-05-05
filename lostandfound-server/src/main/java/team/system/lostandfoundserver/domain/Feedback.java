package team.system.lostandfoundserver.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@TableName("feedback")
@Data
public class Feedback {
    @TableId(type = IdType.AUTO) //id自增
    private Integer id;
    private String uid;
    private String content;
    private String lid;
    private String fid;
    private Integer state;
}
