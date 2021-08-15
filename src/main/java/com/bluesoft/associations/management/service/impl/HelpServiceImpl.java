package com.bluesoft.associations.management.service.impl;

import com.bluesoft.associations.management.DTOS.HelpDTO;
import com.bluesoft.associations.management.DTOS.SearchHelpDTO;
import com.bluesoft.associations.management.entities.Help;
import com.bluesoft.associations.management.entities.Person;
import com.bluesoft.associations.management.repositories.HelpRepository;
import com.bluesoft.associations.management.repositories.PersonRepository;
import com.bluesoft.associations.management.service.HelpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class HelpServiceImpl implements HelpService {

    @Autowired
    HelpRepository helpRepository;

    @Autowired
    PersonRepository personRepository;

    @Override
    public Help save(HelpDTO helpDTO) {

        if (helpDTO.getId() == null) {
            Help help = new Help();
            help.setPerson(new Person(helpDTO.getPersonId()));
            help.setHelpType(helpDTO.getHelpType());
            help.setDate(LocalDateTime.now());
            return helpRepository.save(help);
        } else {
            Help oldHelp = helpRepository.findById(helpDTO.getId()).get();
            oldHelp.setPerson(new Person(helpDTO.getPersonId()));
            oldHelp.setHelpType(helpDTO.getHelpType());
            return helpRepository.save(oldHelp);
        }
    }

    @Override
    public Help save(Help help) {
        return helpRepository.save(help);
    }

    @Override
    public Help getById(int id) {
        return helpRepository.getOne(id);
    }

    @Override
    public void delete(int id) {
        helpRepository.deleteById(id);
    }

    @Override
    public Page<Help> getALl(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return helpRepository.findAll(pageable);
    }

    @Override
    public Page<Help> search(SearchHelpDTO searchHelpDTO, int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return helpRepository.search(searchHelpDTO.getName(),
                searchHelpDTO.getSsn(),
                searchHelpDTO.getHelpType(), pageable);
    }

}
