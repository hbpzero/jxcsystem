package com.jxc.jxcsystem.service;


import com.jxc.jxcsystem.dao.UserMapper;
import com.jxc.jxcsystem.pojo.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;
    @Override
    public User login(User user) {
        return userMapper.login(user);
    }

    @Override
    public List<Map> queryAll() {
        return  userMapper.queryAll();
    }

    @Override
    public int delUserById(Integer userId) {
        return userMapper.delUserById(userId);
    }

    @Override
    public int addNewUser(User user) {
        return userMapper.addNewUser(user);
    }

    @Override
    public int editUser(User user) {
        return userMapper.editUser(user);
    }
}
