package com.dimple.test.multithread;

import com.alibaba.fastjson.JSONObject;
import com.dimple.test.Http.HttpClient;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;

public class PublishMsgTest {

    //创建固定大小为100 的线程池
    private static ExecutorService service = Executors.newFixedThreadPool(100);

    //发送消息的业务逻辑方法
    public int sendMsg(List<Integer> receivers, String content) {

        long begin = System.nanoTime();
        AtomicInteger ai = new AtomicInteger(0);
        List<Future<Integer>> list = new ArrayList<>();
        //循环发送消息
        for (int i = 0; i < receivers.size(); i++) {
            Integer receiver = receivers.get(i);
            //使用Future，Callable实现发送消息后返回发送结果
            Future<Integer> future = service.submit(new Callable<Integer>() {
                @Override
                public Integer call() throws Exception {
                    ThreadLocal<Long> longThreadLocal = new ThreadLocal<>();
                    //调用相对比较耗时的发送消息接口
                    //Thread.sleep(200);
                    //发送消息
                    int resultStatus = sendMsg(receiver, content);
                    longThreadLocal.set(System.currentTimeMillis());
                    Map map = new HashMap();
                    map.put("questionId", "5e6b441df4d72828f359e711");
                    JSONObject jsonObject = new JSONObject();
                    jsonObject.put("content", "压测：" + receiver);
                    map.put("update", jsonObject.toJSONString());
                    String s = HttpClient.apacheSendPost("http://0.0.0.0:10003/api_v20/question/write/updateQuestion", map);
                    System.out.println("接收者【" + receiver + "】,发送结果【" + resultStatus + "】,返回结果" + s + "--耗时：" + (longThreadLocal.get() - (System.currentTimeMillis())));
                    return resultStatus;
                }
            });

            /*service.execute(new Runnable() {
                @Override
                public void run() {
                    //调用相对比较耗时的发送消息接口
                    try {
                        Thread.sleep(200);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    //发送消息
                    int resultStatus = sendMsg(receiver, content);
                    System.out.println("接收者【" + receiver + "】,发送结果【" + resultStatus + "】");
                }
            });*/
            list.add(future);
        }
        System.out.println("-----------------------" + (System.nanoTime() - begin) / 1000_000d + "-----------------------");
        //循环接收发送结果，相当于一个使线程同步的过程，这个过程是比较耗时的
        for (int i = 0; i < list.size(); i++) {
            try {
                int resultStatus = list.get(i).get();
                if (resultStatus == 0) {//发送成功
                    ai.incrementAndGet();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        System.out.println("线程运行结束。。。。。。");
        try {
            service.shutdown();
            if (!service.awaitTermination(10, TimeUnit.MILLISECONDS)) {
                System.out.println("超时关闭线程池!!!!");
                service.shutdownNow();
            }
        } catch (Exception e) {
            System.out.println("异常关闭线程池！！！！！！");
            service.shutdownNow();
        }
        System.out.println("发送消息结束，耗时：" + (System.nanoTime() - begin) / 1000_000d);
        return ai.get();
    }

    public static void main(String[] args) {
        PublishMsgTest pmt = new PublishMsgTest();
        //待接收人
        List<Integer> receivers = new ArrayList<Integer>();
        for (int i = 0; i < 5000; i++) {
            receivers.add(i);
        }
        String content = "群发消息_测试代码";
        int successCount = pmt.sendMsg(receivers, content);
        System.out.println("共有【" + receivers.size() + "】接收者，发送成功【" + successCount + "】");
    }

    //完成发送消息
    private int sendMsg(Integer receiver, String content) {
        if (receiver % 2 == 0) {//模拟被2整除，即为发送成功
            return 0;
        }
        return 1;
    }
}
