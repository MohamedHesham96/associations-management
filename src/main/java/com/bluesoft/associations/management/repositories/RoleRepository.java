package com.bluesoft.associations.management.repositories;

import com.bluesoft.associations.management.entities.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface RoleRepository extends JpaRepository<Role, Integer> {

    List<Role> findAllByIdIn(List<Integer> roleIds);

    List<Role> findAllByIdIn(String[] roleIds);

    @Query("select ur.role from UserRole ur where ur.user.id = :userId")
    List<Role> findUserRoles(@Param("userId") int userId);

}
