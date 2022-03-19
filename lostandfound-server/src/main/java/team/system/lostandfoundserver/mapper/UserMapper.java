package team.system.lostandfoundserver.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import team.system.lostandfoundserver.domain.User;

import java.util.List;

/**
 * @ClassName: UserDao
 * @Description:
 * @Author: Jason
 * @Date: 2022/2/14 4:23 下午
 * @Version: 1.0
 */


@Mapper
public interface UserMapper {

    @Insert("insert into user_base (uid,user_name,password)  values(#{uid},#{userName},#{password}) ")
    boolean addUser(User user);

    @Select("select * from user_base")
    List<User> findAll();

    @Select("select * from user_base limit #{currentIndex},#{endIndex}")
    List<User> findByPage(Integer currentIndex,Integer endIndex);

    @Update("update user_base set username = #{userName},password = #{password},age = #{age},address = #{address},sex = #{sex},tag = #{tag}, where id = #{id}")
    Boolean update(User user);

    @Delete("delete from user_base where id = #{id}")
    Boolean delete(Integer id);

    @Select("select * from user_base where user_name = #{userName}")
    User findByUserName(String userName);

    @Select("select count(*) from user_base")
    Integer countUser();
}
