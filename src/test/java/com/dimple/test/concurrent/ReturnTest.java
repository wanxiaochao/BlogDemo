package com.dimple.test.concurrent;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class ReturnTest {

    /**
     * 缓存击穿  达到只有一个线程去db取数据
     * @param args
     * @throws InterruptedException
     */
    public static void main(String[] args) throws InterruptedException {

        ExecutorService service = Executors.newFixedThreadPool(10);

        for (int i = 0; i < 3; i++) {
            service.execute(new Runnable() {
                @Override
                public void run() {
                    try {
                        getData04();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            });
        }

    }


    static Lock reenLock = new ReentrantLock();
    static List<String>data = new ArrayList<>();

    public static List<String> getData04() throws InterruptedException {
        List<String> result = new ArrayList<String>();
        // 从缓存读取数据
        result = getDataFromCache();
        if (result.isEmpty()) {
            if (reenLock.tryLock()) {
                try {
                    System.out.println("拿到锁了,从DB获取数据库后写入缓存");
                    // 从数据库查询数据
                    result = getDataFromDB();
                    // 将查询到的数据写入缓存
                    setDataToCache(result);
                } finally {
                    reenLock.unlock();// 释放锁
                }

            } else {
                result = getDataFromCache();// 先查一下缓存
                if (result.isEmpty()) {
                    System.out.println("没拿到锁,缓存也没数据,先小憩一下");
                    Thread.sleep(100);// 小憩一会儿
                    return getData04();// 重试
                }
            }
        }
        return result;
    }

    public static List<String> getDataFromCache(){
        return data;
    }

    public static List<String> getDataFromDB(){
        data.add("1");
        return data;
    }

    public static void setDataToCache(List<String>data){
        data.add("2");
    }
}
