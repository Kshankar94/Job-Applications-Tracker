package com.WebGroup.ApplicationTracker;

import com.WebGroup.ApplicationTracker.model.App;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Repository;

import java.util.Map;

public interface AppRepository {
    void save(App app);
    Map<String, App> findAll();
    App findById(String id);
    void update(App app);
    void deleteById(String id);
    Long setUniqueId();
    String deleteAll();
}
