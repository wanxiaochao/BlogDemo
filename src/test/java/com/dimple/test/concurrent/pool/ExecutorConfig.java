package com.dimple.test.concurrent.pool;

import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.concurrent.ThreadPoolExecutor;

@Configuration
@Slf4j
public class ExecutorConfig {

    private final static String thread_name_prefix = "app-thread-async-service-";
    private int corePoolSize = 5;
    private int maxPoolSize = 50;
    private int queueCapacity = 1000;
    private int keepAliveSeconds = 5;

    @Bean
    public ThreadPoolTaskExecutor appThreadService() {
        AppThreadPoolTaskExecutor executor = new AppThreadPoolTaskExecutor();
        executor.setCorePoolSize(corePoolSize);
        executor.setKeepAliveSeconds(keepAliveSeconds);
        executor.setMaxPoolSize(maxPoolSize);
        executor.setQueueCapacity(queueCapacity);
        executor.setThreadNamePrefix(thread_name_prefix);
        executor.setRejectedExecutionHandler(new ThreadPoolExecutor.CallerRunsPolicy());
        executor.initialize();
        return executor;
    }

}
