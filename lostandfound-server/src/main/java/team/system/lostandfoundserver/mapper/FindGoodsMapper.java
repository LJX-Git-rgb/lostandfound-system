package team.system.lostandfoundserver.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import team.system.lostandfoundserver.domain.FindGoods;
import team.system.lostandfoundserver.domain.User;

@Mapper
public interface FindGoodsMapper {
    @Insert("insert into found_goods (image,description,title,state,tag,create_time,found_area,found_time,uid) values(#{image},#{desc},#{title},#{state},#{tag},#{createTime},#{foundArea},#{foundTime},#{uid}) ")
    boolean addFoundGoods(FindGoods goods);

////    id=null,
//    title=我丢了学生卡,
//    desc=一张学生卡，
//    学号201819164431,
//    image=["/foundgoods/69334141-2f46-40b7-a0dc-c016cb773ae1.jpg"],
//    tag=["卡"],
//    state=0,
//    createTime=Thu Apr 14 10:51:17 CST 2022,
//    foundTime=Fri Apr 15 00:00:00 CST 2022,
//    foundArea=西校区,
//    uid=21
}
