package com.bluesoft.associations.management.service;

import com.bluesoft.associations.management.DTOS.HelpDTO;
import com.bluesoft.associations.management.DTOS.SearchHelpDTO;
import com.bluesoft.associations.management.entities.Help;
import org.springframework.data.domain.Page;

public interface HelpService {

    Help save(HelpDTO helpDTO);

    Help save(Help help);

    Help getById(int id);

    void delete(int id);

    Page<Help> getALl(int page, int size);

    Page<Help> search(SearchHelpDTO searchHelpDTO, int page, int size);
}
