package team.system.lostandfoundserver.controller.user;


import org.springframework.web.bind.annotation.*;
import team.system.lostandfoundserver.domain.Approve;
import team.system.lostandfoundserver.domain.Result;
import team.system.lostandfoundserver.mapper.ApproveMapper;

import javax.annotation.Resource;

@RestController
@RequestMapping("/approve")
public class ApproveController {

    @Resource
    ApproveMapper approveMapper;

    @PostMapping
//      新增
    public Result save(@RequestBody Approve approve){
        approveMapper.insert(approve);
        return Result.success(null);
    }
}

