package team.system.lostandfoundserver.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.system.lostandfoundserver.domain.FindGoods;
import team.system.lostandfoundserver.mapper.FindGoodsMapper;
import team.system.lostandfoundserver.service.impl.FindGoodsServiceImpl;


@Service
public class FindGoodsService implements FindGoodsServiceImpl {

    @Autowired
    FindGoodsMapper mapper;

    @Override
    public boolean addGoods(FindGoods goods) {
        boolean b = mapper.addFoundGoods(goods);
        return b;
    }
}
