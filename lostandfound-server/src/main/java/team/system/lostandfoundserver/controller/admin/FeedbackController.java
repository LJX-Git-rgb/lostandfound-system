package team.system.lostandfoundserver.controller.admin;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.web.bind.annotation.*;
import team.system.lostandfoundserver.domain.Feedback;
import team.system.lostandfoundserver.domain.Result;
import team.system.lostandfoundserver.mapper.FeedbackMapper;

import javax.annotation.Resource;
import java.util.UUID;

@RestController
@RequestMapping("/feedback")
public class FeedbackController {
    @Resource
    FeedbackMapper feedbackMapper;

//    新增
    @RequestMapping("/report")
    public Result report(Boolean isLost,String content,Integer id,Integer uid){
        Feedback feedback = new Feedback();
        if(isLost){
            feedback.setLid(id);
        }else{
            feedback.setFid((id));
        }
        feedback.setContent(content);
        feedback.setUid(uid);
        feedback.setState(0);
        int insert = feedbackMapper.insert(feedback);
        if (insert >= 1) {
            return Result.success(null);
        }else{
            return Result.error("500","服务器错误");
        }
    }

    //    更新
    @RequestMapping("/update")
    public Result update(@RequestBody Feedback feedback){
        feedbackMapper.updateById(feedback);
        return Result.success(null);
    }

    //    删除
    @DeleteMapping("/{id}")
    public Result update(@PathVariable long id){
        feedbackMapper.deleteById(id);
        return Result.success(null);
    }

    //分页查询，用后台写好的MybatisPlusConfig分页插件
    @GetMapping
    public Page<Feedback> findPage(@RequestParam(defaultValue = "1") Integer pageNum,
                                 @RequestParam(defaultValue = "10") Integer pageSize,
                                 @RequestParam(defaultValue = "") String search) {
        LambdaQueryWrapper<Feedback> Wrapper = Wrappers.<Feedback>lambdaQuery();
        if (StrUtil.isNotBlank(search)) {
            Wrapper.like(Feedback::getId, search);
        }
        return feedbackMapper.selectPage(new Page<>(pageNum,pageSize),Wrapper);
    }
}
