package com.dimple.test.concurrent;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
/*CountDownLatch 的构造函数接收一个int 类型的参数作为计数器，如果你想等待N个点完成，这里就传入N。
        当我们调用 CountDownLatch 的 countDown 方法时，N 就会 -1，CountDownLatch 的 await 方法会阻塞当前线程，直到 N 变成零。
        由于 countDown 方法可以用在任何地方，所以这里说的 N 个点，可以是 N个线程，也可以是 1个线程里的N个执行步骤。
        用在多个线程时，只需要把这个 CountDownLatch 的引用传递到线程里即可。
        如果有某个解析 sheet 的线程处理得比较慢，我们不可能让主线程一直等待，所以可以使用另外一个带指定时间的 await 方法—— await(long time，TimeUnit unit)，这个方法等待特定时间后，就会不再阻塞当前线程。
        join 也有类似的方法*/

public class CountDownLatchTest {
    private static CountDownLatch c = new CountDownLatch(3);

    public static void main(String[] args) {
        new Thread(new Runnable() {
            @Override
            public void run() {
                System.out.println(1 + " -- " + System.currentTimeMillis());
                c.countDown();
                System.out.println(2 + " -- " + System.currentTimeMillis());
                c.countDown();
                try {
                    Thread.sleep(1000);
                    System.out.println(4 + " -- " + System.currentTimeMillis());
                    c.countDown();
                    Thread.sleep(1000);
                    System.out.println(5 + " -- " + System.currentTimeMillis());
                    c.countDown();
                    System.out.println(6 + " -- " + System.currentTimeMillis());
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }).start();
        try {
            c.await();
            System.out.println("3" + " -- " + System.currentTimeMillis());
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

    }


}
