package com.WebGroup.ApplicationTracker.model;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.annotation.Id;
import org.springframework.data.redis.core.RedisHash;
import org.springframework.stereotype.Indexed;

import java.io.Serializable;
@RedisHash("App")
@Indexed
public class App implements Serializable {
    @Id
    private String id;

    private String company;

    private String jobTitle;

    private String jobBoard;

    private String jobUrl;

    private String notes;

    public App(String id, String company,String jobTitle) {
        this.company = company;
        this.id = id;
        this.jobTitle = jobTitle;
    }

    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public String getJobBoard() {
        return jobBoard;
    }

    public void setJobBoard(String jobBoard) {
        this.jobBoard = jobBoard;
    }

    public String getJobUrl() {
        return jobUrl;
    }

    public void setJobUrl(String jobUrl) {
        this.jobUrl = jobUrl;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }
}
