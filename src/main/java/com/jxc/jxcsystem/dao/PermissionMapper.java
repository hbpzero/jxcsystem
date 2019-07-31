package com.jxc.jxcsystem.dao;

import com.jxc.jxcsystem.pojo.Permission;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
@Mapper
public interface PermissionMapper {
    public List<Permission> queryAll();
    public List<Permission> queryByRole(int roleId);
}
