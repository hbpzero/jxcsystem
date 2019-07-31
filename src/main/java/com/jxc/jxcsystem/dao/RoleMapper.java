package com.jxc.jxcsystem.dao;

import com.jxc.jxcsystem.pojo.Role;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
@Mapper
public interface RoleMapper {
    public List<Role> queryAll();
}
