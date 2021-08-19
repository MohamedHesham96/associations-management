package com.bluesoft.associations.management.service.impl;

import com.bluesoft.associations.management.DTOS.SearchPersonDTO;
import com.bluesoft.associations.management.entities.Person;
import com.bluesoft.associations.management.repositories.PersonRepository;
import com.bluesoft.associations.management.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class PersonServiceImpl implements PersonService {

    @Autowired
    PersonRepository personRepository;

    @Override
    public Person getById(int id) {
        return personRepository.getOne(id);
    }

    @Override
    public Person save(Person personDTO) {

        if (personDTO.getId() == null) {
            personDTO.setDate(LocalDateTime.now());
            return personRepository.save(personDTO);
        } else {
            Person oldPerson = personRepository.findById(personDTO.getId()).get();
            oldPerson.setName(personDTO.getName());
            oldPerson.setAddress(personDTO.getAddress());
            oldPerson.setPhone(personDTO.getPhone());
            oldPerson.setSocialStatus(personDTO.getSocialStatus());
            oldPerson.setSsn(personDTO.getSsn());
            return personRepository.save(oldPerson);
        }
    }

    @Override
    public void delete(int id) {
        personRepository.deleteById(id);
    }

    @Override
    public Page<Person> getALl(int page, int size) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("date").descending());
        return personRepository.findAll(pageable);
    }

    @Override
    public List<Person> getALl() {
        return personRepository.findAll();
    }

    @Override
    public Page<Person> search(SearchPersonDTO searchPersonDTO, int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return personRepository.search(searchPersonDTO.getName(), searchPersonDTO.getSsn(),
                searchPersonDTO.getPhone(), searchPersonDTO.getSocialStatus(), pageable);
    }

}
