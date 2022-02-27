package com.example.springboot.service.impl;

import com.example.springboot.domain.PageHelper;
import com.example.springboot.domain.Result;
import com.example.springboot.domain.User;
import com.github.pagehelper.Page;
import org.springframework.stereotype.Service;

import java.util.List;

public interface UserServiceImpl {
    List<User> findUserByPage(Integer currentPage,Integer pageSize);

    Boolean add(User user);

    User login(String userName, String password);

    Boolean delete(Integer userId);

    Boolean update(User newUser);

    Integer countUser();
}
