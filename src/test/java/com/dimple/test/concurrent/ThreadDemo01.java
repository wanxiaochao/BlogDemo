package com.dimple.test.concurrent;

import org.apache.naming.factory.BeanFactory;

import javax.swing.*;

public class ThreadDemo01 implements Runnable{

    private static int max = 100000;
    private static int count = 0;

    public static void main(String[] args) throws InterruptedException {

        ThreadDemo01 threadDemo01 = new ThreadDemo01();
        Thread t1 = new Thread(threadDemo01);
        Thread t2 = new Thread(threadDemo01);
        t1.start();
        t2.start();
        t1.join();
        t2.join();
        System.out.println(count);
    }

    @Override
    public void run() {
        for (int i = 0; i < max; i++) {
            increase();
        }
    }
    //同步方法
    /*public synchronized void increase() {
        count++;
    }*/
    //同步静态方法
    /*public synchronized static void increase() {
        count++;
    }*/
    //修饰代码块
    public static void increase() {
        synchronized(ThreadDemo01.class){
            count++;
        }

    }
}
