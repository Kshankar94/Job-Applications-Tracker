package com.WebGroup.ApplicationTracker;

import com.WebGroup.ApplicationTracker.model.App;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Repository;

import java.util.Map;
import java.util.Set;

@Repository
public class AppRepositoryImpl implements AppRepository {
    private RedisTemplate<String, App> redisTemplate;

    private HashOperations hashOperations;

    public AppRepositoryImpl(RedisTemplate<String,App> redisTemplate){
        this.redisTemplate = redisTemplate;
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
            Long value = (Long) hashOperations.size("App") + 1;
            return value;
        }

    }

    @Override
    public String deleteAll() {
        this.redisTemplate.delete("App");
        return "success";

    }
}
