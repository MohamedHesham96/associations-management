package com.bluesoft.associations.management.repositories;

import com.bluesoft.associations.management.entities.Person;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface PersonRepository extends JpaRepository<Person, Integer> {

    Page<Person> findAll(Pageable pageable);

    @Query("select p from Person p where (:name is null or p.name like concat('%',:name,'%'))" +
            " and (:ssn is null or p.ssn like concat('%',:ssn,'%'))" +
            " and (:phone is null or p.phone like concat('%',:phone,'%')) order by p.date desc")
    Page<Person> search(String name, String ssn, String phone, Pageable pageable);
}
