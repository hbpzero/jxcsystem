package com.jxc.jxcsystem.service;

import com.jxc.jxcsystem.pojo.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    public User login(User user);
    public List<Map> queryAll();
    public int delUserById(Integer userId);
    public int addNewUser(User user);
    public int editUser(User user);
}
