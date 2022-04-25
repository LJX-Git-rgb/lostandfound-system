package team.system.lostandfoundserver.controller.admin;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import team.system.lostandfoundserver.domain.Admin;
import team.system.lostandfoundserver.common.Result;
import team.system.lostandfoundserver.mapper.AdminMapper;
import team.system.lostandfoundserver.service.impl.UserServiceImpl;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;

@RestController
@RequestMapping("/adminUser")
public class AdminController {

    @Resource
    AdminMapper adminMapper;

    @Autowired
    private UserServiceImpl userService;

    @PostMapping("/login")
    public Result adminlogin(@RequestBody HashMap<String,String> map){
        Admin admin = userService.adminlogin(map.get("name"),map.get("pwd"));
        ArrayList<Object> data = new ArrayList<>();
        data.add(admin);
        return Result.success(data);
    }

    @PostMapping
//      新增
    public Result<?> save(@RequestBody Admin admin){
        adminMapper.insert(admin);
        return Result.success();
    }

//    更新
    @PutMapping
    public Result<?> update(@RequestBody Admin admin){
        adminMapper.updateById(admin);
        return Result.success();
    }

//    删除
    @DeleteMapping("/{id}")
    public Result<?> update(@PathVariable long id){
        adminMapper.deleteById(id);
        return Result.success();
    }

    //分页查询，用后台写好的MybatisPlusConfig分页插件
    @GetMapping
    public Result<?> findPage(@RequestParam(defaultValue = "1") Integer pageNum,
                              @RequestParam(defaultValue = "10") Integer pageSize,
                              @RequestParam(defaultValue = "") String search){
        LambdaQueryWrapper<Admin> Wrapper = Wrappers.<Admin> lambdaQuery();
        if(StrUtil.isNotBlank(search)){
            Wrapper.like(Admin::getId,search);
        }
        Page<Admin> adminPage = adminMapper.selectPage(new Page<>(pageNum,pageSize),Wrapper);
        return Result.success(adminPage);
    }

}

