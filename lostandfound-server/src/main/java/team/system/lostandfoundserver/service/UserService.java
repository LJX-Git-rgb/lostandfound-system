package team.system.lostandfoundserver.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import team.system.lostandfoundserver.domain.User;
import team.system.lostandfoundserver.mapper.UserMapper;
import team.system.lostandfoundserver.service.impl.UserServiceImpl;

import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;
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
    public User add(String userName, String pwd) {
        User user = new User();
        user.setUserName(userName);
        user.setPassword(pwd);
        UUID uuid = UUID.randomUUID();
        user.setUid(uuid.toString());
        try {
            userMapper.addUser(user);
        }catch (Exception exception){
            if (exception instanceof SQLIntegrityConstraintViolationException || exception instanceof DuplicateKeyException) {
                System.out.println("用户名冲突");
                return null;
            }else{
                exception.printStackTrace();
            }
        }
        return userMapper.findByUserName(userName);
    }

    @Override
    public User login(String userName) {
        return userMapper.findByUserName(userName);
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

    @Override
    public Boolean findUserByUserNameAndEmail(String email) {
        return true;
    }
}
