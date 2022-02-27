package com.example.springboot.domain;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * @ClassName: User
 * @Description:
 * @Author: Jason
 * @Date: 2022/2/14 3:51 下午
 * @Version: 1.0
 *
 */
public class User {
    private Integer id;
    private String userName;
    private String password;
    private String address;
    private String sex;
    private Integer age;
    private String tag;

    public User() {}
    public User(String userName, String password, String address, String sex, Integer age, String tag) {
        this.userName = userName;
        this.password = password;
        this.address = address;
        this.sex = sex;
        this.age = age;
        this.tag = tag;
    }
    public User(Integer id, String userName, String password, String address, String sex, Integer age, String tag) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.address = address;
        this.sex = sex;
        this.age = age;
        this.tag = tag;
    }

    public int getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", address='" + address + '\'' +
                ", sex='" + sex + '\'' +
                ", age=" + age +
                ", tag=" + tag +
                '}';
    }
}
