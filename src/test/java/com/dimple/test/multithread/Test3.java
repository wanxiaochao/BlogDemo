package com.dimple.test.multithread;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@SpringBootTest
@RunWith(SpringRunner.class)
public class Test3 {

    private volatile boolean flag = false;

    synchronized void method1() {
        try {
            while (flag == true) {
                wait();
            }
            for (int i = 0; i < 5; i++) {
                System.out.println("m1m1m1m1m1m1");
            }
            flag = true;
            notifyAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    synchronized void method2() {
        try {
            while (flag == true) {
                wait();
            }
            for (int i = 0; i < 5; i++) {
                System.out.println("m2m2m2m2m2m2");
            }
            flag = true;
            notifyAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void test111() {
        for (int i = 0; i < 5; i++) {
            Thread thread = new Thread(() -> method1());
            Thread thread1 = new Thread(() -> method2());
            thread.start();
            thread1.start();
        }
    }


}
