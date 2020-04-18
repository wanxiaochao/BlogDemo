package com.dimple.test.concurrent;

import java.util.Map;
import java.util.concurrent.*;

/**
 回环栅栏：让一组线程等待至某个状态之后再全部同时执行。
 叫做回环是因为当所有等待线程都被释放以后，CyclicBarrier可以被重用。
 叫做栅栏，大概是描述所有线程被栅栏挡住了，当都达到时，一起跳过栅栏执行，也算形象。我们可以把这个状态就叫做barrier。
* @since: 2020/4/18
*/
public class CyclicBarrierTest {

    /**
     * 创建4个屏障，处理完之后执行当前类的run方法
     */
    private CyclicBarrier c = new CyclicBarrier(4, new MyRunnable());
    /**
     * 假设只有4个sheet，所以只启动4个线程
     */
    private Executor executor = Executors.newFixedThreadPool(4);
    /**
     * 保存每个sheet计算出的银流结果
     */
    private ConcurrentHashMap<String, Integer> sheetBankWaterCount = new ConcurrentHashMap<>();

    public static void main(String[] args) {
        CyclicBarrierTest bankWaterCount = new CyclicBarrierTest();
        bankWaterCount.count();
    }


    private void count() {
        for (int i = 0; i < 4; i++) {
            executor.execute(new Runnable() {
                @Override
                public void run() {
                    // 计算当前sheet的银流数据，计算代码省略
                    sheetBankWaterCount.put(Thread.currentThread().getName(), 1);
                    // 银流计算完成，插入一个屏障
                    try {
                        c.await();
                    } catch (InterruptedException | BrokenBarrierException e) {
                        e.printStackTrace();
                    }
                }
            });
        }
    }

    class MyRunnable implements Runnable {

        @Override
        public void run() {
            int result = 0;
            // 汇总每个sheet计算出的结果
            for (Map.Entry<String, Integer> sheet : sheetBankWaterCount.entrySet()) {
                result += sheet.getValue();
            }
            // 将结果输出
            sheetBankWaterCount.put("result", result);
            System.out.println("result = " + result);
        }
    }

}
