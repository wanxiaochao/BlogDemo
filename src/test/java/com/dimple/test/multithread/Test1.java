package com.dimple.test.multithread;

import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.FutureTask;

public class Test1 implements Callable<String> {

    //编写一个计时器，每隔一秒钟，在控制台打印出最新时间。


    @Override
    public String call() throws Exception {
        String s = "";
        while (true){
            Thread.sleep(1000);
            s = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
            System.out.println(s);
        }
    }

    public static void main(String[] args) {
        FutureTask<String> integerFutureTask = new FutureTask<>(new Test1());
        new Thread(integerFutureTask).start();
        try {
            String integer = integerFutureTask.get();
            System.out.println(integer);
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
    }
}
