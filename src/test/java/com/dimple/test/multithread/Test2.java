package com.dimple.test.multithread;

import lombok.SneakyThrows;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.concurrent.*;

public class Test2 implements Runnable {

    @SneakyThrows
    @Override
    public void run() {
        while (true){
            Thread.sleep(1000);
            String s = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
            System.out.println(s);
        }
    }

    public static void main(String[] args) {
        ExecutorService executorService = Executors.newFixedThreadPool(2);
        executorService.submit(new Runnable() {
            @SneakyThrows
            @Override
            public void run() {
                while (true){
                    Thread.sleep(1000);
                    String s = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
                    System.out.println(s);
                }
            }
        });
    }
}
