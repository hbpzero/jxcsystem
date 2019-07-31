package com.jxc.jxcsystem.service;

import com.jxc.jxcsystem.dao.PermissionMapper;
import com.jxc.jxcsystem.pojo.Permission;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class PermissionServiceImpl implements PermissionService {
    @Resource
    private PermissionMapper permissionMapper;
    @Override
    public List<Permission> queryAll() {
        return permissionMapper.queryAll();
    }

    @Override
    public List<Permission> queryByRole(int roleId) {
        return permissionMapper.queryByRole(roleId);
    }
}
