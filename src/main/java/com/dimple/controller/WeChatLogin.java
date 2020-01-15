package com.dimple.controller;

import cn.zhouyafeng.itchat4j.controller.LoginController;
import org.springframework.stereotype.Controller;

@Controller
public class WeChatLogin extends LoginController {

    @Override
    public void login(String qrPath) {
        super.login(qrPath);
    }




}
