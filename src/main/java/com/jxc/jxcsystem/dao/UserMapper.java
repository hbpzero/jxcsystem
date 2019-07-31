package com.jxc.jxcsystem.dao;

import com.jxc.jxcsystem.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface UserMapper {
    public User login(User user);
    public List<Map> queryAll();
    public int delUserById(Integer userId);
    public int addNewUser(User user);
    public int editUser(User user);
}
