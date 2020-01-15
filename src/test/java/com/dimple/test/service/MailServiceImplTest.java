package com.dimple.test.service;

import com.dimple.DimpleBlogApplication;
import com.dimple.framework.shiro.service.PasswordService;
import com.dimple.project.common.service.impl.MailServiceImpl;
import com.dimple.project.system.user.domain.User;
import com.dimple.project.system.user.mapper.UserMapper;
import com.dimple.project.system.user.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * @className: MailServiceTest
 * @description:
 * @auther: Dimple
 * @date: 07/18/19
 * @version: 1.0
 */
@SpringBootTest(classes = DimpleBlogApplication.class)
@RunWith(SpringJUnit4ClassRunner.class)
public class MailServiceImplTest {
    @Autowired
    MailServiceImpl mailServiceImpl;

    @Autowired
    UserMapper userMapper;
    @Autowired
    PasswordService passwordService;


    @Test
    public void testSendSimpleMail() {
        String to = "bianxiaofeng_cdu@163.com";
        String subject = "Test";
        String content = "test";
        mailServiceImpl.sendSimpleMail(to, subject, content);
    }

    @Test
    public void testReplyEmail() {
        mailServiceImpl.sendReplyEmail("bianxiaofeng@sohu.com", 15, "原始内容", "", "http://www.bianxiaofeng.com");
    }
    @Test
    public void testUser(){
        List<User> users = userMapper.selectAll();
        users.forEach(user->{
            user.randomSalt();
            user.setPassword(passwordService.encryptPassword(user.getLoginName(), "123456", user.getSalt()));
            userMapper.updateUser(user);
        });

        System.out.println("111");

    }
}
