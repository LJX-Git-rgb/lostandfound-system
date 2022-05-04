package team.system.lostandfoundserver.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import team.system.lostandfoundserver.domain.FindGoods;
import team.system.lostandfoundserver.domain.LostGoods;

import java.util.Date;
import java.util.List;

@Mapper
public interface LostGoodsMapper {

    @Insert("insert into lost_goods (image,description,title,state,tag,create_time,lost_area,lost_time,uid) values(#{image},#{description},#{title},#{state},#{tag},#{createTime},#{lostArea},#{lostTime},#{uid}) ")
    boolean addlostGoods(LostGoods goods);

    @Select("select * from lost_goods where state=0 order by create_Time desc  limit #{begin},#{end}")
    List<LostGoods> findByLimit(Integer begin, Integer end);

    @Select("select * from lost_goods where state=0 and create_time between #{beginTime} and #{endTime}")
    List<LostGoods> limitTime(Date beginTime, Date endTime);
    @Select("select * from lost_goods where state=0 and tag=#{tag}")
    List<LostGoods> limitType(String tag);
    @Select("select * from lost_goods where state=0 and (create_time between #{beginTime} and #{endTime}) and tag=#{tag}")
    List<LostGoods> limitTimeAndType(Date beginTime, Date endTime, String tag);

    @Select("select * from lost_goods where uid = #{uid}")
    List<LostGoods> findByUser(Integer uid);

    @Select("select * from lost_goods where state=0 and " +
            "title like CONCAT('%',#{text},'%') or description like CONCAT('%',#{text},'%') or tag like CONCAT('%',#{text},'%') or lost_area like CONCAT('%',#{text},'%')")
    List<LostGoods> searchByText(String text);

    @Select("select * from lost_goods where id = #{id}")
    LostGoods findById(Integer id);

    @Select("select count(*) from lost_goods")
    Integer countGoods();

    @Delete("delete from lost_goods where id = #{id}")
    Boolean deleteGoods(Integer id);

    @Update("update lost_goods set state=1 where id=#{id}")
    Boolean changeState(Integer id);

    @Delete("delete from found_goods where uid = #{uid}")
    Boolean deleteGoodsByUser(Integer uid);
}
