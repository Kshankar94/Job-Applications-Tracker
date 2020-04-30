package com.WebGroup.ApplicationTracker;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;

import com.WebGroup.ApplicationTracker.model.App;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;


import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("/api/app")
public class AppResource {

    private AppRepository appRepository;

    public AppResource(AppRepository appRepository){
        this.appRepository = appRepository;
    }

//    @Value("${application.message:Hello World}")
//    private String helloMessage;

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public RedirectView add(App app) {
        String id = String.valueOf(appRepository.setUniqueId());
        App app_ = new App(id,app.getCompany(),app.getJobTitle());
        appRepository.save(app_);
        System.out.println("company");
        if(app!=null) System.out.println(app.getCompany());

        return new RedirectView("/");
    }

    @GetMapping("/all")
    public Map<String, App> all() {
        return appRepository.findAll();
    }

    @GetMapping("/delete/{id}")
    public Map<String, App> delete(@PathVariable("id") final String id) {
        appRepository.deleteById(id);
        return all();
    }

    @GetMapping("/deleteAll")
    public String deleteAll(){
        return appRepository.deleteAll();
    }


}



