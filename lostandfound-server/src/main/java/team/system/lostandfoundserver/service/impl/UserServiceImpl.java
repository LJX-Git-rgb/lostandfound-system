package team.system.lostandfoundserver.service.impl;

import team.system.lostandfoundserver.domain.User;

import java.util.List;

public interface UserServiceImpl {
    List<User> findUserByPage(Integer currentPage, Integer pageSize);

    User add(String userName, String pwd);

    User login(String userName);

    Boolean delete(Integer userId);

    Boolean update(User newUser);

    Integer countUser();

    Boolean findUserByUserNameAndEmail(String email);
}
