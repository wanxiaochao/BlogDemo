package com.dimple.test.concurrent;

import java.util.concurrent.BrokenBarrierException;
import java.util.concurrent.CyclicBarrier;

/**
 * Description: TODO
 * 字面意思回环栅栏，通过它可以实现让一组线程等待至某个状态之后再全部同时执行。叫做回环是因为当所有等待线程都被释放以后，CyclicBarrier可以被重用。我们暂且把这个状态就叫做barrier，当调用await()方法之后，线程就处于barrier了。
 * <p>
 * 　　CyclicBarrier类位于java.util.concurrent包下，CyclicBarrier提供2个构造器：
 * public CyclicBarrier(int parties, Runnable barrierAction) {
 * }
 * public CyclicBarrier(int parties) {
 * }
 * 　　参数parties指让多少个线程或者任务等待至barrier状态；参数barrierAction为当这些线程都达到barrier状态时会执行的内容。
 * 　　然后CyclicBarrier中最重要的方法就是await方法，它有2个重载版本：
 * public int await() throws InterruptedException, BrokenBarrierException { };
 * public int await(long timeout, TimeUnit unit)throws InterruptedException,BrokenBarrierException,TimeoutException { };
 * 　　第一个版本比较常用，用来挂起当前线程，直至所有线程都到达barrier状态再同时执行后续任务；
 * 　　第二个版本是让这些线程等待至一定的时间，如果还有线程没有到达barrier状态就直接让到达barrier的线程执行后续任务。
 * 　　下面举几个例子就明白了：
 * 　　假若有若干个线程都要进行写数据操作，并且只有所有线程都完成写数据操作之后，这些线程才能继续做后面的事情，此时就可以利用CyclicBarrier了：
 *
 * @return <pre>
 * </pre>
 * @since: 2020/4/18
 */
public class CyclicBarrierTests {

    public static void main(String[] args) {
        int N = 2;
        CyclicBarrier barrier  = new CyclicBarrier(N);

//        从上面输出结果可以看出，每个写入线程执行完写数据操作之后，就在等待其他线程写入操作完毕。
//　　当所有线程线程写入操作完毕之后，所有线程就继续进行后续的操作了。
//　　如果说想在所有线程写入操作完之后，进行额外的其他操作可以为CyclicBarrier提供Runnable参数：
        CyclicBarrier cyclicBarrier = new CyclicBarrier(N, new Runnable() {
            @Override
            public void run() {
                System.out.println("线程" + Thread.currentThread().getName() + "所有线程写入结束后执行");
            }
        });

        for(int i=0;i<4;i++)
            new Writer(cyclicBarrier).start();

        try {
            Thread.sleep(25000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        System.out.println("CyclicBarrier重用");

        for(int i=0;i<N;i++) {
            new Writer(cyclicBarrier).start();
        }

        System.out.println("执行主线程");
    }
    static class Writer extends Thread{
        private CyclicBarrier cyclicBarrier;
        public Writer(CyclicBarrier cyclicBarrier) {
            this.cyclicBarrier = cyclicBarrier;
        }

        @Override
        public void run() {
            System.out.println("线程"+Thread.currentThread().getName()+"正在写入数据...");
            try {
                Thread.sleep(5000);      //以睡眠来模拟写入数据操作
                System.out.println("线程"+Thread.currentThread().getName()+"写入数据完毕，等待其他线程写入完毕");
                cyclicBarrier.await();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }catch(BrokenBarrierException e){
                e.printStackTrace();
            }
            System.out.println("所有线程写入完毕，继续处理其他任务...");
        }
    }

}
