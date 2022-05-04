package team.system.lostandfoundserver.service.impl;

import team.system.lostandfoundserver.domain.User;
import team.system.lostandfoundserver.domain.Admin;
import team.system.lostandfoundserver.domain.UserContactInfo;

import java.util.List;

public interface UserServiceImpl {
    List<User> findUserByPage(Integer currentPage, Integer pageSize);

    User add(String email, String pwd);

    User login(String userName);

    Admin adminlogin(String name, String pwd);

    Boolean delete(Integer userId);

    Boolean update(User newUser);

    Integer countUser();

    User retrive(String email, String identifyCode);

    User changepwd(String email ,String newPwd);

    User findUserByEmail(String email);

    User wechatLogin(User user);

    UserContactInfo searchUserContactInfoByUid(Integer uid);

    Boolean updateUserContactInfo(UserContactInfo userContactInfo);
}
