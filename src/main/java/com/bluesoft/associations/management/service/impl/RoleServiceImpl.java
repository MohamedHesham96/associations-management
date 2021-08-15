package com.bluesoft.associations.management.service.impl;

import com.bluesoft.associations.management.entities.Role;
import com.bluesoft.associations.management.repositories.RoleRepository;
import com.bluesoft.associations.management.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleRepository roleRepository;

    @Override
    public List<Role> getRolesByIds(List<Integer> roleIds) {
        return roleRepository.findAllByIdIn(roleIds);
    }

    @Override
    public List<Role> getAllRole() {
        return roleRepository.findAll();
    }

    @Override
    public List<Role> getRolesByIdIn(String[] roleIds) {
        return roleRepository.findAllByIdIn(roleIds);
    }

    @Override
    public List<Role> getUserRoles(int userId) {
        return roleRepository.findUserRoles(userId);
    }
}
