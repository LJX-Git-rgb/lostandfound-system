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
public class Admin {
    private Integer id;
    private String uid;
    private String name;
    private String pwd;
    private String phone;
}
