package com.dimple.test.concurrent.pool;

import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.util.concurrent.ListenableFuture;

import java.util.concurrent.Callable;
import java.util.concurrent.Future;
import java.util.concurrent.ThreadPoolExecutor;

@Slf4j
public class AppThreadPoolTaskExecutor extends ThreadPoolTaskExecutor {
    private static final long serialVersionUID = -8390143797529109261L;

    private void showThreadPoolInfo(String prefix) {
        ThreadPoolExecutor executor = getThreadPoolExecutor();
        log.info(this.getThreadNamePrefix(), prefix, executor.getCorePoolSize(), executor.getCompletedTaskCount(), executor.getActiveCount(), executor.getQueue().size());
    }

    @Override
    public void execute(Runnable task) {
        showThreadPoolInfo("executor");
        super.execute(task);
    }

    @Override
    public void execute(Runnable task, long startTimeout) {
        showThreadPoolInfo("executor with timeout");
        super.execute(task, startTimeout);
    }

    @Override
    public Future<?> submit(Runnable task) {
        showThreadPoolInfo("submit");
        return super.submit(task);
    }

    @Override
    public <T> Future<T> submit(Callable<T> task) {
        showThreadPoolInfo("submit callable");
        return super.submit(task);
    }

    @Override
    public ListenableFuture<?> submitListenable(Runnable task) {
        showThreadPoolInfo("submit listenable");
        return super.submitListenable(task);
    }

    @Override
    public <T> ListenableFuture<T> submitListenable(Callable<T> task) {
        showThreadPoolInfo("submit listenable callable");
        return super.submitListenable(task);
    }
}
