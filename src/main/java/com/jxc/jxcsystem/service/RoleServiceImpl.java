package com.jxc.jxcsystem.service;

import com.jxc.jxcsystem.dao.RoleMapper;
import com.jxc.jxcsystem.pojo.Role;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class RoleServiceImpl implements RoleService{
    @Resource
    private RoleMapper roleMapper;

    @Override
    public List<Role> queryAll() {
        return roleMapper.queryAll();
    }
}
