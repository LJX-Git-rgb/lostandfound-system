package team.system.lostandfoundserver.controller.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import team.system.lostandfoundserver.domain.Admin;
import team.system.lostandfoundserver.domain.Result;
import team.system.lostandfoundserver.service.impl.UserServiceImpl;

import java.util.ArrayList;
import java.util.HashMap;

@RestController
@RequestMapping("/adminUser")
public class AdminController {

    @Autowired
    private UserServiceImpl userService;

    @PostMapping("/login")
    public Result adminlogin(@RequestBody HashMap<String,String> map){
        Admin admin = userService.adminlogin(map.get("name"),map.get("pwd"));
        ArrayList<Object> data = new ArrayList<>();
        data.add(admin);
        return Result.success(data);
    }

}

