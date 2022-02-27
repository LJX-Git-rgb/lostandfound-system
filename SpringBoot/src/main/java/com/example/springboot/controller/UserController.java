package com.example.springboot.controller;

import com.example.springboot.domain.LoginUser;
import com.example.springboot.domain.PageHelper;
import com.example.springboot.domain.Result;
import com.example.springboot.domain.User;
import com.example.springboot.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @ClassName: UserController
 * @Description:
 * @Author: Jason
 * @Date: 2022/2/14 3:53 下午
 * @Version: 1.0
 */

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserServiceImpl userService;

    @RequestMapping("/findAll")
    public List<User> findAll(Integer currentPage,Integer pageSize){
        if (currentPage > 0){
            currentPage--;
        }
        return userService.findUserByPage(currentPage,pageSize);
    }

    @RequestMapping("/countUser")
    public Integer countUser(){
        return userService.countUser();
    }

    @PostMapping("/add")
    public String add(@RequestBody User user){
        Boolean add = userService.add(user);
        if (add) {
            return "redirect:findAll";
        }
        else {
            return Result.error("500", "server is add fail").toString();
        }
    }

//   因为get传参有问题，只能封装对象来进行接受参数
    @RequestMapping("/login")
    public Result<User> login(@RequestBody LoginUser loginUser){
        Result<User> loginResult;
        User user = userService.login(loginUser.getUserName(), loginUser.getPassword());
        loginResult = Result.success(user);
        if (user == null){
            loginResult = Result.error("500", "抱歉，未查询到该用户，请检查您的用户名");
        }
        if (user.getPassword() != user.getPassword()){
            loginResult = Result.error("500","密码错误，请检查密码");
        }
        return loginResult;
    }

    @RequestMapping("/update")
    public Result update(@RequestBody User newUser){
        if (userService.update(newUser)){
            return Result.success();
        }
        return Result.error("500","编辑失败，请确认信息");
    }

    @GetMapping("/delete")
    public Result delete(HttpServletRequest request){
        String userId = request.getParameter("userId");
        if (userService.delete(Integer.parseInt(userId))){
            return Result.success();
        }
        else{
            return Result.error("500","未知错误，删除失败");
        }
    }
}
