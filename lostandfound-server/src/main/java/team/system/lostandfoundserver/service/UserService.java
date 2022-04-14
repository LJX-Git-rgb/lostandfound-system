package team.system.lostandfoundserver.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import team.system.lostandfoundserver.domain.User;
import team.system.lostandfoundserver.domain.Admin;
import team.system.lostandfoundserver.mapper.UserMapper;
import team.system.lostandfoundserver.service.impl.UserServiceImpl;
import team.system.lostandfoundserver.utils.SMTPClient;

import java.sql.SQLIntegrityConstraintViolationException;
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
        try {
            userMapper.addUser(user);
        }catch (Exception exception){
            if (exception instanceof SQLIntegrityConstraintViolationException || exception instanceof DuplicateKeyException) {
//                用户名冲突
                return null;
            }else{
                exception.printStackTrace();
            }
        }
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
    @Override
    public User changepwd(String newpwd,String checkpwd){
        User userByEmail = userMapper.findUserByEmail(newpwd);
        try {
            SMTPClient smtpClient = new SMTPClient();
            boolean b = smtpClient.sendMessage(newpwd, checkpwd);
            if(!b){
                return null;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return userByEmail;
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
