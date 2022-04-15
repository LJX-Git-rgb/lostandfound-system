package team.system.lostandfoundserver.service.impl;

import org.springframework.stereotype.Repository;
import team.system.lostandfoundserver.domain.FindGoods;

import java.util.List;

@Repository
public interface FindGoodsServiceImpl {
    boolean addGoods(FindGoods goods);

    List<FindGoods> findByLimit(Integer begin,Integer end);

    List<FindGoods> limitByTimeAndType(String foundTimeRange, String tag);

    List<FindGoods> findByUser(Integer uid);
}
