package com.example.springboot.domain;

/**
 * @ClassName: LoginUser
 * @Description:
 * @Author: Jason
 * @Date: 2022/2/16 7:49 下午
 * @Version: 1.0
 */
public class LoginUser {
        private String userName;
        private String password;

        public LoginUser() {
        }

        public LoginUser(String userName, String password) {
            this.userName = userName;
            this.password = password;
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
}
