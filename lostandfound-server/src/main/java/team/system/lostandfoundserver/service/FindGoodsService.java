package team.system.lostandfoundserver.service;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.system.lostandfoundserver.domain.FindGoods;
import team.system.lostandfoundserver.mapper.FindGoodsMapper;
import team.system.lostandfoundserver.service.impl.FindGoodsServiceImpl;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class FindGoodsService implements FindGoodsServiceImpl {

    @Autowired
    FindGoodsMapper mapper;

    @Override
    public boolean addGoods(FindGoods goods) {
        boolean b = mapper.addFoundGoods(goods);
        return b;
    }

    @Override
    public List<FindGoods> findByLimit(Integer begin, Integer end) {
        return mapper.findByLimit(begin,end);
    }

    @Override public List<FindGoods> limitByTimeAndType(String foundTimeRange,
        String tag) {
        if (foundTimeRange.length() == 2) {
            if (tag == "") {
                return null;
            }else{
                return mapper.limitType(tag);
            }
        }else {
            List<String> parse = (List<String>) JSON.parse(foundTimeRange);
            Date beginTime = null, endTime = null;
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS Z");
            try {
                beginTime = format.parse(parse.get(0).replace("Z", " UTC"));
                endTime = format.parse(parse.get(1).replace("Z", " UTC"));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            if (tag == "") {
                return mapper.limitTime(beginTime, endTime);
            }else{
                return mapper.limitTimeAndType(beginTime,endTime,tag);
            }
        }
    }

    @Override
    public List<FindGoods> findByUser(Integer uid) {
        return mapper.findByUser(uid);
    }

    @Override
    public List<FindGoods> searchText(String text) {
        return mapper.searchByText(text);
    }

    @Override
    public FindGoods findById(Integer id) {
        return mapper.findById(id);
    }

    @Override
    public Integer countGoods() {
        return mapper.countGoods();
    }

    @Override
    public Boolean deleteGoods(Integer id) {
        return mapper.deleteGoods(id);
    }

    @Override
    public Boolean changeState(Integer id) {
        return mapper.changeState(id);
    }

    @Override
    public Boolean deleteGoodsByUser(Integer uid) {
        return mapper.deleteGoodsByUser(uid);
    }
}
