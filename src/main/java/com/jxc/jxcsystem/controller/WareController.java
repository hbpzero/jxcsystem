package com.jxc.jxcsystem.controller;

import com.jxc.jxcsystem.pojo.WareHouse;
import com.jxc.jxcsystem.service.WareService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/ware")
public class WareController {
    @Resource
    private WareService wareService;
    @RequestMapping(value = "/queryAll")
    @ResponseBody
    public List<WareHouse> queryAll(){
        return wareService.queryAll();
    }

    @RequestMapping(value = "/applyToWare")
    @ResponseBody
    public String applyToWare(@RequestBody Map map){
        Boolean result=wareService.applyToWare(map);
        if (result)
            return "true";
        else
            return "false";
    }
}
