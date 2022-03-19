package team.system.lostandfoundserver.controller.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import team.system.lostandfoundserver.domain.Result;
import team.system.lostandfoundserver.domain.User;
import team.system.lostandfoundserver.service.impl.UserServiceImpl;

import java.util.HashMap;

/**
 * @ClassName: UserController
 * @Description:
 * @Author: Jason
 * @Date: 2022/3/16 2:07 下午
 * @Version: 1.0
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserServiceImpl userService;

    /**
     * @Author: Jason
     * @Description: 用户注册
     * @Date: 10:57 上午 2022/3/19
     * @Param: [userName, pwd]
     * @return: team.system.lostandfoundserver.domain.Result<team.system.lostandfoundserver.domain.User>
     **/
    @RequestMapping("/add")
    public Result<User> add(String userName,String pwd){
        User user = userService.add(userName, pwd);
        Result<User> regResult = Result.success(user);
        regResult.setMsg("恭喜您注册成功");
        if (user == null){
            regResult = Result.error("500","用户名已存在，请更换用户名");
        }
        return regResult;
    }

    /**
     * @Author: Jason
     * @Description: 用户登录
     * @Date: 10:57 上午 2022/3/19
     * @Param: [userName, password]
     * @return: team.system.lostandfoundserver.domain.Result<team.system.lostandfoundserver.domain.User>
     **/
    @RequestMapping("/login")
    public Result<User> login(@RequestBody HashMap<String,String> map){
        User user = userService.login(map.get("userName"));
        if (user == null){
            return Result.error("500", "抱歉，未查询到该用户，请检查您的用户名");
        }
        if (!map.get("password").equals(user.getPassword())){
            return Result.error("500","密码错误，请检查密码");
        }
        return Result.success(user);
    }

    /**
     * @Author: Jason
     * @Description: 找回自己的密码（未完成，需要邮件工具类和一些逻辑）
     * @Date: 10:58 上午 2022/3/19
     * @Param: [newUser]
     * @return: team.system.lostandfoundserver.domain.Result
     **/
    @RequestMapping("/retrive")
    public Result retrive(String email){
        Boolean userByUserNameAndEmail = userService.findUserByUserNameAndEmail(email);
        boolean emailFlag;
        if (userByUserNameAndEmail) {
            //发邮件，返回结果
            emailFlag = true;
            if (emailFlag){
                //确认邮件后

            }else{
                //没有确认，邮件失效后
            }
        }
        return Result.error("500","您的用户名和邮箱不匹配，请确认后重新输入");
    }
//    @RequestMapping("/update")
//    public Result retrive(String email, String password){
//        Boolean userByUserNameAndEmail = userService.findUserByUserNameAndEmail(email);
//        boolean emailFlag;
//        if (userByUserNameAndEmail) {
//            //发邮件，返回结果
//            emailFlag = true;
//            if (emailFlag){
//                //确认邮件后
//
//            }else{
//                //没有确认，邮件失效后
//            }
//        }
//        return Result.error("500","您的用户名和邮箱不匹配，请确认后重新输入");
//    }
}

