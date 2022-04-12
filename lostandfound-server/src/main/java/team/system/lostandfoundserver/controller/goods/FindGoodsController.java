package team.system.lostandfoundserver.controller.goods;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import team.system.lostandfoundserver.domain.Result;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @ClassName: FindGoods
 * @Description:
 * @Author: Jason
 * @Date: 2022/3/24 8:45 下午
 * @Version: 1.0
 */

@RequestMapping("/find")
@Controller
public class FindGoodsController {
  public Result findLimitNew(){
    return null;
  }

  @RequestMapping("/add")
  public Result addFindGood(HttpServletRequest request){
    System.out.println(request);
    return null;
  }
}
