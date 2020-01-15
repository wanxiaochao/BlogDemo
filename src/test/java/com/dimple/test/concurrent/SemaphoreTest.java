package com.dimple.test.concurrent;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Semaphore;
/*Semaphore（信号量）是用来控制同时访问特定资源的线程数量，它通过协调各个线程，以保证合理的使用公共资源。*/
public class SemaphoreTest {

    private static final Integer MAX_CONNECT = 20;
    private static ExecutorService executorService = Executors.newFixedThreadPool(MAX_CONNECT);
    private static Semaphore semaphore = new Semaphore(5);

    public static void main(String[] args) {

        for (int i = 0; i < MAX_CONNECT; i++) {
            executorService.execute(new MyRunnable(i));
        }
        executorService.shutdown();
    }

    static class MyRunnable implements Runnable {
        private int index;

        public MyRunnable(int index) {
            this.index = index;
        }
        @Override
        public void run() {
            try {
                semaphore.acquire();
                System.out.println("save data--:" + index);
                semaphore.release();
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
    }

}


