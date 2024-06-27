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
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/notice")
public class NoticeController {
  @Resource
  NoticeMapper noticeMapper;

  @PostMapping
  public Result save(@RequestBody Notice notice) {
    noticeMapper.insert(notice);
    return Result.success(null);
  }

  @PutMapping
  public Result update(@RequestBody Notice notice) {
    noticeMapper.updateById(notice);
    return Result.success(null);
  }

  @DeleteMapping("/{id}")
  public Result update(@PathVariable long id) {
    noticeMapper.deleteById(id);
    return Result.success(null);
  }

  @RequestMapping("/search")
  public Result search(Integer id) {
    Notice notice = noticeMapper.searchById(id);
    List<Notice> list = new ArrayList<>();
    list.add(notice);
    return Result.success(list);
  }

  @GetMapping
  public Page<Notice> findPage(@RequestParam(defaultValue = "1") Integer pageNum, @RequestParam(defaultValue = "10") Integer pageSize, @RequestParam(defaultValue = "") String search) {
    LambdaQueryWrapper<Notice> Wrapper = Wrappers.<Notice>lambdaQuery();
    if (StrUtil.isNotBlank(search)) {
      Wrapper.like(Notice::getId, search);
    }
    return noticeMapper.selectPage(new Page<>(pageNum, pageSize), Wrapper);
  }
}
