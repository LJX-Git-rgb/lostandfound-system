package team.system.lostandfoundserver.controller.goods;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import team.system.lostandfoundserver.domain.Result;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

/**
 * @ClassName: FindGoods
 * @Description:
 * @Author: Jason
 * @Date: 2022/3/24 8:45 下午
 * @Version: 1.0
 */

@RequestMapping("/finds")
@Controller
public class FindGoodsController {
  public Result findLimitNew(){
    return null;
  }

  @RequestMapping("/add")
  public Result addFindGood(HttpServletRequest request) throws IOException {
    List<MultipartFile> files = ((MultipartHttpServletRequest) request).getFiles("file") ;

    BufferedOutputStream stream = null;
    for (MultipartFile file: files) {
      if (!file.isEmpty()) {
        byte[] bytes = file.getBytes();
        String uploadPath = "/image/" + file.getOriginalFilename();
        stream = new BufferedOutputStream(new FileOutputStream(new File(uploadPath)));
        stream.write(bytes);
        stream.close();
      }
    }
    return null;
  }
}
