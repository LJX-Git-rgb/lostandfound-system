package team.system.lostandfoundserver.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import team.system.lostandfoundserver.domain.User;
import team.system.lostandfoundserver.domain.Admin;
import team.system.lostandfoundserver.domain.UserContactInfo;
import team.system.lostandfoundserver.mapper.UserMapper;
import team.system.lostandfoundserver.service.impl.UserServiceImpl;
import team.system.lostandfoundserver.utils.SMTPClient;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

/**
 * @ClassName: UserService
 * @Description:
 * @Author: Jason
 * @Date: 2022/2/14 4:44 下午
 * @Version: 1.0
 */

@Service
public class UserService implements UserServiceImpl {

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> findUserByPage(Integer currentPage,Integer pageSize) {
        int currentDataIndex = currentPage * pageSize;
        return userMapper.findByPage(currentDataIndex,pageSize);
    }

    @Override
    public User add(String email, String pwd) {
        User user = new User();
        user.setEmail(email);
        user.setPassword(pwd);
        user.setUid(UUID.randomUUID().toString());
        user.setCreateTime(new Date());
        user.setUserRole(1);

        userMapper.addUser(user);
        return userMapper.findUserByEmail(email);
    }

    @Override
    public User retrive(String email, String identifyCode) {
        User userByEmail = userMapper.findUserByEmail(email);

        try {
            SMTPClient smtpClient = new SMTPClient();
            boolean b = smtpClient.sendMessage(email,identifyCode);
            if (!b){
                //未区分出来是没有该用户还是邮件发不出去
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userByEmail;
    }

    @Override public User changepwd(String email, String newPwd) {
        User userByEmail = userMapper.findUserByEmail(email);
        userByEmail.setPassword(newPwd);
        if (userMapper.update(userByEmail)){
            return userByEmail;
        }
        return null;
    }

    @Override
    public User findUserByEmail(String email) {
        return userMapper.findUserByEmail(email);
    }

    @Override
    public User wechatLogin(User user) {
        //查询是否微信注册过
        User wechatUser = userMapper.searchWechatSignature(user.getSignature());
        //没有的话微信直接注册（没有邮箱和密码
        if (wechatUser == null){
            user.setUid(UUID.randomUUID().toString());
            user.setCreateTime(new Date());
            user.setUserRole(1);
            if(userMapper.addUser(user)){
                return user;
            }
        }else{
            if (wechatUser.getFace() == null || wechatUser.getFace().length() == 0){
                wechatUser.setFace(user.getFace());
                wechatUser.setGender(user.getGender());
                userMapper.update(wechatUser);
            }
            //注册过的话直接返回查询到到用户就可以
            return wechatUser;
        }
        return null;
    }

    @Override
    public UserContactInfo searchUserContactInfoByUid(Integer uid) {
        return userMapper.searchUserContactInfoByUid(uid);
    }

    @Override
    public User login(String userName) {
        return userMapper.findUserByEmail(userName);
    }

    @Override
    public Admin adminlogin(String name, String pwd) {
        return userMapper.adminlogin(name, pwd);
    }

    @Override
    public Boolean delete(Integer userId) {
        return userMapper.delete(userId);
    }

    @Override
    public Boolean update(User newUser) {
        return userMapper.update(newUser);
    }

    @Override
    public Integer countUser() {
        return userMapper.countUser();
    }

}
