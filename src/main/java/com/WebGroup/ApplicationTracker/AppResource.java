package com.WebGroup.ApplicationTracker;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;

import com.WebGroup.ApplicationTracker.model.App;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;



import java.util.*;

@RestController
@RequestMapping("/api/app")
public class AppResource {

    private AppRepository appRepository;

    public AppResource(AppRepository appRepository){
        this.appRepository = appRepository;
    }

    @Value("${application.message:Hello World}")
    private String helloMessage;

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public RedirectView add(App app) {
        String id = String.valueOf(appRepository.setUniqueId());
        App app_ = new App(id,app.getCompany(),app.getJobTitle(), app.getStatus());
        appRepository.save(app_);
        System.out.println("company");
        if(app!=null) {
            System.out.println(app.getCompany());
            System.out.println(app.getJobTitle());
            System.out.println(app.getStatus());
        }

//        RedirectView rdv = new RedirectView();
//        rdv.setUrl("/");
//        rdv.addStaticAttribute("applications", appRepository.findAll());
        return rdvHelper();
    }

    @GetMapping("/all")
    public Map<String, App> all() {
        return appRepository.findAll();
    }

    @RequestMapping(value = "/delete/{id}")
    public RedirectView delete(@PathVariable("id") final String id) {

       if(id.length()== 0) return new RedirectView("/");
//       System.out.println("id_delete");
//       System.out.println(id);
       appRepository.deleteById(id);
       return rdvHelper();
    }
    @GetMapping("/deleteAll")
    public String deleteAll(){
        return appRepository.deleteAll();
    }

    @RequestMapping(value = "/update")
    public RedirectView update(App app){
    if(app!=null){
        appRepository.save(new App(app.getId(),app.getCompany(),app.getJobTitle(),app.getStatus()));
    }
    return rdvHelper();
    }

    public RedirectView rdvHelper(){
        RedirectView rdv = new RedirectView();
        rdv.setUrl("/");
        rdv.addStaticAttribute("applications", appRepository.findAll());
        return rdv;
    }

}



