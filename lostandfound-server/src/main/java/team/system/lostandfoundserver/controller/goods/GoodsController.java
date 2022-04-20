package team.system.lostandfoundserver.controller.goods;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import team.system.lostandfoundserver.service.FindGoodsService;
import team.system.lostandfoundserver.service.LostGoodsService;

@Controller
@RequestMapping("/goods")
public class GoodsController {

    @Autowired
    FindGoodsService findGoodsService;

    @Autowired
    LostGoodsService lostGoodsService;

    @RequestMapping("changestate")
    public boolean changeState(){
        return true;
    }
}
