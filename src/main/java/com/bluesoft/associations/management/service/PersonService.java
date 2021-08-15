package com.bluesoft.associations.management.service;

import com.bluesoft.associations.management.DTOS.SearchHelpDTO;
import com.bluesoft.associations.management.DTOS.SearchPersonDTO;
import com.bluesoft.associations.management.entities.Help;
import com.bluesoft.associations.management.entities.Person;
import org.springframework.data.domain.Page;

import java.util.List;

public interface PersonService {

    Person getById(int id);

    Person save(Person person);

    void delete(int id);

    Page<Person> getALl(int page, int size);

    List<Person> getALl();

    Page<Person> search(SearchPersonDTO searchPersonDTO, int page, int size);
}
