package team.system.lostandfoundserver.domain;

import lombok.Data;

import java.util.Date;

/**
 * @ClassName: User
 * @Description:
 * @Author: Jason
 * @Date: 2022/2/14 3:51 下午
 * @Version: 1.0
 *
 */

@Data
public class User {
    private Integer id;
    private String uid;
    private String nickName;
    private String email;
    private String password;
    private String gender;
    private Integer userRole;
    private String face;
    private Date createTime;
    private Date updateTime;
    private String signature;
}
