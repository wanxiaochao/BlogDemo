package com.dimple.test.concurrent.pool;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.Executor;
import java.util.stream.Collectors;

public class Test {

    @Resource(name = "appThreadService")
    private Executor executor;

    public void test1(){
        List<CompletableFuture<String>> futures = new ArrayList<>();
        futures.add(CompletableFuture.supplyAsync(this::t1,executor));
        futures.add(CompletableFuture.supplyAsync(this::t2,executor));
        futures.add(CompletableFuture.supplyAsync(this::t3,executor));
        futures.add(CompletableFuture.supplyAsync(this::t4,executor));
        CompletableFuture<Void> allOf = CompletableFuture.allOf(futures.toArray(new CompletableFuture[futures.size()]));
        CompletableFuture<List<String>> future = allOf.thenApplyAsync(value -> futures.stream().map(CompletableFuture::join).collect(Collectors.toList()),executor);
        List<String> join = future.join();

    }

    private String  t1(){
        return "1";
    }
    private String t2(){
        return "2";
    }
    private String t3(){
        return "3";
    }
    private String t4(){
        return "4";
    }
}
