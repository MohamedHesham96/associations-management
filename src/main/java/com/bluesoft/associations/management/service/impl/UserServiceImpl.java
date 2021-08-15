package com.bluesoft.associations.management.service.impl;

import com.bluesoft.associations.management.entities.User;
import com.bluesoft.associations.management.exception.BusinessException;
import com.bluesoft.associations.management.repositories.UserRepository;
import com.bluesoft.associations.management.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public User save(User user) {
        return userRepository.save(user);
    }

    @Override
    public User findById(int userId) throws BusinessException {
        return userRepository.findById(userId).get();
    }

}
