package com.WebGroup.ApplicationTracker;

import com.WebGroup.ApplicationTracker.model.App;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Repository;

import java.util.*;
import java.util.stream.Collectors;

@Repository
public class AppRepositoryImpl implements AppRepository {
    private RedisTemplate<String, App> redisTemplate;

    private HashOperations hashOperations;

    public AppRepositoryImpl(RedisTemplate<String,App> redisTemplate){
        this.redisTemplate = redisTemplate;
        this.redisTemplate.setDefaultSerializer(new StringRedisSerializer());
        hashOperations = redisTemplate.opsForHash();
    }


    @Override
    public void save(App app) {
        hashOperations.put("App", app.getId(), app);
    }

    @Override
    public Map<String, App> findAll() {
        return hashOperations.entries("App");
    }

    @Override
    public App findById(String id) {
        return (App)hashOperations.get("App", id);
    }


    @Override
    public void update(App app) {

        save(app);
    }

    @Override
    public void deleteById(String id) {
        hashOperations.delete("App", id);
    }

    @Override
    public Long setUniqueId() {

        if(hashOperations.size("App") == Long.valueOf(0)) {
            return Long.valueOf(1);
        }
        else {
           Set<String> obj =  hashOperations.keys("App");
           Set<Integer> ids = obj.stream().map(Integer::valueOf).collect(Collectors.toSet());
           int val = Collections.max(ids);
           Long value = Long.valueOf(val) + 1;
           return value;
        }

    }

    @Override
    public String deleteAll() {
        this.redisTemplate.delete("App");
        return "success";

    }
}
