package com.dimple.test.main;

import com.dimple.project.blog.blog.domain.Blog;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

public class Test1 {

    public static void main(String[] args) {

        System.out.println(3 | 9);
        List<String> list = new ArrayList<>();
        list.add("1");
        list.add("2");
        list.add("3");

        int i1 = list.indexOf("1");
        System.out.println(i1);

        int i = 1;
        do {
            //System.out.printf("do while(%s)",i);
            i++;
        } while (i < 100);


        /**
         * << : 左移运算符，num << 1 数据未溢出时，相当于num乘以2
         * >> : 右移运算符，num >> 1 数据未溢出时，相当于num除以2
         */
        System.out.println("左移：" + (2 << 6));
        System.out.println(6 * 36);
        System.out.println("右移：" + (2 >> 3));
        String s = "";
        s.hashCode();
        List<Object> objects = new LinkedList<Object>(Collections.singleton(10));
        Map<String, String> map = new Hashtable<>();
        map.put("k1", "v1");
        map.put("k2", "k2");
        Blog blog = new Blog();
        blog.setBlogId(1);

        Map<Blog, String> hmap = new HashMap<>();
        hmap.put(blog, "v1");
        hmap.put(blog, "v2");
        String s1 = hmap.get(blog);
        hmap.remove(blog);

        ConcurrentHashMap concurrentHashMap = new ConcurrentHashMap();
        Object q = concurrentHashMap.get("q");

    }

}
