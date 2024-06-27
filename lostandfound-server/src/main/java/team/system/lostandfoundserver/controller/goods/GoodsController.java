package team.system.lostandfoundserver.controller.goods;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import team.system.lostandfoundserver.domain.Goods;
import team.system.lostandfoundserver.domain.Result;
import team.system.lostandfoundserver.service.FindGoodsService;
import team.system.lostandfoundserver.service.LostGoodsService;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/generalgoods")
public class GoodsController {
  @Autowired
  FindGoodsService findGoodsService;

  @Autowired
  LostGoodsService lostGoodsService;

  @RequestMapping("changestate")
  @ResponseBody
  public Result changeState(Boolean flag, Integer id) {
    if (flag) {
      findGoodsService.changeState(id);
    } else {
      lostGoodsService.changeState(id);
    }
    return Result.success(null);
  }

  @RequestMapping("countGoods")
  @ResponseBody
  public Integer countGoods(Boolean flag) {
    if (flag) {
      return findGoodsService.countGoods();
    } else {
      return lostGoodsService.countGoods();
    }
  }

  @RequestMapping("findGoodsByPage")
  @ResponseBody
  public List<Goods> findGoodsByPage(Integer currentPage, Integer pageSize, Boolean flag) {
    if (currentPage > 0) {
      currentPage--;
    }
    int currentDataIndex = currentPage * pageSize;
    if (flag) {
      return findGoodsService.findByLimit(currentDataIndex, pageSize);
    } else {
      return lostGoodsService.findByLimit(currentDataIndex, pageSize);
    }
  }

  @RequestMapping("/deleteall")
  @ResponseBody
  public Boolean deleteAll(Boolean flag, Integer uid) {
    if (!flag) {
      return findGoodsService.deleteGoodsByUser(uid);
    } else {
      return lostGoodsService.deleteGoodsByUser(uid);
    }
  }

  @RequestMapping("/deletebyid")
  @ResponseBody
  public Boolean deleteById(Boolean flag, Integer id) {
    if (!flag) {
      return findGoodsService.deleteGoods(id);
    } else {
      return lostGoodsService.deleteGoods(id);
    }
  }

  @RequestMapping("/searchPersonCharcter")
  public List searchPersonCharcter(Integer uid) {
//        List list = lostGoodsService.searchPersonCharcter(uid);
//        list.addAll(findGoodsService.searchPersonCharcter(uid));
//        return list;
    return new ArrayList();
  }
}
