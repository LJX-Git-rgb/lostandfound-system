package team.system.lostandfoundserver.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import team.system.lostandfoundserver.domain.User;
import team.system.lostandfoundserver.domain.Admin;

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

    @Insert("insert into user_base (uid,email,password,create_time)  values(#{uid},#{email},#{password},#{createTime}) ")
    boolean addUser(User user);

    @Select("select * from user_base")
    List<User> findAll();

    @Select("select * from user_base limit #{currentIndex},#{endIndex}")
    List<User> findByPage(Integer currentIndex,Integer endIndex);

    @Update("update user_base set email = #{email},password = #{password},gender=#{gender},user_role = #{userRole},face = #{face},update_time = #{updateTime} where id = #{id}")
    Boolean update(User user);

    @Delete("delete from user_base where id = #{id}")
    Boolean delete(Integer id);

    @Select("select * from user_base where email = #{email}")
    User findUserByEmail(String email);

    @Select("select * from admin_user where name = #{name} and pwd =#{pwd}")
    Admin adminlogin(String name, String pwd);

    @Select("select count(*) from user_base")
    Integer countUser();
}
