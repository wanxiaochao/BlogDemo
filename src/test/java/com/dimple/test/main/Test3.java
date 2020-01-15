package com.dimple.test.main;

import com.dimple.framework.aspectj.lang.annotation.Excel;
import com.dimple.project.system.user.domain.User;
import com.sun.org.apache.bcel.internal.generic.NEW;
import org.apache.commons.beanutils.BeanUtils;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Test3 {

    public static void main(String[] args) throws InvocationTargetException, IllegalAccessException {
        User user = new User();
        user.setUserId(1L);
        user.setLoginName("zhangs");
        user.setUserName("uname");
        PPPP pppp = new PPPP();
        BeanUtils.copyProperties(user,pppp);
        PPPP pppp1 = new PPPP();
        org.springframework.beans.BeanUtils.copyProperties(user,pppp1);

        System.out.println(111);
    }

    static class PPPP implements Serializable {

        private Long userId;
        private String loginName;
        private String userName;

        public Long getUserId() {
            return userId;
        }

        public void setUserId(Long userId) {
            this.userId = userId;
        }

        public String getLoginName() {
            return loginName;
        }

        public void setLoginName(String loginName) {
            this.loginName = loginName;
        }

        public String getUserName() {
            return userName;
        }

        public void setUserName(String userName) {
            this.userName = userName;
        }
    }

}


