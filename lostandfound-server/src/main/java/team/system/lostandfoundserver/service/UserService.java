package team.system.lostandfoundserver.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.system.lostandfoundserver.domain.User;
import team.system.lostandfoundserver.mapper.UserMapper;
import team.system.lostandfoundserver.service.impl.UserServiceImpl;
import java.util.List;

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
    public Boolean add(User user) {
        userMapper.addUser(user);
        return true;
    }

    @Override
    public User login(String userName, String password) {
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
}