package team.system.lostandfoundserver.service.impl;

import org.springframework.stereotype.Repository;
import team.system.lostandfoundserver.domain.LostGoods;

import java.util.List;

@Repository
public interface LostGoodsServiceImpl {

    boolean addGoods(LostGoods goods);

    List<LostGoods> findByLimit(Integer begin, Integer end);

    List<LostGoods> limitByTimeAndType(String foundTimeRange, String tag);

    List<LostGoods> findByUser(Integer uid);

    List<LostGoods> searchText(String text);

    LostGoods findById(Integer id);

    Integer countGoods();

    Boolean deleteGoods(Integer id);

    Boolean changeState(Integer id);
}
