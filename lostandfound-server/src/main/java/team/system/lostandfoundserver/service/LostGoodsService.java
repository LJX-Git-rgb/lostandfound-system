package team.system.lostandfoundserver.service;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.system.lostandfoundserver.domain.LostGoods;
import team.system.lostandfoundserver.mapper.LostGoodsMapper;
import team.system.lostandfoundserver.service.impl.LostGoodsServiceImpl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class LostGoodsService implements LostGoodsServiceImpl {

    @Autowired
    LostGoodsMapper mapper;

    @Override
    public boolean addGoods(LostGoods goods) {
        boolean b = mapper.addlostGoods(goods);
        return b;
    }

    @Override
    public List<LostGoods> findByLimit(Integer begin, Integer end) {
        return mapper.findByLimit(begin,end);
    }

    @Override
    public List<LostGoods> limitByTimeAndType(String LostTimeRange, String tag) {
        if (LostTimeRange.length() == 2) {
            if (tag == "") {
                return null;
            }else{
                return mapper.limitType(tag);
            }
        }else {
            List<String> parse = (List<String>) JSON.parse(LostTimeRange);
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
    public List<LostGoods> findByUser(Integer uid) {
        return mapper.findByUser(uid);
    }
}
