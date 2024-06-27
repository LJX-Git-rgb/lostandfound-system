package team.system.lostandfoundserver.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@TableName("feedback")
@Data
public class Feedback {
    @TableId(type = IdType.AUTO)
    private Integer id;
    private Integer uid;
    private String content;
    private Integer lid;
    private Integer fid;
    private Integer state;
}
