package team.system.lostandfoundserver.service.impl;

import team.system.lostandfoundserver.domain.User;

import java.util.List;

public interface UserServiceImpl {
    List<User> findUserByPage(Integer currentPage, Integer pageSize);

    Boolean add(User user);

    User login(String userName, String password);

    Boolean delete(Integer userId);

    Boolean update(User newUser);

    Integer countUser();
}
