package com.bluesoft.associations.management.repositories;

import com.bluesoft.associations.management.DTOS.SearchHelpDTO;
import com.bluesoft.associations.management.entities.Help;
import com.bluesoft.associations.management.entities.Person;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface HelpRepository extends JpaRepository<Help, Integer> {

    Page<Help> findAll(Pageable pageable);

    @Query("select h from Help h where (:name is null or h.person.name like concat('%',:name,'%'))" +
            " and (:ssn is null or h.person.ssn like concat('%',:ssn,'%'))" +
            " and (:helpType is null or h.helpType like concat('%',:helpType,'%'))")
    Page<Help> search(String name, String ssn, String helpType, Pageable pageable);
}
