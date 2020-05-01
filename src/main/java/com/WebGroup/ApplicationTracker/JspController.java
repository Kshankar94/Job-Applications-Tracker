package com.WebGroup.ApplicationTracker;


import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JspController {
    private AppRepository appRepository;

    public JspController(AppRepository appRepository){
        this.appRepository = appRepository;
    }


    @RequestMapping("/")
    public String home(ModelMap modelMap) {
        modelMap.addAttribute("applications", appRepository.findAll().values());
        System.out.println(modelMap.getAttribute("applications"));
        return "welcome";
    }
    @RequestMapping("/create_index")
    public String create() {
        return "index";
    }
    @RequestMapping("/modify_index/{id}")
    public String modify(@PathVariable final String id, ModelMap map) {
        map.addAttribute("app", appRepository.findById(id));
        return "modify";
    }
    @RequestMapping("/modify_page")
    public String modifyPage(@PathVariable final String id, ModelMap map) {
        map.addAttribute("app", appRepository.findById(id));
        return "modify";
    }


}
