package com.bluesoft.associations.management.service;

import com.bluesoft.associations.management.entities.Role;

import java.util.List;

public interface RoleService {

    List<Role> getRolesByIds(List<Integer> roleIds);

    List<Role> getAllRole();

    List<Role> getRolesByIdIn(String [] userRolesIds);

    List<Role> getUserRoles(int userId);

}
