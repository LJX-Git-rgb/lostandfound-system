package team.system.lostandfoundserver.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import team.system.lostandfoundserver.domain.FindGoods;
import java.util.Date;
import java.util.List;

@Mapper
public interface FindGoodsMapper {

    @Insert("insert into found_goods (image,description,title,state,tag,create_time,found_area,found_time,uid) values(#{image},#{description},#{title},#{state},#{tag},#{createTime},#{foundArea},#{foundTime},#{uid}) ")
    boolean addFoundGoods(FindGoods goods);

    @Select("select * from found_goods where state=0 order by create_Time desc  limit #{begin},#{end}")
    List<FindGoods> findByLimit(Integer begin, Integer end);

    @Select("select * from found_goods where state=0 and create_time between #{beginTime} and #{endTime}")
    List<FindGoods> limitTime(Date beginTime, Date endTime);
    @Select("select * from found_goods where state=0 and tag=#{tag}")
    List<FindGoods> limitType(String tag);
    @Select("select * from found_goods where state=0 and (create_time between #{beginTime} and #{endTime}) and tag=#{tag}")
    List<FindGoods> limitTimeAndType(Date beginTime, Date endTime, String tag);

    @Select("select * from found_goods where uid = #{uid}")
    List<FindGoods> findByUser(Integer uid);

    @Select("select * from found_goods where state=0 and  " +
            "title like #{text} or description like #{text} or tag like #{text} or found_area like #{text}")
    List<FindGoods> searchByText(String text);

    @Select("select * from found_goods where id = #{id}")
    FindGoods findById(Integer id);

    @Select("select count(*) from found_goods")
    Integer countGoods();

    @Delete("delete from found_goods where id = #{id}")
    Boolean deleteGoods(Integer id);

    @Update("update found_goods set state=1 where id=#{id}")
    Boolean changeState(Integer id);

    @Delete("delete from found_goods where uid = #{uid}")
    Boolean deleteGoodsByUser(Integer uid);
}
