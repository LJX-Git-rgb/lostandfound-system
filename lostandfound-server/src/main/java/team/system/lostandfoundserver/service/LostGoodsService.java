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
import java.util.Objects;

@Service
public class LostGoodsService implements LostGoodsServiceImpl {

  @Autowired
  LostGoodsMapper mapper;

  @Override
  public boolean addGoods(LostGoods goods) {
    return mapper.addlostGoods(goods);
  }

  @Override
  public List<LostGoods> findByLimit(Integer begin, Integer end) {
    return mapper.findByLimit(begin, end);
  }

  @Override
  public List<LostGoods> limitByTimeAndType(String LostTimeRange, String tag) {
    if (LostTimeRange.length() == 2) {
      if (Objects.equals(tag, "")) {
        return null;
      } else {
        return mapper.limitType(tag);
      }
    } else {
      List<String> parse = (List<String>) JSON.parse(LostTimeRange);
      Date beginTime = null, endTime = null;
      SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS Z");
      try {
        beginTime = format.parse(parse.get(0).replace("Z", " UTC"));
        endTime = format.parse(parse.get(1).replace("Z", " UTC"));
      } catch (ParseException e) {
        e.printStackTrace();
      }
      if (Objects.equals(tag, "")) {
        return mapper.limitTime(beginTime, endTime);
      } else {
        return mapper.limitTimeAndType(beginTime, endTime, tag);
      }
    }
  }

  @Override
  public List<LostGoods> findByUser(Integer uid) {
    return mapper.findByUser(uid);
  }

  @Override
  public List<LostGoods> searchText(String text) {
    return mapper.searchByText(text);
  }

  @Override
  public LostGoods findById(Integer id) {
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
