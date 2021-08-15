package com.bluesoft.associations.management.controller;

import com.bluesoft.associations.management.DTOS.HelpDTO;
import com.bluesoft.associations.management.DTOS.SearchHelpDTO;
import com.bluesoft.associations.management.entities.Help;
import com.bluesoft.associations.management.entities.Person;
import com.bluesoft.associations.management.response.ResponseModel;
import com.bluesoft.associations.management.service.HelpService;
import com.bluesoft.associations.management.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/app/helps")
public class HelpController {

    @Autowired
    HelpService helpService;

    @Autowired
    PersonService personService;

    @GetMapping
    public ModelAndView navAllHelps() {

        Page<Help> HelpPage = helpService.getALl(0, 10);
        List<Person> personList = personService.getALl();
        ModelAndView modelAndView = new ModelAndView("helps");
        modelAndView.addObject("helpList", HelpPage.getContent());
        modelAndView.addObject("personList", personList);

        modelAndView.addObject("page", 0);
        modelAndView.addObject("size", 10);
        modelAndView.addObject("total", HelpPage.getTotalPages());

        return modelAndView;
    }

    @PostMapping("/search/{page}/{size}")
    public @ResponseBody
    ModelAndView searchInHelps(@RequestBody SearchHelpDTO searchHelpDTO, @PathVariable("page") int page, @PathVariable("size") int size) {

        Page<Help> HelpPage = helpService.search(searchHelpDTO, page, size);
        ModelAndView modelAndView = new ModelAndView("helps/_helpList");
        modelAndView.addObject("helpList", HelpPage.getContent());

        modelAndView.addObject("page", page);
        modelAndView.addObject("size", size);
        modelAndView.addObject("total", HelpPage.getTotalPages());

        return modelAndView;
    }

    @PostMapping
    public @ResponseBody
    ResponseModel createHelp(@RequestBody HelpDTO helpDTO) {
        helpService.save(helpDTO);
        return new ResponseModel("تم حفظ البيانات", true);
    }


    @DeleteMapping("/{Id}")
    public @ResponseBody
    ResponseModel deleteHelp(@PathVariable int Id) {
        helpService.delete(Id);
        return new ResponseModel("تم الحذف بنجاح", true);
    }

    @PostMapping("/{Id}")
    public @ResponseBody
    ResponseModel changeHelpServedState(@PathVariable int Id) {
        Help help = helpService.getById(Id);
        help.setServed(help.getServed() == null ? true : !help.getServed());
        helpService.save(help);
        return new ResponseModel("تم التعديل بنجاح", true);
    }
}
