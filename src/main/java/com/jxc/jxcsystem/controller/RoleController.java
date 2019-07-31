package com.jxc.jxcsystem.controller;

import com.jxc.jxcsystem.pojo.Role;
import com.jxc.jxcsystem.service.RoleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping(value = "/role")
public class RoleController {
    @Resource
    private RoleService roleService;

    @RequestMapping(value = "/queryAll")
    @ResponseBody
    public List<Role> queryAll(){
        return roleService.queryAll();
    }
}
