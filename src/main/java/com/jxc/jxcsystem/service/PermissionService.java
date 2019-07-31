package com.jxc.jxcsystem.service;

import com.jxc.jxcsystem.pojo.Permission;

import java.util.List;

public interface PermissionService {
    public List<Permission> queryAll();
    public List<Permission> queryByRole(int roleId);
}
