package team.system.lostandfoundserver.domain;

import lombok.Data;
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
    private String email;
    private String password;
    private String gender;
    private Integer userRole;
    private String face;
    private Integer createTime;
    private Integer updateTime;
}
