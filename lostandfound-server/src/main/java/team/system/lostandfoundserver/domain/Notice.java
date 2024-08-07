package team.system.lostandfoundserver.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@TableName("notice")
@Data
public class Notice {
    @TableId(type = IdType.AUTO)
    private Integer id;
    private String content;
}
