package com.bluesoft.associations.management.service;

import com.bluesoft.associations.management.entities.UserRole;

import java.util.List;

public interface UserRoleService {


    void save(UserRole userRole);

    void save(List<UserRole> userRoleList);
}
