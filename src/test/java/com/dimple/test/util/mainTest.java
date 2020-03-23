package com.dimple.test.util;

import com.alibaba.fastjson.JSON;
import com.dimple.test.util.ceshi.AnswerTree;
import com.dimple.test.util.ceshi.WpAnswerQuestion;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.util.*;

public class mainTest {

    public static  List<Menu> menuList = new ArrayList<Menu>();
    public static  List<WpAnswerQuestion> answerQuestions = new ArrayList<WpAnswerQuestion>();

    public static void main(String[] args) {

        Set<String> strings = null;
        List<String> a = new ArrayList<>(strings);
        System.out.println(a);
        /*插入一些数据*/
/*        menuList.add(new Menu("GN001D000", "0", "系统管理", "/admin", "Y"));
        menuList.add(new Menu("GN001D100", "GN001D000", "权限管理", "/admin", "Y"));
        menuList.add(new Menu("GN001D110", "GN001D100", "密码修改", "/admin", "Y"));
        menuList.add(new Menu("GN001D120", "GN001D100", "新加用户", "/admin", "Y"));
        menuList.add(new Menu("GN001D200", "GN001D000", "系统监控", "/admin", "Y"));
        menuList.add(new Menu("GN001D210", "GN001D200", "在线用户", "/admin", "Y"));
        menuList.add(new Menu("GN002D000", "0", "订阅区", "/admin", "Y"));
        menuList.add(new Menu("GN003D000", "0", "未知领域", "/admin", "Y"));*/

        answerQuestions.add(new WpAnswerQuestion("一","questionId","0","不大的"));
        answerQuestions.add(new WpAnswerQuestion("二","questionId","一","大苏打"));
        answerQuestions.add(new WpAnswerQuestion("三","questionId","二","来回路上的房间"));
        answerQuestions.add(new WpAnswerQuestion("四","questionId","三","爱上邓丽君ask的"));
        answerQuestions.add(new WpAnswerQuestion("五","questionId","0","陆军空军"));

        /*让我们创建树*/
//        MenuTree menuTree = new MenuTree(menuList);
//        menuList = menuTree.builTree();
//        /*转为json看看效果*/
//        String jsonOutput = JSON.toJSONString(menuList);
//        System.out.println(jsonOutput);

        AnswerTree answerTree = new AnswerTree(answerQuestions);
        answerQuestions = answerTree.buildTree();
        System.out.println(answerTree);


    }


}
