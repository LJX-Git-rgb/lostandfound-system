package team.system.lostandfoundserver.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import team.system.lostandfoundserver.domain.FindGoods;
import team.system.lostandfoundserver.mapper.FindGoodsMapper;

@Repository
public interface FindGoodsServiceImpl {
    boolean addGoods(FindGoods goods);
}
