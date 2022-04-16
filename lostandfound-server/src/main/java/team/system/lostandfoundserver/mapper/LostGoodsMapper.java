package team.system.lostandfoundserver.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import team.system.lostandfoundserver.domain.LostGoods;

import java.util.Date;
import java.util.List;

@Mapper
public interface LostGoodsMapper {

    @Insert("insert into lost_goods (image,description,title,state,tag,create_time,lost_area,lost_time,uid) values(#{image},#{description},#{title},#{state},#{tag},#{createTime},#{lostArea},#{lostTime},#{uid}) ")
    boolean addlostGoods(LostGoods goods);

    @Select("select * from lost_goods limit #{begin},#{end}")
    List<LostGoods> findByLimit(Integer begin, Integer end);

    @Select("select * from lost_goods where create_time between #{beginTime} and #{endTime}")
    List<LostGoods> limitTime(Date beginTime, Date endTime);
    @Select("select * from lost_goods where tag=#{tag}")
    List<LostGoods> limitType(String tag);
    @Select("select * from lost_goods where (create_time between #{beginTime} and #{endTime}) and tag=#{tag}")
    List<LostGoods> limitTimeAndType(Date beginTime, Date endTime, String tag);

    @Select("select * from lost_goods where uid = #{uid}")
    List<LostGoods> findByUser(Integer uid);
}
