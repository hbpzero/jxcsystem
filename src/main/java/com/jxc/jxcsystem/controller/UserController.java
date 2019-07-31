package com.jxc.jxcsystem.controller;

import com.jxc.jxcsystem.pojo.User;
import com.jxc.jxcsystem.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/user")
public class UserController {
    @Resource
    private UserService userService;
    @RequestMapping(value = "/login")
    @ResponseBody
    public String login(User user,HttpSession session){
        User result=userService.login(user);
        if (result!=null){
            session.setAttribute("user",result);
            return "true";
        } else
            return "false";
    }
    @RequestMapping(value = "/queryAll")
    @ResponseBody
    public List<Map> queryAll(){
        return userService.queryAll();
    }

    @RequestMapping(value = "/del")
    @ResponseBody
    public String delUserById(Integer userNo){
        int result=0;
        result=userService.delUserById(userNo);
        if(result!=0){
            return "true";
        }else
            return "false";

    }
    @RequestMapping(value = "/add")
    @ResponseBody
    public String addNewUser(User user){
        int result=0;
        result=userService.addNewUser(user);
        if(result!=0)
            return "true";
        else
            return "false";
    }
    @RequestMapping(value = "/edit")
    @ResponseBody
    public String editUser(User user){
        int result=0;
        result=userService.editUser(user);
        if(result!=0)
            return "true";
        else
            return "false";
    }

    @RequestMapping(value = "/toUser")
    public String toUser(){
        return "/back/all";
    }
    @RequestMapping(value = "/toBackIndex")
    public String toBackIndex(){
        return "/backIndex";
    }
}
