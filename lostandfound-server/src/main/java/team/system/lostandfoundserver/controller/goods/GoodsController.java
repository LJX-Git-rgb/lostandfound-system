package team.system.lostandfoundserver.controller.goods;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import team.system.lostandfoundserver.domain.FindGoods;
import team.system.lostandfoundserver.domain.LostGoods;
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
            Integer integer = findGoodsService.countGoods();
            return integer;
        } else {
            Integer integer = lostGoodsService.countGoods();
            return integer;
        }
    }

    @RequestMapping("findGoodsByPage")
    @ResponseBody
    public List findGoodsByPage(Integer currentPage, Integer pageSize, Boolean flag) {
        if (currentPage > 0) {
            currentPage--;
        }
        int currentDataIndex = currentPage * pageSize;
        if (flag) {
            List<FindGoods> byLimit = findGoodsService.findByLimit(currentDataIndex, pageSize);
            return byLimit;
        } else {
            List<LostGoods> byLimit = lostGoodsService.findByLimit(currentDataIndex, pageSize);
            return byLimit;
        }
    }

    @RequestMapping("/deleteall")
    @ResponseBody
    public Boolean deleteAll(Boolean flag,Integer uid){
        if (!flag){
            return findGoodsService.deleteGoodsByUser(uid);
        }else{
            return lostGoodsService.deleteGoodsByUser(uid);
        }
    }

    @RequestMapping("/deletebyid")
    @ResponseBody
    public Boolean deleteById(Boolean flag,Integer id){
        if (!flag){
            return findGoodsService.deleteGoods(id);
        }else{
            return lostGoodsService.deleteGoods(id);
        }
    }

    @RequestMapping("/searchPersonCharcter")
    public List searchPersonCharcter(Integer uid){
//        List list = lostGoodsService.searchPersonCharcter(uid);
//        list.addAll(findGoodsService.searchPersonCharcter(uid));
//        return list;
        return new ArrayList();
    }
}
