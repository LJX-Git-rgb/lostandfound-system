package com.example.springboot.mapper;

import com.example.springboot.domain.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

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

    @Insert("insert into user (username,password,age,address,sex,tag)  values(#{userName},#{password},#{age},#{address},#{sex},#{tag}) ")
    boolean addUser(User user);

    @Select("select * from user")
    List<User> findAll();

    @Select("select * from user limit #{currentIndex},#{endIndex}")
    List<User> findByPage(Integer currentIndex,Integer endIndex);

    @Update("update user set username = #{userName},password = #{password},age = #{age},address = #{address},sex = #{sex},tag = #{tag}, where id = #{id}")
    Boolean update(User user);

    @Delete("delete from user where id = #{id}")
    Boolean delete(Integer id);

    @Select("select * from user where userName = #{userName}")
    User findByUserName(String userName);

    @Select("select count(*) from user")
    Integer countUser();
}
