package team.system.lostandfoundserver.service;

import com.alibaba.fastjson.JSON;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.system.lostandfoundserver.domain.FindGoods;
import team.system.lostandfoundserver.mapper.FindGoodsMapper;
import team.system.lostandfoundserver.service.impl.FindGoodsServiceImpl;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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
        List<String> parse = (List<String>) JSON.parse(foundTimeRange);
        Date beginTime = null,endTime = null;
        try {
            beginTime = DateUtils
                .parseDate(parse.get(0), Locale.CHINA,"yyyy-MM-dd");
            endTime = DateUtils
                .parseDate(parse.get(1), Locale.CHINA);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        System.out.println(new Date());
        mapper.limitTimeAndType(beginTime,endTime,tag);
        return null;
    }
}
