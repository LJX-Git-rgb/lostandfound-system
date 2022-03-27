package team.system.lostandfoundserver.domain;

import lombok.Data;
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
    private String uid;
    private String userName;
    private String password;
    private String gender;
    private String email;
    private Integer userRole;
    private String face;
    private Integer createTime;
    private Integer updateTime;
    private String studentId;
    private String universityId;

    public User() {
    }

    public User(Integer id, String uid, String userName, String password, String gender, String email, Integer userRole, String face, Integer createTime, Integer updateTime, String studentId, String universityId) {
        this.id = id;
        this.uid = uid;
        this.userName = userName;
        this.password = password;
        this.gender = gender;
        this.email = email;
        this.userRole = userRole;
        this.face = face;
        this.createTime = createTime;
        this.updateTime = updateTime;
        this.studentId = studentId;
        this.universityId = universityId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getUserRole() {
        return userRole;
    }

    public void setUserRole(Integer userRole) {
        this.userRole = userRole;
    }

    public String getFace() {
        return face;
    }

    public void setFace(String face) {
        this.face = face;
    }

    public Integer getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Integer createTime) {
        this.createTime = createTime;
    }

    public Integer getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Integer updateTime) {
        this.updateTime = updateTime;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getUniversityId() {
        return universityId;
    }

    public void setUniversityId(String universityId) {
        this.universityId = universityId;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", uid='" + uid + '\'' +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", gender='" + gender + '\'' +
                ", email='" + email + '\'' +
                ", userRole=" + userRole +
                ", face='" + face + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", studentId='" + studentId + '\'' +
                ", universityId='" + universityId + '\'' +
                '}';
    }
}
