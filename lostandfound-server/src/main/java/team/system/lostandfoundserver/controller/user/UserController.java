package team.system.lostandfoundserver.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import team.system.lostandfoundserver.domain.Result;
import team.system.lostandfoundserver.domain.User;
import team.system.lostandfoundserver.domain.UserContactInfo;
import team.system.lostandfoundserver.service.impl.UserServiceImpl;

import java.util.ArrayList;
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
    public Result add(@RequestBody  User user){
        if (userService.findUserByEmail(user.getEmail()) != null){
            return Result.error("500","邮箱已存在，请更换邮箱");
        }

        User regUser = userService.add(user.getEmail(), user.getPassword());
        ArrayList data = new ArrayList();
        data.add(regUser);
        Result regResult = Result.success(data);
        regResult.setMsg("恭喜您注册成功");
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
    public Result login(@RequestBody HashMap<String,String> map){
        User user = userService.login(map.get("account"));
        if (user == null){
            return Result.error("500", "抱歉，未查询到该用户，请检查您的用户名");
        }
        if (!map.get("password").equals(user.getPassword())){
            return Result.error("500","密码错误，请检查密码");
        }
        ArrayList<Object> data = new ArrayList<>();
        data.add(user);
        return Result.success(data);
    }

    @RequestMapping("/wechatLogin")
    public Result login(@RequestBody User user){
        User loginUser = userService.wechatLogin(user);
        if (loginUser == null) {
            return Result.error("500", "服务器错误");
        }
        ArrayList<Object> data = new ArrayList<>();
        data.add(loginUser);
        return Result.success(data);
    }

    /**
     * @Author: Jason
     * @Description: 找回自己的密码（未完成，需要邮件工具类和一些逻辑）
     * @Date: 10:58 上午 2022/3/19
     * @Param: [newUser]
     * @return: team.system.lostandfoundserver.domain.Result
     **/
    @RequestMapping("/retrive")
    public Result retrive(@RequestBody HashMap<String,String> map) {
        User user = userService.retrive(map.get("email"), map.get("identifyCode"));
        ArrayList data = new ArrayList();
        data.add(user);
        if (user == null){
            return Result.error("500", "抱歉，未查询到该用户，请检查您的邮箱");
        }
        return Result.success(data);
    }

    @RequestMapping("/changepwd")
    public Result changepwd(@RequestBody HashMap<String, String> map){
        User user = userService.changepwd(map.get("email"),map.get("newPwd"));
        ArrayList data = new ArrayList();
        data.add(user);
        if (user == null){
            return Result.error("500", "抱歉，确认密码输入错误，请重新确认");
        }
        return Result.success(data);
    }

    @RequestMapping("/searchUserContact")
    public Result searchUserContact(Integer uid){
        UserContactInfo userContactInfo = userService.searchUserContactInfoByUid(uid);
        if (userContactInfo != null){
            ArrayList<Object> objects = new ArrayList<>();
            objects.add(userContactInfo);
            return Result.success(objects);
        }else{
            return Result.error("500","服务器出错了");
        }
    }
}

