package team.system.lostandfoundserver.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import team.system.lostandfoundserver.domain.FindGoods;

import java.util.List;

@Mapper
public interface FindGoodsMapper {
    @Insert("insert into found_goods (image,description,title,state,tag,create_time,found_area,found_time,uid) values(#{image},#{desc},#{title},#{state},#{tag},#{createTime},#{foundArea},#{foundTime},#{uid}) ")
    boolean addFoundGoods(FindGoods goods);

    @Select("select * from found_goods limit #{begin},#{end}")
    List<FindGoods> findByLimit(Integer begin, Integer end);
}
