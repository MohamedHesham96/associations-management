package com.bluesoft.associations.management.service;

import com.bluesoft.associations.management.entities.User;
import com.bluesoft.associations.management.exception.BusinessException;

import java.util.List;

public interface UserService {

    User findByUsername(String username);

    User save(User user);

    User findById(int userId) throws BusinessException;

}
