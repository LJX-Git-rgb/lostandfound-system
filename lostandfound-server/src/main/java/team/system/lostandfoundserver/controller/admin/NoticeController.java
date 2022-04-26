package team.system.lostandfoundserver.controller.admin;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.web.bind.annotation.*;
import team.system.lostandfoundserver.domain.Notice;
import team.system.lostandfoundserver.domain.Result;
import team.system.lostandfoundserver.mapper.NoticeMapper;


import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/notice")
public class NoticeController {
    @Resource
    NoticeMapper noticeMapper;

    @PostMapping
//      新增
    public Result save(@RequestBody Notice notice){
        noticeMapper.insert(notice);
        return Result.success(null);
    }

    //    更新
    @PutMapping
    public Result update(@RequestBody Notice notice){
        noticeMapper.updateById(notice);
        return Result.success(null);
    }

    //    删除
    @DeleteMapping("/{id}")
    public Result update(@PathVariable long id){
        noticeMapper.deleteById(id);
        return Result.success(null);
    }

    //分页查询，用后台写好的MybatisPlusConfig分页插件
    @GetMapping
    public Page<Notice> findPage(@RequestParam(defaultValue = "1") Integer pageNum,
                                 @RequestParam(defaultValue = "10") Integer pageSize,
                                 @RequestParam(defaultValue = "") String search) {
        LambdaQueryWrapper<Notice> Wrapper = Wrappers.<Notice>lambdaQuery();
        if (StrUtil.isNotBlank(search)) {
            Wrapper.like(Notice::getId, search);
        }
//        Page<Notice> noticePage = noticeMapper.selectPage(new Page<>(pageNum, pageSize), Wrapper);
//        return noticePage;
        return noticeMapper.selectPage(new Page<>(pageNum,pageSize),Wrapper);
    }
}
