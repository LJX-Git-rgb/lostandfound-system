package team.system.lostandfoundserver.controller.goods;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import team.system.lostandfoundserver.domain.FindGoods;
import team.system.lostandfoundserver.domain.Result;
import team.system.lostandfoundserver.service.FindGoodsService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @ClassName: FindGoods
 * @Description:
 * @Author: Jason
 * @Date: 2022/3/24 8:45 下午
 * @Version: 1.0
 */

@RestController
@RequestMapping("/finds")
public class FindGoodsController {

  @Autowired
  FindGoodsService service;

  public Result findLimitNew(){
    return null;
  }

  @RequestMapping("/addImg")
  public Result addFindGoodImgs(HttpServletRequest request) throws IOException {
    List<MultipartFile> files = ((MultipartHttpServletRequest) request).getFiles("file") ;
    ArrayList<Object> pathList = new ArrayList<>();
    BufferedOutputStream stream = null;
    for (MultipartFile file: files) {
      if (!file.isEmpty()) {
        byte[] bytes = file.getBytes();
        String[] split = file.getOriginalFilename().split("\\.");
        String fileName = UUID.randomUUID() + "." + split[split.length - 1];
        String uploadPath = "./image/foundgoods/" + fileName;
        stream = new BufferedOutputStream(new FileOutputStream(new File(uploadPath)));
        stream.write(bytes);
        stream.close();

        pathList.add("/foundgoods/" + fileName);
      }
    }
    return Result.success(pathList);
  }
  @RequestMapping("/add")
  public Result addFindGood(@RequestBody  FindGoods goods) throws IOException {
    goods.setCreateTime(new Date());
    goods.setState(0);

    if (service.addGoods(goods)){
      return Result.success(null);
    }
    return Result.error("500","发布失败，服务器错误");
  }
}
