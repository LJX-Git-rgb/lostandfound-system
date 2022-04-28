package team.system.lostandfoundserver.domain;

import lombok.Data;

@Data
public class UserContactInfo {

    Integer id;
    Integer uid;
    String appellation;
    String phone;
    String qq;
    String wechat;
    String email;
    String address;
    String microblogging;
    String other;

}
