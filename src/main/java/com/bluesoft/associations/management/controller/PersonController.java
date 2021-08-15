package com.bluesoft.associations.management.controller;

import com.bluesoft.associations.management.DTOS.SearchHelpDTO;
import com.bluesoft.associations.management.DTOS.SearchPersonDTO;
import com.bluesoft.associations.management.entities.Help;
import com.bluesoft.associations.management.entities.Person;
import com.bluesoft.associations.management.response.ResponseModel;
import com.bluesoft.associations.management.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/app/persons")
public class PersonController {

    @Autowired
    PersonService personService;

    @GetMapping
    public ModelAndView navAllPersons() {

        Page<Person> personsPage = personService.getALl(0, 10);
        ModelAndView modelAndView = new ModelAndView("persons");
        modelAndView.addObject("personList", personsPage.getContent());

        modelAndView.addObject("page", 0);
        modelAndView.addObject("size", 10);
        modelAndView.addObject("total", personsPage.getTotalPages());

        modelAndView.addObject("pagePrint", 0);
        modelAndView.addObject("sizePrint", 10);
        modelAndView.addObject("totalPrint", personsPage.getTotalPages());
        return modelAndView;
    }

    @PostMapping("/search/{page}/{size}")
    public @ResponseBody
    ModelAndView searchInPersons(@RequestBody SearchPersonDTO searchHelpDTO, @PathVariable("page") int page, @PathVariable("size") int size) {

        Page<Person> PersonPage = personService.search(searchHelpDTO, page, size);
        ModelAndView modelAndView = new ModelAndView("persons/_personsList");
        modelAndView.addObject("personList", PersonPage.getContent());

        modelAndView.addObject("page", page);
        modelAndView.addObject("size", size);
        modelAndView.addObject("total", PersonPage.getTotalPages());

        return modelAndView;
    }

    @GetMapping("/profile/{id}")
    public ModelAndView openPersonProfile(@PathVariable int id) {
        Person person = personService.getById(id);
        ModelAndView modelAndView = new ModelAndView("persons/_personProfile");
        modelAndView.addObject("person", person);
        return modelAndView;
    }

    @PostMapping
    public @ResponseBody
    ResponseModel createPerson(@RequestBody Person person) {
        personService.save(person);
        return new ResponseModel("تم حفظ البيانات", true);
    }


    @DeleteMapping("/{personId}")
    public @ResponseBody
    ResponseModel deletePerson(@PathVariable int personId) {
        personService.delete(personId);
        return new ResponseModel("تم الحذف بنجاح", true);
    }
}
