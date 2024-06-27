package team.system.lostandfoundserver.controller.goods;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import team.system.lostandfoundserver.domain.FindGoods;
import team.system.lostandfoundserver.domain.Result;
import team.system.lostandfoundserver.service.FindGoodsService;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

@RestController
@RequestMapping("/finds")
public class FindGoodsController {
  @Autowired
  FindGoodsService service;

  @RequestMapping("/findLimit")
  public List<FindGoods> findLimit(Integer begin, Integer end) {
    return getUrlList(service.findByLimit(begin, end));
  }

  @RequestMapping("/limitByTimeAndType")
  public List<FindGoods> limitByTimeAndType(@RequestBody HashMap<String, String> map) {
    return getUrlList(service.limitByTimeAndType(map.get("foundTimeRange"), map.get("tag")));
  }

  @RequestMapping("/addImg")
  public Result addFindGoodImgs(HttpServletRequest request) throws IOException {
    List<MultipartFile> files = ((MultipartHttpServletRequest) request).getFiles("file");
    ArrayList<Object> pathList = new ArrayList<>();
    BufferedOutputStream stream;
    for (MultipartFile file : files) {
      if (!file.isEmpty()) {
        byte[] bytes = file.getBytes();
        final String originalFilename = file.getOriginalFilename();
        if (originalFilename == null) {
          return Result.error("500", "上传失败，文件名为空");
        }
        String[] split = originalFilename.split("\\.");
        String fileName = UUID.randomUUID() + "." + split[split.length - 1];
        String uploadPath = "./lostandfound-miniprogram/src/static/image/foundgoods/" + fileName;
        stream = new BufferedOutputStream(new FileOutputStream(uploadPath));
        stream.write(bytes);
        stream.close();

        pathList.add("/foundgoods/" + fileName);
      }
    }
    return Result.success(pathList);
  }

  @RequestMapping("/add")
  public Result addFindGood(@RequestBody FindGoods goods) {
    goods.setCreateTime(new Date());
    goods.setState(0);

    if (service.addGoods(goods)) {
      return Result.success(null);
    }
    return Result.error("500", "发布失败，服务器错误");
  }

  @RequestMapping("/byUser")
  public List<FindGoods> findByUser(Integer uid) {
    return getUrlList(service.findByUser(uid));
  }

  @RequestMapping("/search")
  public List<FindGoods> searchByText(String searchInput) {
    return getUrlList(service.searchText(searchInput));
  }

  @RequestMapping("/findById")
  public FindGoods findById(Integer id) {
    FindGoods byId = service.findById(id);
    byId.setImageList(byId.getImage().split("&"));
    return byId;
  }

  @RequestMapping("/delete")
  public Result delete(Integer id) {
    if (service.deleteGoods(id)) {
      return Result.success(null);
    }
    return Result.error("500", "删除不成功，可能服务器错误");
  }

  private List<FindGoods> getUrlList(List<FindGoods> goods) {
      for (FindGoods good : goods) {
          good.setImageList(good.getImage().split("&"));
      }
    return goods;
  }
}
