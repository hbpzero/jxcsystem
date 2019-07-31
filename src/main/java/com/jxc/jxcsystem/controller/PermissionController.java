package com.jxc.jxcsystem.controller;

import com.jxc.jxcsystem.pojo.Permission;
import com.jxc.jxcsystem.pojo.User;
import com.jxc.jxcsystem.service.PermissionService;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/permission")
public class PermissionController {
    @Resource
    private PermissionService permissionService;
    @RequestMapping(value = "/queryAll")
    @ResponseBody
    public List<Permission> queryAll(){
        return permissionService.queryAll();
    }
    @RequestMapping(value = "/queryByRole")
    @ResponseBody
    public List<Permission> queryByRole(HttpSession session){
        User user=(User) session.getAttribute("user");
        return permissionService.queryByRole(user.getUserRole());
    }
}
